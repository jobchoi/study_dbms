1. ����� ���, ��, �����ڵ�, �Ի����� ��ȸ
select employee_id, last_name, job_id, hire_date
from employees;

2. �޿��� 12000 �̻��� ����� ���, ����, �޿� ��ȸ
select employee_id, last_name||' '||first_name name, salary
from employees
where salary >= 12000; --�޿��� 12000 �̻�;

3. ��� 176�� ����� ����, �μ���ȣ ��ȸ
select last_name||' '||first_name name, department_id
from employees
where employee_id = 176; ��� 176��

4. �޿��� 8000 �̻� 12000 ���Ͽ� �ش����� �ʴ� ����� ���, ����, �޿�
select employee_id, last_name||' '||first_name name, salary
from employees
where not (8000<=salary and salary<=12000);
--where not salary between 8000 and 12000;
--where salary not between 8000 and 12000;
--where salary<8000 or salary>12000;
--�޿��� 8000 �̻� 12000 ���Ͽ� �ش����� �ʴ�;

5. 2005�� 1�� 1�Ϻ��� 2005�� 6�� 30�ϱ��� �Ի��� �����
���, ����, �����ڵ�, �Ի����� ��ȸ. �Ի����ڸ� �������� �������� ����
select employee_id, last_name||' '||first_name name, job_id, hire_date
from employees
where hire_date between '2005/01/01' and  '2005/06/30'
order by 4 asc;
--order by hire_date asc;
--where hire_date >= '2005/01/01' and hire_date <= '2005/06/30';
--2005�� 1�� 1�Ϻ��� 2005�� 6�� 30�ϱ���

6. �μ��ڵ� 20 �� 50�� ���� ������� ���, ����, �μ��ڵ� ��ȸ.
 ������ �������� �������� ����
 select employee_id, last_name||' '||first_name name, department_id
 from employees
 where department_id in (20, 50)
 order by 2 ;
 --order by name;
 --where department_id = 20 or department_id=50; --�μ��ڵ� 20 �� 50�� ����
  
7. �޿��� 8000 �̻� 12000 �����̰�, �μ��ڵ尡 20,50�� �ش��ϴ� �����
����, �μ��ڵ�, �޿� ��ȸ, 
�μ��ڵ带 �������� ��������, �޿��� �������� �������� ����
select last_name||' '||first_name name, department_id, salary
from employees
where salary between 8000 and 12000 --�޿��� 8000 �̻� 12000 �����̰�
and department_id in (20,50);
--and (department_id = 20 or department_id=50);

8. �Ŵ����� ���� ����� ����, �����ڵ� ��ȸ
select last_name||' '||first_name name, job_id
from employees
where manager_id is null;

9. Ŀ�̼��� �޴� ����� ����,�޿�, Ŀ�̼ǿ��� ��ȸ
�޿��� �������� ��������, Ŀ�̼ǿ����� �������� �������� ����
select last_name||' '||first_name name, salary, commission_pct
from employees
where commission_pct is not null --Ŀ�̼��� �޴�
order by salary desc, 3 desc;

10.���� ��ҹ��� �����ϰ� w�� �ִ� ����� ������ ��ȸ
select last_name||' '||first_name name
from employees
where upper(last_name||first_name) like '%W%';
--where lower(last_name||first_name) like '%w%';
--where last_name||first_name like '%w%'
--or last_name||first_name like '%W%'; --���� ��ҹ��� �����ϰ� w�� �ִ�

11.���� 3��° �ҹ��ڰ� a�� ����� ���� ��ȸ
select last_name||' '||first_name name
from employees
where  last_name like '__a%';
--���� 3��° �ҹ��ڰ� a��

12.Ŀ�̼��� ���� �ʴ� ����� ���, ����, �޿�, 5%�λ�� �޿���ȸ.
5%�λ�� �޿��� �ݿø��Ͽ� ������ ǥ��
select employee_id, last_name||' '||first_name name, salary,
       salary*1.05 increased_salary
from employees
where commission_pct is null;--Ŀ�̼��� ���� �ʴ�;       

13.�����ڵ尡 clerk ������ ����� ���, ����, �����ڵ� ��ȸ
select employee_id, last_name||' '||first_name name, job_id
from employees
where upper(job_id) like '%CLERK%';
--where lower(job_id) like '%clerk%';



