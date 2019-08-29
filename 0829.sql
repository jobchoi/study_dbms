복습
from 절에 사용하는 서브쿼리
사번, 성, 급여, 회사평균급여, 회사최대급여, 회사최저급여 조회
select employee_id, last_name, salary,
       avg_sal, max_sal, min_sal  
from employees e, (select round(avg(salary)) avg_sal, 
                         max(salary) max_sal, min(salary) min_sal
                   from employees) s
;                   

우리회사에서 가장 최근에 입사한 사원들 5명을 파악하고자 한다.
가장 최근에 입사한 사원들 5명의 사번, 성, 입사일자 조회
select rownum no, e.* 
from (select employee_id, last_name, hire_date
      from employees
      order by hire_date desc) e
where rownum<=5;

순위를 사용하고자 할때 : rank() over(순위를결정할 기준)
                      dense_rank() over(순위를결정할 기준)
select * 
from (select rank() over(order by hire_date desc) rank, employee_id, last_name, hire_date
      from employees) e
where rank<=5;

select * 
from (select dense_rank() over(order by hire_date desc) rank, employee_id, last_name, hire_date
      from employees) e
where rank<=5;

DML + TCL(commit/rollback)
삽입저장: insert into 테이블명 
         values (테이블구조가 갖는 컬럼순서에 맞게 담길 데이터목록);
         insert into 테이블명(컬럼명1, 컬럼명2, ...)
         values (나열된 컬럼순에 맞게 담길 데이터목록);
         insert into 테이블명
         쿼리문;
     
사원테이블에 새로운 사원을 저장     
insert into employees(employee_id, last_name, hire_date, email, job_id)
values (301, '전우치', sysdate, 'jeon@naver.com', 'ST_CLERK');
select * from employees order by 1 desc;

변경저장: update 테이블명
         set 컬럼명1 = 데이터값1, 컬럼명2 = 데이터값2,  ...
         where 절;
301번 사원의 급여를 3000 으로, 성을 전, 명을 우치로 변경한다.
update employees
set salary = 3000, last_name='전', first_name='우치'
where employee_id=301;

select * from employees where employee_id=301;

삭제: delete from 테이블명
      where 절;
300번 사번의 정보를 삭제한다.
select * from employees where employee_id>=300;
delete from employees where employee_id=300;
commit;
----------------------------------------


DDL - auto commit;
desc employees
데이터타입: 문자, 숫자, 날짜
문자: char, varchar2
char(n)-고정문자 : 지정된 사이즈만큼 메모리를 확보한다.
char(10) - 저장시 abcd 문자를 저장 -> abcd______
varchar2(n) - 가변문자 : 데이터가 저장될때 메모리를 확보한다.
varchar2(30) - 저장시 abcd 문자를 저장 -> abcd

데이터사이크가 고정적인 : 주민번호 와 같은 경우 char 

숫자: number(n) - 정수데이터
     number(8) - 99999999까지
     number(n,p) - 부동소수점데이터
     number(8,2) - 999999.99
날짜: date

1. 테이블생성 - 
create table 테이블명(
컬럼명1  데이터타입,
컬럼명2  데이터타입,
...
);

create table temp(
id      number(4),
name    varchar2(30)
);
desc temp
데이터삽입저장 
코드가 100, 이름이 홍길동
insert into temp
values (100, '홍길동');
select * from temp;
rollback;

코드가 101, 이름이 홍길동
insert into temp
values (101, '홍길동');
commit;

temp 테이블에서 코드가 101 번인 이름을 홍명보로 변경한다.
update temp set name='홍명보'
where id=101;


2. 테이블구조변경 - alter
1) 컬럼추가
alter table 테이블명 
add ( 컬럼명1 데이터타입, 컬럼명2 데이터타입, ... );
temp 테이블에 숫자8자리를 담을 salary 컬럼을 추가하자
alter table temp
add (salary number(8));

desc temp
select * from temp;
100번씨의 급여를 3000 으로 변경한다.
update temp set salary=3000 where id=100;

2) 데이터타입 사이즈변경
alter table 테이블명 
modify ( 컬럼명 데이터타입(새사이즈) );
temp 테이블의 salary 컬럼의 사이즈를 10 으로 변경한다.
alter table temp
modify (salary number(10));

3) 컬럼삭제
alter table 테이블명
drop column 컬럼명 ;
temp 테이블의 salary 컬럼 삭제한다.
alter table temp
drop column salary;
desc temp

4) 컬럼명 변경
alter table 테이블명 
rename column 원래컬럼명 to 새컬럼명;
temp 테이블의 id 컬럼명을 temp_id 로 변경한다.
alter table temp
rename column id to temp_id;

3. 데이터행삭제 - truncate - 조건절 사용 불가
truncate table 테이블명; 
truncate table temp;

select * from temp;
100 번 데이터행 삭제
delete from temp where temp_id=100;
rollback;

4. 테이블삭제 - drop
drop table 테이블명;
drop table temp;


5. 테이블명변경 - rename
rename 원래테이블명 to 새테이블명;
temp 테이블명을 test 로 변경한다.
rename temp to test;
desc test

