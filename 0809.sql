복습
데이터가 null 인 경우 반환데이터를 지정하는 함수
nvl(대상표현, null 일때 반환데이터)
nvl2(대상표현, null 아닐때 반환데이터, null 일때 반환데이터)
coalesce(대상표현, 1째 파라미터가 null일때 반환데이터,
                  2째 파라미터가 null일때 반환데이터, 
                  3째 파라미터가 null일때 반환데이터,
                  ....)

사번, 매니저사번
select employee_id, nvl(manager_id, 0) manager_id,
      nvl2(manager_id, 'O', 'X') exist
from employees;
----------------------------------------------------
1. 조건문에 해당하는 함수
if( 조건식1 ){
 ....
}else if( 조건식2 ){
 .....
}else if( 조건식3 ){
 .....
}else{
 ....
}

부서별로 보너스를 지급하기로 했다.
부서코드가 10 이면  급여의 10%,
         20 이면  급여의 20%,
         30 이면  급여의 30%,
         나머지 부서원은 급여의 5%
if( 부서코드 <= 10 ){
  보너스 = 급여*0.1;
}else if( 부서코드 <= 20 ){
  보너스 = 급여*0.2;
}else if( 부서코드 <= 30 ){
  보너스 = 급여*0.3;
}else{
  보너스 = 급여*0.05;
}

: decode( 대상표현, 비교데이터표현1, 반환데이터1, 
                   비교데이터표현2, 반환데이터2,
                   비교데이터표현3, 반환데이터3, default반환데이터)

사번, 성, 부서코드, 급여, 보너스 조회
select employee_id, last_name, department_id, salary, 
       decode(department_id, 10, salary*0.1, 
                             20, salary*0.2, 
                             30, salary*0.3, salary*0.05 ) bonus
from employees;       

사원들의 사번, 성, 업무코드, 업무등급 조회
select employee_id, last_name, job_id, 
       decode( job_id, 'AD_PRES', 'A', 
                       'ST_MAN', 'B', 
                       'IT_PROG', 'C', 
                       'X' ) job_grade,
       case job_id when 'AD_PRES' then 'A' 
                   when 'ST_MAN' then 'B'
                   when 'IT_PROG' then 'C' else 'X' end grade                       
from employees;

업무등급은 업무코드에 따라 분류한다.
업무코드       업무등급
AD_PRES       A
ST_MAN        B
IT_PROG       C
그 외          X

조건문에 해당하는 구문: case ~ end
case  대상표현 when 비교데이터값1 then 반환데이터1
              when 비교데이터값2 then 반환데이터2
              when 비교데이터값3 then 반환데이터3
              ....
              else default반환데이터
end

사번, 성, 부서코드, 급여, 보너스
select employee_id, last_name, department_id, salary,
       case department_id when 10 then salary*0.1 
                          when 20 then salary*0.2
                          when 30 then salary*0.3 
                          else salary*0.05 end bonus
from employees;

범위 조건에 따라 데이터를 반환하는 경우의 case 구문
case when 조건식1 then 반환데이터1
     when 조건식2 then 반환데이터2
     when 조건식3 then 반환데이터3
     else default반환데이터
end      

부서코드가 10~30 이면 급여의 10%
부서코드가 40~60 이면 급여의 20%
          70~100 이면 급여의 30%
그외 부서원은 급여의 5%
사번, 성, 부서코드, 급여, 보너스 조회
select employee_id, last_name, department_id, salary,
       case when department_id between 10 and 30 then salary*0.1
            when department_id between 40 and 60 then salary*0.2
            when department_id between 70 and 100 then salary*0.3
            else salary*0.05 end bonus1,
      case when department_id <=30 then salary*0.1
           when department_id <=60 then salary*0.2
           when department_id <=100 then salary*0.3 
           else salary*0.05 end bonus2    
from employees;

부서코드가 30이하 이면  급여의 10%
급여가 10000 이상이면 급여의 5%
업무코드가 clerk 종류의 업무이면 급여의 20% 
사번, 성, 부서코드, 급여, 업무코드, 보너스 조회
select employee_id, last_name, department_id, salary, job_id,
      case when department_id <= 30 then salary*0.1
           when salary>=10000 then salary*0.05
           when lower(job_id) like '%clerk%' then salary*0.2 end bonus
