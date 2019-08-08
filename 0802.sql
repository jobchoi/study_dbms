����
in ������ - �÷�ǥ�� in (������� �����Ͱ� ���)
:������ �÷�ǥ���� ���� ������� ���ǽ��� or �����ڷ� ������ ����

����� 100, 110, 120, 125 �� ������� ���, ��, �� ��ȸ
select employee_id, last_name, first_name
from employees
where employee_id = 100 or employee_id = 110 
or employee_id = 120 or employee_id = 125; 
--����� 100, 110, 120, 125

select employee_id, last_name, first_name
from employees
where employee_id in (100,110,120,125);

�����Ͱ��� ���������� �Ǵ��� ������
is not null / is nullwq

null : �񱳺Ұ�, �������Ұ�
�μ���ġ ���� ���� ������� ���, ��, �μ��ڵ� ��ȸ
select employee_id, last_name, department_id
from employees
where department_id is null; --�μ���ġ ���� ����

Ŀ�̼��� �޴� ������� ���, ��, Ŀ�̼ǿ��� ��ȸ
select employee_id, last_name, commission_pct
from employees
where commission_pct is not null; --Ŀ�̼��� �޴� 

�˻�������: like '����ǥ��' + %,_
           %: ����ڰ� � �ִ� ������
           _: ����� �Ѱ��� �ִ�
���� C �� �����ϴ� ���� ���� ������� ���, ��, �� ��ȸ
select employee_id, last_name, first_name
from employees
where last_name like 'C%'; --���� C �� �����ϴ�
����/��¥ ������ǥ�� : ''

alias��
select last_name|| ' '||first_name "Name"
from employees;

���� t �� ������ ���� ���� ������� ���, ��, �� ��ȸ
select employee_id, last_name, first_name
from employees
where last_name like '%t'; --���� t �� ������

���� ��/�ҹ��� t�� �ִ� ���� ���� ������� ���, ��, �� ��ȸ
select employee_id, last_name, first_name
from employees
where last_name like '%t%' or last_name like '%T%'; --���� ��ҹ��� t�� �ִ� 

���� �ҹ��� t�� �տ��� 3��° ��ġ�� ���� ���� �������
���, ��, �� ��ȸ
select employee_id, last_name, first_name
from employees
where last_name like '%t__';
--���� �ҹ��� t�� �ڿ��� 3��° ��ġ��
--where last_name like '__t%';
--���� �ҹ��� t�� �տ��� 3��° ��ġ��

�����ڵ忡 _R �� �ִ� ������� ���, ��, �����ڵ� ��ȸ
_ �� % �� ���� ��ü�� �����ǰ� �ϱ� ���� 
_ �� % �տ� ��ȣ���ڸ� ���̰� 
���� ��ȣ���ڴ� �˻����� ���ܽ�Ų��. : escape ���α�ȣ����
select employee_id, last_name, job_id
from employees
where job_id like '%@_R%' escape '@' ; --�����ڵ忡 _R �� �ִ�;
-----------------------------------------------------------------

* ������������ - order by �� : �������� ���� �������� ��ġ
order by ���ı���ǥ�� + ����(default) asc /�������� desc
���ı���ǥ��: �÷�ǥ�� �״��, alias, select��Ͽ����� ��ġ
select �� 
from ��
where ��
order by ��;

���, ��, �μ��ڵ�, �޿�, �Ի����� ��ȸ, �� ������������ �����Ѵ�.
select employee_id, last
_name name, department_id, salary, hire_date
from employees
order by 2 desc;
--order by name desc;
--order by last_name desc;

���, ��, �μ��ڵ�, �޿�, �Ի����� ��ȸ, 
�μ� ������ �����Ѵ�.
select employee_id, last_name, department_id, salary, hire_date
from employees
order by department_id asc;

���, ��, �μ��ڵ�, �޿�, �Ի����� ��ȸ
�Ի����� ������ �����Ѵ�.
select employee_id, last_name, department_id, salary, hire_date
from employees
order by 5;
--order by hire_date;

���, ��, �μ��ڵ�, �޿�, �Ի����� ��ȸ
�޿� ������ �����Ѵ�.
select employee_id, last_name, department_id, salary, hire_date
from employees
order by salary;

order by ���ı���1 ����/����, ���ı���2 ����/����, ...

���, ��, �μ��ڵ�, �޿�, �Ի����� ��ȸ
�μ� ��, �޿� ������������ �����Ѵ�.
select employee_id, last_name, department_id, salary, hire_date
from employees
order by department_id, 4 desc;

�ǽ�
1. �μ��ڵ� 30, 40, 60�� �μ��� ���� �������
���, ����, �μ��ڵ�, �޿��� ��ȸ�Ͽ� ��������� �����Ѵ�.
select employee_id, last_name||' '||first_name name, 
        department_id, salary
from employees        
where department_id in (30,40,60)  --�μ��ڵ� 30, 40, 60�� �μ��� ����
order by 2;
--order by  name;
--order by last_name||' '||first_name;

2. Ŀ�̼��� �޴� ������� ���, ����, �޿�, Ŀ�̼ǿ����� ��ȸ�Ͽ�
Ŀ�̼ǿ����� ���� ������� ���� ��������� �����Ѵ�.
select employee_id, last_name||' '||first_name name, 
       salary, commission_pct
from employees
where commission_pct is not null --Ŀ�̼��� �޴� �����
order by 4 desc;
--order by commission_pct;

3. ���� ��/�ҹ��� �����ϰ� z �� �ִ� �������
���, ���� �� ��ȸ�Ͽ� ��������� �����Ѵ�.
select employee_id, last_name||' '||first_name name
from employees
where last_name||first_name like '%z%'
order by name; --���� ��/�ҹ��� �����ϰ� z �� �ִ�

* �Լ�
: �����Լ�, �����Լ�, ��¥�Լ�, ����ȯ�Լ�, �Ϲ��Լ�

int no1 = 10;
short no2 = 5;
no2 = (short)no1; �ȴ�� int -> short
no1 = (int)no2; short -> int : ����� ����ȯ
no1 = no2; �Ϲ��� ����ȯ

�������׽�Ʈ�� ���� ���̺�: dummy table - dual;

1. �����Լ�
1) �ݿø��Լ�:  round(�����ڵ�����, ǥ���� �ڸ���)
�Ҽ� ��°�ڸ����� ǥ��
round(1234.56789, 2) -> 1234.57
select round(1234.56789, 2) r1
from dual;










































































