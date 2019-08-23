����
��� ��/���� ��¥�� ��ȯ�ϴ� �Լ�: add_months(���ǥ��, ������)
select add_months(sysdate, 3) after3M
from dual;
�� ��¥ ������ �������� ���̸� ��ȯ�ϴ� �Լ�
: months_between(���¥ǥ��1, ���¥ǥ��2 )
  ���¥ǥ��1 > ���¥ǥ��2 
�� ������� �ٹ��� �ٹ��������� �ľ��ϰ��� �Ѵ�.
���, ��, �Ի�����, �ٹ������� ��ȸ. ���� �ٹ��� ��������� ����
�ٹ��������� ������ ǥ��
select employee_id, last_name, hire_date, 
       floor(months_between(sysdate, hire_date)) work_months
from employees
order by work_months desc;
--order by hire_date asc;

Ư����¥ �ش���� ������ ��¥�� ��ȯ�ϴ� �Լ�: last_day(���ǥ��)
select last_day( '19/05/05' ) d1
from dual;

���� -> ����: ����ȭ: to_number(���ǥ��)
select to_number( '12000' ) n1
from dual;

���� -> ����: ����ȭ : to_char(���ǥ��, ǥ������)
12,000
ǥ������ : 9/0 �� ǥ�� 9�� ǥ���� �������� ä������
                     0�� ǥ���� 0���� ä������.
          õ���� , ��ȣ���� ǥ��
          ��ȭ��ȣ ǥ�� L
select 12000 n1,  to_char(12000) n2,
       trim(to_char(1212000, 'L9,999,999,999')) n3,
       to_char(1212000, 'L00,000,000,000') n4
from dual;


��¥ -> ����: ����ȭ : to_char(���ǥ��, ǥ������)
ǥ������ : ��-yyyy, yy, rrrr, rr    ��-mm    ��-dd   ����-day,dy
          ��-hh, hh24     ��-mi    ��-ss
select sysdate today, 
       to_char(sysdate, 'yyyy-mm-dd dy hh:mi:ss') today2
from dual;

���� -> ��¥: ��¥ȭ : to_date(���ǥ��, ǥ������)
select '191210' s1, to_date('19-12-10') s2,
      to_date('191210', 'ddmmrr') s3
from dual;
-----------------------------------------------

* �Ϲ��Լ�
1. �����Ͱ��� null �� ��� �ٸ� ������ ��ü�Ͽ� ��ȯ�ϴ� �Լ�
   : nvl(���ǥ��, null�϶� ��ȯ ǥ��)
     null �϶� ��ȯ ǥ���� ������Ÿ���� ���ǥ���� ������Ÿ�԰� ���ƾ� �Ѵ�.
���, ��, �޿�, Ŀ�̼ǿ���, �ѱ޿� ��ȸ
�ѱ޿��� �޿�+Ŀ�̼Ǳݾ� 
select employee_id, last_name, salary, commission_pct,
       salary * (1+  nvl(commission_pct, 0)  ) total_salary
from employees;


2. �����Ͱ��� null �� ��� ��ȯ ǥ���� 
            null �� �ƴ� ��� ��ȯ ǥ���� ���� ������ �� �ִ� ������ �Լ�
: nvl2( ���ǥ��, null �ƴѰ�� ��ȯǥ��, null �� ��� ��ȯǥ��)            
  null �� ��� ��ȯǥ���� null �ƴѰ�� ��ȯǥ���� ������Ÿ���� ���ƾ� �Ѵ�.
Ŀ�̼��� �޴� ����� �ѱ޿��� �޿�+Ŀ�̼Ǳݾ�
        ���� �ʴ� �����    �޿�
���, ��, �޿�, Ŀ�̼ǿ���, �ѱ޿����� ��ȸ
select employee_id, last_name, salary, commission_pct,
       nvl2(commission_pct, '�޿�+Ŀ�̼Ǳݾ�', '�޿�' ) salary_type ,
       nvl2(commission_pct, 'salary+commission', 'salary') type2,
       nvl2(commission_pct, 'salary+commission', salary) type3,
       nvl2(commission_pct, 'salary', 'salary+commission') type4,
       nvl2(commission_pct, to_char(salary), 'salary+commission') type5
from employees;

3. �����Ͱ��� null �� ��� ��ü�ؼ� ��ȯ ǥ���� ���� �� ������ �� �ִ� ���� �Լ�
  : null �� �ƴ� ù��° �����͸� ��ȯ�ϴ� �Լ�
 coalesce(���ǥ��, ��üǥ��1, ��üǥ��2, ��üǥ��3, ...)  
 null �� null, ''
 select coalesce('a', '', null, 'd') n1,
        coalesce(null, 'b', null, 'd') n2, 
        coalesce(null, '', 'c', 'd') n3,
        coalesce(null, '', null, 'd') n4,
        coalesce(null, '', null, '') n5
 from dual;
           �޴���            ��         �繫��
ȫ�浿  010-1234-5212
��û                     062-4115-54412
����ġ                                    062-7815-4111
coalesce(�޴���, �繫��, ��)

�ǽ�
���, ��, �μ��ڵ�, �����ڵ�, �Ի�����, �Ŵ������翩�� ��ȸ
�Ŵ������翩�δ� �� ����� ���� 
����� ������(�Ŵ���)�� ������  ���� ����
      ������(�Ŵ���)�� ������  ���� ���� ��ȸ�ǰ� �Ѵ�.
select employee_id, last_name, department_id, job_id, hire_date,
       nvl2(manager_id, '����', '����')  manager_exist,
       nvl2(manager_id, '�Ф�', '^^')  manager_exist2
from employees;        










      













        
        







































