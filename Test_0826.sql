1. �ְ�(��)�޿�, �޿��Ѿ�, ��ձ޿��� ��ȸ.
��ձ޿��� �ݿø��Ͽ� ������ ǥ��
select MAX(salary), min(salary), round(avg(salary),0)
from employees;

2. �ְ�޿�, �����޿����� �޿����� �󸶳� �Ǵ��� �ľ��ϰ��� �Ѵ�.
�ְ�޿��� �����޿��� ������ ��ȸ�Ͻÿ�

3.�������� ��� ������� �ľ��ϰ��� �Ѵ�.
������ ���� ��ȸ�Ͻÿ�.
select distinct  m.manager_id, e.employee_id
from employees e, employees m
where m.manager_id = e.employee_id(+);

4. �μ��ڵ� 20,40,50�� �μ������� �ϴ� ������ � �������� �ִ��� �ľ��ϰ��� �Ѵ�.
�μ��ڵ� 20,40,50�� �μ����鿡 �����ڵ� ��ȸ
select distinct job_id
from employees
where department_id in (20,40,50);

5. �����ڵ�, ������� ��ȸ
select job_id, count(employee_id) mem
from employees
group by job_id
order by -1;

6. �μ��� ��ձ޿� ��ȸ
�μ��ڵ�, �μ���ձ޿��� ��ȸ�ϵ� �μ���ձ׺��� ���� �μ����� �����Ͻÿ�
�μ���ձ޿��� �ݿø��Ͽ� �Ҽ��Ѥ��ڸ����� ǥ���Ͻÿ�
select department_id,round(avg(salary),2)as avg_sal
from employees
group by department_id
order by round(avg(salary),2) asc;

7. �μ���, ������, �޿��Ѿ��� ��ȸ�Ͻÿ�.
select distinct department_id, job_id, sum(salary)
from employees
group by department_id, job_id
order by 1;

8.�μ��ڵ� 50���� �����
select count(employee_id )cnt
from employees
where department_id=50;

9. �μ��޿���� 10000�̻��� �μ��ڵ�, �μ���ձ޿��� ��ȸ
�μ���ձ޿��� �ݿø��Ͽ� �Ҽ� ��°�ڸ����� ǥ���Ͻÿ�.
select round(avg(salary),2) as avg_sal, department_id
from employees
group by department_id
having round(avg(salary),2) >= 10000 ;

10. �� �μ��� �ִ�޿��� 10000�λ��� �μ��� �ľ��ϰ��� �Ѵ�.
�μ��� �ִ�޿��� 10000 �̻��� �μ��ڵ�, �μ��ִ�޿��� ��ȸ�Ͻÿ�.
select max(salary) as max_sal, department_id
from employees
group by department_id
having max(salary) >= 10000;


-- =================== join =================== 
1. ��� ����� ����, �μ��ڵ�, �μ����� ��ȸ�Ͻÿ�.
select e.last_name||' '||first_name name, e.department_id, d.department_name
from employees e inner join departments d
on e.department_id=d.department_id(+);

2. ���� king�� ����� ���, �μ��ڵ�, �μ����� ��ȸ�Ͻÿ�
select last_name||' '||first_name, employee_id, e.department_id, department_name
from departments d,employees e 
where e.department_id=d.department_id(+)
and lower(last_name)='king';

3. ������ ����� 149���� ����� ���, ��, �μ��ڵ�, �μ����� ��ȸ -- ??
select manager_id, e.employee_id, last_name, e.department_id, department_name
from employees e left outer join departments d
where e.manager_id=149;

4. ������� ���, ����, �������� ��� �������� ������ ��ȸ
select e.employee_id, e.last_name, e.manager_id,
       m.employee_id, m.last_name manager_name
from employees e , employees m
where e.employee_id=m.employee_id(+)
order by 1;

5. ��ġ�ڵ� 1400�� ���ÿ��� � �μ����� �ִ��� �ľ��ϰ��� �Ѵ�.
��ġ�ڵ� 1400�� ���ø�, �μ����� ��ȸ�Ͻÿ�

6. ��ġ�ڵ� 1800�� �ٹ��ϴ� ����� ����, �����ڵ�,�޿�, �μ���, ��ġ�ڵ带 ��ȸ�Ͻÿ�

7. ���� ��ҹ��� �����ϰ� a�� ���Ե� ������� ���, ��, �μ����� ��ȸ�Ͻÿ�

8. �����ں��� ���� �Ի��� ����� ����, �Ի�����, ������ ����, ������ �Ի����ڸ� ��ȸ�Ͻÿ�

9. Ŀ�̼��� �޴� ������� ��, �μ���, ��ġ�ڵ�, ���ø��� ��ȸ�Ͻÿ�

10. toronto���� �ٹ��ϴ� ������� ��, �μ���, �����ڵ�, �μ��ڵ�, �μ����� ��ȸ�Ͻÿ�

11. ������� �ٹ��ϴ� �μ������� �ش� �μ����� �ٹ��ϴ� ����� ������� �ľ��ϰ��� �Ѵ�
����� �ٹ��ϴ� �μ��� �μ��ڵ�,�μ���, ��ġ�ڵ�, ������� ��ȸ�Ͻÿ�

12.������� 3�� �̸��� �μ��� ������ �ľ��ϰ����Ѵ�.
������� 3�� �̸��� �μ��ڵ�, �μ���, ������� ��ȸ�Ͻÿ�

13. Administration, Excutive�μ����� � ������ �ְ� 
�ش������ �ϴ� ����� ������� �ľ��ϰ��� �Ѵ�.
Administration, Excutive�μ��� ���� ������� �����ڵ�, ������� ��ȸ�Ͽ� 
������� ���� �������� ���� ���������� �����Ͻÿ