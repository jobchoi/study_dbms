����
�׷��Լ� - count, max/min, sum, avg
�츮ȸ�� ����� ��ȸ
select count(*) cnt
from employees;

Ư�� ������ �ξ� ���ؿ� �ش��ϴ� �׷�� �ϳ��� ����� ��ȸ�ϰ��� �Ҷ�
group by �� + �׷����� ����

* ������ �ۼ�����
1. ��ȸ�ؾ��� �����͸� �ľ��� �� 
   select ���� �÷������ �ۼ��Ѵ�.
2. select ���� ������ �÷��� �ľ��� �� 
   from ���� �÷��� �ִ� ���̺��� �ۼ��Ѵ�.
3. Ư�����ǿ� �´� ���������� ��ȸ�ؾ� �Ѵٸ�
   where ���� ���ǽ��� �ۼ��Ѵ�.
4. �׷�� �ϳ��� ����� ��ȸ�ϴ� ��� - select ���� �׷��Լ��� ����� ǥ����
                                    �׷��Լ��� ������� ���� ǥ���� �Բ� �ִٸ�
   group by ���� �׷����� �������� �ۼ��Ѵ�.
5. �������࿡ ���� ������ �ʿ��� ���
   order by ���� ���ı������� �ۼ��Ѵ�.
;

�� �μ����� ������ �ľ��ϰ��� �Ѵ�.
�� �μ��� �μ��ڵ�, �μ�����, �μ���ձ޿�, �μ��ְ�޿�, �μ������޿� ��ȸ
select department_id, count(*) cnt, round(avg(salary)) avg_sal,
       max(salary) max_sal, min(salary) min_sal
from employees       
group by department_id;

�� �������� ������ �ľ��ϰ��� �Ѵ�.
�� ������ �����ڵ�, �����ϴ»����, ������ձ޿�, �����ְ�޿�, ���������޿� ��ȸ
select job_id, count(*) cnt, round(avg(salary)) avg_sal,
       max(salary) max_sal, min(salary) min_sal
from employees
group by job_id;

�� �μ��� �μ��� �������� �μ��ڵ�, �����ڵ�, �����, ��ձ޿� ��ȸ
select department_id, job_id, count(*) cnt, round(avg(salary)) avg_sal
from employees
group by department_id, job_id
order by 1;


�츮ȸ�� ����鿡 ���� �� �⵵�� �Ի��� ������� �ľ��ϰ��� �Ѵ�.
�⵵, ����� ��ȸ
select to_char(hire_date,'yyyy') hire_year, count(*) cnt
from employees
group by to_char(hire_date,'yyyy')
order by 1;
2001  10
2003   5
--------------------------------------------------------

�ϳ��� ���̺�κ��� �����͸� ��ȸ�� �� ���� ���
�������� ���̺�κ��� �����͸� ��ȸ�ϴµ� ���̺� ���α�� �̶�� �Ѵ�.
���̺�����
1. from ���� ���̺����� �����Ѵ�.
2. ���������� where ���� �ۼ��Ѵ�.
3. �ڵ� ������ ���̰� �������� ���̱� ���� ���̺�� alias �� �����Ѵ�.

������� ������ �ľ��ϰ��� �Ѵ�.
������� ���, ����, �μ��ڵ�, �μ���, �޿�, �Ի����� ��ȸ
select employee_id, last_name||' '||first_name name, 
       e.department_id, department_name, salary, hire_date
from employees e, departments d
where e.department_id = d.department_id   --����� �μ��ڵ� = �μ����̺��� �μ��ڵ�;
order by 1;

�μ������� ������ ���̺�: departments
select * from departments;

�߸��� ���������� ����� ���� �Ǵ� ����: cartesian product
employees: 107 * departments : 27 = 2889

�츮ȸ�� ������� ���, ��, �μ��ڵ�, �����ڵ�, ��������, �޿� ��ȸ
select employee_id, last_name, department_id, e.job_id, 
       job_title, salary
