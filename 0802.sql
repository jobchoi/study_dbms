복습
in 연산자 - 컬럼표현 in (동등비교할 데이터값 목록)
:동일한 컬럼표현에 대해 동등비교한 조건식을 or 연산자로 나열한 형태

사번인 100, 110, 120, 125 인 사원들의 사번, 성, 명 조회
select employee_id, last_name, first_name
from employees
where employee_id = 100 or employee_id = 110 
or employee_id = 120 or employee_id = 125; 
--사번인 100, 110, 120, 125

select employee_id, last_name, first_name
from employees
where employee_id in (100,110,120,125);

데이터값의 존재유무를 판단할 연산자
is not null / is nullwq

null : 비교불가, 산술연산불가
부서배치 받지 않은 사원들의 사번, 성, 부서코드 조회
select employee_id, last_name, department_id
from employees
where department_id is null; --부서배치 받지 않은

커미션을 받는 사원들의 사번, 성, 커미션요율 조회
select employee_id, last_name, commission_pct
from employees
where commission_pct is not null; --커미션을 받는 

검색연산자: like '문자표현' + %,_
           %: 어떤문자가 몇개 있던 무관한
           _: 어떤문자 한개가 있는
성이 C 로 시작하는 성을 가진 사원들의 사번, 성, 명 조회
select employee_id, last_name, first_name
from employees
where last_name like 'C%'; --성이 C 로 시작하는
문자/날짜 데이터표현 : ''

alias명
select last_name|| ' '||first_name "Name"
from employees;

성이 t 로 끝나는 성을 가진 사원들의 사번, 성, 명 조회
select employee_id, last_name, first_name
from employees
where last_name like '%t'; --성이 t 로 끝나는

성에 대/소문자 t가 있는 성을 가진 사원들의 사번, 성, 명 조회
select employee_id, last_name, first_name
from employees
where last_name like '%t%' or last_name like '%T%'; --성에 대소문자 t가 있는 

성에 소문자 t가 앞에서 3번째 위치한 성을 가진 사원들의
사번, 성, 명 조회
select employee_id, last_name, first_name
from employees
where last_name like '%t__';
--성에 소문자 t가 뒤에서 3번째 위치한
--where last_name like '__t%';
--성에 소문자 t가 앞에서 3번째 위치한

업무코드에 _R 이 있는 사원들의 사번, 성, 업무코드 조회
_ 나 % 를 문자 자체로 인지되게 하기 위해 
_ 나 % 앞에 기호문자를 붙이고 
붙인 기호문자는 검색에서 제외시킨다. : escape 붙인기호문자
select employee_id, last_name, job_id
from employees
where job_id like '%@_R%' escape '@' ; --업무코드에 _R 이 있는;
-----------------------------------------------------------------

* 데이터행정렬 - order by 절 : 쿼리문의 가장 마지막에 위치
order by 정렬기준표현 + 오름(default) asc /내림차순 desc
정렬기준표현: 컬럼표현 그대로, alias, select목록에서의 위치
select 절 
from 절
where 절
order by 절;

사번, 성, 부서코드, 급여, 입사일자 조회, 성 내림차순으로 정렬한다.
select employee_id, last
_name name, department_id, salary, hire_date
from employees
order by 2 desc;
--order by name desc;
--order by last_name desc;

사번, 성, 부서코드, 급여, 입사일자 조회, 
부서 순으로 정렬한다.
select employee_id, last_name, department_id, salary, hire_date
from employees
order by department_id asc;

사번, 성, 부서코드, 급여, 입사일자 조회
입사일자 순으로 정렬한다.
select employee_id, last_name, department_id, salary, hire_date
from employees
order by 5;
--order by hire_date;

사번, 성, 부서코드, 급여, 입사일자 조회
급여 순으로 정렬한다.
select employee_id, last_name, department_id, salary, hire_date
from employees
order by salary;

order by 정렬기준1 오름/내림, 정렬기준2 오름/내림, ...

사번, 성, 부서코드, 급여, 입사일자 조회
부서 순, 급여 내림차순으로 정렬한다.
select employee_id, last_name, department_id, salary, hire_date
from employees
order by department_id, 4 desc;

실습
1. 부서코드 30, 40, 60인 부서에 속한 사원들의
사번, 성명, 부서코드, 급여를 조회하여 성명순으로 정렬한다.
select employee_id, last_name||' '||first_name name, 
        department_id, salary
from employees        
where department_id in (30,40,60)  --부서코드 30, 40, 60인 부서에 속한
order by 2;
--order by  name;
--order by last_name||' '||first_name;

2. 커미션을 받는 사원들의 사번, 성명, 급여, 커미션요율을 조회하여
커미션요율이 높은 사원부터 낮은 사원순으로 정렬한다.
select employee_id, last_name||' '||first_name name, 
       salary, commission_pct
from employees
where commission_pct is not null --커미션을 받는 사원들
order by 4 desc;
--order by commission_pct;

3. 성명에 대/소문자 무관하게 z 가 있는 사원들의
사번, 성명 을 조회하여 성명순으로 정렬한다.
select employee_id, last_name||' '||first_name name
from employees
where last_name||first_name like '%z%'
order by name; --성명에 대/소문자 무관하게 z 가 있는

* 함수
: 숫자함수, 문자함수, 날짜함수, 형변환함수, 일반함수

int no1 = 10;
short no2 = 5;
no2 = (short)no1; 안담김 int -> short
no1 = (int)no2; short -> int : 명시적 형변환
no1 = no2; 암묵적 형변환

데이터테스트를 위한 테이블: dummy table - dual;

1. 숫자함수
1) 반올림함수:  round(대상숫자데이터, 표현할 자릿수)
소수 둘째자리까지 표현
round(1234.56789, 2) -> 1234.57
select round(1234.56789, 2) r1
from dual;










































































