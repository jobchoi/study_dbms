����
���ڿ����� Ư�� ���ڿ��� �ٸ� ���ڿ��� �ٲ� ��ȯ�ϴ� �Լ�
: replace(���ǥ��,  ã�¹��ڿ�, ��ü�ɹ��ڿ�)
���ڿ����� Ư�� ���ڸ� �ٸ� ���ڷ� �ٲ� ��ȯ�ϴ� �Լ�
: translate(���ǥ��, ã�¹����� ����, ��ü�ɹ����� ����)

select replace('���ڿ����� Ư�� ���ڿ��� �ٸ� ���ڿ��� �ٲ� ��ȯ�ϴ� �Լ�'
                , '���ڿ�', '����') s1                
           /* ���ڿ��� Ư�� ������ �ٸ� ���ڷ� �ٲ� ��ȯ�ϴ� �Լ� */,
       translate( '���ڿ����� Ư�� ���ڿ��� �ٸ� ���ڿ��� �ٲ� ��ȯ�ϴ� �Լ�'
                , '����', '��' ) s2
from dual;

���ڿ����� �����Ϻθ� ��ȯ�ϴ� �Լ�: 
substr(���ǥ��, ������ġ, ����)
select substr('���ڿ����� Ư�� ���ڿ��� �ٸ� ���ڿ��� �ٲ� ��ȯ�ϴ� �Լ�', 7, 6) s
from dual;

���ڿ����� Ư�����ڿ��� �ִ� ��ġ�� ��ȯ�ϴ� �Լ�: 
instr(���ǥ��, ã�¹��ڿ�, ã������� ��ġ, ���°�����°�)
�� ��° �����°��� ã���� ���� ���� : default 1
ã������� ��ġ ���� ���� : default 1
select instr('���ڿ����� Ư�� ���ڿ��� �ٸ� ���ڿ��� �ٲ� ��ȯ�ϴ� �Լ�',
                '���ڿ�' ,5, 1) s1,
       instr('���ڿ����� Ư�� ���ڿ��� �ٸ� ���ڿ��� �ٲ� ��ȯ�ϴ� �Լ�',
                '���ڿ�' ,5, 2) s2                 
from dual;

������̺��� ���, ��, ��ȭ��ȣ
select employee_id, last_name, phone_number, 
       substr(phone_number, 1, 
             instr(phone_number, '.', 1, 1)-1
       /*ù��°.�� ��ġ*/  ) local,
       substr(phone_number, instr(phone_number, '.', -1, 1)+1 ) private
       /*������.�� ��ġ=�����ʿ��� ù��°.�� ��ġ*/ 
from employees;

��¥�Լ�
�ý����� ���ó�¥�� ��ȯ�ϴ� �Լ�: sysdate
select sysdate
from dual;

��¥ +- ���� -> ��¥
��¥ - ��¥ -> ����

Ư����¥�κ��� �� ���� ��/�� �� ��¥�� ��ȯ�Լ�
: add_months(��¥ǥ��, ������)
���÷κ��� 3���� ���� ��¥�� �������� �ľ��ϰ��� �Ѵ�.
���÷κ��� 3���� ��, 6���� ���� ��¥ ��ȸ
select add_months(sysdate, -3) before3M, 
       add_months(sysdate, 6) after6M
from dual;

�� ��¥������ �������� ���̸� ��ȯ�Լ�
: months_between(��¥1, ��¥2) ��¥1 > ��¥2
�Ҽ� ù° �ڸ����� ǥ��
select trunc( months_between(sysdate, '19/06/20' ), 1) diff
from dual;

�츮ȸ�� ��� 100���� ��� �� 
���, ��, �Ի�����, �ٹ�������, �ٹ���� ��ȸ
- �ٹ�������, �ٹ������ ������ �������� ����Ͽ� ������ ǥ�� 
���� ��� ������ 2019/08/07 �̰�, 2019/05/27 �Ͽ� �Ի��ߴٸ�  2���� �ٹ��� ��
select employee_id, last_name, hire_date, 
       floor(months_between(sysdate, hire_date) ) work_months,
       floor(months_between(sysdate, hire_date)/12 ) work_years
