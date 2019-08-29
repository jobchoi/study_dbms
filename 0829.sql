����
from ���� ����ϴ� ��������
���, ��, �޿�, ȸ����ձ޿�, ȸ���ִ�޿�, ȸ�������޿� ��ȸ
select employee_id, last_name, salary,
       avg_sal, max_sal, min_sal  
from employees e, (select round(avg(salary)) avg_sal, 
                         max(salary) max_sal, min(salary) min_sal
                   from employees) s
;                   

�츮ȸ�翡�� ���� �ֱٿ� �Ի��� ����� 5���� �ľ��ϰ��� �Ѵ�.
���� �ֱٿ� �Ի��� ����� 5���� ���, ��, �Ի����� ��ȸ
select rownum no, e.* 
from (select employee_id, last_name, hire_date
      from employees
      order by hire_date desc) e
where rownum<=5;

������ ����ϰ��� �Ҷ� : rank() over(������������ ����)
                      dense_rank() over(������������ ����)
select * 
from (select rank() over(order by hire_date desc) rank, employee_id, last_name, hire_date
      from employees) e
where rank<=5;

select * 
from (select dense_rank() over(order by hire_date desc) rank, employee_id, last_name, hire_date
      from employees) e
where rank<=5;

DML + TCL(commit/rollback)
��������: insert into ���̺�� 
         values (���̺����� ���� �÷������� �°� ��� �����͸��);
         insert into ���̺��(�÷���1, �÷���2, ...)
         values (������ �÷����� �°� ��� �����͸��);
         insert into ���̺��
         ������;
     
������̺� ���ο� ����� ����     
insert into employees(employee_id, last_name, hire_date, email, job_id)
values (301, '����ġ', sysdate, 'jeon@naver.com', 'ST_CLERK');
select * from employees order by 1 desc;

��������: update ���̺��
         set �÷���1 = �����Ͱ�1, �÷���2 = �����Ͱ�2,  ...
         where ��;
301�� ����� �޿��� 3000 ����, ���� ��, ���� ��ġ�� �����Ѵ�.
update employees
set salary = 3000, last_name='��', first_name='��ġ'
where employee_id=301;

select * from employees where employee_id=301;

����: delete from ���̺��
      where ��;
300�� ����� ������ �����Ѵ�.
select * from employees where employee_id>=300;
delete from employees where employee_id=300;
commit;
----------------------------------------


DDL - auto commit;
desc employees
������Ÿ��: ����, ����, ��¥
����: char, varchar2
char(n)-�������� : ������ �����ŭ �޸𸮸� Ȯ���Ѵ�.
char(10) - ����� abcd ���ڸ� ���� -> abcd______
varchar2(n) - �������� : �����Ͱ� ����ɶ� �޸𸮸� Ȯ���Ѵ�.
varchar2(30) - ����� abcd ���ڸ� ���� -> abcd

�����ͻ���ũ�� �������� : �ֹι�ȣ �� ���� ��� char 

����: number(n) - ����������
     number(8) - 99999999����
     number(n,p) - �ε��Ҽ���������
     number(8,2) - 999999.99
��¥: date

1. ���̺���� - 
create table ���̺��(
�÷���1  ������Ÿ��,
�÷���2  ������Ÿ��,
...
);

create table temp(
id      number(4),
name    varchar2(30)
);
desc temp
�����ͻ������� 
�ڵ尡 100, �̸��� ȫ�浿
insert into temp
values (100, 'ȫ�浿');
select * from temp;
rollback;

�ڵ尡 101, �̸��� ȫ�浿
insert into temp
values (101, 'ȫ�浿');
commit;

temp ���̺��� �ڵ尡 101 ���� �̸��� ȫ���� �����Ѵ�.
update temp set name='ȫ��'
where id=101;


