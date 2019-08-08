사원들에 대한 사번, 성, 명, 부서코드, 입사일자, 업무코드, 급여 조회
select employee_id, last_name, first_name, department_id,
       hire_date, job_id, salary
from employees;       

특정 조건에 맞는 데이터행을 조회하고자 할때
조건절: where 절
select 절
from 절
where 절;

조건절에 사용하는 연산자
1.비교연산자: =, !=, <>, >, <, >=, <=
부서코드가 90인 부서에 속한 사원들의
사번, 성, 명, 부서코드, 업무코드 조회
select employee_id, last_name, first_name, department_id, job_id
from employees
where department_id = 90;  /*부서코드가 90인 부서에 속한;*/

문자 데이터표현 : ''

성이 King 인 사원들의
사번, 성, 명 조회
select employee_id, last_name, first_name
from employees
where last_name = 'King'; --성이 King;

급여가 17000 인 사원들의
사번, 성, 명, 부서코드, 급여 조회
select employee_id, last_name, first_name, department_id, salary
from employees
where salary = 17000; --급여가 17000;

급여가 3000 이하인 사원들의 
사번, 성, 명, 업무코드, 급여, 입사일자 조회
select employee_id, last_name, first_name, job_id,
        salary, hire_date
from employees
where salary <= 3000;        

급여가 15000 이상인 사원들의
사번, 성, 명, 업무코드, 급여 조회
select employee_id, last_name, first_name, job_id, salary
from employees
where salary >= 15000;--급여가 15000 이상;

2. 산술연산자: +, -, *, /  : select절, 조건절
연봉이 150000 이상인 사원들의
사번, 성, 명, 업무코드, 월급여, 연봉 조회
select employee_id, last_name, first_name, job_id, salary, 
        salary*12 annual_salary
from employees
where salary*12 >= 150000;  --연봉이 150000 이상;

공백문자: ' '
홍 길동
3. 문자연결연산자: || : select절, 조건절
성명이 KingSteven 인 사원의 
사번, 성명, 업무코드, 급여, 부서코드 조회
select employee_id, last_name || '  ' || first_name as name, job_id, 
      salary, department_id dept_id
from employees
where last_name||first_name = 'KingSteven'; --성명이 KingSteven;      

컬럼표현에 대한 다른 이름: alias
컬럼표현 as alias명, 컬럼표현 alias명
1. 컬럼표현에 연산자가 사용된 경우
2. 컬럼표현에 함수가 사용된 경우
3. 컬럼표현이 지나치게 긴 경우

4. 논리연산자 : and
부서코드가 10 이상 30 이하인 사원들의
사번, 성명, 부서코드 조회
select employee_id, last_name||' '||first_name name, department_id
from employees
where department_id >=10 and  department_id <= 30 ;--부서코드가 10 이상 30 이하;

급여가 10000 이상 15000 이하인 사원들의
사번, 성명, 급여, 업무코드 조회
select employee_id, last_name||' '||first_name name, salary, job_id
from employees
where salary>=10000 and salary<=15000; --급여가 10000 이상 15000 이하

부서가 60인 부서에서 급여가 5000 이상인 사원들의
사번, 성명, 부서코드, 급여 조회
select employee_id, last_name||' '||first_name name,
       department_id, salary
from employees
where department_id = 60 and salary>= 5000;--부서가 60인 부서 급여가 5000 이상

문자/날짜 데이터표현: ''
부서코드가 60 이하이면서 2003년 6월 17일 이전에 입사한 사원들의 
사번, 성명, 입사일자 조회
select employee_id, last_name||' '||first_name name, hire_date
from employees
where hire_date <= '2003-06-17'  -- 2003년 6월 17일 이전에 입사한;
and department_id <= 60 --부서코드가 60 이하
; 


정리
1. 조건절: where 절
select 절 : 컬럼명1, 컬럼명2, 컬럼명3, ...
from 절 : 테이블명
where 절 : 조건식

조건식에 사용되는 연산자들: 비교연산자, 산술연산자, 연결연산자, 논리연산자
연결연산자: ||
논리연산자: and 

연산자,함수를 사용한 컬럼표현에 대해서는 alias 를 지정하는 습관을 갖는다.






































