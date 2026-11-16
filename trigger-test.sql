-- Oracle PL/SQL Triggers – Exploration Tasks

-- Use the **HR demo schema**. For each task, write and execute SQL/PL/SQL statements, observe the results, and explain
-- the behavior.


------------------------------------------------------
-- 1. **Create a basic row-level trigger.** Create a `BEFORE UPDATE` trigger on `employees` that uses `:OLD` and `:NEW`
-- to display the previous and new salary. Test with an `UPDATE` affecting several employees. How often does it fire?

CREATE OR REPLACE TRIGGER trg_emp_salary_change
    BEFORE UPDATE OF salary ON EMPLOYEES
    FOR EACH ROW -- ROWtrigger
BEGIN
    DBMS_OUTPUT.PUT_LINE(:NEW.salary || ', ' || :OLD.salary);
END;
/

-- Test: Update salary for department 20 (contains 2 employees: Hartstein and Fay)
UPDATE employees
SET salary = salary * 1.05
WHERE department_id = 20;


------------------------------------------------------
-- 2. **Compare row-level and statement-level triggers.** Create an `AFTER UPDATE` trigger without `FOR EACH ROW`.
-- Compare its execution with the first trigger for updates affecting zero, one, and multiple rows.
-- Statement-level trigger (omits 'FOR EACH ROW')

CREATE OR REPLACE TRIGGER trg_emp_salary_change2
    AFTER UPDATE OF FIRST_NAME ON EMPLOYEES
BEGIN
    DBMS_OUTPUT.PUT_LINE('Aw man this trigger just fired.');
END;
/

UPDATE EMPLOYEES SET FIRST_NAME = 'Steven' WHERE EMPLOYEE_ID = 99;
------------------------------------------------------
-- 3. **Modify values in a trigger.** Create a `BEFORE UPDATE OF salary` row trigger that prevents negative salaries by
-- changing `:NEW.salary`. Test the behavior. What happens if you try to assign to `:NEW` in an `AFTER` trigger?


------------------------------------------------------
-- 4. **Investigate the mutating-table error with salary increases.** Add an `INCPERC` (percentage increase) column to
-- `employees`. Implement a `BEFORE UPDATE OF incperc FOR EACH ROW` trigger that increases `salary` by the given
-- percentage and then resets `incperc` to `NULL`. First use `:NEW.salary` and `:NEW.incperc` and test the result. Then
-- rewrite the trigger to execute an explicit `UPDATE employees` instead. What error occurs, and why?


------------------------------------------------------
-- 5. **Resolve the mutating-table problem.** Explore a compound trigger that collects employee IDs and requested
-- percentage increases in its row-level section and processes them in its `AFTER STATEMENT` section. Can you apply the
-- salary changes and reset `INCPERC`? Compare this approach with direct assignments to `:NEW` in Task 4. What risks
-- arise when the trigger updates its own table again?


------------------------------------------------------
-- 6. **Explore autonomous transactions.** Create a trigger that inserts a record into a separate audit table using
-- `PRAGMA AUTONOMOUS_TRANSACTION` and `COMMIT`. Update an employee and then execute `ROLLBACK`. Does the audit record
-- remain? Investigate why an autonomous transaction is not a reliable solution to the mutating-table problem.