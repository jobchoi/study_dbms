복습
기본적으로 데이터는 중복을 포함하여 조회된다.
중복을 제거하고 대표데이터행만 조회하기 위해서는 distinct 를 사용 - null 포함
우리회사에 사원이 소속된 부서들을 파악하고자 한다.
사원들이 소속된 부서코드 조회
select distinct department_id
from employees
where department_id is not null;


우리회사에서 매니저로 있는 사원들을 파악하고자 한다.
매니저인 사원들의 사번 조회
select distinct manager_id
from employees
where manager_id is not null;

그룹함수 - 여러개의 데이터 행으로부터 하나의 결과를 반환하는 함수
          null 을 제외
          
1. count(컬럼표현) : 데이터행의 갯수를 반환
우리회사 사원수, 부서배치받은 사원수, 커미션받는 사원수 조회
select count(*) cnt, count(department_id) detp_cnt, 
       count(commission_pct) comm_cnt
from employees;

우리회사 사원들 중 부서코드 60번 부서에 속한 사원들의 수를 파악하고자한다.
부서코드 60번 부서에 속한 사원수 조회
select count(*) cnt
from employees
where department_id = 60;

우리회사 사원들 중 clerk 종류의 업무를 하는 사원들의 수를 파악하고자 한다.
clerk 종류의 업무를 하는 사원수 조회
select count(*) cnt
from employees
where lower(job_id) like '%clerk%'; --clerk 종류의 업무를 하는

2. sum(대상표현) : 데이터값을 모두 합한 결과를 반환 - 대상표현은 숫자만 가능
우리회사 모든 사원들의 급여를 합한 결과 를 조회
select sum(salary) sum_salary
from employees;

우리회사 부서코드 60번 부서에 속한 사원들의 급여를 합한 결과 를 조회
select sum(salary) sum_sal
from employees
where department_id = 60;--60번 부서에 속한

우리회사 account 업무를 하는 사원들의 급여를 합한 결과를 조회
select sum(salary) sum_sal
from employees
where lower(job_id) like '%account%';--account 업무를 하는 

3. max/min(대상표현) : 데이터값들 중 가장 큰/작은 값을 반환 
   - 숫자/문자/날짜 적용 가능
우리회사 사원들 급여 중 가장 많은, 적은 급여를 조회
select max(salary) max_sal, min(salary) min_sal
from employees;

우리회사 사원들 중 가장 먼저/나중에 오는 성을 조회
select min(last_name) min_name, max(last_name) max_name
from employees;

우리회사 사원들 중 가장 먼저/나중에 입사한 사원의 입사일자 조회
select min(hire_date) min_hire_date, max(hire_date) max_hire_date
from employees;

우리회사 부서코드 60번인 부서에 속한 사원들 중 가장 많은 급여, 적은 급여 조회
select max(salary) max_sal, min(salary) min_sal
from employees
where department_id = 60;--부서코드 60번;

우리회사 clerk 종류의 업무를 하는 사원들의 입사정보를 파악하고자 한다.
clerk 종류의 업무를 하는 사원들 중 
가장 먼저 입사한 입사일자, 가장 최근 입사한 입사일자 조회
select min(hire_date) min_date, max(hire_date) max_date
from employees
where lower(job_id) like '%clerk%'; --clerk 종류의 업무를 하는

4. avg(대상표현) : 데이터값의 평균을 반환 - 숫자만 가능

우리회사 사원들의 급여평균 조회
select round(sum(salary)/count(*)) avg_sal, 
       round(avg(salary),2) avg_sal2
from employees;

우리회사 부서코드 60인 부서에 속한 사원들의 급여평균 조회
급여평균은 소수 둘째자리까지 반올림해서 표현
select round(avg(salary),2) avg_sal
from employees
where department_id = 60; --부서코드 60인 부서에 속한;

우리회사 사원들 중 clerk 종류의 업무를 하는 사원들의 급여평균 조회
급여평균은 소수 둘째자리까지 반올림해서 표현
select round(avg(salary),2) avg_sal
from employees
where lower(job_id) like '%clerk%';--clerk 종류의 업무를 하는

실습
1. 성에 대소문자 무관하게 z가 포함된 성을 가진 사원들이 
   모두 몇명인지 파악하고자 한다.
   성에 대소문자 무관하게 z가 포함된 성을 가진 사원들의 수를 조회하시오.
