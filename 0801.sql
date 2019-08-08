��������: and, or, not
����������: �÷�ǥ�� between A and B - A�̻� B����
           �÷�ǥ�� not between A and B- A�̸� B�ʰ�
           not �÷�ǥ�� between A and B- A�̸� B�ʰ�
�޿��� 2000 �̻� 3000 ������ ������� ���, ����, �޿� ��ȸ
select employee_id, last_name||' '||first_name name, salary
from employees
where salary between 2000 and 3000; --�޿��� 2000 �̻� 3000 ����

�Ի����ڰ� 2003�� 8�� 1�� ���� 2005�� 7�� 31�� �� �ش��ϴ� �������
���, ����, �Ի����� ��ȸ
select employee_id, last_name||' '||first_name name, hire_date
from employees
where hire_date between '03-08-01' and '05-07-31';--�Ի����ڰ� 2003�� 8�� 1�� ���� 2005�� 7�� 31��;



�μ��ڵ尡 20,30,40,60,100, 110 �� �μ��� ���� ������� ���, ����, �μ��ڵ� ��ȸ
select employee_id, last_name||' '||first_name name, department_id
from employees
where department_id=20 or department_id=30 or
department_id=40 or department_id=60 or department_id=100 or department_id=110;
--�μ��ڵ尡 20,30,40,60,100 

6. in ������: ���ǽĿ� �־� 
������ �÷�ǥ���� ���� ������� ������ ���ǽ��� or �� ������ ����
:   �÷�ǥ�� in (������� �����Ͱ� ���)
<-> �÷�ǥ�� not in (������� �����Ͱ� ���)
    not �÷�ǥ�� in (������� �����Ͱ� ���)
select employee_id, last_name||' '||first_name name, department_id
from employees
where department_id in (20,30,40,60,110,100);

select employee_id, last_name||' '||first_name name, department_id
from employees
where not department_id in (20,30,40,60,110,100);
--where department_id not in (20,30,40,60,110,100);

�ǽ�
1.�μ��ڵ尡 30, 60 �� �μ��� ���� ������� ���, ����, �μ��ڵ�, �޿� ��ȸ
select employee_id, last_name||' '||first_name name, department_id, salary
from employees
where department_id in (30, 60);
--where department_id = 30 or department_id = 60; --�μ��ڵ尡 30, 60 

2.�޿��� 5000 �̻� 7000 ������ ������� ���, ����, �μ��ڵ�, �޿� ��ȸ
select employee_id, last_name||' '||first_name name, department_id, salary
from employees
where salary between 5000 and 7000;
--where salary >=5000 and salary<=7000; --�޿��� 5000 �̻� 7000 ����

3.�μ��ڵ尡 30,60 �� �μ��� ���� ������� �޿��� 5000 �̻� 7000 ������ �������
  ���, ����, �μ��ڵ�, �޿� ��ȸ
select employee_id, last_name||' '||first_name name, department_id, salary
from employees
where department_id in (30, 60)
and salary between 5000 and 7000;
--where (department_id = 30 or department_id = 60) --�μ��ڵ尡 30, 60 
--    and (salary >=5000 and salary<=7000); --�޿��� 5000 �̻� 7000 ����
A + B * C *  D

�츮ȸ�� ������� ���, ��, �μ��ڵ� ��ȸ
select employee_id, last_name, department_id
from employees;

�����Ͱ��� ���� ������ ǥ��: null - �񱳺Ұ�, �������Ұ�
7. �÷�ǥ�� is null/is not null : null���� �ƴ��� �ľ�

�μ��ڵ尡 null �� 
�μ���ġ���� ���� ������� ���, ��, �μ��ڵ�, �����ڵ�, �޿� ��ȸ
select employee_id, last_name, department_id, job_id, salary
from employees
where department_id is null;--�μ��ڵ尡 null;
--where department_id is not null;--�μ��ڵ尡 null �� �ƴ�;

Ŀ�̼��� �޴� ������� ���, ��, �μ��ڵ�, Ŀ�̼ǿ��� ��ȸ
select employee_id, last_name, department_id, commission_pct
from employees
where commission_pct is not null;--Ŀ�̼��� �޴�

