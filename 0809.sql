����
�����Ͱ� null �� ��� ��ȯ�����͸� �����ϴ� �Լ�
nvl(���ǥ��, null �϶� ��ȯ������)
nvl2(���ǥ��, null �ƴҶ� ��ȯ������, null �϶� ��ȯ������)
coalesce(���ǥ��, 1° �Ķ���Ͱ� null�϶� ��ȯ������,
                  2° �Ķ���Ͱ� null�϶� ��ȯ������, 
                  3° �Ķ���Ͱ� null�϶� ��ȯ������,
                  ....)

���, �Ŵ������
select employee_id, nvl(manager_id, 0) manager_id,
      nvl2(manager_id, 'O', 'X') exist
from employees;
----------------------------------------------------
1. ���ǹ��� �ش��ϴ� �Լ�
if( ���ǽ�1 ){
 ....
}else if( ���ǽ�2 ){
 .....
}else if( ���ǽ�3 ){
 .....
}else{
 ....
}

�μ����� ���ʽ��� �����ϱ�� �ߴ�.
�μ��ڵ尡 10 �̸�  �޿��� 10%,
         20 �̸�  �޿��� 20%,
         30 �̸�  �޿��� 30%,
         ������ �μ����� �޿��� 5%
if( �μ��ڵ� <= 10 ){
  ���ʽ� = �޿�*0.1;
}else if( �μ��ڵ� <= 20 ){
  ���ʽ� = �޿�*0.2;
}else if( �μ��ڵ� <= 30 ){
  ���ʽ� = �޿�*0.3;
}else{
  ���ʽ� = �޿�*0.05;
}

: decode( ���ǥ��, �񱳵�����ǥ��1, ��ȯ������1, 
                   �񱳵�����ǥ��2, ��ȯ������2,
                   �񱳵�����ǥ��3, ��ȯ������3, default��ȯ������)

���, ��, �μ��ڵ�, �޿�, ���ʽ� ��ȸ
select employee_id, last_name, department_id, salary, 
       decode(department_id, 10, salary*0.1, 
                             20, salary*0.2, 
                             30, salary*0.3, salary*0.05 ) bonus
from employees;       

������� ���, ��, �����ڵ�, ������� ��ȸ
select employee_id, last_name, job_id, 
       decode( job_id, 'AD_PRES', 'A', 
                       'ST_MAN', 'B', 
                       'IT_PROG', 'C', 
                       'X' ) job_grade,
       case job_id when 'AD_PRES' then 'A' 
                   when 'ST_MAN' then 'B'
                   when 'IT_PROG' then 'C' else 'X' end grade                       
from employees;

��������� �����ڵ忡 ���� �з��Ѵ�.
�����ڵ�       �������
AD_PRES       A
ST_MAN        B
IT_PROG       C
�� ��          X

���ǹ��� �ش��ϴ� ����: case ~ end
case  ���ǥ�� when �񱳵����Ͱ�1 then ��ȯ������1
              when �񱳵����Ͱ�2 then ��ȯ������2
              when �񱳵����Ͱ�3 then ��ȯ������3
              ....
              else default��ȯ������
end

���, ��, �μ��ڵ�, �޿�, ���ʽ�
select employee_id, last_name, department_id, salary,
       case department_id when 10 then salary*0.1 
                          when 20 then salary*0.2
                          when 30 then salary*0.3 
                          else salary*0.05 end bonus
from employees;

���� ���ǿ� ���� �����͸� ��ȯ�ϴ� ����� case ����
case when ���ǽ�1 then ��ȯ������1
     when ���ǽ�2 then ��ȯ������2
     when ���ǽ�3 then ��ȯ������3
     else default��ȯ������
end      

�μ��ڵ尡 10~30 �̸� �޿��� 10%
�μ��ڵ尡 40~60 �̸� �޿��� 20%
          70~100 �̸� �޿��� 30%
�׿� �μ����� �޿��� 5%
���, ��, �μ��ڵ�, �޿�, ���ʽ� ��ȸ
select employee_id, last_name, department_id, salary,
       case when department_id between 10 and 30 then salary*0.1
            when department_id between 40 and 60 then salary*0.2
            when department_id between 70 and 100 then salary*0.3
            else salary*0.05 end bonus1,
      case when department_id <=30 then salary*0.1
           when department_id <=60 then salary*0.2
           when department_id <=100 then salary*0.3 
           else salary*0.05 end bonus2    
from employees;

�μ��ڵ尡 30���� �̸�  �޿��� 10%
�޿��� 10000 �̻��̸� �޿��� 5%
�����ڵ尡 clerk ������ �����̸� �޿��� 20% 
���, ��, �μ��ڵ�, �޿�, �����ڵ�, ���ʽ� ��ȸ
select employee_id, last_name, department_id, salary, job_id,
      case when department_id <= 30 then salary*0.1
           when salary>=10000 then salary*0.05
           when lower(job_id) like '%clerk%' then salary*0.2 end bonus
from employees;