2. ���̺������� - alter
1) �÷��߰�
alter table ���̺�� 
add ( �÷���1 ������Ÿ��, �÷���2 ������Ÿ��, ... );
temp ���̺� ����8�ڸ��� ���� salary �÷��� �߰�����
alter table temp
add (salary number(8));

desc temp
select * from temp;
100������ �޿��� 3000 ���� �����Ѵ�.
update temp set salary=3000 where id=100;

2) ������Ÿ�� �������
alter table ���̺�� 
modify ( �÷��� ������Ÿ��(��������) );
temp ���̺��� salary �÷��� ����� 10 ���� �����Ѵ�.
alter table temp
modify (salary number(10));

3) �÷�����
alter table ���̺��
drop column �÷��� ;
temp ���̺��� salary �÷� �����Ѵ�.
alter table temp
drop column salary;
desc temp

4) �÷��� ����
alter table ���̺�� 
rename column �����÷��� to ���÷���;
temp ���̺��� id �÷����� temp_id �� �����Ѵ�.
alter table temp
rename column id to temp_id;

3. ����������� - truncate - ������ ��� �Ұ�
truncate table ���̺��; 
truncate table temp;

select * from temp;
100 �� �������� ����
delete from temp where temp_id=100;
rollback;

4. ���̺���� - drop
drop table ���̺��;
drop table temp;


5. ���̺���� - rename
rename �������̺�� to �����̺��;
temp ���̺���� test �� �����Ѵ�.
rename temp to test;
desc test

* ���Ἲ ��������(integity constraint) - ��Ȯ��, ���ռ�, ���Ἲ
1. not null : �����Ͱ��� �ݵ�� ��� �־�߸� �ϴ� ����
create table emp(
id      number(4) not null,
name    varchar2(30) not null,
salary  number(8)
);
desc emp
������������
insert into emp values (100, 'ȫ�浿', null);
select * from emp;

insert into emp values (101, '', null);

������������ Ȯ�� - user_constraints, user_cons_columns
select constraint_name, constraint_type
from user_constraints
where lower(table_name) = 'emp';

select constraint_name, column_name
from user_cons_columns
where table_name='EMP';

�������Ǹ�, �÷���, ������������ ��ȸ
select constraint_name, column_name, 
       (select constraint_type from user_constraints
        where constraint_name=c.constraint_name) constraint_type
from user_cons_columns c
where table_name='EMP';

name �� ������ not null -> null �� ����
salary �� null -> not null �� ����
alter table emp
modify (salary not null, name null);
update emp set salary=1000;
select * from emp;
desc emp

�������Ǽ��� - column ����, table ����
2. check - Ư�� ���ǿ� �´� ���� �����ϵ��� �ϱ� ���� ���� - null ���
drop table emp;
create table emp(
id      number(4) not null,
name    varchar2(30) not null,
salary  number(8),
gender  varchar2(3) ,
constraint emp_gender_ck check(  gender in ('��','��')  )
);
desc emp
select * from emp;
insert into emp 
values(102, 'ȫ�浿', 6000, '��');
insert into emp 
values(101, 'ȫ���', 4000, '��'); <- ����Ұ�
�޿��� ���� 3000 �̻� 5000 ���ϸ� ������ �� �ֵ��� check ���������� �����Ѵ�.
alter table emp
add constraint emp_salary_ck check( salary between 3000 and 5000 ) ;

select constraint_name, column_name, 
       (select constraint_type from user_constraints
        where constraint_name=c.constraint_name) constraint_type
from user_cons_columns c
where table_name='EMP';

3. unique - ���ϼ��� �����ϱ� ���� ���� - null ���
drop table emp;
create table emp(
id      number(4) not null,
name    varchar2(30) not null,
salary  number(8),
gender  varchar2(3) ,
email   varchar2(50) /* constraint emp_email_uk unique */ , 
constraint emp_gender_ck check(  gender in ('��','��') ),
constraint emp_salary_ck check( salary between 3000 and 5000 ),
constraint emp_emails_uk unique( email )
--constraint emp_email_uk unique( name, email )
);