select count(*) cnt
from employees
where lower(last_name) like '%z%';   
   
2. 우리회사 사원들 최고급여와 최저급여 간 급여차를 파악하고자 한다.
   우리회사 최고급여와 최저급여의 급여차를 조회하시오.
select max(salary) - min(salary) diff
from employees;

3. 우리회사에 매니저로 있는 사원들의 수를 파악하고자 한다.
   우리회사 매니저인 사원들의 수를 조회하시오.
select count(distinct manager_id) cnt
from employees;

4. 우리회사 account 업무를 하는 사원들의 평균급여를 조회하시오.
select round(avg(salary),2) avg_sal
from employees
where lower(job_id) like '%account%';



우리회사 사원들의 사번, 성, 부서코드, 급여 조회하여  부서코드 순으로 정렬한다.
select employee_id, last_name, department_id, salary
from employees
order by department_id;

부서코드 급여
10	4400
20	13000
20	6000
30	11000
30	3100
30	2900
30	2800
30	2600
30	2500
40	6500

전체 데이터행을 하나의 그룹으로 보고 그룹함수로 데이터를 조회
select count(*) cnt
from employees;

특정 기준을 두어 기준으로 그룹을 짓고 그룹별로 하나의 결과를 조회하고자 할때
group by 절을 사용한다.

select 절 - 조회하고자 하는 컬럼 목록
from 절 - select절의 컬럼이 있는 테이블
where 절 - 조건만 맞는 데이터행을 조회하고자 할때
group by 절 - 특정기준으로 그룹을 지을때
order by 절 - 데이터행의 정렬;

group by + 그룹짓고자 하는 기준
우리회사 각 부서별 급여합계를 파악하고자 한다.
각 부서별 부서코드, 급여합계, 평균급여, 부서원수를 조회하시오
select department_id, sum(salary) sum_sal, 
       round(avg(salary)) avg_sal, count(*) cnt
from employees
group by department_id
order by 1;


select 절 - 조회하고자 하는 컬럼 목록
from 절 - select절의 컬럼이 있는 테이블
where 절 - 조건만 맞는 데이터행을 조회하고자 할때
group by 절 - 특정기준으로 그룹을 지을때
order by 절 - 데이터행의 정렬;

select 목록에 그룹함수를 사용한 표현과
             그룹함수를 사용하지 않은 표현이 함께 있다면
반.드.시 그룹함수를 사용하지 않은 표현에 대해서는 
group by 의 기준으로 명시해야만 한다.;

사번, 성, 부서코드, 업무코드, 급여 조회
select employee_id, last_name, department_id, job_id, salary
from employees;

group by 기준1, 기준2..
각 부서별, 업무별로 사원의 정보를 파악하고자 한다.
각 부서별, 업무별로 급여합계, 급여평균, 사원수를 조회
select department_id, job_id, sum(salary) sum_sal, 
       round(avg(salary)) avg_sal, count(*) cnt
from employees
group by department_id, job_id
order by 1;

우리회사 부서코드 10,20,30,40, 60 번 부서에 속한 사원들의 정보를 파악하고자 한다.
해당 부서별로 부서코드, 부서원수, 부서평균급여 조회
select department_id, count(*) cnt, round(avg(salary) ) avg_sal
from employees
where department_id in (10,20,30,40, 60)--부서코드 10,20,30,40, 60 번 부서에 속한
group by department_id;


우리회사 clerk 종류의 업무를 하는 사원들의 정보를 파악하고자 한다.
clerk 종류의 업무별로 업무코드, 업무하는사원수, 업무하는사원들평균급여 조회
select job_id, count(*) cnt, round(avg(salary)) avg_sal
from employees
where lower(job_id) like '%clerk%' --clerk 종류의 업무를 하는
group by job_id;

우리회사 부서코드 10,20,30,40,60 번 부서에 속한 사원들은 
어떤 업무를 하는지 파악하고자 한다.
해당 부서에  속한 사원들이 하는 업무코드 를 조회
select distinct job_id
from employees
where department_id in (10,20,30,40,60); --부서코드 10,20,30,40,60 번 부서에 속한;

select job_id
from employees
where department_id in (10,20,30,40,60)
group by job_id;

우리회사 사원들에 대해 각 년도별 입사한 사원수를 파악하고자 한다.
년도, 사원수 조회
2001  10
2003   5


































             
























   













































            