from employees
where employee_id = 100;
------------------------------------------------------

4) �ش� ���� ������ ��¥�� ��ȯ�ϴ� �Լ�
: last_day(��¥ǥ��)
select last_day(sysdate) s1, 
        last_day(add_months(sysdate, -6)) s2,
       --���÷κ��� 6�������� ���� ������ ��¥
       last_day(add_months(sysdate, 6)) s3
       --���÷κ��� 6���� ���� ���� ������ ��¥
from dual;

* ����ȯ�Լ�
   to_char     to_date
    ->          ->
����        ����      ��¥
     <-           <-  
   to_number    to_char 

����ȭ�Լ�: to_char
����ȭ�Լ�: to_number
��¥ȭ�Լ�: to_date

1. ����ȭ�Լ�: to_number ����->����
'������', 'abc', '19/02/05' -> ���ڷ� ��ȯ �Ұ�
select to_number('1245') s1, 1245 s2
from dual;

2. ����ȭ�Լ�: to_char
1) ����->����: to_char(���ǥ��, ��������)
   ��������: 9:����,0   õ����,ǥ��  ��ȭ��ȣL
select 12345 n1, to_char(123456) s1, 
       1500000 n2, 
              
       '['|| ltrim(to_char(1500000, 'L9,999,999,999'), ' ' ) s21, 
       '['|| ltrim(to_char(1500000, 'L9,999,999,999') ) s22, 
       '['|| trim( leading ' '
                    from to_char(1500000, 'L9,999,999,999') ) s23, 
       '['|| trim(  ' ' from to_char(1500000, 'L9,999,999,999') ) s24, 
       '['|| trim( to_char(1500000, 'L9,999,999,999') ) s25, 
       
       to_char(1500000,'0,000,000,000') s3       
from dual;

2) ��¥->����: to_char(���ǥ��, ǥ������)
ǥ������: ��-yyyy, yy, rr, rrrr ��-mm, month, mon ��-dd  
         ����-day, dy
         ��-hh, hh24   ��-mi   ��-ss
select to_char(sysdate, 'yyyy-mm-dd dy hh24:mi:ss') d1
from dual;


3. ��¥ȭ�Լ�: to_date(���ǥ��, ǥ������)  
'19-08-04' -> ��ȯ����:��¥����, 
'������', 'adb' -> ��ȯ�Ұ�
select to_date('19-08-04') d1, to_date('190804') d2,
       to_date('19-08-04', 'dd-mm-yy') d3
from dual;

select 10 + 20 n1, '10' + '20' n2, 10 + '20' n3
from dual;

10
2

�ǽ�
1. 2005 �� ��(2004�����)�� �Ի��� ������� 
   ���, ����, �Ի�����, �Ի����� ���� �� ��ȸ�Ͽ� 
   �ֱٿ� �Ի��� ��������� �����Ѵ�.
select employee_id, last_name|| ' '|| first_name name,
      hire_date, to_char(hire_date, 'day') hire_day
from employees 
where to_char(hire_date, 'yyyy') < 2005 
order by hire_date desc; --�Ի��� �� < 2005; 
--where hire_date <= '2004/12/31'; 
--where hire_date < '2005/01/01';  --2005 �� ��(2004�����)�� �Ի���;      

2. �޿��� 10000 �̻��� ������� ���, ����, �޿��� ��ȸ�Ͽ�
   �޿������� �����Ѵ�.
   �޿��� ������� õ���� ��ȣ�� ����Ͽ� ǥ���Ѵ�.
select employee_id, last_name||' '||first_name name, 
       trim(to_char(salary, '9,999,999,999')) salary
from employees
where salary >= 10000 --�޿��� 10000 �̻�
order by salary asc;

* �Ϲ��Լ�
���, ��, �޿�, Ŀ�̼ǿ���, �ѱ޿� ��ȸ
�ѱ޿��� �޿�+Ŀ�̼Ǳݾ� 
select employee_id, last_name, salary, commission_pct,
       salary * (1+commission_pct) total_salary
from employees;









































































