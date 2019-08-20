복습
그룹함수 - count, max/min, sum, avg
우리회사 사원수 조회
select count(*) cnt
from employees;

특정 기준을 두어 기준에 해당하는 그룹당 하나의 결과를 조회하고자 할때
group by 절 + 그룹짓는 기준

* 쿼리문 작성순서
1. 조회해야할 데이터를 파악한 후 
   select 절에 컬럼목록을 작성한다.
2. select 절에 나열된 컬럼을 파악한 후 
   from 절에 컬럼이 있는 테이블을 작성한다.
3. 특정조건에 맞는 데이터행을 조회해야 한다면
   where 절에 조건식을 작성한다.
4. 그룹당 하나의 결과를 조회하는 경우 - select 절에 그룹함수를 사용한 표현과
                                    그룹함수를 사용하지 않은 표현이 함께 있다면
   group by 절에 그룹짓는 기준으로 작성한다.
5. 데이터행에 대한 정렬이 필요한 경우
   order by 절에 정렬기준으로 작성한다.
;

각 부서별로 정보를 파악하고자 한다.
각 부서별 부서코드, 부서원수, 부서평균급여, 부서최고급여, 부서최저급여 조회
select department_id, count(*) cnt, round(avg(salary)) avg_sal,
       max(salary) max_sal, min(salary) min_sal
from employees       
group by department_id;

각 업무별로 정보를 파악하고자 한다.
각 업무별 업무코드, 업무하는사원수, 업무평균급여, 업무최고급여, 업무최저급여 조회
select job_id, count(*) cnt, round(avg(salary)) avg_sal,
       max(salary) max_sal, min(salary) min_sal
from employees
group by job_id;

각 부서별 부서내 업무별로 부서코드, 업무코드, 사원수, 평균급여 조회
select department_id, job_id, count(*) cnt, round(avg(salary)) avg_sal
from employees
group by department_id, job_id
order by 1;


우리회사 사원들에 대해 각 년도별 입사한 사원수를 파악하고자 한다.
년도, 사원수 조회
select to_char(hire_date,'yyyy') hire_year, count(*) cnt
from employees
group by to_char(hire_date,'yyyy')
order by 1;
2001  10
2003   5
--------------------------------------------------------

하나의 테이블로부터 데이터를 조회할 수 없는 경우
여러개의 테이블로부터 데이터를 조회하는데 테이블 조인기법 이라고 한다.
테이블조인
1. from 절에 테이블목록을 나열한다.
2. 조인조건을 where 절에 작성한다.
3. 코드 라인을 줄이고 가독성을 높이기 위해 테이블명에 alias 를 지정한다.

사원들의 정보를 파악하고자 한다.
사원들의 사번, 성명, 부서코드, 부서명, 급여, 입사일자 조회
select employee_id, last_name||' '||first_name name, 
       e.department_id, department_name, salary, hire_date
from employees e, departments d
where e.department_id = d.department_id   --사원의 부서코드 = 부서테이블의 부서코드;
order by 1;

부서정보를 관리한 테이블: departments
select * from departments;

잘못된 데이터행의 결과를 갖게 되는 현상: cartesian product
employees: 107 * departments : 27 = 2889

우리회사 사원들의 사번, 성, 부서코드, 업무코드, 업무제목, 급여 조회
select employee_id, last_name, department_id, e.job_id, 
       job_title, salary
from employees e, jobs j
where e.job_id = j.job_id --사원의 업무코드 = 업무테이블의 업무코드
order by 1;

영업부 -> 영업총괄부
100 홍길동 10            10 영업총괄부
101 전우치 20            20 개발부   
102 심청   10 
103 박문수 10 

RDBMS
Table -> Entity
ERD(Entity Relationship Diagram)

우리회사 사원들의 사번, 성, 부서코드, 부서명, 업무코드, 업무제목 조회
select employee_id, last_name, e.department_id,
       department_name, e.job_id, job_title
from  employees e, departments d, jobs j
where e.department_id=d.department_id
  and e.job_id = j.job_id
order by 1  ;

사번이 100, 120, 130, 140인 사원들의
사번, 성, 부서코드, 부서명
select employee_id, last_name, e.department_id, department_name
from employees e, departments d
where e.department_id = d.department_id
and employee_id in (100,120,130,140);

실습
1. 성에 대소문자 무관하게 z가 있는 성을 가진 사원들의
   사번, 성, 부서명 조회
select employee_id, last_name, department_name
from employees e, departments d
where e.department_id = d.department_id
  and lower(last_name) like '%z%'; --성에 대소문자 무관하게 z가 있는 성;
     
2. 커미션을 받는 사원들의 사번, 성, 급여, 커미션요율, 업무제목 조회
select employee_id, last_name, salary, commission_pct, job_title
from employees e, jobs j
where e.job_id = j.job_id
and commission_pct is not null; --커미션을 받는 사원들

3. 각 부서에 대한 정보를 파악하고자 한다.
   각 부서의 부서코드, 부서명, 위치코드, 도시를 조회
select department_id, department_name, l.location_id, city
from departments d, locations l
where d.location_id = l.location_id
order by 1;

조인조건에 동등비교연산자로 비교한 형태의 조인기법은 equi join

데이터행의 누락이 발생하지 않도록 하기 위한 조인기법은 outer join
: 기호 (+) 를 데이터행이 부족한 조인조건쪽에 붙여준다.
 
사원테이블에는 부서배치받지 않은 사원 데이터행이 있고
부서테이블에서 부서코드가 null 인 데이터행이 없으므로
부서테이블의 부서코드 쪽에 outer 기호를 붙인다.
모든 사원의 사번, 성, 부서코드, 부서명 조회
select employee_id, last_name, e.department_id, department_name
from employees e, departments d
where e.department_id = d.department_id(+)
order by 1; 

100  90       90 Executive
178  null     
   
모든 사원의 사번, 성, 업무코드, 업무제목 조회
select employee_id, last_name, j.job_id, job_title
from employees e, jobs j
where e.job_id = j.job_id;


모든 사원의 사번, 성, 부서코드, 부서명, 위치코드, 도시 조회
select employee_id, last_name, e.department_id, department_name,
       d.location_id, city
from employees e, departments d, locations l
where e.department_id = d.department_id(+)
and d.location_id= l.location_id(+) 
order by 1;

100  90         90 Executive   1600           1600  Seattle
150  60         60 IT          1700           1700  Paris
178  null null                                

모든 사원의 사번, 성, 부서코드, 부서명, 업무코드, 업무제목 조회
select employee_id, last_name, e.department_id, department_name,
       e.job_id, job_title
from employees e, departments d, jobs j
where e.department_id=d.department_id(+)
and e.job_id = j.job_id
order by 1;












   
   
   
   
   
   
   



































































   
   
   
   
   
   
   
   
   
   
   