복습
1. 조건절(where, having)에 사용하는 단일행 서브쿼리
   : 사용하는 연산자 =, !=, <>, >, <, >=, <=

우리회사 평균급여보다 더 많은 급여를 받는 사원들의 사번, 성, 급여 조회
select employee_id, last_name, salary
from employees
where salary > (select avg(salary) from employees);
--where salary > 우리회사 평균급여;

2. 조건절(where, having)에 사용하는 다중행 서브쿼리
   : 사용하는 연산자 in, not in
우리회사에서 mgr 업무를 하는 사원들과 같은 부서에 속한 사원들의
사번, 성, 업무코드 조회
select employee_id, last_name, job_id
from employees
where department_id in (select department_id from employees
                        where lower(job_id) like '%mgr%');

3. 조건절(where, having)에 사용하는 다중컬럼 서브쿼리
   : 다중컬럼을 pair 의 형태로 비교한다.
각 부서별 부서내에서 가장 많은 급여를 받는 사원들을 파악하고자 한다.
각 부서별 부서내에서 가장 많은 급여를 받는 사원들의 사번, 성, 부서코드, 급여 조회
select employee_id, last_name, 
        nvl(to_char(department_id), '기타') id, salary
from employees
where ( nvl(department_id,0), salary) 
      in (select nvl(department_id,0), max(salary) 
                                  from employees
                                  group by department_id)
order by department_id;

4. select 절에 사용하는 스칼라 서브쿼리 - 단일컬럼만 
   1) 단순한 그룹함수의 결과값을 select 절에 조회하고자 할때
사번, 성, 급여, 회사평균급여, 회사최소급여 조회  
select employee_id, last_name, salary, 
       (select round(avg(salary)) from employees) avg_sal,
       (select min(salary) from employees) min_sal
from employees;       

   2) 코드성 데이터를 select 절에 조회하고자 할때
모든 사원에 사번, 성, 부서코드, 부서명, 급여, 입사일자 조회
select employee_id, last_name, e.department_id, 
       department_name, salary, hire_date
from employees e, departments d
where e.department_id = d.department_id(+);

select employee_id, last_name, department_id, 
       (select department_name from departments
        where department_id = e.department_id) department_name, 
       salary, hire_date
from employees e;

각 사원에 대해 사원이 소속된 부서의 급여정보대비 사원의 급여를 파악하고자 한다.
사번, 성, 부서코드, 급여, 속한 부서의 평균급여 조회
select employee_id, last_name, department_id, salary, 
       ( select round(avg(salary)) from employees
         where department_id = e.department_id ) dept_avg_sal
from employees e;

select employee_id, last_name, department_id, salary, 
       ( select round(avg(salary)) from employees
         group by department_id
         having department_id=e.department_id) dept_avg_sal
from employees e;

각 부서별 부서코드, 부서평균급여 조회
select department_id, round(avg(salary)) avg_sal
from employees
group by department_id;

5. from절에 사용하는 인라인뷰 서브쿼리

각 사원들의 급여수준을 파악하고자 한다.
사원이 받는 급여가 회사평균이상 최대이하에 해당하는 사원들의
사번, 성, 급여, 우리회사평균급여, 우리회사최소급여, 회사최대급여
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

사번, 성, 부서코드, 급여, 부서원수, 부서의평균급여, 부서최대급여, 부서최소급여 조회
select employee_id, last_name, e.department_id, salary,
       cnt, avg_sal, max_sal, min_sal
from employees e, (select count(*) cnt, round(avg(salary)) avg_sal,
                          max(salary) max_sal, min(salary) min_sal,
                          department_id
                   from employees
                   group by department_id) d
where nvl(e.department_id,0) = nvl(d.department_id,0);                   
 
몇개의 데이터행만 조회해 보자.
데이터행을 조회해오는 순서 : rownum - pseudo

사번, 성, 명 조회
select rownum, employee_id, last_name, first_name
from employees
where rownum<=10;