8. �˻��� �ش��ϴ� ������ : �÷�ǥ�� like �˻����� + %
   %: ����ڰ� ��� ������ ������
ȫ���� �����ϴ� ���� : ȫ�浿, ȫ��, ȫ��, ȫ, ȫ���Ϲ�...
���� like 'ȫ%'
ȫ���� ������ ���� : Ȳ��ȫ, ��ȫ, ��ȫ, ȫ, ����Ϲ�...ȫ
���� like '%ȫ'
ȫ�� ���Ե� ����: ȫ�浿, ȫ��, ȫ��, ȫ, ȫ���Ϲ�, 
                Ȳ��ȫ, ��ȫ, ��ȫ, ȫ, ����Ϲ�...ȫ,
                ��ȫ��, ...
���� like '%ȫ%'

���� K�� �����ϴ� ���� ���� ������� ���, ��, �� ��ȸ
select employee_id, last_name, first_name
from employees
where last_name like 'K%'; --���� K�� �����ϴ�

���� s�� ������ ���� ���� ������� ���, ��, �� ��ȸ
select employee_id, last_name, first_name
from employees
where first_name like '%s';

���� z �� ���Ե� ���� ���� ������� ���, ��, �� ��ȸ
select employee_id, last_name, first_name
from employees
where last_name like '%z%'; --���� z �� ���Ե�

���� ��ҹ��� �����ϰ� z �� ���Ե� ���� ���� ������� ���, ��, �� ��ȸ
select employee_id, last_name, first_name
from employees
where last_name like '%z%' or last_name like '%Z%'; --���� ��ҹ��� �����ϰ� z �� ���Ե�

���� ��ҹ��� �����ϰ� z�� ���Ե� ���� ���� ������� ���, ���� ��ȸ
select employee_id, last_name||' '||first_name name
from employees
where last_name||first_name like '%z%' 
or last_name||first_name like '%Z%';
--���� ��ҹ��� �����ϰ� z�� ���Ե�

���� �ҹ��� z �� ���Ե� ���� ���� ������� ���, ��, �� ��ȸ
select employee_id, last_name, first_name
from employees
where last_name like '%z%'; --���� �ҹ��� z �� ���Ե�

�˻��� �ش��ϴ� ������ : �÷�ǥ�� like �˻����� + %,_
   %: ����ڰ� ��� ������ ������
   _: �ϳ��� ���ڰ� ����ڰ� ������ ������
���� �ҹ��� z�� 2��°�� ��ġ�� �ִ� ���� ���� ������� ���, �� ��ȸ
select employee_id, last_name
from employees
where last_name like '_z%'; --���� �ҹ��� z�� 2��°�� ��ġ�� �ִ�

���� �ҹ��� z�� 5��°�� ��ġ�� �ִ� ���� ���� ������� ���, �� ��ȸ
select employee_id, last_name
from employees
where last_name like '____z%'; --���� �ҹ��� z�� 2��°�� ��ġ�� �ִ�

���� �ҹ��� z�� �ڿ������� 5��°�� ��ġ�� �ִ� ���� ���� ������� ���, �� ��ȸ
select employee_id, last_name
from employees
where last_name like '%z____'; 

�츮ȸ�� ������� ���, ��, �����ڵ� ��ȸ
select employee_id, last_name, job_id
from employees;

like �����ڿ� �Բ� ���� %, _ �� ���� ��ü�� �����ǰ� �Ϸ���
%,_ �տ� ��ȣ���ڸ� ���̰� escape �ɼ��� �����Ѵ�.
�÷�ǥ�� like 'Ư������*_' escape '*'
������� �������¸� �ľ��ϰ��� �Ѵ�.
�����ڵ尡 _A �� ������� ���, ��, �����ڵ带 ��ȸ
: FI_ACCOUNT, AD_ASST, AC_ACCOUNT
select employee_id, last_name, job_id
from employees
where job_id like '%?_A%' escape '?'; --�����ڵ尡 _A ��







   






























































