오라클 조인과 ANSI 조인을 모두 작성
1. 모든 사원의 성명, 부서코드, 부서명 조회
select last_name||' '||first_name name, e.department_id, department_name
from employees e, departments d  
where e.department_id = d.department_id(+);

select last_name||' '||first_name name, e.department_id, department_name
from employees e left outer join departments d  
on  e.department_id = d.department_id;

select last_name||' '||first_name name, department_id, department_name
from employees e left outer join departments d  
using (department_id);

2. 성이 king 인 사원의 사번, 성명, 부서코드, 부서명 조회
select employee_id, last_name||' '||first_name name, 
       e.department_id, department_name
from employees e, departments d
where e.department_id = d.department_id
and lower(last_name) = 'king';

select employee_id, last_name||' '||first_name name, 
       e.department_id, department_name
from employees e inner join departments d
on e.department_id = d.department_id
where lower(last_name) = 'king';

select employee_id, last_name||' '||first_name name, 
       department_id, department_name
from employees e inner join departments d
using (department_id)
where lower(last_name) = 'king';

3. 관리자 사번이 149 인 사원의 사번, 성, 부서코드, 부서명 조회
select employee_id, last_name, e.department_id, department_name --, e.manager_id 
from employees e, departments d
where e.department_id = d.department_id(+)
and e.manager_id=149;

select employee_id, last_name, e.department_id, department_name
from employees e left outer join departments d
on e.department_id = d.department_id
where e.manager_id=149;

select employee_id, last_name, department_id, department_name
from employees e left outer join departments d
using (department_id)
where e.manager_id=149;

4. 모든 사원의 사번, 성명, 관리자 사번, 관리자 성명 조회
select e.employee_id, e.last_name||' '||e.first_name name,
       e.manager_id, m.employee_id mgr_id, 
       m.last_name||' '||m.first_name manager_name
from employees e, employees m
where e.manager_id = m.employee_id(+);

select e.employee_id, e.last_name||' '||e.first_name name,
       e.manager_id, m.employee_id mgr_id, 
       m.last_name||' '||m.first_name manager_name
from employees m right outer join employees e
on e.manager_id = m.employee_id;

5. 위치코드 1400 인 도시명, 부서명 조회
select city, department_name --, d.location_id
from locations l, departments d
where l.location_id = d.location_id
and d.location_id = 1400;

select city, department_name --, d.location_id
from locations l inner join departments d
on l.location_id = d.location_id
where d.location_id = 1400;

select city, department_name --, location_id
from locations l inner join departments d
using (location_id)
where location_id = 1400;

6. 위치코드 1800 에 근무하는 사원의 성명, 업무코드, 급여, 부서명, 위치코드 조회
select last_name||' '||first_name name, job_id, salary,
       department_name, location_id
from employees e, departments d
where e.department_id = d.department_id
and location_id = 1800;

select last_name||' '||first_name name, job_id, salary,
       department_name, location_id
from employees e inner join departments d
on e.department_id = d.department_id
where location_id = 1800;

select last_name||' '||first_name name, job_id, salary,
       department_name, location_id
from employees e inner join departments d
using (department_id)
where location_id = 1800;

7. 성에 대소문자 무관하게 a가 포함된 사원들의 사번, 성, 부서명 조회
select employee_id, last_name, department_name 
from employees e, departments d
where e.department_id = d.department_id(+)
and lower(last_name) like '%a%';

select employee_id, last_name, department_name 
from employees e left outer join departments d
on e.department_id = d.department_id
where lower(last_name) like '%a%';

select employee_id, last_name, department_name 
from employees e left outer join departments d
using (department_id)
where lower(last_name) like '%a%';

8. 관리자보다 먼저 입사한 사원의 성명, 입사일자, 관리자 성명, 관리자 입사일자 조회
select e.last_name||' '||e.first_name emp_name, e.hire_date emp_hire,
       m.last_name||' '||m.first_name mgr_name, m.hire_date mgr_hire 
from employees e, employees m
where e.manager_id = m.employee_id
and e.hire_date < m.hire_date;

select e.last_name||' '||e.first_name emp_name, e.hire_date emp_hire,
       m.last_name||' '||m.first_name mgr_name, m.hire_date mgr_hire 
from employees e inner join employees m
on e.manager_id = m.employee_id
where e.hire_date < m.hire_date;

9. 커미션을 받는 사원들의 성, 부서명, 위치코드, 도시명 조회
select last_name, department_name, d.location_id, city
from employees e, departments d, locations l
where e.department_id = d.department_id(+)
and d.location_id = l.location_id(+)
and commission_pct is not null;

select last_name, department_name, d.location_id, city
from employees e left outer join departments d
on e.department_id = d.department_id
left outer join locations l
on d.location_id = l.location_id
where commission_pct is not null;

select last_name, department_name, location_id, city
from employees e left outer join departments d
using  (department_id)
left outer join locations l
using (location_id)
where commission_pct is not null;

10.toronto 에 근무하는 사원의 사번, 성, 업무코드, 부서코드, 부서명 조회
select employee_id, last_name, job_id, e.department_id, department_name
from employees e, departments d, locations l
where e.department_id = d.department_id
and d.location_id = l.location_id 
and lower(city) = 'toronto'; --근무지가 toronto;

select employee_id, last_name, job_id, e.department_id, department_name
from employees e inner join departments d
on e.department_id = d.department_id
inner join locations l
on d.location_id = l.location_id 
where lower(city) = 'toronto'; --근무지가 toronto;

select employee_id, last_name, job_id, department_id, department_name
from employees e inner join departments d
using (department_id)
inner join locations l
using (location_id )
where lower(city) = 'toronto'; --근무지가 toronto;

11. 사원들이 근무하는 부서의  부서코드, 부서명, 위치코드, 사원수 조회
select
from

12. 사원수가 3명 미만인 부서의 부서코드, 부서명, 사원수 조회
select
from

13. Administration, Executive 부서원들의 업무코드, 사원수 조회
   사원수가 많은 업무부터 적은 순으로 정렬
select
from

   
