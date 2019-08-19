1. 사원의 사번, 성, 업무코드, 입사일자 조회
select employee_id, last_name, job_id, hire_date
from employees;

2. 급여가 12000 이상인 사원의 사번, 성명, 급여 조회
select employee_id, last_name||' '||first_name name, salary
from employees
where salary >= 12000; --급여가 12000 이상;

3. 사번 176인 사원의 성명, 부서번호 조회
select last_name||' '||first_name name, department_id
from employees
where employee_id = 176; 사번 176인

4. 급여가 8000 이상 12000 이하에 해당하지 않는 사원의 사번, 성명, 급여
select employee_id, last_name||' '||first_name name, salary
from employees
where not (8000<=salary and salary<=12000);
--where not salary between 8000 and 12000;
--where salary not between 8000 and 12000;
--where salary<8000 or salary>12000;
--급여가 8000 이상 12000 이하에 해당하지 않는;

5. 2005년 1월 1일부터 2005년 6월 30일까지 입사한 사원의
사번, 성명, 업무코드, 입사일자 조회. 입사일자를 기준으로 오름차순 정렬
select employee_id, last_name||' '||first_name name, job_id, hire_date
from employees
where hire_date between '2005/01/01' and  '2005/06/30'
order by 4 asc;
--order by hire_date asc;
--where hire_date >= '2005/01/01' and hire_date <= '2005/06/30';
--2005년 1월 1일부터 2005년 6월 30일까지

6. 부서코드 20 및 50에 속한 사원들의 사번, 성명, 부서코드 조회.
 성명을 기준으로 오름차순 정렬
 select employee_id, last_name||' '||first_name name, department_id
 from employees
 where department_id in (20, 50)
 order by 2 ;
 --order by name;
 --where department_id = 20 or department_id=50; --부서코드 20 및 50에 속한
  
7. 급여가 8000 이상 12000 이하이고, 부서코드가 20,50에 해당하는 사원의
성명, 부서코드, 급여 조회, 
부서코드를 기준으로 오름차순, 급여를 기준으로 내림차순 정렬
select last_name||' '||first_name name, department_id, salary
from employees
where salary between 8000 and 12000 --급여가 8000 이상 12000 이하이고
and department_id in (20,50);
--and (department_id = 20 or department_id=50);

8. 매니저가 없는 사원의 성명, 업무코드 조회
select last_name||' '||first_name name, job_id
from employees
where manager_id is null;

9. 커미션을 받는 사원의 성명,급여, 커미션요율 조회
급여를 기준으로 내림차순, 커미션요율을 기준으로 내림차순 정렬
select last_name||' '||first_name name, salary, commission_pct
from employees
where commission_pct is not null --커미션을 받는
order by salary desc, 3 desc;

10.성명에 대소문자 무관하게 w가 있는 사원의 성명을 조회
select last_name||' '||first_name name
from employees
where upper(last_name||first_name) like '%W%';
--where lower(last_name||first_name) like '%w%';
--where last_name||first_name like '%w%'
--or last_name||first_name like '%W%'; --성명에 대소문자 무관하게 w가 있는

11.성의 3번째 소문자가 a인 사원의 성명 조회
select last_name||' '||first_name name
from employees
where  last_name like '__a%';
--성의 3번째 소문자가 a인

12.커미션을 받지 않는 사원의 사번, 성명, 급여, 5%인상된 급여조회.
5%인상된 급여는 반올림하여 정수로 표현
select employee_id, last_name||' '||first_name name, salary,
       salary*1.05 increased_salary
from employees
where commission_pct is null;--커미션을 받지 않는;       

13.업무코드가 clerk 종류인 사원의 사번, 성명, 업무코드 조회
select employee_id, last_name||' '||first_name name, job_id
from employees
where upper(job_id) like '%CLERK%';
--where lower(job_id) like '%clerk%';



