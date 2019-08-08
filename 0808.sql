select add_months(sysdate, 3) after3M
from dual;

�� ��¥ ������ �������� ���̸� ��ȯ�ϴ� �Լ�
months_between(���¥ǥ��1, ���¥ǥ��2)


���, ��, �Ի�����, �ٹ������� ��ȸ -> ���� �ٹ��� ��������� ����
select employee_id, last_name, hire_date,
    floor(months_between(sysdate, hire_date)) work_months
from employees
order by hire_date desc;

Ư����¥ �ش���� ������ ��¥�� ��ȯ�ϴ� �Լ� : last_day()
select last_day('19/05/05') as dl
from dual;

���� -> ���� :
����ȭ : to_number()
select to_number('12000') as nl
from dual;

���� -> ���� 
����ȭ : to_char()
        to_char(���ǥ��, ǥ�� ����)
 ǥ�� ���� : 
 9 / 0���� ǥ��, 9 -> �������� ä����
                0 -> 0 ���� ä����
select 12000 as nl, to_char(12000) as n2
from dual;
select  12000 as nl, to_char(12000) as n2
        trim(to_char(1212000,L9,999,999))
from dual;

��¥ ->����
ǥ�� ���� :
�� - yyyy, yy, rrrr, rr
�� - mm, month(�����ΰ�쿡 ����)
�� - dd
���� - day, dy
�� - hh, hh24,  �� - mm,  �� - ss
select sysdate today, to_char(sysdate, 'yy-mm-dd dy hh:mm:ss') as today2
from dual;


���� -> ��¥
to_date(���ǥ��, ǥ������)
select  '191210' as s, to_date('191210') as s2,
        to_date('191210','ddmmrr') s3
from dual;

�Ϲ��Լ�
1. �����Ͱ��� null �� ��� �ٸ� ������ ��ü�Ͽ� ��ȯ�ϴ� �Լ�
: nvl(���ǥ��, null�϶� ��ȯ ǥ��)
���, ��, �޿�, Ŀ�̼���, �ѱ޿� ��ȸ
�ѱ޿� = �޿� + Ŀ�̼� �ݾ�
select employee_id, last_name, salary, commission_pct,
        salary*(1+nvl(commission_pct, 0))total_salary
from employees;

2. �����Ͱ��� null�� ��� ��ȯ ǥ����
null�� �ƴ� ��� ��ȯǥ���� ���� ������ ���ִ� ������ �Լ�
: nvl2(���ǥ��, null �ƴ� ��� ��ȯǥ��, null�� ��� ��ȯǥ��)
Ŀ�̼��� �޴� ��� :    �ѱ޿� = �޿� + Ŀ�̼Ǳݾ�
    ���� �ʴ� ��� :  �ѱ޿� = �޿� 
null�� ��� ��ȯǥ���� null�� �ƴ� ��� ��ȯǥ���� ������ Ÿ���� ���ƾ� �Ѵ�.
select  employee_id, last_name, salary, commission_pct,
        nvl2(commission_pct, '�޿�+Ŀ�̼Ǳݾ�','�ݾ�') salary_type,
        nvl2(commission_pct,'salary+commission','salary') type2,
        nvl2(commission_pct,'salary+commission',salary) type3,
        nvl2(commission_pct,'salary','salary+commission') type4,
        nvl2(commission_pct,to_char(salary),'salary+commission') type5
from employees;

3. �����Ͱ��� null�� ��� ��ü�ؼ� ��ȯ ǥ���� ������ ������ �� �ִ� ���� �Լ�
: null �� �ƴ� ù��° �����͸� ��ȯ�ϴ� �Լ�
coalesce(���ǥ��, ��üǥ��1, ��üǥ��2, ��üǥ��3, ....);

select  coalesce('a','',null,'d') as n1,
        coalesce(null,'b',null,'d') as n2,
        coalesce(null,'','c','d') as n3,
        coalesce(null,'',null,'d') as n4,        
        coalesce(null,'',null,'') as n5
from dual;

�ǽ� 
���, ��, �μ��ڵ�, �����ڵ�, �Ի�����, �Ŵ������翩�� ��ȸ
�Ŵ��� ���翩�δ� �� ����� ���� 
����� ������(�Ŵ���)�� ������ -> ����
                     ������ -> ����
-- my code
select  employee_id, last_name, nvl2(manager_id,'����','����'), 
        to_char(hire_date,'yyyy-mm-dd')
from employees, jobs;

-- master
select  employee_id, last_name, department_id, hire_date,
        nvl2(manager_id,'����','����') manager_exist
from employees;