복습
프로시저, 함수
매개변수가 없는 경우는 () 선언불가
매개변수의 데이터타입에 대한 사이즈 지정 불가
create or replace procedure 프로시저명 is
begin
    DML 에 해당하는 처리
end;
/

create or replace procedure 프로시저명(매개변수 데이터타입) is
begin
    DML 에 해당하는 처리
end;
/

execute/exec 프로시저명;

create or replace function 함수명(매개변수 데이터타입, ...) 
    return 리턴데이터의타입 is
begin
    처리;
    return 데이터;
end;
/

사원이 소속된 부서의 부서명을 반환하는 함수 선언
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
사번, 성, 부서코드, 부서명 조회
select employee_id, last_name, department_id,
       fn_dept(employee_id) department_name
from employees;

공지사항을 관리할 테이블
create table notice(
    id          number,         /* 식별자 */
    title       varchar2(300) not null,  /* 제목 */
    content     varchar2(3000) not null, /* 내용 */
    writedate   date default sysdate not null, /* 작성일자 */
    writer      varchar2(50) not null   /* 작성자 */,
    constraint notice_id_pk primary key(id)
);

notice 테이블의 id 컬럼에 적용할 시퀀스
create sequence seq_notice
start with 1 increment by 1;

select * from notice;
insert into notice(title, content, writer)
values ( '세번째 공지글', '트리거로 작성한 공지글입니다.',  '전우치' );

select seq_notice.currval from dual;
insert into notice(id, title, content, writer)
values ( seq_notice.nextval, '네번째 공지글', 
        '네번째로 작성한 공지글입니다.',  '홍길동' );
insert into notice(id, title, content, writer)
values ( seq_notice.nextval, '두번째 공지글', 
        '두번째로 작성한 공지글입니다.',  '전우치' );
        commit;
시퀀스값을 테이블의 컬럼에 적용시키는 기능을 가진 객체: trigger
각 데이터행의 컬럼값을 제어하는 처리를 자동으로 실행되게 하는데 사용
트리거 생성
create or replace trigger 트리거명 
    실행시점(before/after) DML형태(insert/update/delete) on 테이블명
    for each row
begin
    자동실행될 처리;
end;
/


notice 테이블에 데이터행 삽입저장시 시퀀스값을 자동저장되게 할 트리거
create or replace trigger trg_notice
    before insert on notice
    for each row
begin
    select seq_notice.nextval into :new.id from dual;
end;
/


















        
        


































