1. �츮ȸ�� ������� �ְ�޿�, �����޿�, �޿��Ѿ�, ��ձ޿� ��ȸ
   ��ձ޿��� �ݿø��Ͽ� ������ ǥ��
select max(salary) max_sal, min(salary) min_sal,
       sum(salary) sum_sal, round(avg(salary)) avg_sal       
from employees;

2. �츮ȸ�� �ְ�޿��� �����޿��� �޿��� ��ȸ
select max(salary) - min(salary) salary_diff
from employees;

3. �츮ȸ�� ������ ���� ��ȸ
select count(distinct manager_id) cnt
from employees;

4. �μ��ڵ� 20,40,50 �� �μ������� �����ڵ� ��ȸ
select distinct job_id
from employees
where department_id in (20,40,50);

select  job_id
from employees
where department_id in (20,40,50)
group by job_id;

5. �츮ȸ�� ������ �����ڵ�, ����� ��ȸ.
select job_id, count(*) cnt
from employees
group by job_id;

6. �μ��� �μ��ڵ�, ��ձ޿� ��ȸ.
   �μ���ձ޿��� �ݿø��Ͽ� �Ҽ� ��°�ڸ�����. �޿��� ���� �μ����� ����
select department_id, round(avg(salary), 2) avg_sal
from employees
group by department_id
order by 2 desc;
--order by avg_sal desc;

7. �μ��� �μ��ڵ�, �����ڵ�, �޿��Ѿ� ��ȸ
select department_id, job_id, sum(salary) sum_sal
from employees
group by department_id, job_id;

8. �μ��ڵ� 50 �� �Ҽӵ� �μ����� �� ��ȸ
select count(*) cnt
from employees
where department_id = 50;

select count(*) cnt
from employees
group by department_id
having department_id = 50;

9. �μ���ձ޿��� 10000 �̻��� �μ��ڵ�, �μ���ձ޿� ��ȸ
   �μ���ձ޿��� �ݿø��Ͽ� �Ҽ� ��°�ڸ�����
select department_id, round(avg(salary) ,2) avg_sal
from employees
group by department_id
having avg(salary) >= 10000;

10.�� �μ��� �ִ�޿��� 10000 �̻��� �μ��ڵ�, �μ��ִ�޿� ��ȸ
select department_id, max(salary) max_sal
from employees
group by department_id
having max(salary)>=10000 ;   
