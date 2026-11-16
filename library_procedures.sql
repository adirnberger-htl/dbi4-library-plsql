CREATE OR REPLACE PACKAGE pack_lib AS
    FUNCTION func_validate_ISBN(p_ISBN VARCHAR2) RETURN BOOLEAN;
    PROCEDURE proc_add_author(
        p_first_name VARCHAR2,
        p_last_name VARCHAR2,
        p_date_of_birth DATE,
        p_date_of_death DATE
    );
    PROCEDURE proc_add_book(
        -- Author
        p_first_name VARCHAR2,
        p_last_name VARCHAR2,
        p_date_of_birth DATE,
        p_date_of_death DATE,

        -- Book
        p_title VARCHAR2,
        p_ISBN VARCHAR2,
        p_book_language NUMBER,
        p_media_type NUMBER,
        p_shelf VARCHAR2
    );
    PROCEDURE proc_add_reader(
        p_first_name VARCHAR2,
        p_last_name VARCHAR2,
        p_email VARCHAR2
    );
    PROCEDURE proc_print_book_info(
        p_serial_number VARCHAR2
    );

    TYPE t_book_list IS TABLE OF LIBRARY_BOOK%ROWTYPE;

    FUNCTION print_authors_books(
        p_book_list t_book_list
    )
    RETURN BOOLEAN;

    FUNCTION find_authors_books(
        p_author_id NUMBER
    )
    RETURN t_book_list;

    PROCEDURE rent_book(
        p_book_id NUMBER
    );

END pack_lib;
CREATE OR REPLACE PACKAGE BODY pack_lib AS

    FUNCTION func_validate_ISBN(
        p_ISBN VARCHAR2
    )
        RETURN BOOLEAN
        IS
        v_digit  NUMBER;
        v_total  NUMBER;
        v_weight NUMBER;
    BEGIN
        FOR i IN 1 .. LENGTH(p_ISBN)
            LOOP
                v_digit := TO_NUMBER(SUBSTR(p_ISBN, i, 1));

                IF MOD(i, 2) = 1 THEN
                    v_weight := 1;
                ELSE
                    v_weight := 3;
                END IF;

                v_total := v_total + v_digit * v_weight;
            end loop;

        if MOD(v_total, 10) = 0 then
            return true;
        else
            return false;
        end if;
    END;

    PROCEDURE proc_add_author(
        p_first_name VARCHAR2,
        p_last_name VARCHAR2,
        p_date_of_birth DATE,
        p_date_of_death DATE
    )
    IS
    BEGIN
        INSERT INTO LIBRARY_AUTHOR (FIRST_NAME, LAST_NAME, DATE_OF_BIRTH, DATE_OF_DEATH)
        VALUES (p_first_name, p_last_name, p_date_of_birth, p_date_of_death);
    END;

    PROCEDURE proc_add_book(
        -- Author
        p_first_name VARCHAR2,
        p_last_name VARCHAR2,
        p_date_of_birth DATE,
        p_date_of_death DATE,

        -- Book
        p_title VARCHAR2,
        p_ISBN VARCHAR2,
        p_book_language NUMBER,
        p_media_type NUMBER,
        p_shelf VARCHAR2
    )
    IS
        e_two_same_authors EXCEPTION;
        e_isbn_not_valid EXCEPTION;

        v_author_count  NUMBER;
        v_author_id     NUMBER;
        v_ISBN_is_valid BOOLEAN;
    BEGIN
        v_ISBN_is_valid := func_validate_ISBN(p_ISBN);

        if v_ISBN_is_valid = false then
            raise e_isbn_not_valid;
        end if;

        SELECT count(*)
        INTO v_author_count
        FROM LIBRARY_AUTHOR la
        WHERE la.LAST_NAME = p_last_name
          AND la.FIRST_NAME = p_first_name
          AND la.DATE_OF_BIRTH = p_date_of_birth;
        -- I don't want to check dod bc id have to check for null and idc.

        if v_author_count > 1 THEN
            RAISE e_two_same_authors;
        elsif v_author_count < 1 THEN
            proc_add_author(p_first_name, p_last_name, p_date_of_birth, p_date_of_death);
        end if;

        SELECT ID
        INTO v_author_id
        FROM LIBRARY_AUTHOR la
        WHERE la.LAST_NAME = p_last_name
          AND la.FIRST_NAME = p_first_name
          AND la.DATE_OF_BIRTH = p_date_of_birth;

        INSERT INTO LIBRARY_BOOK (AUTHOR, TITLE, ISBN, BOOK_LANGUAGE, BOOK_GENRE, MEDIA_TYPE, SHELF)
        VALUES (v_author_id, p_title, p_ISBN, p_book_language,
                p_book_language, p_media_type, p_shelf);

    EXCEPTION
        WHEN e_two_same_authors THEN
            DBMS_OUTPUT.PUT_LINE('There are 2 same authors - fix your schema');
        WHEN e_isbn_not_VALID THEN
            DBMS_OUTPUT.PUT_LINE('ISBN is not valid');
    END;

    PROCEDURE proc_add_reader(
        p_first_name VARCHAR2,
        p_last_name VARCHAR2,
        p_email VARCHAR2
    )
    IS
        e_email_already_registered EXCEPTION ;

        v_email_count NUMBER;
    BEGIN
        SELECT COUNT(*) INTO v_email_count FROM LIBRARY_CLIENT WHERE EMAIL = p_email;

        if v_email_count > 1 then
            raise e_email_already_registered;
        end if;

        INSERT INTO LIBRARY_CLIENT (FIRST_NAME, LAST_NAME, EMAIL)
        VALUES (p_first_name, p_last_name, p_email);

    EXCEPTION
        WHEN e_email_already_registered THEN
            DBMS_OUTPUT.PUT_LINE('Email is already registered!');
    END;

    PROCEDURE proc_print_book_info(
        p_serial_number VARCHAR2
    )
    IS
        v_book VARCHAR2(400);
    BEGIN

        SELECT JSON_OBJECT(*) INTO v_book FROM LIBRARY_BOOK WHERE SERIAL_NUMBER = p_serial_number;

        DBMS_OUTPUT.PUT_LINE(v_book);

    EXCEPTION
        WHEN no_data_found THEN
            DBMS_OUTPUT.PUT_LINE('This book does not exist.');
    END;

    FUNCTION print_authors_books (
        p_book_list t_book_list
    )
    RETURN BOOLEAN
    IS
        v_book LIBRARY_BOOK%ROWTYPE;
    BEGIN
        if p_book_list.COUNT < 1 then
            raise no_data_found;
        end if;

        FOR i IN 1 .. p_book_list.COUNT LOOP
            v_book := p_book_list(i);
            DBMS_OUTPUT.PUT_LINE('Titel: ' || v_book.TITLE || ' | Genre: ' || v_book.BOOK_GENRE);
        end loop;

        RETURN true;
    EXCEPTION
        WHEN no_data_found then
            return false;
    END;

    FUNCTION find_authors_books (
        p_author_id NUMBER
    )
    RETURN t_book_list
    IS
        v_arr t_book_list := t_book_list();
    BEGIN
        SELECT *
        bulk collect into v_arr
        FROM LIBRARY_BOOK WHERE AUTHOR = p_author_id;

        if v_arr.COUNT = 0 then raise no_data_found;
        end if;

        RETURN v_arr;
    EXCEPTION
        WHEN no_data_found THEN
            DBMS_OUTPUT.PUT_LINE('Yo nigga! Ain`t no data here.');
    END;

    PROCEDURE rent_book(
        p_book_id NUMBER
    )
    IS

    BEGIN

    END;

END pack_lib;



