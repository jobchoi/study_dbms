���̺���������
from ���� ���̺��� ������ ����� ���·� �����Ѵ�.
���������� where ��
where �������ǽ�

1. equi join
2. outer join - �������� �������� �ʵ���

�μ��� 60�� �μ��� ���� ������� 
���, ��, �μ��� ��ȸ
select employee_id, last_name, department_name
from employees e, departments d
where e.department_id =60 and 
e.department_id = d.department_id;

����ǥ������ : ANSI JOIN
1. equi join -> inner join
from ���� ���̺� ���������� �����Ѵ�. 
���������� : on �� - �������ǽ�
                    �����ϴ� �÷����� �����ϸ�
                            ��.��.�� ���̺���� ����ؾ߸� �Ѵ�. 
           using �� - �����ϴ� �÷����� ������ ��츸 ��� ���� 
                  using (�����÷���) 
                  - using���� ���� �÷��� ���ؼ��� 
                       ���̺�� ��.��.�� ����ؼ��� �ȵȴ�.
���̺� �������İ� ������������ �� �����̴�.
�Ϲ����� ���������� ������ ���� ������ - where ��

���, ��, �μ��ڵ�, �μ��� ��ȸ
select employee_id, last_name, e.department_id, department_name
from employees e inner join departments d
on e.department_id = d.department_id
where e.department_id=60;

select employee_id, last_name, department_id, department_name
from employees e inner join departments d
using (department_id)
where department_id=60;

���, ��, �����ڵ�, �������� ��ȸ
select employee_id, last_name, job_id, job_title
from employees e inner join jobs j 
using (job_id);

select employee_id, last_name, e.job_id, job_title
from employees e inner join jobs j 
on e.job_id = j.job_id
where lower(e.job_id) like '%clerk%';

�츮ȸ�� �μ������� �ľ��ϰ��� �Ѵ�.
�μ��ڵ�, �μ���, ��ġ�ڵ�, ���� ��ȸ
select department_id, department_name, location_id, city
from departments d inner join locations l
using(location_id)
order by 1;

select department_id, department_name, d.location_id, city
from departments d inner join locations l
on d.location_id = l.location_id
order by 1;

�μ��ڵ� 10,20,40,60 �� �μ��� ���� �������
���, ��, �μ��ڵ�, �μ���, �����ڵ�, �������� ��ȸ
select employee_id, last_name, department_id, department_name,
       job_id, job_title
from employees e inner join jobs j 
using (job_id)
inner join departments d
using (department_id)
where department_id in (10,20,40,60);

select employee_id, last_name, e.department_id, department_name,
       e.job_id, job_title
from  employees e inner join departments d 
on e.department_id = d.department_id
inner join jobs j
on e.job_id = j.job_id
where e.department_id in (10,20,40,60);

�ǽ� ansi join
���, ��, �μ��ڵ�, �μ���, ��ġ�ڵ�, ���� ��ȸ
select employee_id, last_name, e.department_id, department_name,
       d.location_id, city
from  employees e inner join departments d
on e.department_id = d.department_id 
inner join locations l  
on d.location_id = l.location_id;

2. outer join -> left/right outer join : �������̺������� 
��� ������� ���, ��, �μ��ڵ�, �μ��� ��ȸ
select employee_id, last_name, e.department_id, department_name
from employees e left outer join departments d
on e.department_id = d.department_id
order by 1;

���, ��, �μ��ڵ�, �μ���, ���� ��ȸ
select employee_id, last_name, e.department_id, department_name, city
from employees e left outer join departments d
on e.department_id = d.department_id
left outer join locations l
on d.location_id = l.location_id
;

��� ������� ���, ��, �Ŵ������, �Ŵ����� ��ȸ-����Ŭ����, ansi���� on��
select e.employee_id, e.last_name, e.manager_id,
       m.employee_id, m.last_name manager_name
from employees e, employees m
where e.manager_id = m.employee_id(+)
order by 1;

select e.employee_id, e.last_name, e.manager_id,
       m.employee_id, m.last_name manager_name
from employees e left outer join employees m
on e.manager_id = m.employee_id
order by 1;





















































