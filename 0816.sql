����
�⺻������ �����ʹ� �ߺ��� �����Ͽ� ��ȸ�ȴ�.
�ߺ��� �����ϰ� ��ǥ�������ุ ��ȸ�ϱ� ���ؼ��� distinct �� ��� - null ����
�츮ȸ�翡 ����� �Ҽӵ� �μ����� �ľ��ϰ��� �Ѵ�.
������� �Ҽӵ� �μ��ڵ� ��ȸ
select distinct department_id
from employees
where department_id is not null;


�츮ȸ�翡�� �Ŵ����� �ִ� ������� �ľ��ϰ��� �Ѵ�.
�Ŵ����� ������� ��� ��ȸ
select distinct manager_id
from employees
where manager_id is not null;

�׷��Լ� - �������� ������ �����κ��� �ϳ��� ����� ��ȯ�ϴ� �Լ�
          null �� ����
          
1. count(�÷�ǥ��) : ���������� ������ ��ȯ
�츮ȸ�� �����, �μ���ġ���� �����, Ŀ�̼ǹ޴� ����� ��ȸ
select count(*) cnt, count(department_id) detp_cnt, 
       count(commission_pct) comm_cnt
from employees;

�츮ȸ�� ����� �� �μ��ڵ� 60�� �μ��� ���� ������� ���� �ľ��ϰ����Ѵ�.
�μ��ڵ� 60�� �μ��� ���� ����� ��ȸ
select count(*) cnt
from employees
where department_id = 60;

�츮ȸ�� ����� �� clerk ������ ������ �ϴ� ������� ���� �ľ��ϰ��� �Ѵ�.
clerk ������ ������ �ϴ� ����� ��ȸ
select count(*) cnt
from employees
where lower(job_id) like '%clerk%'; --clerk ������ ������ �ϴ�

2. sum(���ǥ��) : �����Ͱ��� ��� ���� ����� ��ȯ - ���ǥ���� ���ڸ� ����
�츮ȸ�� ��� ������� �޿��� ���� ��� �� ��ȸ
select sum(salary) sum_salary
from employees;

�츮ȸ�� �μ��ڵ� 60�� �μ��� ���� ������� �޿��� ���� ��� �� ��ȸ
select sum(salary) sum_sal
from employees
where department_id = 60;--60�� �μ��� ����

�츮ȸ�� account ������ �ϴ� ������� �޿��� ���� ����� ��ȸ
select sum(salary) sum_sal
from employees
where lower(job_id) like '%account%';--account ������ �ϴ� 

3. max/min(���ǥ��) : �����Ͱ��� �� ���� ū/���� ���� ��ȯ 
   - ����/����/��¥ ���� ����
�츮ȸ�� ����� �޿� �� ���� ����, ���� �޿��� ��ȸ
select max(salary) max_sal, min(salary) min_sal
from employees;

�츮ȸ�� ����� �� ���� ����/���߿� ���� ���� ��ȸ
select min(last_name) min_name, max(last_name) max_name
from employees;

�츮ȸ�� ����� �� ���� ����/���߿� �Ի��� ����� �Ի����� ��ȸ
select min(hire_date) min_hire_date, max(hire_date) max_hire_date
from employees;

�츮ȸ�� �μ��ڵ� 60���� �μ��� ���� ����� �� ���� ���� �޿�, ���� �޿� ��ȸ
select max(salary) max_sal, min(salary) min_sal
from employees
where department_id = 60;--�μ��ڵ� 60��;

�츮ȸ�� clerk ������ ������ �ϴ� ������� �Ի������� �ľ��ϰ��� �Ѵ�.
clerk ������ ������ �ϴ� ����� �� 
���� ���� �Ի��� �Ի�����, ���� �ֱ� �Ի��� �Ի����� ��ȸ
select min(hire_date) min_date, max(hire_date) max_date
from employees
where lower(job_id) like '%clerk%'; --clerk ������ ������ �ϴ�

4. avg(���ǥ��) : �����Ͱ��� ����� ��ȯ - ���ڸ� ����

�츮ȸ�� ������� �޿���� ��ȸ
select round(sum(salary)/count(*)) avg_sal, 
       round(avg(salary),2) avg_sal2
from employees;

�츮ȸ�� �μ��ڵ� 60�� �μ��� ���� ������� �޿���� ��ȸ
�޿������ �Ҽ� ��°�ڸ����� �ݿø��ؼ� ǥ��
select round(avg(salary),2) avg_sal
from employees
where department_id = 60; --�μ��ڵ� 60�� �μ��� ����;

�츮ȸ�� ����� �� clerk ������ ������ �ϴ� ������� �޿���� ��ȸ
�޿������ �Ҽ� ��°�ڸ����� �ݿø��ؼ� ǥ��
select round(avg(salary),2) avg_sal
from employees
where lower(job_id) like '%clerk%';--clerk ������ ������ �ϴ�

�ǽ�
1. ���� ��ҹ��� �����ϰ� z�� ���Ե� ���� ���� ������� 
   ��� ������� �ľ��ϰ��� �Ѵ�.
   ���� ��ҹ��� �����ϰ� z�� ���Ե� ���� ���� ������� ���� ��ȸ�Ͻÿ�.
