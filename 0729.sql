�����Ͱ���: Table
�࿭�� �̷���� 2���������� Table�� �����͸� ����


���۸޴� -> cmd -> 
> sqlplus 
> user-name: system
> password: 0000
SQL> 
��������� Ȯ�� - HR ������ �����
SQL>  select username from dba_users;
����ڿ� ���� �������� ��й�ȣ ����
SQL> alter user hr identified by hr;
SQL> User altered;
����ڿ� ���� ���� Ǯ��
SQL> alter user hr account unlock;
SQL> User altered;

cmd> sqlplus
> user-name: hr
> password : hr
hr ������ ������ table Ȯ��
SQL> select table_name from user_tables;
regions: �������
locations: ��ġ����
departments: �μ�����
jobs: ��������
employees: �������
job_history: �����̷�����
countries: ��������

table ���� �ľ�
describe ���̺��� ==  desc ���̺���
employees �����ľ� 
SQL> describe employees
������̺��� ��� ������ ��ȸ
SQL: Structured Query Language
��ȸ: Query L : select
����DML(Data Manipulation L.): insert, update, delete
DML: select + insert, update, delete
����DDL(Data Definition L.): create, drop, alter, truncate, rename
����DCL(Data Control L.): grant, revoke
TCL(Transaction Control L.): commit, rollback

������̺��� ��� ������ ��ȸ
��� �÷�: *, Ư���÷�: �÷���
select * from ���̺���;
select * from employees;
����� ���, ��, �� ��ȸ
select employee_id , last_name, first_name
from employees;









