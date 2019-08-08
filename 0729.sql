데이터관리: Table
행열로 이루어진 2차원구조의 Table로 데이터를 관리


시작메뉴 -> cmd -> 
> sqlplus 
> user-name: system
> password: 0000
SQL> 
사용자정보 확인 - HR 유저를 사용함
SQL>  select username from dba_users;
사용자에 대해 인증받을 비밀번호 지정
SQL> alter user hr identified by hr;
SQL> User altered;
사용자에 대한 계정 풀기
SQL> alter user hr account unlock;
SQL> User altered;

cmd> sqlplus
> user-name: hr
> password : hr
hr 유저에 관리된 table 확인
SQL> select table_name from user_tables;
regions: 대륙정보
locations: 위치정보
departments: 부서정보
jobs: 업무정보
employees: 사원정보
job_history: 업무이력정보
countries: 국가정보

table 구조 파악
describe 테이블명 ==  desc 테이블명
employees 구조파악 
SQL> describe employees
사원테이블의 모든 데이터 조회
SQL: Structured Query Language
조회: Query L : select
조작DML(Data Manipulation L.): insert, update, delete
DML: select + insert, update, delete
정의DDL(Data Definition L.): create, drop, alter, truncate, rename
권한DCL(Data Control L.): grant, revoke
TCL(Transaction Control L.): commit, rollback

사원테이블의 모든 데이터 조회
모든 컬럼: *, 특정컬럼: 컬럼명
select * from 테이블명;
select * from employees;
사원의 사번, 성, 명 조회
select employee_id , last_name, first_name
from employees;










