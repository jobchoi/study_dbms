����
DDL
1. ���� create
create table ���̺��(
�÷���1      ������Ÿ�� not null,
�÷���2      ������Ÿ�� constraint �������Ǹ� check (�÷���2 ���ǽ�),
�÷���3      ������Ÿ�� constraint �������Ǹ� unique ,
�÷���4      ������Ÿ�� constraint �������Ǹ� primary key ,
�÷���5      ������Ÿ�� constraint �������Ǹ� references �θ����̺�(pk���÷�) ,
constraint �������Ǹ� check (�÷���2 ���ǽ�) ,
constraint �������Ǹ� unique (�÷���3) ,
constraint �������Ǹ� primary key (�÷���4),
constraint �������Ǹ� foreign key (�÷���5) references �θ����̺�(pk���÷�)
);

2. �������� alter
��������
1. not null - ���� ������ �����͸� �������� �ʵ���
alter table ���̺�� 
modify (�÷��� not null);
2. check �߰� - Ư�� ���ǿ� ���� �ʴ� �����͸� �������� �ʵ���, null ���
alter table ���̺��
add constraint �������Ǹ� check( �÷��� ���ǽ� );
3. unique �߰� - ���ϼ��� ������� ���� �����ʹ� �������� �ʵ���, null ���
alter table ���̺��
add constraint �������Ǹ� unique(�÷���);
4. primary key �߰� - �ĺ���, �⺻Ű, ��Ű, pk : not null + unique
alter table ���̺�� 
add constraint �������Ǹ� primary key(�÷���);
5. foreign key �߰� - �ܷ�Ű, ����Ű, fk : null���, �θ����̺��� pk�� �÷��� ����
alter table ���̺��
add constraint �������Ǹ� foreign key(�÷���) references �θ����̺�(pk���÷�);

desc emp
select * from emp;
�����ͻ�������
insert into emp(id, name, salary, gender, email, dept_id)
values (101, '����ġ', 3000, '��', null, default);
insert into emp(id, name, salary)
values (102, '��û', 5000);

������ �����͸� �������� ������ �⺻ �� �� ����ǰ� �ϰ��� �Ѵ�.
�÷��� ���� default ����
alter table emp
modify (gender default '��');

insert into emp(id, name, salary)
values (103, '�ڹ���', 4000);

select * from emp;
�Ի����� �߰�
alter table emp 
add ( hire_date date default sysdate not null );

view 
���, ����, �μ��ڵ�, �μ���, �����ڵ�, ������ ��ȸ
select * from vu_emps;

create or replace view vu_emps as 
select employee_id, last_name||' '||first_name name, 
       department_id, 
       (select department_name from departments
        where department_id=e.department_id) department_name, job_id, 
       (select job_title from jobs 
        where job_id=e.job_id) job_title
from employees e;
-----------------------------------------------


�������� ���ڸ� ������ִ� ����� ���� ��ü
: sequence
������ ����
create sequence �������� 
start with ���۰�
increment by ����ġ
maxvalue �ִ밪 (10�� 26��)
minvalue �ּҰ� 
cache ����
nocycle / cycle ;

select * from emp;

create sequence seq_emp
start with 104
increment by 1;

���������� ���� : currval, nextval
select seq_emp.nextval from dual;
select seq_emp.currval from dual;

emp ���̺��� pk�� id �÷��� �������� �����Ͽ� ���������� ���������Ѵ�.
insert into emp (id, name)
values ( seq_emp.nextval, '���ٶ�');
select * from emp;

select employee_id from employees;
select department_id from departments;
select location_id from locations;

PL/SQL( Procedural L. extension SQL)
: SQL + ���α׷��� ����� ���·� ���յ� ���

�⺻����
����� : ����/������� 
����� : ���Թ�, ���ǹ�, �ݺ���

�׽�Ʈ�� pl/sql : �͸� ��
declare 
�����
begin
����ó���� : exception
end;
/


5 * 6 �� ����� ����ϴ� ���α׷�

declare
    res  number(5);
begin
    res := 5 / 0 ;
    dbms_output.put_line( '5 / 0 = ' ||  res  );
    exception 
        --when zero_divide then
        when others then
            dbms_output.put_line( sqlerrm ); 
            --dbms_output.put_line('0���� ������ ����'); 
end;
/


class Circle{
    int radius;
    Circle( int radius ) throws Exception {
        if( radius<=0 ) throw new Exception("�������� 0���� Ŀ�� ��");
        this.radius = radius;
    }
    double getAround(){
        return 2 * 3.14 * radius;
    }
}

