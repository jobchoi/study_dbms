����
���̺�����- �������� ���̺�κ��� �����͸� ��ȸ�ϴ� ���
�������ۼ�����
1. select ���� �÷����� ������� �����Ѵ�.
2. from ���� �ʿ��� ���̺���� ������� �����Ѵ�.
3. from ���� ���̺� ��������� ���̺� ������ �ʿ��ϴ�.
   - ���������� : where �������ǽ�
4. �������� ������ ���� ���ǿ� �´� �������ุ ��ȸ�ؾ� �Ѵٸ�
   ������ : where ���ǽ�
���̺��������ǰ� �Ϲ����� ������ ��� ����ؾ� �ϴ� ���
   where �������ǽ� and ���ǽ�
5. �׷�� �ϳ��� ����� ��ȸ�ϴ� ���
   (select ���� �׷��Լ�ǥ���� �׷��Լ������������ǥ���� �Բ� �ִٸ�
   �ݵ�� �׷��Լ������������ǥ���� ���� group by �������� ����Ѵ�.)
   group by �� �׷����±���
6. group by �� ����࿡ ���� �������� �ʿ��� ���
   having ���ǽ�
7. ���������� ������ �ʿ��� ���
   order by ���ı���

;

group by �� ����࿡ ���� ���������� ������ ���� ������
: having ���ǽ�

�� �μ��� �μ��ڵ�, �μ�����, �μ���ձ޿� ��ȸ
select department_id, count(*) cnt, round(avg(salary)) avg_sal
from employees
group by department_id
having department_id=100;

100�� �μ��� ���� ������ �ľ��ϰ��� �Ѵ�.
100�� �μ��� �μ��ڵ�, �μ�����, �μ���ձ޿� ��ȸ
select department_id, count(*) cnt, round(avg(salary)) avg_sal
from employees
where department_id=100
group by department_id;

�� �μ��� ������ �ľ��ϰ��� �Ѵ�.
�� �μ��� �μ������� 15�� �̻��� �μ��� ���� �μ��ڵ�, �μ�����, �μ���ձ޿� ��ȸ
select department_id, count(*) cnt, round(avg(salary)) avg_sal
from employees
group by department_id
having count(*)  >= 15;

�� �μ��� �μ���ձ޿��� 8000 �̻��� �μ��� ����
�μ��ڵ�, �μ�����, �μ���ձ޿� ��ȸ
select department_id, count(*) cnt, round(avg(salary)) avg_sal
from employees
group by department_id
having avg(salary)>=8000;

�� �μ��� �ִ�޿��� 10000 �̻��� �μ��� �ľ��ϰ��� �Ѵ�.
�� �μ��� �ִ�޿��� 10000 �̻��� �μ��ڵ�, �μ����ִ�޿� ��ȸ
select department_id, max(salary) max_sal
from employees
group by department_id
having max(salary) >= 10000; -- �ִ�޿��� 10000 �̻�

������߿� �Ȱ��� ���� ���� ����� �� �̻� �ִ� ������� �ľ��ϰ��� �Ѵ�.
�Ȱ��� ���� ���� ����� �� �̻� �ִ� ����鿡 ����
����� ��, ����������������� ��ȸ
select last_name, count(*) cnt
from employees
group by last_name
having count(*) >= 2;

���������� ������ �����ϱ� ���� ���̺�����: outer join
: (+) ���������� ������ ���������ʿ� ���δ�.

���, ��, �μ��ڵ�, �μ��� ��ȸ
select employee_id, last_name, e.department_id, department_name
from employees e, departments d
where e.department_id = d.department_id(+);--����μ��ڵ� = �μ������ڵ�;

���, ��, �����ڵ�, �������� ��ȸ
select employee_id, last_name, e.job_id, job_title
from employees e, jobs j
where e.job_id = j.job_id;

���, ��, �μ���, �������� ��ȸ
select employee_id, last_name, department_name, job_title
from employees e, departments d, jobs j
where e.department_id = d.department_id(+)
and e.job_id =j.job_id
order by 1;

������ ���̺��� ������ �غ��Ͽ� �����ϴ� ���: self join

���, ��, �Ŵ������, �Ŵ����� ��ȸ
select e.employee_id, e.last_name, e.manager_id, 
       m.employee_id mgr_id, m.last_name manager_name
from employees e, employees m
where e.manager_id = m.employee_id(+)--����� �Ŵ��� = m.employee_id;
order by 1;

�ǽ�
1. ��� ������� ���, ��, �μ���, ���� ��ȸ
select employee_id, last_name, department_name, city
from employees e, departments d, locations l
where e.department_id = d.department_id(+)
and d.location_id = l.location_id(+)
order by 1;

2. ���� king �� ������� ���, ����, �μ��� ��ȸ
select employee_id, last_name||' '||first_name name, department_name
from employees e, departments d
where e.department_id = d.department_id(+)
and lower(last_name) = 'king';

3. �Ŵ�������� 149 ���� ������� ���, ��, �μ��� ��ȸ
select employee_id, last_name, department_name--, e.manager_id
from employees e, departments d
where e.department_id = d.department_id(+)
and e.manager_id=149;

4. ��ġ�ڵ尡 1400 �� ���ÿ��� � �μ����� �ֳ� �ľ��ϰ��� �Ѵ�.
   ��ġ�ڵ尡 1400 �� ����, �μ��� ��ȸ
select city, department_name--, d.location_id
from locations l, departments d
where d.location_id = l.location_id
and d.location_id=1400;
   
5. ��ġ�ڵ� 1800 �� �ٹ��ϴ� ������� ���, ��, �����ڵ�, �μ���, ��ġ�ڵ� ��ȸ
select employee_id, last_name, job_id, department_name, location_id
from employees e, departments d
where e.department_id = d.department_id(+)
and location_id = 1800;

6. �ڽ��� �Ŵ������� ���� �Ի��� ������� 
   ���, ����, �Ի�����, �Ŵ�������, �Ŵ����Ի����� ��ȸ
select e.employee_id, e.last_name||' '||e.first_name name, e.hire_date,
       m.last_name||' '||m.first_name manager_name, m.hire_date manager_hire_date
from employees e, employees m
where e.manager_id = m.employee_id(+)
and e.hire_date < m.hire_date --�ڽ��� �Ŵ������� ���� �Ի��� = �ڽ��� �Ի����� < �Ŵ����� �Ի����� ;
order by 1;
  
7. Ŀ�̼��� �޴� ��� ������� ��, �μ���, ��ġ�ڵ�, ���� ��ȸ
select last_name, department_name, d.location_id, city
from employees e, departments d, locations l
where e.department_id = d.department_id(+)
and d.location_id = l.location_id(+)
and commission_pct is not null; --Ŀ�̼��� �޴�;

8. toronto �� �ٹ��ϴ� ������� ��, �����ڵ�, �μ��ڵ�, �μ��� ��ȸ
select last_name, job_id, e.department_id, department_name
from employees e, departments d, locations l
where e.department_id = d.department_id(+)
and d.location_id = l.location_id(+)
and lower(city) = 'toronto';


   
   
   
   
   
   
   
   
   