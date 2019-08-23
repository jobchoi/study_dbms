테이블조인형식
from 절에 테이블을 여러개 목록의 형태로 나열한다.
조인조건절 where 절
where 조인조건식

1. equi join
2. outer join - 데이터행 누락되지 않도록

부서가 60인 부서에 속한 사원들의 
사번, 성, 부서명 조회
select employee_id, last_name, department_name
from employees e, departments d
where e.department_id =60 and 
e.department_id = d.department_id;

국제표준조인 : ANSI JOIN
1. equi join -> inner join
from 절에 테이블간 조인형식을 지정한다. 
조인조건절 : on 절 - 조인조건식
                    조인하는 컬럼명이 동일하면
                            반.드.시 테이블명을 명시해야만 한다. 
           using 절 - 조인하는 컬럼명이 동일한 경우만 사용 가능 
                  using (조인컬럼명) 
                  - using절에 사용된 컬럼에 대해서는 
                       테이블명 절.대.로 명시해서는 안된다.
테이블간 조인형식과 조인조건절은 한 묶음이다.
일반적인 데이터행의 제한을 위한 조건절 - where 절

사번, 성, 부서코드, 부서명 조회
select employee_id, last_name, e.department_id, department_name
from employees e inner join departments d
on e.department_id = d.department_id
where e.department_id=60;

select employee_id, last_name, department_id, department_name
from employees e inner join departments d
using (department_id)
where department_id=60;

사번, 성, 업무코드, 업무제목 조회
select employee_id, last_name, job_id, job_title
from employees e inner join jobs j 
using (job_id);

select employee_id, last_name, e.job_id, job_title
from employees e inner join jobs j 
on e.job_id = j.job_id
where lower(e.job_id) like '%clerk%';

우리회사 부서정보를 파악하고자 한다.
부서코드, 부서명, 위치코드, 도시 조회
select department_id, department_name, location_id, city
from departments d inner join locations l
using(location_id)
order by 1;

select department_id, department_name, d.location_id, city
from departments d inner join locations l
on d.location_id = l.location_id
order by 1;

부서코드 10,20,40,60 인 부서에 속한 사원들의
사번, 성, 부서코드, 부서명, 업무코드, 업무제목 조회
select employee_id, last_name, department_id, department_name,
       job_id, job_title
from employees e inner join jobs j 
using (job_id)
inner join departments d
using (department_id)
where department_id in (10,20,40,60);

select employee_id, last_name, e.department_id, department_name,
       e.job_id, job_title
from  employees e inner join departments d 
on e.department_id = d.department_id
inner join jobs j
on e.job_id = j.job_id
where e.department_id in (10,20,40,60);

실습 ansi join
사번, 성, 부서코드, 부서명, 위치코드, 도시 조회
select employee_id, last_name, e.department_id, department_name,
       d.location_id, city
from  employees e inner join departments d
on e.department_id = d.department_id 
inner join locations l  
on d.location_id = l.location_id;

2. outer join -> left/right outer join : 기준테이블쪽으로 
모든 사원들의 사번, 성, 부서코드, 부서명 조회
select employee_id, last_name, e.department_id, department_name
from employees e left outer join departments d
on e.department_id = d.department_id
order by 1;

사번, 성, 부서코드, 부서명, 도시 조회
select employee_id, last_name, e.department_id, department_name, city
from employees e left outer join departments d
on e.department_id = d.department_id
left outer join locations l
on d.location_id = l.location_id
;

모든 사원들의 사번, 성, 매니저사번, 매니저성 조회-오라클형식, ansi형식 on절
select e.employee_id, e.last_name, e.manager_id,
       m.employee_id, m.last_name manager_name
from employees e, employees m
where e.manager_id = m.employee_id(+)
order by 1;

select e.employee_id, e.last_name, e.manager_id,
       m.employee_id, m.last_name manager_name
from employees e left outer join employees m
on e.manager_id = m.employee_id
order by 1;





















