from employees;

실습
모든 사원의 각 사원들의 근무년수, 근속상태를 파악하고자 한다.
사원들의 사번, 성, 입사일자, 근무년수, 근속상태 조회
근무년수는 오늘을 기준으로 근무한 년수를 정수로 표현한다.
근속상태는 근무년수에 따라 표현한다.
근무년수가 12년 미만이면             12년 미만 근속   으로 표현
          12년 이상 15년 미만 이면  15년 미만 근속   으로 표현
          15년 이상 이면           15년 이상 근속   으로 표현    
select employee_id, last_name, hire_date,
       trunc(months_between(sysdate, hire_date)/12) work_years,
       case when months_between(sysdate, hire_date)/12 <12 then '12년 미만 근속'
            when months_between(sysdate, hire_date)/12 >=12 
                    and months_between(sysdate, hire_date)/12 < 15
                 then '15년 미만 근속' 
            when months_between(sysdate, hire_date)/12 >=15
                 then '15년 이상 근속' 
       end work_status,
       case when months_between(sysdate, hire_date)/12 <12 then '12년 미만 근속'
            when months_between(sysdate, hire_date)/12 <15
                 then '15년 미만 근속' 
            else  '15년 이상 근속' 
       end work_status       
from employees;
          
하나의 데이터행에 대해 하나의 결과를 반환하는 형태의 함수:  단일행 함수
숫자함수: round,trunc, ceil,floor
문자함수: upper, lower, trim, ltrim/rtrim, lpad/rpad, 
         substr, instr, replace, translate
날짜함수: sysdate, months_between, add_months, last_day
형변환함수: to_char, to_number, to_date
일반함수: nvl, nvl2, coalesce, decode, case~end


우리회사 사원들의 사번, 성, 부서코드 조회
select employee_id, last_name, department_id
from employees;

데이터는 중복된 데이터행이 조회된다.
중복을 제거하고 대표값만 조회하기 위한 키워드: distinct : null 을 포함한다.
데이터행에 대해 distinct 한다.

null 은 내림차순에 대해 우선순위를 갖는다.
내림차순일 때 null 을 마지막 데이터행으로 조회하려면 nulls last
오름차순일 때 null 을 첫번째 데이터행으로 조회하려면 nulls first
우리회사 사원들이 소속된 부서들을 파악하고자 한다.
사원들이 소속된 부서코드를 조회
select distinct department_id
from employees
order by 1 desc nulls last;

select distinct department_id
from employees
order by 1 nulls first;

select distinct department_id, employee_id
from employees;

실습
우리회사에 매니저로 있는 사원들이 누군인지 파악하고자 한다.
매니저인 사원들의 사번을 조회
select distinct manager_id
from employees
where manager_id is not null;

여러 행으로부터 하나의 결과를 반환하는 형태의 함수: 그룹함수
- null 을 제외한다.
1. 데이터행의 갯수를 세어 반환하는 함수: count(대상표현)
select count(*) cnt1, count(employee_id) cnt2, 
       count(department_id) cnt3
from employees;

부서배치 받은 사원의 수를 조회
select count(*) cnt 
from employees
where department_id is not null;

select count(department_id) cnt 
from employees;
          
매니저인 사원들 조회
select distinct manager_id
from employees
where manager_id is not null;

매니저인 사원들의 수 조회
select count(distinct manager_id) cnt
from employees;

우리회사 사원들 중 커미션을 받는 사원들이 모두 몇명인지 파악하고자 한다.
커미션을 받는 사원의 수를 조회
select count(*) cnt
from employees
where commission_pct is not null;

select count(commission_pct) cnt
from employees;

2. 데이터값을 합하여 반환하는 함수: sum(대상표현) - 숫자에만 사용 가능
우리회사 사원들의 급여 합계 조회
select sum(salary) sum_sal
from employees;

3. 데이터값 중 가장 큰/작은 값을 반환하는 함수: max/min(대상표현)
우리회사 사원들의 급여 중 가장 높은/적은 급여를 파악하고자 한다.
우리회사 가장 높은, 적은 급여 조회
select max(salary) max_sal, min(salary) min_sal
from employees;

























     

















