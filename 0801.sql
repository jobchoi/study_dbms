논리연산자: and, or, not
범위연산자: 컬럼표현 between A and B - A이상 B이하
           컬럼표현 not between A and B- A미만 B초과
           not 컬럼표현 between A and B- A미만 B초과
급여가 2000 이상 3000 이하인 사원들의 사번, 성명, 급여 조회
select employee_id, last_name||' '||first_name name, salary
from employees
where salary between 2000 and 3000; --급여가 2000 이상 3000 이하

입사일자가 2003년 8월 1일 부터 2005년 7월 31일 에 해당하는 사원들의
사번, 성명, 입사일자 조회
select employee_id, last_name||' '||first_name name, hire_date
from employees
where hire_date between '03-08-01' and '05-07-31';--입사일자가 2003년 8월 1일 부터 2005년 7월 31일;



부서코드가 20,30,40,60,100, 110 인 부서에 속한 사원들의 사번, 성명, 부서코드 조회
select employee_id, last_name||' '||first_name name, department_id
from employees
where department_id=20 or department_id=30 or
department_id=40 or department_id=60 or department_id=100 or department_id=110;
--부서코드가 20,30,40,60,100 

6. in 연산자: 조건식에 있어 
동일한 컬럼표현에 대해 동등비교한 형태의 조건식을 or 로 나열한 형태
:   컬럼표현 in (동등비교할 데이터값 목록)
<-> 컬럼표현 not in (동등비교할 데이터값 목록)
    not 컬럼표현 in (동등비교할 데이터값 목록)
select employee_id, last_name||' '||first_name name, department_id
from employees
where department_id in (20,30,40,60,110,100);

select employee_id, last_name||' '||first_name name, department_id
from employees
where not department_id in (20,30,40,60,110,100);
--where department_id not in (20,30,40,60,110,100);

실습
1.부서코드가 30, 60 인 부서에 속한 사원들의 사번, 성명, 부서코드, 급여 조회
select employee_id, last_name||' '||first_name name, department_id, salary
from employees
where department_id in (30, 60);
--where department_id = 30 or department_id = 60; --부서코드가 30, 60 

2.급여가 5000 이상 7000 이하인 사원들의 사번, 성명, 부서코드, 급여 조회
select employee_id, last_name||' '||first_name name, department_id, salary
from employees
where salary between 5000 and 7000;
--where salary >=5000 and salary<=7000; --급여가 5000 이상 7000 이하

3.부서코드가 30,60 인 부서에 속한 사원들중 급여가 5000 이상 7000 이하인 사원들의
  사번, 성명, 부서코드, 급여 조회
select employee_id, last_name||' '||first_name name, department_id, salary
from employees
where department_id in (30, 60)
and salary between 5000 and 7000;
--where (department_id = 30 or department_id = 60) --부서코드가 30, 60 
--    and (salary >=5000 and salary<=7000); --급여가 5000 이상 7000 이하
A + B * C *  D

우리회사 사원들의 사번, 성, 부서코드 조회
select employee_id, last_name, department_id
from employees;

데이터값이 없는 형태의 표현: null - 비교불가, 산술연산불가
7. 컬럼표현 is null/is not null : null인지 아닌지 파악

부서코드가 null 인 
부서배치받지 않은 사원들의 사번, 성, 부서코드, 업무코드, 급여 조회
select employee_id, last_name, department_id, job_id, salary
from employees
where department_id is null;--부서코드가 null;
--where department_id is not null;--부서코드가 null 이 아닌;

커미션을 받는 사원들의 사번, 성, 부서코드, 커미션요율 조회
select employee_id, last_name, department_id, commission_pct
from employees
where commission_pct is not null;--커미션을 받는

8. 검색에 해당하는 연산자 : 컬럼표현 like 검색문자 + %
   %: 어떤문자가 몇개가 오던지 무관한
홍으로 시작하는 성명 : 홍길동, 홍명보, 홍시, 홍, 홍수완무...
성명 like '홍%'
홍으로 끝나는 성명 : 황선홍, 분홍, 다홍, 홍, 김수완무...홍
성명 like '%홍'
홍이 포함된 성명: 홍길동, 홍명보, 홍시, 홍, 홍수완무, 
                황선홍, 분홍, 다홍, 홍, 김수완무...홍,
                김홍도, ...
성명 like '%홍%'

성이 K로 시작하는 성을 가진 사원들의 사번, 성, 명 조회
select employee_id, last_name, first_name
from employees
where last_name like 'K%'; --성이 K로 시작하는

명이 s로 끝나는 명을 가진 사원들의 사번, 성, 명 조회
select employee_id, last_name, first_name
from employees
where first_name like '%s';

성에 z 가 포함된 성을 가진 사원들의 사번, 성, 명 조회
select employee_id, last_name, first_name
from employees
where last_name like '%z%'; --성에 z 가 포함된

성에 대소문자 무관하게 z 가 포함된 성을 가진 사원들의 사번, 성, 명 조회
select employee_id, last_name, first_name
from employees
where last_name like '%z%' or last_name like '%Z%'; --성에 대소문자 무관하게 z 가 포함된

성명에 대소문자 무관하게 z가 포함된 성을 가진 사원들의 사번, 성명 조회
select employee_id, last_name||' '||first_name name
from employees
where last_name||first_name like '%z%' 
or last_name||first_name like '%Z%';
--성명에 대소문자 무관하게 z가 포함된

성에 소문자 z 가 포함된 성을 가진 사원들의 사번, 성, 명 조회
select employee_id, last_name, first_name
from employees
where last_name like '%z%'; --성에 소문자 z 가 포함된

검색에 해당하는 연산자 : 컬럼표현 like 검색문자 + %,_
   %: 어떤문자가 몇개가 오던지 무관한
   _: 하나의 문자가 어떤문자가 오던지 무관한
성에 소문자 z가 2번째에 위치해 있는 성을 가진 사원들의 사번, 성 조회
select employee_id, last_name
from employees
where last_name like '_z%'; --성에 소문자 z가 2번째에 위치해 있는

성에 소문자 z가 5번째에 위치해 있는 성을 가진 사원들의 사번, 성 조회
select employee_id, last_name
from employees
where last_name like '____z%'; --성에 소문자 z가 2번째에 위치해 있는

성에 소문자 z가 뒤에서부터 5번째에 위치해 있는 성을 가진 사원들의 사번, 성 조회
select employee_id, last_name
from employees
where last_name like '%z____'; 

우리회사 사원들의 사번, 성, 업무코드 조회
select employee_id, last_name, job_id
from employees;

like 연산자와 함께 사용된 %, _ 를 문자 자체로 인지되게 하려면
%,_ 앞에 기호문자를 붙이고 escape 옵션을 지정한다.
컬럼표현 like '특정문자*_' escape '*'
사원들의 업무형태를 파악하고자 한다.
업무코드가 _A 인 사원들의 사번, 성, 업무코드를 조회
: FI_ACCOUNT, AD_ASST, AC_ACCOUNT
select employee_id, last_name, job_id
from employees
where job_id like '%?_A%' escape '?'; --업무코드가 _A 인







   






























