* 무결성 제약조건(integity constraint) - 정확성, 정합성, 무결성
1. not null : 데이터값이 반드시 들어 있어야만 하는 형태
create table emp(
id      number(4) not null,
name    varchar2(30) not null,
salary  number(8)
);
desc emp
삽입저장하자
insert into emp values (100, '홍길동', null);
select * from emp;

insert into emp values (101, '', null);

제약조건정보 확인 - user_constraints, user_cons_columns
select constraint_name, constraint_type
from user_constraints
where lower(table_name) = 'emp';

select constraint_name, column_name
from user_cons_columns
where table_name='EMP';

제약조건명, 컬럼명, 제약조건유형 조회
select constraint_name, column_name, 
       (select constraint_type from user_constraints
        where constraint_name=c.constraint_name) constraint_type
from user_cons_columns c
where table_name='EMP';

name 에 지정된 not null -> null 로 변경
salary 의 null -> not null 로 변경
alter table emp
modify (salary not null, name null);
update emp set salary=1000;
select * from emp;
desc emp

제약조건선언 - column 레벨, table 레벨
2. check - 특정 조건에 맞는 값을 관리하도록 하기 위한 형태 - null 허용
drop table emp;
create table emp(
id      number(4) not null,
name    varchar2(30) not null,
salary  number(8),
gender  varchar2(3) ,
constraint emp_gender_ck check(  gender in ('남','여')  )
);
desc emp
select * from emp;
insert into emp 
values(102, '홍길동', 6000, '남');
insert into emp 
values(101, '홍길명', 4000, '여'); <- 저장불가
급여에 대해 3000 이상 5000 이하만 저장할 수 있도록 check 제약조건을 지정한다.
alter table emp
add constraint emp_salary_ck check( salary between 3000 and 5000 ) ;

select constraint_name, column_name, 
       (select constraint_type from user_constraints
        where constraint_name=c.constraint_name) constraint_type
from user_cons_columns c
where table_name='EMP';

3. unique - 유일성을 보장하기 위한 형태 - null 허용
drop table emp;
create table emp(
id      number(4) not null,
name    varchar2(30) not null,
salary  number(8),
gender  varchar2(3) ,
email   varchar2(50) /* constraint emp_email_uk unique */ , 
constraint emp_gender_ck check(  gender in ('남','여') ),
constraint emp_salary_ck check( salary between 3000 and 5000 ),
constraint emp_emails_uk unique( email )
--constraint emp_email_uk unique( name, email )
);

select table_name, constraint_name, constraint_type
from user_constraints
where lower(constraint_name) = 'emp_email_uk';

desc user_constraints

여러개의 컬럼에 대해 하나의 제약조건을 지정할 수 있다: 복합키

4. primary key : pk , 주키, 기본키, 식별자 - 테이블당 한 개만 지정 가능
   - 주민번호, 사번, 학번,...
   
desc emp
drop table emp;
create table emp(
id      number(4) /* constraint emp_id_pk primary key */,
name    varchar2(30) not null unique,
salary  number(8),
gender  varchar2(3) ,
email   varchar2(50) /* constraint emp_email_uk unique */ , 
constraint emp_gender_ck check(  gender in ('남','여') ),
constraint emp_salary_ck check( salary between 3000 and 5000 ),
constraint emp_emails_uk unique( email ),
--constraint emp_email_uk unique( name, email )
constraint emp_id_pk primary key( id )
);

desc emp

5. foreign key :  fk, 외래키, 참조키
create table emp(
id      number(4) /* constraint emp_id_pk primary key */,
name    varchar2(30) not null unique,
salary  number(8),
gender  varchar2(3) ,
email   varchar2(50) /* constraint emp_email_uk unique */ , 
dept_id number(4) /* constraint emp_dept_id_fk 
                    references departments(department_id) */ ,
constraint emp_gender_ck check(  gender in ('남','여') ),
constraint emp_salary_ck check( salary between 3000 and 5000 ),
constraint emp_emails_uk unique( email ),
--constraint emp_email_uk unique( name, email )
constraint emp_id_pk primary key( id ),
constraint emp_dept_id_pk foreign key(dept_id)
                            references departments(department_id)
);
fk 에 의해  테이블간 부모 - 자식 관계가 형성된다
fk 를 지정하는 테이블이 자식테이블이고
fk 에 의해 참조되는 테이블이 부모테이블
employees(자식) - departments(부모)
참조되어질 부모테이블의 컬럼은 반드시 pk 만 참조될 수 있다

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
values (100, '홍길동', 3000,  '남', '', '');
update emp set dept_id = 15 where id=100;

* View (뷰)
- 실제로 데이터가 존재하는 객체는 아니다
  테이블의 데이터를 뷰를 통해 접근한다.
  1. 보안 - 접근 권한
  2. 복잡한쿼리문을 단순한 쿼리문으로 사용할 수 있다.

뷰생성
create view 뷰명 as 
쿼리문;

60번 부서원 정보 조회
create or replace view vu_60 as
  select employee_id, last_name||' '||first_name name,
         department_id, job_id, hire_date, email 
  from employees 
  where department_id=60;

select * from vu_60;

우리회사 모든 사원들의 
사번, 성명, 부서코드, 부서명, 급여, 부서의평균급여, 부서최대급여, 부서최소급여 조회
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
























































































































































