class CircleMain{
    public static void main(String a[]){
        try{
            Circle c = new Circle(-5);
            System.out.print( c.getAround());        
        }catch(Exception e){
            System.out.print(e.getMessage());
        }
    }
}


declare
    radius  number := -5;
    around  number;
    invalid_radius exception;
begin
    if( radius <=0 ) then
        raise invalid_radius;
    else
        around := 2 * 3.14 * radius;
    end if;
    dbms_output.put_line(
        '������ ' || radius || ' �� ���ѷ��� ' || around );
    exception when invalid_radius then
        dbms_output.put_line('�������� 0���� Ŀ�� ��');
end;
/

������ ���� ����
90���̻� A, 80���̻� B, 70���̻� C, 60���̻� D, �� �� F
declare
    test number := 73;
    grade varchar2(1);
begin
    if test>=90 then grade := 'A';
    elsif test>=80 then grade := 'B';
    elsif test>=70 then grade := 'C';
    elsif test>=60 then grade := 'D';
    else                grade := 'F';
    end if;
    dbms_output.put_line('����:' || test  || ' ' || grade || '����' );
end;
/

�������Ͽ� �ϳ��� ��ü�� �����صΰ� �ʿ��Ҷ��� ȣ���ؼ� ����� 
�̸��� ���� �� : PL/SQL �������α׷�
procedure / function
������: 1. �Ķ���ͺ����� ������Ÿ�� ������ ���� �Ұ�
       2. �Ķ���Ͱ� ������ () ���� �Ұ�

���ν���: �����͸� ����DML ó���� �ַ� ���
create or replace procedure ���ν�����( �Ķ���ͺ��� ������Ÿ��, ... ) is
�����
begin
end;
/

Ư�� ����� ����� ���� ������ %��ŭ �λ�� �޿��� �޿��� �����ϴ� ó���� �� ���ν���
create or replace procedure 
            pro_emp_salary_update(emp_id number, pct number) is
begin
    update employees set salary = round(salary * ( 1 + pct*0.01 ))
    where employee_id = emp_id;
end;
/

���ν�������: execute/exec ���ν�����
100�� ����� �޿��� 10% �λ�� �޿��� ���������Ѵ�.
exec pro_emp_salary_update(100, 10);

select employee_id, salary
from employees where employee_id = 100;

������ 100�� ����� �޿��� 5000���� ���������ϴ� ���ν���
create or replace procedure pro_emp_100_update is
begin
    update employees set salary = 5000
    where employee_id = 100;
end;
/

select employee_id, salary
from employees where employee_id = 100;
exec pro_emp_100_update;


�μ����̺� ���ο� �μ��� ����ϴ� ���ν���
create or replace procedure 
        pro_depart_regist(dept_id number, dept_name varchar2) is
    cnt number;
begin
    select count(*) into cnt from departments
    where department_id = dept_id;

    if cnt=0 then    
        insert into departments(department_id, department_name)
        values (  dept_id, dept_name );
    else
        update departments set department_name = dept_name
        where department_id = dept_id;
    end if;
end;
/

select * from departments;

exec pro_depart_regist(300, '������');
exec pro_depart_regist(310, 'A/S');
exec pro_depart_regist(320, '���ߺ�');

String add( int n1, int n2 ){
    return "���� ����� " + n1 + n2;
}

function : �����ϴ� �����Ͱ� �ִ� �޼ҵ��� ����� �ȴ�.
create or replace function �Լ���(�Ķ���ͺ����� ������Ÿ��, ...)
    return ���ϵ������� ������Ÿ�� is
begin
    return ��ȯ������;
end;
/

����� �Ҽӵ� �μ��� �μ����� ��ȯ�ϴ� �Լ�
create or replace function fn_dept_name(id number) 
return varchar2 is
    dept_name varchar2(50);
begin
    select (select department_name from departments
            where department_id = e.department_id) into dept_name
    from employees e
    where employee_id=id;
    return dept_name;
end;
/

��� ����� ���, ����, �μ��ڵ�, �μ��� ��ȸ
select employee_id, last_name||' '||first_name name, department_id
       , fn_dept_name(employee_id) department_name
from employees;       


100 �� ����� �μ��� ��ȸ
select fn_dept_name(200) from dual;

select (select department_name from departments
        where department_id = e.department_id) department_name
from employees e
where employee_id=100;

select department_name
from employees e, departments d
where employee_id=100
and e.department_id = d.department_id(+);





















































































































       
       
       
       
       
       
       
       


















































