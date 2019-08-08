select �÷���1, �÷���2,  ...
from ���̺��;

Ư�����ǿ� �´� �������� ��ȸ��
select �÷���1, �÷���2,  ...
from ���̺��
where ���ǽ�;

�������� ����ϴ� ������
1. �񱳿�����: =, !=, <>, >, <, >=, <=
�޿��� 15000 �̻��� ������� ���, ��, ��, �޿� ��ȸ
select employee_id, last_name, first_name, salary
from employees
where salary >= 15000; --�޿��� 15000 �̻�;

����/��¥������ǥ��: ''
���� King �� ������� ���, ��, ��, �Ի����� ��ȸ
select employee_id, last_name, first_name, hire_date
from employees
where last_name = 'King'; --���� King ��;

�Ի����ڰ� 2004��1��30�� ������� ���, ��, ��, �Ի�����, �����ڵ� ��ȸ
select employee_id, last_name, first_name, hire_date, job_id
from employees
where hire_date = '2004-01-30';

��¥�������� �������� Ȯ��:
select * from v$nls_parameters;

2. ���������: +, -, *, / : ������, select���� ���
������ 30000 �̸��� ������� ���, ��, ��, �޿�, ���� ��ȸ
select employee_id, last_name, first_name, salary, salary*12 annual
from employees
where salary*12 < 30000; --������ 30000 �̸�;

3. ���ڿ��Ῥ����: || : ������, select���� ���
������ ChenJohn �� ����� ���, ���� ��ȸ
select employee_id, last_name || '  ' || first_name as name
from employees
where last_name||first_name = 'ChenJohn'; --������ ChenJohn;

select �� �÷�ǥ���� ������/�Լ��� ���� ��� 
�ݵ�� alias �� �����ϵ��� �Ѵ�.
�÷�ǥ�� as alias�� / �÷�ǥ�� alias�� ;

4. ��������: and 
�޿��� 3000 �̻� 4000 ������ ������� ���, ����, �޿� ��ȸ
select employee_id, last_name||' '||first_name name, salary
from employees
where salary>=3000 and salary<=4000 ;--�޿��� 3000 �̻� 4000 ����;

�μ��ڵ尡 80 �� �μ��� ���ϸ鼭 �޿��� 8000 �̻��� ������� 
���, ����, �μ��ڵ�, �޿� ��ȸ
select employee_id, last_name||' '||first_name name, department_id, salary
from employees
where department_id = 80 --�μ��ڵ尡 80 �� �μ��� ���ϸ鼭;
  and salary>=8000; --�޿��� 8000 �̻�
-------------------------------------------------


�μ��ڵ尡 10,20,30�� �μ��� ���� �������
���, ����, �μ��ڵ�, �����ڵ� ��ȸ
select employee_id, last_name||' '||first_name name, department_id, job_id
from employees
where department_id = 10 or department_id = 30
  or department_id = 20; --�μ��ڵ尡 10,20,30;

����� 150, 170, 190 �� �������
���, ����, �μ��ڵ�, �����ڵ�, �Ի����� ��ȸ
select employee_id, last_name||' '||first_name name, 
        department_id, job_id, hire_date
from employees
where employee_id = 150 or employee_id = 170 or employee_id = 190 ;
--����� 150, 170, 190 ;        

�μ��ڵ尡 30�� �μ��� �޿� 10000 �̸��� ������
�μ��ڵ尡 60�� �μ��� �޿� 5000 �̻��� ������� ���, ����, �μ��ڵ�, �޿� ��ȸ
select employee_id, last_name||' '||first_name name,
       department_id, salary
from employees
where (department_id=30 and salary<10000) 
or (department_id=60 and salary>=5000);
--where department_id=30 and salary<10000 --�μ��ڵ尡 30�� �μ��� �޿� 10000 �̸�
--or department_id=60 and salary>=5000; --�μ��ڵ尡 60�� �μ��� �޿� 5000 �̻�

�����ڿ��� �켱������ �ִ�
��������� ���: *,/ -> +,-
�������� ���: and:���� -> or:����
7+(7/7)+(7*7)-7

5. ����������
A�̻� B����: �÷�ǥ�� between A and B
A�̸� B�ʰ�: �÷�ǥ�� not between A and B
            not �÷�ǥ�� between A and B

�μ��ڵ尡 10 �̻� 40 ������ �μ��� ���� �������
���, ����, �μ��ڵ� ��ȸ
select employee_id, last_name||' '||first_name name, department_id
from employees
where department_id between 10 and 40;
--where department_id>=10 and department_id<=40; --�μ��ڵ尡 10 �̻� 40 ����;

�޿��� 10000 �̻� 15000 ������ ������� ���, ����, �޿� ��ȸ
select employee_id, last_name||' '||first_name name, salary
from employees
where salary between 10000 and 15000;--�޿��� 10000 �̻� 15000 ����


select employee_id, last_name||' '||first_name name, department_id
from employees
where department_id>=10 and department_id<=40; --�μ��ڵ尡 10 �̻� 40 ����;
�������ڸ� �����
�μ��ڵ尡 10 �̸� 40 �ʰ��� ������� ���, ����, �μ��ڵ� ��ȸ
select employee_id, last_name||' '||first_name name, department_id
from employees
--where not department_id between 10 and 40;
--where department_id not between 10 and 40;
--where department_id<10 or department_id>40; --�μ��ڵ尡 10 �̸� 40 �ʰ�
where not (department_id>=10 and department_id<=40);

����� 110 �̻� 120������ ������߿� �޿��� 8000 �̻� 15000 ������ �������
���, ����, �μ��ڵ�, �޿� ��ȸ
select employee_id, last_name||' '||first_name name, department_id, salary
from employees 
where (employee_id between 110 and 120)  --����� 110 �̻� 120����
and (salary between 8000 and 15000);--�޿��� 8000 �̻� 15000 ����


��������: and, or, not
and  | True  False          or   | True  False         not | True  False
------------------          ------------------         ------------------
True | True  False          True | True  True                False True  
False| False False          False| True  False









































