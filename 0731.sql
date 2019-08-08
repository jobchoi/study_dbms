select 컬럼명1, 컬럼명2,  ...
from 테이블명;

특정조건에 맞는 데이터행 조회시
select 컬럼명1, 컬럼명2,  ...
from 테이블명
where 조건식;

조건절에 사용하는 연산자
1. 비교연산자: =, !=, <>, >, <, >=, <=
급여가 15000 이상인 사원들의 사번, 성, 명, 급여 조회
select employee_id, last_name, first_name, salary
from employees
where salary >= 15000; --급여가 15000 이상;

문자/날짜데이터표현: ''
성이 King 인 사원들의 사번, 성, 명, 입사일자 조회
select employee_id, last_name, first_name, hire_date
from employees
where last_name = 'King'; --성이 King 인;

입사일자가 2004년1월30인 사원들의 사번, 성, 명, 입사일자, 업무코드 조회
select employee_id, last_name, first_name, hire_date, job_id
from employees
where hire_date = '2004-01-30';

날짜데이터의 포맷형식 확인:
select * from v$nls_parameters;

2. 산술연산자: +, -, *, / : 조건절, select절에 사용
연봉이 30000 미만인 사원들의 사번, 성, 명, 급여, 연봉 조회
select employee_id, last_name, first_name, salary, salary*12 annual
from employees
where salary*12 < 30000; --연봉이 30000 미만;

3. 문자연결연산자: || : 조건절, select절에 사용
성명이 ChenJohn 인 사원의 사번, 성명 조회
select employee_id, last_name || '  ' || first_name as name
from employees
where last_name||first_name = 'ChenJohn'; --성명이 ChenJohn;

select 절 컬럼표현에 연산자/함수가 사용된 경우 
반드시 alias 를 지정하도록 한다.
컬럼표현 as alias명 / 컬럼표현 alias명 ;

4. 논리연산자: and 
급여가 3000 이상 4000 이하인 사원들의 사번, 성명, 급여 조회
select employee_id, last_name||' '||first_name name, salary
from employees
where salary>=3000 and salary<=4000 ;--급여가 3000 이상 4000 이하;

부서코드가 80 인 부서에 속하면서 급여가 8000 이상인 사원들의 
사번, 성명, 부서코드, 급여 조회
select employee_id, last_name||' '||first_name name, department_id, salary
from employees
where department_id = 80 --부서코드가 80 인 부서에 속하면서;
  and salary>=8000; --급여가 8000 이상
-------------------------------------------------


부서코드가 10,20,30인 부서에 속한 사원들의
사번, 성명, 부서코드, 업무코드 조회
select employee_id, last_name||' '||first_name name, department_id, job_id
from employees
where department_id = 10 or department_id = 30
  or department_id = 20; --부서코드가 10,20,30;

사번이 150, 170, 190 인 사원들의
사번, 성명, 부서코드, 업무코드, 입사일자 조회
select employee_id, last_name||' '||first_name name, 
        department_id, job_id, hire_date
from employees
where employee_id = 150 or employee_id = 170 or employee_id = 190 ;
--사번이 150, 170, 190 ;        

부서코드가 30인 부서의 급여 10000 미만인 사원들과
부서코드가 60인 부서의 급여 5000 이상인 사원들의 사번, 성명, 부서코드, 급여 조회
select employee_id, last_name||' '||first_name name,
       department_id, salary
from employees
where (department_id=30 and salary<10000) 
or (department_id=60 and salary>=5000);
--where department_id=30 and salary<10000 --부서코드가 30인 부서의 급여 10000 미만
--or department_id=60 and salary>=5000; --부서코드가 60인 부서의 급여 5000 이상

연산자에는 우선순위가 있다
산술연산의 경우: *,/ -> +,-
논리연산의 경우: and:논리곱 -> or:논리합
7+(7/7)+(7*7)-7

5. 범위연산자
A이상 B이하: 컬럼표현 between A and B
A미만 B초과: 컬럼표현 not between A and B
            not 컬럼표현 between A and B

부서코드가 10 이상 40 이하인 부서에 속한 사원들의
사번, 성명, 부서코드 조회
select employee_id, last_name||' '||first_name name, department_id
from employees
where department_id between 10 and 40;
--where department_id>=10 and department_id<=40; --부서코드가 10 이상 40 이하;

급여가 10000 이상 15000 이하인 사원들의 사번, 성명, 급여 조회
select employee_id, last_name||' '||first_name name, salary
from employees
where salary between 10000 and 15000;--급여가 10000 이상 15000 이하


select employee_id, last_name||' '||first_name name, department_id
from employees
where department_id>=10 and department_id<=40; --부서코드가 10 이상 40 이하;
논리연산자를 사용해
부서코드가 10 미만 40 초과인 사원들의 사번, 성명, 부서코드 조회
select employee_id, last_name||' '||first_name name, department_id
from employees
--where not department_id between 10 and 40;
--where department_id not between 10 and 40;
--where department_id<10 or department_id>40; --부서코드가 10 미만 40 초과
where not (department_id>=10 and department_id<=40);

사번이 110 이상 120이하인 사원들중에 급여가 8000 이상 15000 이하인 사원들의
사번, 성명, 부서코드, 급여 조회
select employee_id, last_name||' '||first_name name, department_id, salary
from employees 
where (employee_id between 110 and 120)  --사번이 110 이상 120이하
and (salary between 8000 and 15000);--급여가 8000 이상 15000 이하


논리연산자: and, or, not
and  | True  False          or   | True  False         not | True  False
------------------          ------------------         ------------------
True | True  False          True | True  True                False True  
False| False False          False| True  False









































