����
���ν���, �Լ�
�Ű������� ���� ���� () ����Ұ�
�Ű������� ������Ÿ�Կ� ���� ������ ���� �Ұ�
create or replace procedure ���ν����� is
begin
    DML �� �ش��ϴ� ó��
end;
/

create or replace procedure ���ν�����(�Ű����� ������Ÿ��) is
begin
    DML �� �ش��ϴ� ó��
end;
/

execute/exec ���ν�����;

create or replace function �Լ���(�Ű����� ������Ÿ��, ...) 
    return ���ϵ�������Ÿ�� is
begin
    ó��;
    return ������;
end;
/

����� �Ҽӵ� �μ��� �μ����� ��ȯ�ϴ� �Լ� ����
create or replace function fn_dept(id employees.employee_id%type) 
return varchar2 is
    name    departments.department_name%type;
begin
    select department_name into name from departments
    where department_id = (select department_id from employees
                           where employee_id=id);
    return name;
end;
/
select fn_dept(100) from dual;
���, ��, �μ��ڵ�, �μ��� ��ȸ
select employee_id, last_name, department_id,
       fn_dept(employee_id) department_name
from employees;

���������� ������ ���̺�
create table notice(
    id          number,         /* �ĺ��� */
    title       varchar2(300) not null,  /* ���� */
    content     varchar2(3000) not null, /* ���� */
    writedate   date default sysdate not null, /* �ۼ����� */
    writer      varchar2(50) not null   /* �ۼ��� */,
    constraint notice_id_pk primary key(id)
);

notice ���̺��� id �÷��� ������ ������
create sequence seq_notice
start with 1 increment by 1;

select * from notice;
insert into notice(title, content, writer)
values ( '����° ������', 'Ʈ���ŷ� �ۼ��� �������Դϴ�.',  '����ġ' );

select seq_notice.currval from dual;
insert into notice(id, title, content, writer)
values ( seq_notice.nextval, '�׹�° ������', 
        '�׹�°�� �ۼ��� �������Դϴ�.',  'ȫ�浿' );
insert into notice(id, title, content, writer)
values ( seq_notice.nextval, '�ι�° ������', 
        '�ι�°�� �ۼ��� �������Դϴ�.',  '����ġ' );
        commit;
���������� ���̺��� �÷��� �����Ű�� ����� ���� ��ü: trigger
�� ���������� �÷����� �����ϴ� ó���� �ڵ����� ����ǰ� �ϴµ� ���
Ʈ���� ����
create or replace trigger Ʈ���Ÿ� 
    �������(before/after) DML����(insert/update/delete) on ���̺��
    for each row
begin
    �ڵ������ ó��;
end;
/


notice ���̺� �������� ��������� ���������� �ڵ�����ǰ� �� Ʈ����
create or replace trigger trg_notice
    before insert on notice
    for each row
begin
    select seq_notice.nextval into :new.id from dual;
end;
/


















        
        


