from employees e, jobs j
where e.job_id = j.job_id --����� �����ڵ� = �������̺��� �����ڵ�
order by 1;

������ -> �����Ѱ���
100 ȫ�浿 10            10 �����Ѱ���
101 ����ġ 20            20 ���ߺ�   
102 ��û   10 
103 �ڹ��� 10 

RDBMS
Table -> Entity
ERD(Entity Relationship Diagram)

�츮ȸ�� ������� ���, ��, �μ��ڵ�, �μ���, �����ڵ�, �������� ��ȸ
select employee_id, last_name, e.department_id,
       department_name, e.job_id, job_title
from  employees e, departments d, jobs j
where e.department_id=d.department_id
  and e.job_id = j.job_id
order by 1  ;

����� 100, 120, 130, 140�� �������
���, ��, �μ��ڵ�, �μ���
select employee_id, last_name, e.department_id, department_name
from employees e, departments d
where e.department_id = d.department_id
and employee_id in (100,120,130,140);

�ǽ�
1. ���� ��ҹ��� �����ϰ� z�� �ִ� ���� ���� �������
   ���, ��, �μ��� ��ȸ
select employee_id, last_name, department_name
from employees e, departments d
where e.department_id = d.department_id
  and lower(last_name) like '%z%'; --���� ��ҹ��� �����ϰ� z�� �ִ� ��;
     
2. Ŀ�̼��� �޴� ������� ���, ��, �޿�, Ŀ�̼ǿ���, �������� ��ȸ
select employee_id, last_name, salary, commission_pct, job_title
from employees e, jobs j
where e.job_id = j.job_id
and commission_pct is not null; --Ŀ�̼��� �޴� �����

3. �� �μ��� ���� ������ �ľ��ϰ��� �Ѵ�.
   �� �μ��� �μ��ڵ�, �μ���, ��ġ�ڵ�, ���ø� ��ȸ
select department_id, department_name, l.location_id, city
from departments d, locations l
where d.location_id = l.location_id
order by 1;

�������ǿ� ����񱳿����ڷ� ���� ������ ���α���� equi join

���������� ������ �߻����� �ʵ��� �ϱ� ���� ���α���� outer join
: ��ȣ (+) �� ���������� ������ ���������ʿ� �ٿ��ش�.
 
������̺��� �μ���ġ���� ���� ��� ���������� �ְ�
�μ����̺��� �μ��ڵ尡 null �� ���������� �����Ƿ�
�μ����̺��� �μ��ڵ� �ʿ� outer ��ȣ�� ���δ�.
��� ����� ���, ��, �μ��ڵ�, �μ��� ��ȸ
select employee_id, last_name, e.department_id, department_name
from employees e, departments d
where e.department_id = d.department_id(+)
order by 1; 

100  90       90 Executive
178  null     
   
��� ����� ���, ��, �����ڵ�, �������� ��ȸ
select employee_id, last_name, j.job_id, job_title
from employees e, jobs j
where e.job_id = j.job_id;


��� ����� ���, ��, �μ��ڵ�, �μ���, ��ġ�ڵ�, ���� ��ȸ
select employee_id, last_name, e.department_id, department_name,
       d.location_id, city
from employees e, departments d, locations l
where e.department_id = d.department_id(+)
and d.location_id= l.location_id(+) 
order by 1;

100  90         90 Executive   1600           1600  Seattle
150  60         60 IT          1700           1700  Paris
178  null null                                

��� ����� ���, ��, �μ��ڵ�, �μ���, �����ڵ�, �������� ��ȸ
select employee_id, last_name, e.department_id, department_name,
       e.job_id, job_title
from employees e, departments d, jobs j
where e.department_id=d.department_id(+)
and e.job_id = j.job_id
order by 1;












   
   
   
   
   
   
   



































































   
   
   
   
   
   
   
   
   
   
   