�ǽ�
��� ����� �� ������� �ٹ����, �ټӻ��¸� �ľ��ϰ��� �Ѵ�.
������� ���, ��, �Ի�����, �ٹ����, �ټӻ��� ��ȸ
�ٹ������ ������ �������� �ٹ��� ����� ������ ǥ���Ѵ�.
�ټӻ��´� �ٹ������ ���� ǥ���Ѵ�.
�ٹ������ 12�� �̸��̸�             12�� �̸� �ټ�   ���� ǥ��
          12�� �̻� 15�� �̸� �̸�  15�� �̸� �ټ�   ���� ǥ��
          15�� �̻� �̸�           15�� �̻� �ټ�   ���� ǥ��    
select employee_id, last_name, hire_date,
       trunc(months_between(sysdate, hire_date)/12) work_years,
       case when months_between(sysdate, hire_date)/12 <12 then '12�� �̸� �ټ�'
            when months_between(sysdate, hire_date)/12 >=12 
                    and months_between(sysdate, hire_date)/12 < 15
                 then '15�� �̸� �ټ�' 
            when months_between(sysdate, hire_date)/12 >=15
                 then '15�� �̻� �ټ�' 
       end work_status,
       case when months_between(sysdate, hire_date)/12 <12 then '12�� �̸� �ټ�'
            when months_between(sysdate, hire_date)/12 <15
                 then '15�� �̸� �ټ�' 
            else  '15�� �̻� �ټ�' 
       end work_status       
from employees;
          
�ϳ��� �������࿡ ���� �ϳ��� ����� ��ȯ�ϴ� ������ �Լ�:  ������ �Լ�
�����Լ�: round,trunc, ceil,floor
�����Լ�: upper, lower, trim, ltrim/rtrim, lpad/rpad, 
         substr, instr, replace, translate
��¥�Լ�: sysdate, months_between, add_months, last_day
����ȯ�Լ�: to_char, to_number, to_date
�Ϲ��Լ�: nvl, nvl2, coalesce, decode, case~end


�츮ȸ�� ������� ���, ��, �μ��ڵ� ��ȸ
select employee_id, last_name, department_id
from employees;

�����ʹ� �ߺ��� ���������� ��ȸ�ȴ�.
�ߺ��� �����ϰ� ��ǥ���� ��ȸ�ϱ� ���� Ű����: distinct : null �� �����Ѵ�.
�������࿡ ���� distinct �Ѵ�.

null �� ���������� ���� �켱������ ���´�.
���������� �� null �� ������ ������������ ��ȸ�Ϸ��� nulls last
���������� �� null �� ù��° ������������ ��ȸ�Ϸ��� nulls first
�츮ȸ�� ������� �Ҽӵ� �μ����� �ľ��ϰ��� �Ѵ�.
������� �Ҽӵ� �μ��ڵ带 ��ȸ
select distinct department_id
from employees
order by 1 desc nulls last;

select distinct department_id
from employees
order by 1 nulls first;

select distinct department_id, employee_id
from employees;

�ǽ�
�츮ȸ�翡 �Ŵ����� �ִ� ������� �������� �ľ��ϰ��� �Ѵ�.
�Ŵ����� ������� ����� ��ȸ
select distinct manager_id
from employees
where manager_id is not null;

���� �����κ��� �ϳ��� ����� ��ȯ�ϴ� ������ �Լ�: �׷��Լ�
- null �� �����Ѵ�.
1. ���������� ������ ���� ��ȯ�ϴ� �Լ�: count(���ǥ��)
select count(*) cnt1, count(employee_id) cnt2, 
       count(department_id) cnt3
from employees;

�μ���ġ ���� ����� ���� ��ȸ
select count(*) cnt 
from employees
where department_id is not null;

select count(department_id) cnt 
from employees;
          
�Ŵ����� ����� ��ȸ
select distinct manager_id
from employees
where manager_id is not null;

�Ŵ����� ������� �� ��ȸ
select count(distinct manager_id) cnt
from employees;

�츮ȸ�� ����� �� Ŀ�̼��� �޴� ������� ��� ������� �ľ��ϰ��� �Ѵ�.
Ŀ�̼��� �޴� ����� ���� ��ȸ
select count(*) cnt
from employees
where commission_pct is not null;

select count(commission_pct) cnt
from employees;

2. �����Ͱ��� ���Ͽ� ��ȯ�ϴ� �Լ�: sum(���ǥ��) - ���ڿ��� ��� ����
�츮ȸ�� ������� �޿� �հ� ��ȸ
select sum(salary) sum_sal
from employees;

3. �����Ͱ� �� ���� ū/���� ���� ��ȯ�ϴ� �Լ�: max/min(���ǥ��)
�츮ȸ�� ������� �޿� �� ���� ����/���� �޿��� �ľ��ϰ��� �Ѵ�.
�츮ȸ�� ���� ����, ���� �޿� ��ȸ
select max(salary) max_sal, min(salary) min_sal
from employees;

























     

















