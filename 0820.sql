복습
테이블조인- 여러개의 테이블로부터 데이터를 조회하는 기법
쿼리문작성순서
1. select 절에 컬럼들을 목록으로 나열한다.
2. from 절에 필요한 테이블들을 목록으로 나열한다.
3. from 절에 테이블에 여러개라면 테이블간 조인이 필요하다.
   - 조인조건절 : where 조인조건식
4. 데이터행 제한을 위한 조건에 맞는 데이터행만 조회해야 한다면
   조건절 : where 조건식
테이블조인조건과 일반적인 조건을 모두 사용해야 하는 경우
   where 조인조건식 and 조건식
5. 그룹당 하나의 결과를 조회하는 경우
   (select 절에 그룹함수표현과 그룹함수사용하지않은표현이 함께 있다면
   반드시 그룹함수사용하지않은표현에 대해 group by 기준으로 명시한다.)
   group by 절 그룹짓는기준
6. group by 의 결과행에 대한 조건절이 필요한 경우
   having 조건식
7. 데이터행의 정렬이 필요한 경우
   order by 정렬기준

;

group by 의 결과행에 대한 데이터행의 제한을 위한 조건절
: having 조건식

각 부서별 부서코드, 부서원수, 부서평균급여 조회
select department_id, count(*) cnt, round(avg(salary)) avg_sal
from employees
group by department_id
having department_id=100;

100번 부서에 대한 정보를 파악하고자 한다.
100번 부서의 부서코드, 부서원수, 부서평균급여 조회
select department_id, count(*) cnt, round(avg(salary)) avg_sal
from employees
where department_id=100
group by department_id;

각 부서별 정보를 파악하고자 한다.
각 부서별 부서원수가 15명 이상인 부서에 대해 부서코드, 부서원수, 부서평균급여 조회
select department_id, count(*) cnt, round(avg(salary)) avg_sal
from employees
group by department_id
having count(*)  >= 15;

각 부서의 부서평균급여가 8000 이상인 부서에 대해
부서코드, 부서원수, 부서평균급여 조회
select department_id, count(*) cnt, round(avg(salary)) avg_sal
from employees
group by department_id
having avg(salary)>=8000;

각 부서의 최대급여가 10000 이상인 부서를 파악하고자 한다.
각 부서의 최대급여가 10000 이상인 부서코드, 부서의최대급여 조회
select department_id, max(salary) max_sal
from employees
group by department_id
having max(salary) >= 10000; -- 최대급여가 10000 이상

사원들중에 똑같은 성을 가진 사원이 둘 이상 있는 사원들을 파악하고자 한다.
똑같은 성을 가진 사원이 둘 이상 있는 사원들에 대해
사원의 성, 같은성을가진사원수 조회
select last_name, count(*) cnt
from employees
group by last_name
having count(*) >= 2;

데이터행의 누락을 방지하기 위한 테이블조인: outer join
: (+) 데이터행이 부족한 조인조건쪽에 붙인다.

사번, 성, 부서코드, 부서명 조회
select employee_id, last_name, e.department_id, department_name
from employees e, departments d
where e.department_id = d.department_id(+);--사원부서코드 = 부서정보코드;

사번, 성, 업무코드, 업무제목 조회
select employee_id, last_name, e.job_id, job_title
from employees e, jobs j
where e.job_id = j.job_id;

사번, 성, 부서명, 업무제목 조회
select employee_id, last_name, department_name, job_title
from employees e, departments d, jobs j
where e.department_id = d.department_id(+)
and e.job_id =j.job_id
order by 1;

동일한 테이블을 여러개 준비하여 조인하는 기법: self join

사번, 성, 매니저사번, 매니저성 조회
select e.employee_id, e.last_name, e.manager_id, 
       m.employee_id mgr_id, m.last_name manager_name
from employees e, employees m
where e.manager_id = m.employee_id(+)--사원의 매니저 = m.employee_id;
order by 1;

실습
1. 모든 사원들의 사번, 성, 부서명, 도시 조회
select employee_id, last_name, department_name, city
from employees e, departments d, locations l
where e.department_id = d.department_id(+)
and d.location_id = l.location_id(+)
order by 1;

2. 성이 king 인 사원들의 사번, 성명, 부서명 조회
select employee_id, last_name||' '||first_name name, department_name
from employees e, departments d
where e.department_id = d.department_id(+)
and lower(last_name) = 'king';

3. 매니저사번이 149 번인 사원들의 사번, 성, 부서명 조회
select employee_id, last_name, department_name--, e.manager_id
from employees e, departments d
where e.department_id = d.department_id(+)
and e.manager_id=149;

4. 위치코드가 1400 인 도시에는 어떤 부서들이 있나 파악하고자 한다.
   위치코드가 1400 인 도시, 부서명 조회
select city, department_name--, d.location_id
from locations l, departments d
where d.location_id = l.location_id
and d.location_id=1400;
   
5. 위치코드 1800 에 근무하는 사원들의 사번, 성, 업무코드, 부서명, 위치코드 조회
select employee_id, last_name, job_id, department_name, location_id
from employees e, departments d
where e.department_id = d.department_id(+)
and location_id = 1800;

6. 자신의 매니저보다 먼저 입사한 사원들의 
   사번, 성명, 입사일자, 매니저성명, 매니저입사일자 조회
select e.employee_id, e.last_name||' '||e.first_name name, e.hire_date,
       m.last_name||' '||m.first_name manager_name, m.hire_date manager_hire_date
from employees e, employees m
where e.manager_id = m.employee_id(+)
and e.hire_date < m.hire_date --자신의 매니저보다 먼저 입사한 = 자신의 입사일자 < 매니저의 입사일자 ;
order by 1;
  
7. 커미션을 받는 모든 사원들의 성, 부서명, 위치코드, 도시 조회
select last_name, department_name, d.location_id, city
from employees e, departments d, locations l
where e.department_id = d.department_id(+)
and d.location_id = l.location_id(+)
and commission_pct is not null; --커미션을 받는;

8. toronto 에 근무하는 사원들의 성, 업무코드, 부서코드, 부서명 조회
select last_name, job_id, e.department_id, department_name
from employees e, departments d, locations l
where e.department_id = d.department_id(+)
and d.location_id = l.location_id(+)
and lower(city) = 'toronto';


   
   
   
   
   
   
   
   
   