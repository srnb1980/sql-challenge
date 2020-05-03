--1. List the following details of each employee: employee number, last name, first name, sex, and salary.

select emp.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary
from employees emp left outer join
salaries sal
on emp.emp_no=sal.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986.

select first_name,last_name,hire_date from employees 
where EXTRACT(YEAR FROM hire_date) = 1986;

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

select dept.dept_no, dept.dept_name, dept_mng.emp_no, emp.last_name, emp.first_name
from dept_manager dept_mng
left outer join departments dept
on dept_mng.dept_no=dept.dept_no
left outer join employees emp
on dept_mng.emp_no=emp.emp_no;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.

select emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
from employees emp
left outer join dept_emp dept_emp
on emp.emp_no=dept_emp.emp_no
left outer join departments dept
on dept_emp.dept_no=dept.dept_no;

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

select emp.first_name, emp.last_name, emp.sex 
from employees emp
where emp.first_name='Hercules'
and emp.last_name like 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

select emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
from employees emp
inner join dept_emp
on emp.emp_no=dept_emp.emp_no
inner join departments dept
on dept.dept_no=dept_emp.dept_no
and dept.dept_name='Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

select emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
from employees emp
inner join dept_emp
on emp.emp_no=dept_emp.emp_no
inner join departments dept
on dept.dept_no=dept_emp.dept_no
and dept.dept_name in ('Sales','Development');

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

select emp.last_name,count(*) as CNT
from employees emp
group by emp.last_name
order by CNT DESC;