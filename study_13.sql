1. ����� ���, ��, �����ڵ�, �Ի����ڸ� ��ȸ�Ͻÿ�
select employee_id, last_name, department_id, hire_date
from employees;

2. �޿��� 12000 �̻��� ����� 
���, ����, �޿��� ��ȸ�Ͻÿ�
������ ���� �� ���̿� ���� ���ڸ� �ξ� �����Ѵ�.
select employee_id, last_name||' '||first_name as name, salary
from employees
where salary >= 12000;

3. ����� 176�� ����� ����, �μ���ȣ�� ��ȸ�Ͻÿ�.
select employee_id, last_name||' '||first_name as name
from employees
where employee_id = 176;

4. �޿��� 8000 �̻� 12000 ���Ͽ� �ش����� �ʴ� ����� ���, ����, �޿��� ��ȸ�Ͻÿ�.
select employee_id, last_name || ' ' || first_name as name, salary
from employees
where salary > 8000 and salary < 12000;

5. 2005��1��1�Ϻ��� 2005�� 6�� 30�� ���� 
�Ի��� ����� ���, ����, �����ڵ�, �Ի����ڸ� ��ȸ�ϵ� 
�Ի����ڸ� �������� �������� �����Ͻÿ�.
select employee_id, last_name || ' ' || first_name as name, department_id, hire_date
from employees
--where field between to_date('20031120', 'YYYYMMDD') and to_date('20031201', 'YYYYMMDD')
where hire_date between to_date('20050101','yyyymmdd') and to_date('20050630','yyyymmdd'); 

6. �μ��ڵ尡 20 �� 50�� ���ϴ� ������� ���, ����, �μ��ڵ带 ��ȸ�ϵ�
������ �������� �������� �����Ͻÿ�.
select employee_id, last_name||' '||first_name, department_id
from employees
where department_id = 20 or department_id = 50;

7. �޿��� 8000 �̻� 12000�����̰�, �μ��ڵ尡 20,50�� �ش��ϴ� ����� ����, �μ��ڵ�, �޿��� ��ȸ�ϵ�,
�μ��ڵ带 �������� ��������, �޿��� �������� �������� �����Ͻÿ�.
--���� ������ �ʵ尡 �� ���̻��� ���? �� ��쿡�� ����ұ��? �Ʒ��� site, name �ΰ��� �ʵ�� �����ϵ����մϴ�.
--SELECT * FROM tableName WHERE site="webisfree.com" ORDER BY site ASC, name ASC
--// �ټ��� �ʵ�� site�� name���� ������
select employee_id, last_name||' '||first_name as name,
department_id, salary
from employees
where salary >= 8000 and salary <= 12000 and department_id = 50
order by salary asc, department_id desc;

8. �Ŵ����� ���� ����� ����, �����ڵ带 ��ȸ �Ͻÿ�.
select  last_name||' '||first_name, department_id, manager_id
from employees
where manager_id is null;

9. Ŀ�̼��� �޴� ����� ����, �޿�, Ŀ�̼����� ��ȸ�ϵ�,
�޿��� �������� ���������� Ŀ�̼����� �������� �������� �����Ͻÿ�.



-- ================���� ================
select employee_id, nvl(manager_id, 0)manager_id,
        nvl2(manager_id, '0', 'x') exist
from employees;

-- ���ǹ�
* �μ����� ���ʽ��� ����, �μ��ڵ尡 10�̸� -> �޿��� 10%
                                 20�̸� -> �޿��� 20%
                                 30�̸� -> �޿��� 30%
if(�μ��ڵ� == 10){
    ���ʽ� = �޿� * 0.1;
}if(�μ��ڵ� == 20){
    ���ʽ� = �޿� * 0.2;
}if(�μ��ڵ� == 30){
    ���ʽ� = �޿� * 0.3;
}
: decode(���ǥ��,  �񱳵�����ǥ��1, ��ȯ������1,
                   �񱳵�����ǥ��2, ��ȯ������2, 
                   �񱳵�����ǥ��3, ��ȯ������3,
                   ������ �μ������� �޿��� 5%)
���, ��, �μ��ڵ� , �޿�, ���ʽ� ��ȸ
select  employee_id, last_name, department_id, salary,
        decode(department_id,   10, salary*0.1,
                                20, salary*0.2,
                                30, salary*0.3, 
                                salary*0.05) bonus
from employees;

