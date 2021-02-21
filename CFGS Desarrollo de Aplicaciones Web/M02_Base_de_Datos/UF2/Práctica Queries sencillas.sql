/* 1 */
select * from jobs where min_salary > 10000;
/* 2 */
select first_name, hire_date from employees where hire_date between "1993-01-01" and "1998-12-31";
/* 3 */
select first_name, hire_date from employees where job_id = "IT_PROG" or job_id = "SA_MAN";
/* 4 */
select first_name from employees where hire_date > "1999-01-01";
/* 5 */
select first_name from employees where employee_id in (150, 160);
/* 6 */
select last_name, salary, commission_pct, hire_date from employees where salary <10000;
/* 7 */
select job_title, (max_salary - min_salary) as "DIFFERENCE" from jobs where max_salary between 10000 and 20000;
/* 8 */
select * from jobs order by job_title desc;
/* 9 */
select * from employees where first_name like "S%" or last_name like "S%";
/* 10 */
select * from employees where commission_pct is null and salary between 5000 and 10000 and department_id = "30";