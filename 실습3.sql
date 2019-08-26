����Ŭ ���ΰ� ANSI ������ ��� �ۼ�
1. ��� ����� ����, �μ��ڵ�, �μ��� ��ȸ
select last_name||' '||first_name name, e.department_id, department_name
from employees e, departments d  
where e.department_id = d.department_id(+);

select last_name||' '||first_name name, e.department_id, department_name
from employees e left outer join departments d  
on  e.department_id = d.department_id;

select last_name||' '||first_name name, department_id, department_name
from employees e left outer join departments d  
using (department_id);

2. ���� king �� ����� ���, ����, �μ��ڵ�, �μ��� ��ȸ
select employee_id, last_name||' '||first_name name, 
       e.department_id, department_name
from employees e, departments d
where e.department_id = d.department_id
and lower(last_name) = 'king';

select employee_id, last_name||' '||first_name name, 
       e.department_id, department_name
from employees e inner join departments d
on e.department_id = d.department_id
where lower(last_name) = 'king';

select employee_id, last_name||' '||first_name name, 
       department_id, department_name
from employees e inner join departments d
using (department_id)
where lower(last_name) = 'king';

3. ������ ����� 149 �� ����� ���, ��, �μ��ڵ�, �μ��� ��ȸ
select employee_id, last_name, e.department_id, department_name --, e.manager_id 
from employees e, departments d
where e.department_id = d.department_id(+)
and e.manager_id=149;

select employee_id, last_name, e.department_id, department_name
from employees e left outer join departments d
on e.department_id = d.department_id
where e.manager_id=149;

select employee_id, last_name, department_id, department_name
from employees e left outer join departments d
using (department_id)
where e.manager_id=149;

4. ��� ����� ���, ����, ������ ���, ������ ���� ��ȸ
select e.employee_id, e.last_name||' '||e.first_name name,
       e.manager_id, m.employee_id mgr_id, 
       m.last_name||' '||m.first_name manager_name
from employees e, employees m
where e.manager_id = m.employee_id(+);

select e.employee_id, e.last_name||' '||e.first_name name,
       e.manager_id, m.employee_id mgr_id, 
       m.last_name||' '||m.first_name manager_name
from employees m right outer join employees e
on e.manager_id = m.employee_id;

5. ��ġ�ڵ� 1400 �� ���ø�, �μ��� ��ȸ
select city, department_name --, d.location_id
from locations l, departments d
where l.location_id = d.location_id
and d.location_id = 1400;

select city, department_name --, d.location_id
from locations l inner join departments d
on l.location_id = d.location_id
where d.location_id = 1400;

select city, department_name --, location_id
from locations l inner join departments d
using (location_id)
where location_id = 1400;

6. ��ġ�ڵ� 1800 �� �ٹ��ϴ� ����� ����, �����ڵ�, �޿�, �μ���, ��ġ�ڵ� ��ȸ
select last_name||' '||first_name name, job_id, salary,
       department_name, location_id
from employees e, departments d
where e.department_id = d.department_id
and location_id = 1800;

select last_name||' '||first_name name, job_id, salary,
       department_name, location_id
from employees e inner join departments d
on e.department_id = d.department_id
where location_id = 1800;

select last_name||' '||first_name name, job_id, salary,
       department_name, location_id
from employees e inner join departments d
using (department_id)
where location_id = 1800;

7. ���� ��ҹ��� �����ϰ� a�� ���Ե� ������� ���, ��, �μ��� ��ȸ
select employee_id, last_name, department_name 
from employees e, departments d
where e.department_id = d.department_id(+)
and lower(last_name) like '%a%';

select employee_id, last_name, department_name 
from employees e left outer join departments d
on e.department_id = d.department_id
where lower(last_name) like '%a%';

select employee_id, last_name, department_name 
from employees e left outer join departments d
using (department_id)
where lower(last_name) like '%a%';

8. �����ں��� ���� �Ի��� ����� ����, �Ի�����, ������ ����, ������ �Ի����� ��ȸ
select e.last_name||' '||e.first_name emp_name, e.hire_date emp_hire,
       m.last_name||' '||m.first_name mgr_name, m.hire_date mgr_hire 
from employees e, employees m
where e.manager_id = m.employee_id
and e.hire_date < m.hire_date;

select e.last_name||' '||e.first_name emp_name, e.hire_date emp_hire,
       m.last_name||' '||m.first_name mgr_name, m.hire_date mgr_hire 
from employees e inner join employees m
on e.manager_id = m.employee_id
where e.hire_date < m.hire_date;

9. Ŀ�̼��� �޴� ������� ��, �μ���, ��ġ�ڵ�, ���ø� ��ȸ
select last_name, department_name, d.location_id, city
from employees e, departments d, locations l
where e.department_id = d.department_id(+)
and d.location_id = l.location_id(+)
and commission_pct is not null;

select last_name, department_name, d.location_id, city
from employees e left outer join departments d
on e.department_id = d.department_id
left outer join locations l
on d.location_id = l.location_id
where commission_pct is not null;

select last_name, department_name, location_id, city
from employees e left outer join departments d
using  (department_id)
left outer join locations l
using (location_id)
where commission_pct is not null;

10.toronto �� �ٹ��ϴ� ����� ���, ��, �����ڵ�, �μ��ڵ�, �μ��� ��ȸ
select employee_id, last_name, job_id, e.department_id, department_name
from employees e, departments d, locations l
where e.department_id = d.department_id
and d.location_id = l.location_id 
and lower(city) = 'toronto'; --�ٹ����� toronto;

select employee_id, last_name, job_id, e.department_id, department_name
from employees e inner join departments d
on e.department_id = d.department_id
inner join locations l
on d.location_id = l.location_id 
where lower(city) = 'toronto'; --�ٹ����� toronto;

select employee_id, last_name, job_id, department_id, department_name
from employees e inner join departments d
using (department_id)
inner join locations l
using (location_id )
where lower(city) = 'toronto'; --�ٹ����� toronto;

11. ������� �ٹ��ϴ� �μ���  �μ��ڵ�, �μ���, ��ġ�ڵ�, ����� ��ȸ
select
from

12. ������� 3�� �̸��� �μ��� �μ��ڵ�, �μ���, ����� ��ȸ
select
from

13. Administration, Executive �μ������� �����ڵ�, ����� ��ȸ
   ������� ���� �������� ���� ������ ����
select
from

   