������� ���, ��, �����ڵ�, ������� ��ȸ
��������� �����ڵ忡 ���� �з��Ѵ�. 
�����ڵ�     �������
AD_PRES     A
ST_MAN      B
IT_PROG     C
�׿�          X
select  employee_id, last_name, department_id,job_id,
        decode(job_id, 'AD_PRES', 'A',
                        'ST_MAN', 'B',
                        'IT_PROG', 'C',
                        'x') as job_code
        case job_id when 'AD_PRES' then 'A'
                    when 'ST_MAN' then 'B'
                    when 'IT_PROG' then 'C' else 'x ' end k
from employees;

���ǹ��� �ش��ϴ� ���� : case ~ end | �Լ��� �ƴϹǷ� ,�� ������ ���� ����
case ���ǥ��   when �񱳵�����1 then  ��ȯ������1
               when �񱳵�����2 then  ��ȯ������2
               when �񱳵�����3 then  ��ȯ������3
               ...
end

���, ��, �μ��ڵ�, �޿�, ���ʽ�
select employee_id, last_name, department_id, salary,
        case department_id when 10 then salary*0.1 
        when 20 then salary*0.2 
        when 30 then salary*0.3 
        else salary*0.05 end bonus
from employees;              



select employee_id, last_name, department_id, salary,
       case department_id when 10 then salary*0.1 
                          when 20 then salary*0.2
                          when 30 then salary*0.3 
                          else salary*0.05 end bonus
from employees;



select  employee_id, last_name, department_id, job_id,
        case job_id when 'AD_PRES' then 'A'
        else 'x' end grade
from employees;

���� ���ǿ� ���� �����͸� ��ȯ�ϴ� ����� case 
case    when ���ǽ�1 then ��ȯ������1
        when ���ǽ�2 then ��ȯ������2
        when ���ǽ�3 then ��ȯ������3
        else default ��ȯ������
end

�μ��ڵ尡   10~30 -> �޿��� 10%
            40~60 -> �޿��� 20%
            70~100 -> �޿��� 30%
�׿� �μ����� �޿��� 5%
���, ��, �μ��ڵ�, �޿�, ���ʽ� ��ȸ
select employee_id, last_name, department_id, salary,
case when department_id between 10 and 30 then salary*0.1
    when department_id between 40 and 60 then salary*0.2
    when department_id between 70 and 100 then salary*0.3
    else salary*0.05 end bonus
from employees;


�μ��ڵ尡 30�����̸� �޿��� 10%
�޿��� 1000�̻��̸� �޿��� 5%
�����ڵ尡 clerk������ �����̳�
select employee_id, last_name, department_id,salary,job_id,
--case when department_id <= 30 then 0.0
where department_id<=30
from employees;


��� ����� �� ������� �ٹ����, �ټӻ��¸� �ľ��ϰ��� �Ѵ�.
������� ���, ��, �Ի�����, �ٹ���� ������ȸ
�ٹ������ ������ �������� �ٹ��� ����� ������ǥ���Ѵ�.
�ٹ� ���´� �ٹ���� ���� ǥ��
select employee_id, last_name, hire_date,
    trunc(months_between(sysdate,hire_date)/12) work_years,
    case when months_between(sysdate,hire_date)/12 < 12 then '12�� �̸� �ټ�'
    end work_status;
from employees;
-- holding


������� ���, ��, �μ��ڵ� ��ȸ
select employee_id, last_name, department_id
from employees;

�⺻������ �����ʹ� �ߺ��� ���������� ��ȸ�ȴ�.
�ߺ����� : distinct -> null�� ǥ���� �ȴ�.
�������࿡ ���� distinct��.

null : ���������� �켱������ ���´�.
���������� �� null�� ������ ������������ ��ȸ�Ϸ��� nulls last

������� �Ҽӵ� �μ��� �ľ�
������� �Ҽӵ� �μ��ڵ带 ��ȸ
select distinct department_id
from employees
order by 1 nulls first;

-- employee_id�� �ߺ��Ǵ� ���� ���� distinct�� ���� �ǹ̰� ����.
select distinct department_id, employee_id
from employees;

�ǽ� :
�Ŵ����� �ִ� ������� ���������ľ��ϰ��� �Ѵ�.
select  employee_id,department_id
from employees
case when department_id=null;

select distinct manager_id
from employees
where manager_id is not null;


���������� ���� �ϳ��� ����� ��ȯ�ϴ� ������ �Լ� : �׷��Լ�
- null�� ������
1. ���������� ������ ���� ��ȯ�ϴ� �Լ� : count(���ǥ��)
select count (*) cnt1, count(employee_id) cnt2, 
        count(department_id) cnt3
