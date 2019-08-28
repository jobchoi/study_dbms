����
1. ������(where, having)�� ����ϴ� ������ ��������
   : ����ϴ� ������ =, !=, <>, >, <, >=, <=

�츮ȸ�� ��ձ޿����� �� ���� �޿��� �޴� ������� ���, ��, �޿� ��ȸ
select employee_id, last_name, salary
from employees
where salary > (select avg(salary) from employees);
--where salary > �츮ȸ�� ��ձ޿�;

2. ������(where, having)�� ����ϴ� ������ ��������
   : ����ϴ� ������ in, not in
�츮ȸ�翡�� mgr ������ �ϴ� ������ ���� �μ��� ���� �������
���, ��, �����ڵ� ��ȸ
select employee_id, last_name, job_id
from employees
where department_id in (select department_id from employees
                        where lower(job_id) like '%mgr%');

3. ������(where, having)�� ����ϴ� �����÷� ��������
   : �����÷��� pair �� ���·� ���Ѵ�.
�� �μ��� �μ������� ���� ���� �޿��� �޴� ������� �ľ��ϰ��� �Ѵ�.
�� �μ��� �μ������� ���� ���� �޿��� �޴� ������� ���, ��, �μ��ڵ�, �޿� ��ȸ
select employee_id, last_name, 
        nvl(to_char(department_id), '��Ÿ') id, salary
from employees
where ( nvl(department_id,0), salary) 
      in (select nvl(department_id,0), max(salary) 
                                  from employees
                                  group by department_id)
order by department_id;

4. select ���� ����ϴ� ��Į�� �������� - �����÷��� 
   1) �ܼ��� �׷��Լ��� ������� select ���� ��ȸ�ϰ��� �Ҷ�
���, ��, �޿�, ȸ����ձ޿�, ȸ���ּұ޿� ��ȸ  
select employee_id, last_name, salary, 
       (select round(avg(salary)) from employees) avg_sal,
       (select min(salary) from employees) min_sal
from employees;       

   2) �ڵ强 �����͸� select ���� ��ȸ�ϰ��� �Ҷ�
��� ����� ���, ��, �μ��ڵ�, �μ���, �޿�, �Ի����� ��ȸ
select employee_id, last_name, e.department_id, 
       department_name, salary, hire_date
from employees e, departments d
where e.department_id = d.department_id(+);

select employee_id, last_name, department_id, 
       (select department_name from departments
        where department_id = e.department_id) department_name, 
       salary, hire_date
from employees e;

�� ����� ���� ����� �Ҽӵ� �μ��� �޿�������� ����� �޿��� �ľ��ϰ��� �Ѵ�.
���, ��, �μ��ڵ�, �޿�, ���� �μ��� ��ձ޿� ��ȸ
select employee_id, last_name, department_id, salary, 
       ( select round(avg(salary)) from employees
         where department_id = e.department_id ) dept_avg_sal
from employees e;

select employee_id, last_name, department_id, salary, 
       ( select round(avg(salary)) from employees
         group by department_id
         having department_id=e.department_id) dept_avg_sal
from employees e;

�� �μ��� �μ��ڵ�, �μ���ձ޿� ��ȸ
select department_id, round(avg(salary)) avg_sal
from employees
group by department_id;

5. from���� ����ϴ� �ζ��κ� ��������

�� ������� �޿������� �ľ��ϰ��� �Ѵ�.
����� �޴� �޿��� ȸ������̻� �ִ����Ͽ� �ش��ϴ� �������
���, ��, �޿�, �츮ȸ����ձ޿�, �츮ȸ���ּұ޿�, ȸ���ִ�޿�
select employee_id, last_name, salary, 
       (select round(avg(salary)) from employees ) avg_sal, 
       (select min(salary) from employees ) min_sal, 
       (select max(salary) from employees ) max_sal
from employees
where salary between ( select round(avg(salary)) from employees ) and 
(select max(salary) from employees );       
       
select employee_id, last_name, salary, 
       avg_sal, max_sal, min_sal
from employees , (select round(avg(salary)) avg_sal, 
                  max(salary) max_sal, min(salary) min_sal
                  from employees)
where salary between avg_sal and max_sal;
;

���, ��, �μ��ڵ�, �޿�, �μ�����, �μ�����ձ޿�, �μ��ִ�޿�, �μ��ּұ޿� ��ȸ
select employee_id, last_name, e.department_id, salary,
       cnt, avg_sal, max_sal, min_sal
