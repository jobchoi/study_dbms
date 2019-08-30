복습
DDL
1. 생성 create
create table 테이블명(
컬럼명1      데이터타입 not null,
컬럼명2      데이터타입 constraint 제약조건명 check (컬럼명2 조건식),
컬럼명3      데이터타입 constraint 제약조건명 unique ,
컬럼명4      데이터타입 constraint 제약조건명 primary key ,
컬럼명5      데이터타입 constraint 제약조건명 references 부모테이블(pk인컬럼) ,
constraint 제약조건명 check (컬럼명2 조건식) ,
constraint 제약조건명 unique (컬럼명3) ,
constraint 제약조건명 primary key (컬럼명4),
constraint 제약조건명 foreign key (컬럼명5) references 부모테이블(pk인컬럼)
);

2. 구조변경 alter
제약조건
1. not null - 값이 없으며 데이터를 관리하지 않도록
alter table 테이블명 
modify (컬럼명 not null);
2. check 추가 - 특정 조건에 맞지 않는 데이터를 관리하지 않도록, null 허용
alter table 테이블명
add constraint 제약조건명 check( 컬럼명 조건식 );
3. unique 추가 - 유일성을 보장받지 못한 데이터는 관리하지 않도록, null 허용
alter table 테이블명
add constraint 제약조건명 unique(컬럼명);
4. primary key 추가 - 식별자, 기본키, 주키, pk : not null + unique
alter table 테이블명 
add constraint 제약조건명 primary key(컬럼명);
5. foreign key 추가 - 외래키, 참조키, fk : null허용, 부모테이블의 pk인 컬럼을 참조
alter table 테이블명
add constraint 제약조건명 foreign key(컬럼명) references 부모테이블(pk인컬럼);

desc emp
select * from emp;
데이터삽입저장
insert into emp(id, name, salary, gender, email, dept_id)
values (101, '전우치', 3000, '남', null, default);
insert into emp(id, name, salary)
values (102, '심청', 5000);

성별을 데이터를 저장하지 않으면 기본 남 이 저장되게 하고자 한다.
컬럼에 대한 default 지정
alter table emp
modify (gender default '남');

insert into emp(id, name, salary)
values (103, '박문수', 4000);

select * from emp;
입사일자 추가
alter table emp 
add ( hire_date date default sysdate not null );

view 
사번, 성명, 부서코드, 부서명, 업무코드, 업무명 조회
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


시퀀셜한 숫자를 만들어주는 기능을 가진 객체
: sequence
시퀀스 생성
create sequence 시퀀스명 
start with 시작값
increment by 증감치
maxvalue 최대값 (10의 26승)
minvalue 최소값 
cache 갯수
nocycle / cycle ;

select * from emp;

create sequence seq_emp
start with 104
increment by 1;

시퀀스값의 접근 : currval, nextval
select seq_emp.nextval from dual;
select seq_emp.currval from dual;

emp 테이블의 pk인 id 컬럼에 시퀀스를 적용하여 데이터행을 삽입저장한다.
insert into emp (id, name)
values ( seq_emp.nextval, '나다라');
select * from emp;

select employee_id from employees;
select department_id from departments;
select location_id from locations;

PL/SQL( Procedural L. extension SQL)
: SQL + 프로그래밍 언어의 형태로 결합된 언어

기본구조
선언부 : 변수/상수선언문 
실행부 : 대입문, 조건문, 반복문

테스트용 pl/sql : 익명 블럭
declare 
선언부
begin
예외처리부 : exception
end;
/


5 * 6 의 결과를 출력하는 프로그램

declare
    res  number(5);
begin
    res := 5 / 0 ;
    dbms_output.put_line( '5 / 0 = ' ||  res  );
    exception 
        --when zero_divide then
        when others then
            dbms_output.put_line( sqlerrm ); 
            --dbms_output.put_line('0으로 나눌수 없음'); 
end;
/


class Circle{
    int radius;
    Circle( int radius ) throws Exception {
        if( radius<=0 ) throw new Exception("반지름은 0보다 커야 함");
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
        '반지름 ' || radius || ' 인 원둘레는 ' || around );
    exception when invalid_radius then
        dbms_output.put_line('반지름은 0보다 커야 함');
end;
/

점수에 따른 학점
90점이상 A, 80점이상 B, 70점이상 C, 60점이상 D, 그 외 F
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
    dbms_output.put_line('성적:' || test  || ' ' || grade || '학점' );
end;
/

컴파일하여 하나의 객체로 저장해두고 필요할때다 호출해서 사용할 
이름을 가진 블럭 : PL/SQL 서브프로그램
procedure / function
주의점: 1. 파라미터변수의 데이터타입 사이즈 지정 불가
       2. 파라미터가 없으면 () 선언 불가

프로시저: 데이터를 조작DML 처리에 주로 사용
create or replace procedure 프로시저명( 파라미터변수 데이터타입, ... ) is
선언부
begin
end;
/

특정 사번의 사원에 대해 지정한 %만큼 인상된 급여로 급여를 변경하는 처리를 할 프로시저
create or replace procedure 
            pro_emp_salary_update(emp_id number, pct number) is
begin
    update employees set salary = round(salary * ( 1 + pct*0.01 ))
    where employee_id = emp_id;
end;
/

프로시저실행: execute/exec 프로시저명
100번 사원의 급여를 10% 인상된 급여로 변경저장한다.
exec pro_emp_salary_update(100, 10);

select employee_id, salary
from employees where employee_id = 100;

무조건 100번 사원의 급여를 5000으로 변경저장하는 프로시저
create or replace procedure pro_emp_100_update is
begin
    update employees set salary = 5000
    where employee_id = 100;
end;
/

select employee_id, salary
from employees where employee_id = 100;
exec pro_emp_100_update;


부서테이블에 새로운 부서를 등록하는 프로시저
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

exec pro_depart_regist(300, '영업부');
exec pro_depart_regist(310, 'A/S');
exec pro_depart_regist(320, '개발부');

String add( int n1, int n2 ){
    return "더한 결과는 " + n1 + n2;
}

function : 리턴하는 데이터가 있는 메소드라고 여기면 된다.
create or replace function 함수명(파라미터변수명 데이터타입, ...)
    return 리턴데이터의 데이터타입 is
begin
    return 반환데이터;
end;
/

사원이 소속된 부서의 부서명을 반환하는 함수
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

모든 사원의 사번, 성명, 부서코드, 부서명 조회
select employee_id, last_name||' '||first_name name, department_id
       , fn_dept_name(employee_id) department_name
from employees;       


100 번 사원의 부서명 조회
select fn_dept_name(200) from dual;

select (select department_name from departments
        where department_id = e.department_id) department_name
from employees e
where employee_id=100;

select department_name
from employees e, departments d
where employee_id=100
and e.department_id = d.department_id(+);





















































































































       
       
       
       
       
       
       
       


















