from employees;

�μ���ġ�� ���� ����� ���� ��ȸ
select count(department_id) cnt
from employees;

�Ŵ����� ���
select distinct manager_id
from employees
where manager_id is not null;

select count(distinct manager_id) cnt
from employees;

������� Ŀ�̼��� �޴� ������� ��� ����ΰ�?
select count(*) cnt
from employees
where COMMISSION_PCT is not null;

select count(distinct COMMISSION_PCT) cnt
from employees;

1. �����Ͱ��� ���Ͽ� ��ȯ�ϴ� �Լ� : sum(���ǥ��)
������� �޿� �հ� ��ȸ
select sum(salary) sum_sal
from employees;

3. ������ �� �� ���� ū/���� ���� ��ȯ�ϴ� �Լ� : max(���ǥ��)/min(���ǥ��)
���� ���� ����
select max(salary) max_sal
from employees;

select min(salary) min_sal
from employees;




�Ŵ����� �ִ� ������� �ľ��ϰ��� �Ѵ�.
�Ŵ����� ������� �����ȸ
select distinct manager_id
from employees
where manager_id is not null;

�׷��Լ� - �������� ������ �����κ��� �ϳ��� ����� ��ȯ�ϴ� �Լ�
1. count(�÷�ǥ��) : ���������� ������ ��ȯ
�츮ȸ�� �����, �μ���ġ ���� ����� ��ȸ

select  count(*) cnt, count(department_id) dept_cnt,
        count(commission_pct) comm_cnt
from employees;

������� �μ��ڵ� 60�� �μ��� ���� ������� ���� �ľ��ϰ��� �Ѵ�.
�μ��ڵ� 60�� �μ��� ���� ������� ��ȸ
select count(*) cnt
from employees
where department_id=60;

������� clerk������ ������ �ϴ� ������� ���� �ľ��ϰ��� �Ѵ�.
clerk������ ������ �ϴ� ����� ��ȸ
select count(*) cnt
from employees
where lower(job_id) like '%clerk%';

sum(���ǥ��) : �����Ͱ��� ��� ���� ����� ��ȯ - ���ǥ���� ���ڸ� ����.
ȸ�� ��� ������� �޿��� ���� ����� ��ȸ
select sum(salary) sum_salary
from employees;

ȸ�� �μ��ڵ� 60�� �μ��� ���� ������� �޿��� ���� ����� ��ȸ
select sum(salary) sum_sal
from employees
where department_id=60;


account ������ �ϴ� ������� �޿��� ���� ��� ��ȸ
select sum(salary) sum_acc
from employees
where lower(job_id) like '%account%';

max/min : �����Ͱ��� �� ���� ū/���� ���� ��ȯ. - �������밡��. 
- ����, ����, ��¥ ���밡��.

ȸ�� ����� �޿��� ���� ���� �޿��� ��ȸ
select max(salary) max_sal, min(salary) min_sal
from employees;

������� ���� ���� ���� ���� ��ȸ
select min(last_name) min_name, max(last_name) max_name
from employees;

������� ���� ���� �Ի��� ����� �Ի����� ��ȸ
select min(hire_date) min_hire_date, max(hire_date) max_hire_date
from employees;


�μ��ڵ� 60���� �μ��� ���� ����� �� ���� ���� �޿�, ���� �޿� ��ȸ
select max(salary)max_sal, min(salary)min_sal
from emplyees
where department_id=60;

clerk ������ ������ �ϴ� ������� �Ի� ������ �ľ��ϰ��� �Ѵ�.
clerk������ ������ �ϴ� ������� 
���� ���� �Ի��� �Ի�����, ���� �ֱ� �Ի��� �Ի����� ��ȸ
select min(hire_date) first_date, max(hire_date) last_date
from employees
where lower(job_id) like '%clerk%'

�޿� ���
avg(ǥ����)������ ���� ����� ���ϴ� �� - ���ڸ� ����.
select  sum(salary)/count(*) avg_sal,
        round(avg((salary),2) avg_sal2)
from employees;

�μ��ڵ� 60�� �μ��� ���� ������� �޿���� ��ȸ
�޿������ �Ҽ� �Ѷ��ڸ����� �ݿø��ؼ� ǥ��
select round(avg(salary),2) avg_sal
from employees
where department_id =60;

