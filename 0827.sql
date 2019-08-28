select salary
from employees
where max(salary);


1. ������ �������� - ���������� ������� �������� ���
2. ������ �������� - ���������� ������� �������� ���
3. ���� �ķ� �������� - ���������� ����÷��� �����÷��� ���
4. scalar �������� - select ���� ����ϴ� ��������
5. ��ȣ���� �������� - ���������� �÷��� ���������� �������� ���Ǵ� ���
6. inline view �������� - from���� ����ϴ� �������� 


1. ������ �������� 
�츮ȸ�� ������� �޿������� �ľ��ϰ��� �Ѵ�.
�޿��� �츮ȸ�� �޿��� ��պ��� �� ���� �޴� ������� ���, ��, �����ڵ�, �޿���ȸ
select employee_id, last_name, job_id, salary
from employees
where salary < (select avg(salary) from employees);

��� 150�� ������� �� ���� �޿��� �޴� ������� ���, ��, �μ��ڵ�
select employee_id, last_name, department_id, job_id, salary
from employees
where salary > <select salary from emplyees, where employee_id-150;

1. ���� ���� �޿��� �޴� ����� ���, ��, �����ڵ�, �μ��ڵ�, �޿���ȸ
select employee_id, last_name, job_id, salary
from employees 
where salary = (select min(salary ) from employees)
;

2. ȸ�� ����Ժ��� ���� �Ի��� ������� ���, ����, �Ի����� ��ȸ
������ �׸� �����ϴ� �Ŵ����� ���� ����� ���Ѵ�.
select employee_id, last_name||' '||first_name name, hire_date
from employees
where hire_date < (select hire_date from  employees where manager_id is null);


3. �μ����� Marketing�� �μ��� ���� ������� ���, ����, �μ��ڵ�, �����ڵ� ��ȸ\
-- ���ڵ�
select department_name, department_id
from departments
where department_name = 'Marketing' ;
-- ����

select employee_id, last_anme;

���μ��� �ּұ޿��� 40�� �μ��� �ּұ޿����� ������ �μ��� �ľ��ϰ��� �Ѵ�.
�� �μ��� �ּұ޿��� 40�� �μ��� �ּұ޿����� �� ���� �μ��ڵ�, �ּұ޿� ��ȸ
select department_id, min(salary) min_sal
from employees
group by department_id
having min(salary) > (select min(salary) from employees 
                                where department_id=40);
                                
select employee_id, last_name||' '||first_name as name, 
        department_id, job_id
from employees
where department_id =   (select department_id from departments 
                        where location_id=1700);
                        
                        
1. �ٹ����� �����ڵ尡 UK�� ���� �ִ� �μ��� �ľ��ϰ��� �Ѵ�.
�ٹ����� �����ڵ尡 UK�� ���� �ִ� �μ��� �μ��ڵ�, ��ġ�ڵ�, �μ��� ��ȸ
select department_id,department_name, location_id
from departments
where location_id in( select location_id
                        from locations
                        where lower(country_id)='UK') ;

select location_id,country_id
from locations
where country_id='UK';

2. ���� ��ҹ��� �����ϰ�z�� ���Ե� ���� ���� ������
���� �μ��� ���� ������� ���, ����, �μ��ڵ�, �����ڵ� ��ȸ
select department_id, last_name, department_id, 


;3. �����÷� �������� - ���������� ��� �÷��� ���� �÷��� ���
�μ����� ���� �޿��� ���� �޴� ������� �ľ��ϰ��� �Ѵ�.
�μ����� ���� ���� �׺��� �޴� ������� ���, ����, �μ��ڵ�, �޿�, �����ڵ� ��ȸ
select employee_id, last_name||' '||first_name name,
        department_id, salary_id, job_id
from employees
where salary, department_id in (select max(salary), 
                                department_id from employees
                                group by department_id)
order by 3,4 desc;                 


�� �μ��� �ּұ޿��� �޴� ������� ���, ��, �μ��ڵ�, �޿�, �����ڵ� ��ȸ


4. ��Į�� �������� : select���� ����ϴ� ��������
�� ����� �޿� ������ �ľ��ϰ��� �Ѵ�.
��� ����� ���, ��, �޿�, ȸ����ձ޿�, ȸ���ִ� �޿� ��ȸ

��� ����� ���, ��, �μ��ڵ�, �μ��� ��ȸ
select emplyee_id, last_name, e.department_id, department_name
from emplyees e, department d
where d.department_id(+)=e.department_id
;
���, ��, �μ��ڵ�, �����ڵ�, �������� ��ȸ
select  employee_id, last_name, department_id,
        (select job_title from jobs 
        where job) job_title
from employees e;


select department_id, department_name, 
        (select city from locations 
        
from departments d;        
    