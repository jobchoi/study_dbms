1. 최고(저)급여, 급여총액, 평균급여를 조회.
평균급여는 반올림하여 정수로 표현
select MAX(salary), min(salary), round(avg(salary),0)
from employees;

2. 최고급여, 최저급여간의 급여차가 얼마나 되는지 파악하고자 한다.
최고급여와 최저급여의 차액을 조회하시오

3.관지라자 모두 몇명인지 파악하고자 한다.
관리자 수를 조회하시오.
select distinct  m.manager_id, e.employee_id
from employees e, employees m
where m.manager_id = e.employee_id(+);

4. 부서코드 20,40,50번 부서원들이 하는 업무는 어떤 업무들이 있는지 파악하고자 한다.
부서코드 20,40,50번 부서원들에 업무코드 조회
select distinct job_id
from employees
where department_id in (20,40,50);

5. 업무코드, 사원수를 조회
select job_id, count(employee_id) mem
from employees
group by job_id
order by -1;

6. 부서별 평균급여 조회
부서코드, 부서평균급여를 조회하되 부서평균그병가 높은 부서부터 정렬하시오
부서평균급여는 반올림하여 소수둘쨰자리까지 표현하시오
select department_id,round(avg(salary),2)as avg_sal
from employees
group by department_id
order by round(avg(salary),2) asc;

7. 부서별, 업무별, 급여총액을 조회하시오.
select distinct department_id, job_id, sum(salary)
from employees
group by department_id, job_id
order by 1;

8.부서코드 50번인 사원수
select count(employee_id )cnt
from employees
where department_id=50;

9. 부서급여평균 10000이상인 부서코드, 부서평균급여를 조회
부서평균급여는 반올림하여 소수 둘째자리까지 표현하시오.
select round(avg(salary),2) as avg_sal, department_id
from employees
group by department_id
having round(avg(salary),2) >= 10000 ;

10. 각 부서의 최대급여가 10000인상인 부서를 파악하고자 한다.
부서의 최대급여가 10000 이상인 부서코드, 부서최대급여를 조회하시오.
select max(salary) as max_sal, department_id
from employees
group by department_id
having max(salary) >= 10000;


-- =================== join =================== 
1. 모든 사원의 성명, 부서코드, 부서명을 조회하시오.
select e.last_name||' '||first_name name, e.department_id, d.department_name
from employees e inner join departments d
on e.department_id=d.department_id(+);

2. 성이 king인 사원의 사번, 부서코드, 부서명을 조회하시오
select last_name||' '||first_name, employee_id, e.department_id, department_name
from departments d,employees e 
where e.department_id=d.department_id(+)
and lower(last_name)='king';

3. 관리자 사번이 149번인 사원의 사번, 성, 부서코드, 부서명을 조회 -- ??
select manager_id, e.employee_id, last_name, e.department_id, department_name
from employees e left outer join departments d
where e.manager_id=149;

4. 모든사원의 사번, 성명, 관리자의 사번 관리자의 성명을 조회
select e.employee_id, e.last_name, e.manager_id,
       m.employee_id, m.last_name manager_name
from employees e , employees m
where e.employee_id=m.employee_id(+)
order by 1;

5. 위치코드 1400인 도시에는 어떤 부서들이 있는지 파악하고자 한다.
위치코드 1400인 도시명, 부서명을 조회하시오

6. 위치코드 1800에 근무하는 사원의 성명, 업무코드,급여, 부서명, 위치코드를 조회하시오

7. 성에 대소문자 무관하게 a가 포함된 사원들의 사번, 성, 부서명을 조회하시오

8. 관리자보다 먼저 입사한 사원의 성명, 입사일자, 관리자 성명, 관리자 입사일자를 조회하시오

9. 커미션을 받는 사원들의 성, 부서명, 위치코드, 도시명을 조회하시오

10. toronto에서 근무하는 사원들의 성, 부서명, 업무코드, 부서코드, 부서명을 조회하시오

11. 사원들이 근무하는 부서정보와 해당 부서에서 근무하느 사원이 몇명인지 파악하고자 한다
사원이 근무하는 부서의 부서코드,부서명, 위치코드, 사원수를 조회하시오

12.사원수가 3명 미만인 부서의 정보를 파악하고자한다.
사원수가 3명 미만인 부서코드, 부서명, 사원수를 조회하시오

13. Administration, Excutive부서에는 어떤 업무가 있고 
해당업무를 하는 사원이 몇명인지 파악하고자 한다.
Administration, Excutive부서에 속한 사원들의 업무코드, 사원수를 조회하여 
사원수가 많은 업무부터 적은 업무순으로 정렬하시오