������� clerk������ ������ �ϴ� ������� �޿����,
�޿� ����� �Ҽ� ��°¥������ �ݿø��ؼ� ǥ��
select round(avg(salary),2) avg_sal
from employees
where lower(job_id) like '%clerk%';

���� ��ҹ��� �����ϰ�z �� ���Ե� ���� ���� ������� ��� ������� �ľ��ϰ��� �Ѵ�.
���� ��ҹ��� �����ϰ� z�� ���Ե� ���� ���� ������� ���� ��ȸ�Ͻÿ�
select count(*) cnt
from employees
where lower(last_name) like '%z%';

����� �ְ�޿��� �ְ�޿��� �����޿� �� �޿����� �ľ��ϰ��� �Ѵ�
ȸ�� �ְ�޿��� �����޿��� �޿����� ��ȸ.
select  max(salary) - min(salary) diff
from employees;


ȸ�翡 �Ŵ����� �ִ� ������� ���� �ľ��ϰ��� �Ѵ�
�Ŵ����� ������� ���� ��ȸ�Ͻÿ�
select distinct manager_id
from employees;



account������ �ϴ� ������� ��� �޿��� ��ȸ
select found(avg(salary),2) avg_sal;
from employees;
where lower(job_id) like '%account%';


������� ���, ��, �μ��ڵ�, �޿� ��ȸ
select count(*) cnt
from empoyees;


��ü ���������� �ϳ��� �׷����� ���� �׷��Լ��� �����͸� ��ȸ
--select - ��ȸ�ϰ��� �ϴ� �÷� ���
--from - select���� �÷��� �ִ� ���̺�
--where - ���˸� �´� ���������� ��ȸ�ϰ��� �Ҷ�
--group by - Ư���������� �׷��� ������
--order by - ���������� ����


�μ��� �޿��հ踦 �ľ��ϰ��� ���Ѵ�.
�� �μ��� �μ��ڵ�, �޿��հ�, ����հ�, �μ������� ��ȸ�Ͻÿ�
select  department_id, sum(salary) sum_sal,
        round(avg(salary)) avg_sal, count(*) cnt
from employees
group by department_id
order by 1;


select ��Ͽ� �׷��Լ��� ����� ǥ���� 
             �׷��Լ��� ������� ���� ǥ���� �Բ� �ִٸ�
             ��.��.�� �׷��Լ��� ������� ���� ǥ���� ���ؼ���
             group by�� �������� ����ؾ߸� �Ѵ�.
             �׷��Լ��� ������� ������� + �׷��Լ� ����Ѱ��� ���� ������ group by�� ������־�� ��;

���, ��, �μ��ڵ�, �����ڵ�, �޿���ȸ

select employee_id, last_name, department_id, job_id, salary
from employees;

�� �μ����� ������, ����� ������ �ľ��ϰ��� �Ѵ�.
�� �μ���, �������� �޿��հ�, �޿����, ������� ��ȸ
select department_id, job_id, sum(salary) sum_sal, round(avg(salary)) avg_sal, count(*) cnt
from employees
group by department_id, job_id
order by 1;

�μ��ڵ� 10,20,30,40,60 �� �μ��� ���� ������� ������ �ľ��ϰ��� �Ѵ�.
�ش�μ����� �μ��ڵ�, �μ�����, �μ���ձ޿� ��ȸ

--ERROR 
select department_id, count(*) cnt, round(avg(salary)) avg_sal
from employees
where department_id(10,20,30,40,60)
group by department_id;

clerk������ ������ �ϴ� ������� ������ �ľ�, 
clerk������ �������� �����ڵ�, �����ϴ� �����, 
�����ϴ� ���ʵ��� ��ձ޿� ��ȸ
select job_id, count(*) cnt, round(avg(salary),2) avg_sal
from employees
where lower(job_id) like '%clerk%'
group by job_id
order by 1;


ȸ�� �μ��ڵ� 10,20,30,40,60�� �μ��� ���� ������� � ������ �ϴ� �ľ��ϰ��� �Ѵ�.
�ش�μ��� ���� ������� �ϴ� �����ڵ带 ��ȸ
select distinct(job_id)
from employees
where department_id in (10,20,30,40,60);

select distinct(job_id)
from employees
where department_id in (10,20,30,40,60)
group by job_id;

ȸ�� ����鿡 ���� �� �⵵�� �Ի��� ������� �ľ��ϰ��� �Ѵ�.
�⵵, ����� ��ȸ
select to_char(hire_date, 'yyyy') ,count (*) E_cnt
from employees
group by hire_date;


