����鿡 ���� ���, ��, ��, �μ��ڵ�, �Ի�����, �����ڵ�, �޿� ��ȸ
select employee_id, last_name, first_name, department_id,
       hire_date, job_id, salary
from employees;       

Ư�� ���ǿ� �´� ���������� ��ȸ�ϰ��� �Ҷ�
������: where ��
select ��
from ��
where ��;

�������� ����ϴ� ������
1.�񱳿�����: =, !=, <>, >, <, >=, <=
�μ��ڵ尡 90�� �μ��� ���� �������
���, ��, ��, �μ��ڵ�, �����ڵ� ��ȸ
select employee_id, last_name, first_name, department_id, job_id
from employees
where department_id = 90;  /*�μ��ڵ尡 90�� �μ��� ����;*/

���� ������ǥ�� : ''

���� King �� �������
���, ��, �� ��ȸ
select employee_id, last_name, first_name
from employees
where last_name = 'King'; --���� King;

�޿��� 17000 �� �������
���, ��, ��, �μ��ڵ�, �޿� ��ȸ
select employee_id, last_name, first_name, department_id, salary
from employees
where salary = 17000; --�޿��� 17000;

�޿��� 3000 ������ ������� 
���, ��, ��, �����ڵ�, �޿�, �Ի����� ��ȸ
select employee_id, last_name, first_name, job_id,
        salary, hire_date
from employees
where salary <= 3000;        

�޿��� 15000 �̻��� �������
���, ��, ��, �����ڵ�, �޿� ��ȸ
select employee_id, last_name, first_name, job_id, salary
from employees
where salary >= 15000;--�޿��� 15000 �̻�;

2. ���������: +, -, *, /  : select��, ������
������ 150000 �̻��� �������
���, ��, ��, �����ڵ�, ���޿�, ���� ��ȸ
select employee_id, last_name, first_name, job_id, salary, 
        salary*12 annual_salary
from employees
where salary*12 >= 150000;  --������ 150000 �̻�;

���鹮��: ' '
ȫ �浿
3. ���ڿ��Ῥ����: || : select��, ������
������ KingSteven �� ����� 
���, ����, �����ڵ�, �޿�, �μ��ڵ� ��ȸ
select employee_id, last_name || '  ' || first_name as name, job_id, 
      salary, department_id dept_id
from employees
where last_name||first_name = 'KingSteven'; --������ KingSteven;      

�÷�ǥ���� ���� �ٸ� �̸�: alias
�÷�ǥ�� as alias��, �÷�ǥ�� alias��
1. �÷�ǥ���� �����ڰ� ���� ���
2. �÷�ǥ���� �Լ��� ���� ���
3. �÷�ǥ���� ����ġ�� �� ���

4. �������� : and
�μ��ڵ尡 10 �̻� 30 ������ �������
���, ����, �μ��ڵ� ��ȸ
select employee_id, last_name||' '||first_name name, department_id
from employees
where department_id >=10 and  department_id <= 30 ;--�μ��ڵ尡 10 �̻� 30 ����;

�޿��� 10000 �̻� 15000 ������ �������
���, ����, �޿�, �����ڵ� ��ȸ
select employee_id, last_name||' '||first_name name, salary, job_id
from employees
where salary>=10000 and salary<=15000; --�޿��� 10000 �̻� 15000 ����

�μ��� 60�� �μ����� �޿��� 5000 �̻��� �������
���, ����, �μ��ڵ�, �޿� ��ȸ
select employee_id, last_name||' '||first_name name,
       department_id, salary
from employees
where department_id = 60 and salary>= 5000;--�μ��� 60�� �μ� �޿��� 5000 �̻�

����/��¥ ������ǥ��: ''
�μ��ڵ尡 60 �����̸鼭 2003�� 6�� 17�� ������ �Ի��� ������� 
���, ����, �Ի����� ��ȸ
select employee_id, last_name||' '||first_name name, hire_date
from employees
where hire_date <= '2003-06-17'  -- 2003�� 6�� 17�� ������ �Ի���;
and department_id <= 60 --�μ��ڵ尡 60 ����
; 


����
1. ������: where ��
select �� : �÷���1, �÷���2, �÷���3, ...
from �� : ���̺��
where �� : ���ǽ�

���ǽĿ� ���Ǵ� �����ڵ�: �񱳿�����, ���������, ���Ῥ����, ��������
���Ῥ����: ||
��������: and 

������,�Լ��� ����� �÷�ǥ���� ���ؼ��� alias �� �����ϴ� ������ ���´�.






