select count(*) cnt
from employees
where lower(last_name) like '%z%';   
   
2. �츮ȸ�� ����� �ְ�޿��� �����޿� �� �޿����� �ľ��ϰ��� �Ѵ�.
   �츮ȸ�� �ְ�޿��� �����޿��� �޿����� ��ȸ�Ͻÿ�.
select max(salary) - min(salary) diff
from employees;

3. �츮ȸ�翡 �Ŵ����� �ִ� ������� ���� �ľ��ϰ��� �Ѵ�.
   �츮ȸ�� �Ŵ����� ������� ���� ��ȸ�Ͻÿ�.
select count(distinct manager_id) cnt
from employees;

4. �츮ȸ�� account ������ �ϴ� ������� ��ձ޿��� ��ȸ�Ͻÿ�.
select round(avg(salary),2) avg_sal
from employees
where lower(job_id) like '%account%';



�츮ȸ�� ������� ���, ��, �μ��ڵ�, �޿� ��ȸ�Ͽ�  �μ��ڵ� ������ �����Ѵ�.
select employee_id, last_name, department_id, salary
from employees
order by department_id;

�μ��ڵ� �޿�
10	4400
20	13000
20	6000
30	11000
30	3100
30	2900
30	2800
30	2600
30	2500
40	6500

��ü ���������� �ϳ��� �׷����� ���� �׷��Լ��� �����͸� ��ȸ
select count(*) cnt
from employees;

Ư�� ������ �ξ� �������� �׷��� ���� �׷캰�� �ϳ��� ����� ��ȸ�ϰ��� �Ҷ�
group by ���� ����Ѵ�.

select �� - ��ȸ�ϰ��� �ϴ� �÷� ���
from �� - select���� �÷��� �ִ� ���̺�
where �� - ���Ǹ� �´� ���������� ��ȸ�ϰ��� �Ҷ�
group by �� - Ư���������� �׷��� ������
order by �� - ���������� ����;

group by + �׷������� �ϴ� ����
�츮ȸ�� �� �μ��� �޿��հ踦 �ľ��ϰ��� �Ѵ�.
�� �μ��� �μ��ڵ�, �޿��հ�, ��ձ޿�, �μ������� ��ȸ�Ͻÿ�
select department_id, sum(salary) sum_sal, 
       round(avg(salary)) avg_sal, count(*) cnt
from employees
group by department_id
order by 1;


select �� - ��ȸ�ϰ��� �ϴ� �÷� ���
from �� - select���� �÷��� �ִ� ���̺�
where �� - ���Ǹ� �´� ���������� ��ȸ�ϰ��� �Ҷ�
group by �� - Ư���������� �׷��� ������
order by �� - ���������� ����;

select ��Ͽ� �׷��Լ��� ����� ǥ����
             �׷��Լ��� ������� ���� ǥ���� �Բ� �ִٸ�
��.��.�� �׷��Լ��� ������� ���� ǥ���� ���ؼ��� 
group by �� �������� ����ؾ߸� �Ѵ�.;

���, ��, �μ��ڵ�, �����ڵ�, �޿� ��ȸ
select employee_id, last_name, department_id, job_id, salary
from employees;

group by ����1, ����2..
�� �μ���, �������� ����� ������ �ľ��ϰ��� �Ѵ�.
�� �μ���, �������� �޿��հ�, �޿����, ������� ��ȸ
select department_id, job_id, sum(salary) sum_sal, 
       round(avg(salary)) avg_sal, count(*) cnt
from employees
group by department_id, job_id
order by 1;

�츮ȸ�� �μ��ڵ� 10,20,30,40, 60 �� �μ��� ���� ������� ������ �ľ��ϰ��� �Ѵ�.
�ش� �μ����� �μ��ڵ�, �μ�����, �μ���ձ޿� ��ȸ
select department_id, count(*) cnt, round(avg(salary) ) avg_sal
from employees
where department_id in (10,20,30,40, 60)--�μ��ڵ� 10,20,30,40, 60 �� �μ��� ����
group by department_id;


�츮ȸ�� clerk ������ ������ �ϴ� ������� ������ �ľ��ϰ��� �Ѵ�.
clerk ������ �������� �����ڵ�, �����ϴ»����, �����ϴ»������ձ޿� ��ȸ
select job_id, count(*) cnt, round(avg(salary)) avg_sal
from employees
where lower(job_id) like '%clerk%' --clerk ������ ������ �ϴ�
group by job_id;

�츮ȸ�� �μ��ڵ� 10,20,30,40,60 �� �μ��� ���� ������� 
� ������ �ϴ��� �ľ��ϰ��� �Ѵ�.
�ش� �μ���  ���� ������� �ϴ� �����ڵ� �� ��ȸ
select distinct job_id
from employees
where department_id in (10,20,30,40,60); --�μ��ڵ� 10,20,30,40,60 �� �μ��� ����;

select job_id
from employees
where department_id in (10,20,30,40,60)
group by job_id;

�츮ȸ�� ����鿡 ���� �� �⵵�� �Ի��� ������� �ľ��ϰ��� �Ѵ�.
�⵵, ����� ��ȸ
2001  10
2003   5


































             
























   













































            