from employees e, (select count(*) cnt, round(avg(salary)) avg_sal,
                          max(salary) max_sal, min(salary) min_sal,
                          department_id
                   from employees
                   group by department_id) d
where nvl(e.department_id,0) = nvl(d.department_id,0);                   
 
��� �������ุ ��ȸ�� ����.
���������� ��ȸ�ؿ��� ���� : rownum - pseudo

���, ��, �� ��ȸ
select rownum, employee_id, last_name, first_name
from employees
where rownum<=10;

�츮ȸ�� ����鿡 ���� �޿��� ���� �޴� ������ �����Ͽ� ���, ��, �޿� ��ȸ
select employee_id, last_name, salary
from employees
order by salary desc;

�޿� ���� 5���� ���� ���, ��, �޿� ��ȸ
select rownum, e.* 
from  (select employee_id, last_name, salary
       from employees
       order by salary desc) e
where rownum<6;

�޿� ���� 5���� ���, ��, �޿� ��ȸ
select rownum, e.* 
from  (select employee_id, last_name, salary
       from employees
       order by salary) e
where rownum<6;

���� ���� �Ի��� ��� 10�� ���� ���, ��, �Ի����� ��ȸ
select rownum, e.* 
from (select employee_id, last_name, hire_date
    from employees
    order by hire_date) e
where rownum<=10 ;

������ �����ϰ��� �Ѵٸ�
rank() over(������������) - 1,2,2,2,2,6
dense_rank() over(������������) - 1,2,2,2,2,3

10�������� ��ȸ
select * 
from (select dense_rank() over(order by hire_date) rank, 
             employee_id, last_name, hire_date
     from employees)
where rank<=10;


Query L
DML(Data Manipulation L.)- insert, update, delete 
         + TCL(Transaction Control L.) commit / rollback 
1. �������� : insert 
   1) insert into ���̺�� 
      values ( ���̺��� ������ �´� �����Ͱ� ��� );
   2) insert into ���̺��(�÷����� ����)   
      values (������ �÷� ������ �´� �����Ͱ� ���);
   3) insert into ���̺��
      ��ȸ������; 

null�� ǥ�� : null, ''
�μ����̺� ���ο� �μ��� ��������
insert into departments
values (300, '������', null, null);
select * from departments order by 1 desc;
commit;

�μ����̺� ���ο� �μ��� ��������
insert into departments
values (310, '���ߺ�', null, '' );
rollback;

�μ����̺� ���ο� �μ��� ��������
insert into departments(department_id, department_name)
values (310, '���ߺ�');
select * from departments order by 1 desc;

��� �������� �⺻�� default �� null �̴�.
���̺��������� not null �÷����� �ݵ�� ���� ��ƾ� ���������� ����ȴ�.
insert into departments(department_id)
values (320);  <- ����Ұ�
commit;

�μ����̺� ���ο� �μ��� �μ������� �����Ͽ� ������������.
insert into departments
select department_id+1, department_name,manager_id, location_id
from departments;
select * from departments;
rollback;

2. �������� - update : �������� �������� �ʵ��� �����Ѵ�.
   update ���̺��
   set �÷���1 = �����Ͱ�1, �÷���2 = �����Ͱ�2,  ...
   ������;
   
select employee_id, last_name, department_id, salary
from employees;
rollback;

�μ��� 90���� �μ��� ���� �������  �޿��� 5000 ���� ������������
update employees
set salary = 5000
where department_id=90;

���ο� ��������� ������������
60�� �μ��� ��ġ�ϰ� �޿��� 60�� �μ��� ��ձ޿��� ��������
insert into employees(employee_id, last_name, email, hire_date, job_id, salary)
values (300, 'ȫ�浿', 'hong@naver.com', sysdate, 'IT_PROG',
        (select round(avg(salary)) from employees 
         where department_id=60 ) );
select * from employees order by 1 desc;         

300 �� ����� �޿��� �츮ȸ�� �ְ�޿���, ��ȭ��ȣ�� 062.1234.5678 �� ������������
update employees
set salary = (select max(salary) from employees ), 
    phone_number='062.1234.5678'
where employee_id=300;
commit;

3. ����������� delete - �������� �������� �ʵ��� �����Ѵ�.
   delete from ���̺��
   ������;
select * from departments;   
   �μ����̺��� 300, 310 �μ��� ��������
delete from departments
where department_id in (300, 310);   
commit;

* DDL(Data Definition L)
  - create, alter, drop, truncate, rename
  
   










































       
       





































  








   