select table_name, constraint_name, constraint_type
from user_constraints
where lower(constraint_name) = 'emp_email_uk';

desc user_constraints

�������� �÷��� ���� �ϳ��� ���������� ������ �� �ִ�: ����Ű

4. primary key : pk , ��Ű, �⺻Ű, �ĺ��� - ���̺�� �� ���� ���� ����
   - �ֹι�ȣ, ���, �й�,...
   
desc emp
drop table emp;
create table emp(
id      number(4) /* constraint emp_id_pk primary key */,
name    varchar2(30) not null unique,
salary  number(8),
gender  varchar2(3) ,
email   varchar2(50) /* constraint emp_email_uk unique */ , 
constraint emp_gender_ck check(  gender in ('��','��') ),
constraint emp_salary_ck check( salary between 3000 and 5000 ),
constraint emp_emails_uk unique( email ),
--constraint emp_email_uk unique( name, email )
constraint emp_id_pk primary key( id )
);

desc emp

5. foreign key :  fk, �ܷ�Ű, ����Ű
create table emp(
id      number(4) /* constraint emp_id_pk primary key */,
name    varchar2(30) not null unique,
salary  number(8),
gender  varchar2(3) ,
email   varchar2(50) /* constraint emp_email_uk unique */ , 
dept_id number(4) /* constraint emp_dept_id_fk 
                    references departments(department_id) */ ,
constraint emp_gender_ck check(  gender in ('��','��') ),
constraint emp_salary_ck check( salary between 3000 and 5000 ),
constraint emp_emails_uk unique( email ),
--constraint emp_email_uk unique( name, email )
constraint emp_id_pk primary key( id ),
constraint emp_dept_id_pk foreign key(dept_id)
                            references departments(department_id)
);
fk �� ����  ���̺� �θ� - �ڽ� ���谡 �����ȴ�
fk �� �����ϴ� ���̺��� �ڽ����̺��̰�
fk �� ���� �����Ǵ� ���̺��� �θ����̺�
employees(�ڽ�) - departments(�θ�)
�����Ǿ��� �θ����̺��� �÷��� �ݵ�� pk �� ������ �� �ִ�

desc emp

select table_name, constraint_name, column_name, 
       (select constraint_type from user_constraints
        where constraint_name=c.constraint_name) constraint_type
from user_cons_columns c
where table_name in ('EMPLOYEES', 'DEPARTMENTS');

alter table emp
add ( dept_id number(4) constraint emp_dept_id_fk
                              references departments(department_id) );

select * from emp;
insert into emp
values (100, 'ȫ�浿', 3000,  '��', '', '');
update emp set dept_id = 15 where id=100;

* View (��)
- ������ �����Ͱ� �����ϴ� ��ü�� �ƴϴ�
  ���̺��� �����͸� �並 ���� �����Ѵ�.
  1. ���� - ���� ����
  2. �������������� �ܼ��� ���������� ����� �� �ִ�.

�����
create view ��� as 
������;

60�� �μ��� ���� ��ȸ
create or replace view vu_60 as
  select employee_id, last_name||' '||first_name name,
         department_id, job_id, hire_date, email 
  from employees 
  where department_id=60;

select * from vu_60;

�츮ȸ�� ��� ������� 
���, ����, �μ��ڵ�, �μ���, �޿�, �μ�����ձ޿�, �μ��ִ�޿�, �μ��ּұ޿� ��ȸ
select * from vu_depts_sal;

create or replace view vu_depts_sal as
select employee_id, last_name||' '||first_name name, e.department_id,
       (select department_name from departments
        where department_id=e.department_id) department_name,
      avg_sal, max_sal, min_sal  
from employees e, (select department_id, round(avg(salary)) avg_sal,
                           max(salary) max_sal, min(salary) min_sal
                   from employees 
                   group by department_id) d      
where e.department_id = d.department_id;                   
























































































































































































