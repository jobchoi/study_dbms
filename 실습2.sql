1. 우리회사 사원들의 최고급여, 최저급여, 급여총액, 평균급여 조회
   평균급여는 반올림하여 정수로 표현
select max(salary) max_sal, min(salary) min_sal,
       sum(salary) sum_sal, round(avg(salary)) avg_sal       
from employees;

2. 우리회사 최고급여와 최저급여간 급여차 조회
select max(salary) - min(salary) salary_diff
from employees;

3. 우리회사 관리자 수를 조회
select count(distinct manager_id) cnt
from employees;

4. 부서코드 20,40,50 번 부서원들의 업무코드 조회
select distinct job_id
from employees
where department_id in (20,40,50);

select  job_id
from employees
where department_id in (20,40,50)
group by job_id;

5. 우리회사 업무별 업무코드, 사원수 조회.
select job_id, count(*) cnt
from employees
group by job_id;

6. 부서별 부서코드, 평균급여 조회.
   부서평균급여는 반올림하여 소수 둘째자리까지. 급여가 높은 부서부터 정렬
select department_id, round(avg(salary), 2) avg_sal
from employees
group by department_id
order by 2 desc;
--order by avg_sal desc;

7. 부서별 부서코드, 업무코드, 급여총액 조회
select department_id, job_id, sum(salary) sum_sal
from employees
group by department_id, job_id;

8. 부서코드 50 에 소속된 부서원의 수 조회
select count(*) cnt
from employees
where department_id = 50;

select count(*) cnt
from employees
group by department_id
having department_id = 50;

9. 부서평균급여가 10000 이상인 부서코드, 부서평균급여 조회
   부서평균급여는 반올림하여 소수 둘째자리까지
select department_id, round(avg(salary) ,2) avg_sal
from employees
group by department_id
having avg(salary) >= 10000;

10.각 부서의 최대급여가 10000 이상인 부서코드, 부서최대급여 조회
select department_id, max(salary) max_sal
from employees
group by department_id
having max(salary)>=10000 ;   