우리회사 사원들에 대해 급여를 많이 받는 순으로 정렬하여 사번, 성, 급여 조회
select employee_id, last_name, salary
from employees
order by salary desc;

급여 상위 5명의 대항 사번, 성, 급여 조회
select rownum, e.* 
from  (select employee_id, last_name, salary
       from employees
       order by salary desc) e
where rownum<6;

급여 하위 5명의 사번, 성, 급여 조회
select rownum, e.* 
from  (select employee_id, last_name, salary
       from employees
       order by salary) e
where rownum<6;

가장 먼저 입사한 사원 10명에 대한 사번, 성, 입사일자 조회
select rownum, e.* 
from (select employee_id, last_name, hire_date
    from employees
    order by hire_date) e
where rownum<=10 ;

순위를 결정하고자 한다면
rank() over(순위결정기준) - 1,2,2,2,2,6
dense_rank() over(순위결정기준) - 1,2,2,2,2,3

10순위까지 조회
select * 
from (select dense_rank() over(order by hire_date) rank, 
             employee_id, last_name, hire_date
     from employees)
where rank<=10;


Query L
DML(Data Manipulation L.)- insert, update, delete 
         + TCL(Transaction Control L.) commit / rollback 
1. 삽입저장 : insert 
   1) insert into 테이블명 
      values ( 테이블구조 순서에 맞는 데이터값 목록 );
   2) insert into 테이블명(컬럼명의 나열)   
      values (나열된 컬럼 순서에 맞는 데이터값 목록);
   3) insert into 테이블명
      조회쿼리문; 

null의 표현 : null, ''
부서테이블에 새로운 부서를 저장하자
insert into departments
values (300, '영업부', null, null);
select * from departments order by 1 desc;
commit;

부서테이블에 새로운 부서를 저장하자
insert into departments
values (310, '개발부', null, '' );
rollback;

부서테이블에 새로운 부서를 저장하자
insert into departments(department_id, department_name)
values (310, '개발부');
select * from departments order by 1 desc;

모든 데이터의 기본값 default 는 null 이다.
테이블구조에서의 not null 컬럼에는 반드시 값을 담아야 데이터행이 저장된다.
insert into departments(department_id)
values (320);  <- 저장불가
commit;

부서테이블에 새로운 부서를 부서정보를 복사하여 삽입저장하자.
insert into departments
select department_id+1, department_name,manager_id, location_id
from departments;
select * from departments;
rollback;

2. 변경저장 - update : 조건절이 누락되지 않도록 주의한다.
   update 테이블명
   set 컬럼명1 = 데이터값1, 컬럼명2 = 데이터값2,  ...
   조건절;
   
select employee_id, last_name, department_id, salary
from employees;
rollback;

부서가 90번이 부서에 속한 사원들의  급여를 5000 으로 변경저장하자
update employees
set salary = 5000
where department_id=90;

새로운 사원정보를 삽입저장하자
60번 부서에 배치하고 급여는 60번 부서의 평균급여로 저장하자
insert into employees(employee_id, last_name, email, hire_date, job_id, salary)
values (300, '홍길동', 'hong@naver.com', sysdate, 'IT_PROG',
        (select round(avg(salary)) from employees 
         where department_id=60 ) );
select * from employees order by 1 desc;         

300 번 사원의 급여를 우리회사 최고급여로, 전화번호는 062.1234.5678 로 변경저장하자
update employees
set salary = (select max(salary) from employees ), 
    phone_number='062.1234.5678'
where employee_id=300;
commit;

3. 데이터행삭제 delete - 조건절이 누락되지 않도록 주의한다.
   delete from 테이블명
   조건절;
select * from departments;   
   부서테이블에서 300, 310 부서를 삭제하자
delete from departments
where department_id in (300, 310);   
commit;

* DDL(Data Definition L)
  - create, alter, drop, truncate, rename
  
   










































       
       





































  








   
