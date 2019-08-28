select salary
from employees
where max(salary);


1. 단일행 서브쿼리 - 서브쿼리의 결과행이 단일행인 경우
2. 다중행 서브쿼리 - 서브쿼리의 결과행이 여러행인 경우
3. 다중 컴럼 서브쿼리 - 서브쿼리의 결과컬럼이 여러컬럼인 경우
4. scalar 서브쿼리 - select 절에 사용하는 서브쿼리
5. 상호연관 서브쿼리 - 메인쿼리의 컬럼이 서브쿼리의 조건절에 사용되는 경우
6. inline view 서브쿼리 - from절에 사용하는 서브쿼리 


1. 단일행 서브쿼리 
우리회사 사원들의 급여수준을 파악하고자 한다.
급여가 우리회사 급여의 평균보다 더 적게 받는 사원들의 사번, 성, 업무코드, 급여조회
select employee_id, last_name, job_id, salary
from employees
where salary < (select avg(salary) from employees);

사번 150번 사원보다 더 많은 급여를 받는 사원들의 사번, 성, 부서코드
select employee_id, last_name, department_id, job_id, salary
from employees
where salary > <select salary from emplyees, where employee_id-150;

1. 가장 적은 급여를 받는 사원의 사번, 성, 업모코드, 부서코드, 급여조회
select employee_id, last_name, job_id, salary
from employees 
where salary = (select min(salary ) from employees)
;

2. 회사 사장님보다 먼저 입사한 사원들의 사번, 성명, 입사일자 조회
사장은 그를 관리하는 매니저가 없는 사원을 말한다.
select employee_id, last_name||' '||first_name name, hire_date
from employees
where hire_date < (select hire_date from  employees where manager_id is null);


3. 부서명이 Marketing인 부서에 속한 사원들의 사번, 성명, 부서코드, 업무코드 조회\
-- 내코드
select department_name, department_id
from departments
where department_name = 'Marketing' ;
-- 정답

select employee_id, last_anme;

각부서의 최소급여가 40번 부서의 최소급여보다 더높은 부서를 파악하고자 한다.
각 부서의 최소급여가 40번 부서의 최소급여보다 더 높은 부서코드, 최소급여 조회
select department_id, min(salary) min_sal
from employees
group by department_id
having min(salary) > (select min(salary) from employees 
                                where department_id=40);
                                
select employee_id, last_name||' '||first_name as name, 
        department_id, job_id
from employees
where department_id =   (select department_id from departments 
                        where location_id=1700);
                        
                        
1. 근무지의 국가코드가 UK인 곳에 있는 부서를 파악하고자 한다.
근무지의 국가코드가 UK인 곳에 있는 부서의 부서코드, 위치코드, 부서명 조회
select department_id,department_name, location_id
from departments
where location_id in( select location_id
                        from locations
                        where lower(country_id)='UK') ;

select location_id,country_id
from locations
where country_id='UK';

2. 성에 대소문자 무관하게z가 포함된 성을 가진 사원들과
같은 부서에 속한 사원들의 사번, 성명, 부서코드, 업무코드 조회
select department_id, last_name, department_id, 


;3. 다중컬럼 서브쿼리 - 서브쿼리의 결과 컬럼이 여러 컬럼인 경우
부서별로 가장 급여를 많이 받는 사원들을 파악하고자 한다.
부서별로 가장 많은 그병를 받는 사원들의 사번, 성명, 부서코드, 급여, 업무코드 조회
select employee_id, last_name||' '||first_name name,
        department_id, salary_id, job_id
from employees
where salary, department_id in (select max(salary), 
                                department_id from employees
                                group by department_id)
order by 3,4 desc;                 


각 부서별 최소급여를 받는 사원들의 사번, 성, 부서코드, 급여, 업무코드 조회


4. 스칼라 서브쿼리 : select절에 사용하는 서브쿼리
각 사원의 급여 수준을 파악하고자 한다.
모든 사원의 사번, 성, 급여, 회사평균급여, 회사최대 급여 조회

모든 사원의 사번, 성, 부서코드, 부서명 조회
select emplyee_id, last_name, e.department_id, department_name
from emplyees e, department d
where d.department_id(+)=e.department_id
;
사번, 성, 부서코드, 업무코드, 업무제목 조회
select  employee_id, last_name, department_id,
        (select job_title from jobs 
        where job) job_title
from employees e;


select department_id, department_name, 
        (select city from locations 
        
from departments d;        
    