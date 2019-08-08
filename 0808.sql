select add_months(sysdate, 3) after3M
from dual;

두 날짜 사이의 개월수의 차이를 반환하는 함수
months_between(대상날짜표현1, 대상날짜표현2)


사번, 성, 입사일자, 근무개월수 조회 -> 많이 근무한 사원순으로 정렬
select employee_id, last_name, hire_date,
    floor(months_between(sysdate, hire_date)) work_months
from employees
order by hire_date desc;

특정날짜 해당월의 마지막 날짜를 반환하는 함수 : last_day()
select last_day('19/05/05') as dl
from dual;

문자 -> 숫자 :
숫자화 : to_number()
select to_number('12000') as nl
from dual;

숫자 -> 문자 
문자화 : to_char()
        to_char(대상표현, 표현 형식)
 표현 현식 : 
 9 / 0으로 표현, 9 -> 공백으로 채워짐
                0 -> 0 으로 채워짐
select 12000 as nl, to_char(12000) as n2
from dual;
select  12000 as nl, to_char(12000) as n2
        trim(to_char(1212000,L9,999,999))
from dual;

날짜 ->문자
표현 현식 :
년 - yyyy, yy, rrrr, rr
월 - mm, month(영문인경우에 한해)
일 - dd
요일 - day, dy
시 - hh, hh24,  분 - mm,  초 - ss
select sysdate today, to_char(sysdate, 'yy-mm-dd dy hh:mm:ss') as today2
from dual;


문자 -> 날짜
to_date(대상표현, 표현형식)
select  '191210' as s, to_date('191210') as s2,
        to_date('191210','ddmmrr') s3
from dual;

일반함수
1. 데이터값이 null 인 경우 다른 값으로 대체하여 반환하는 함수
: nvl(대상표현, null일때 반환 표현)
사번, 성, 급여, 커미션율, 총급여 조회
총급여 = 급여 + 커미션 금액
select employee_id, last_name, salary, commission_pct,
        salary*(1+nvl(commission_pct, 0))total_salary
from employees;

2. 데이터값이 null인 경우 반환 표현과
null이 아닌 경우 반환표현을 각각 지정할 수있느 형태의 함수
: nvl2(대상표현, null 아닌 경우 반환표현, null인 경우 반환표현)
커미션을 받는 사원 :    총급여 = 급여 + 커미션금액
    받지 않는 사원 :  총급여 = 급여 
null인 경우 반환표현은 null이 아닌 경우 반환표현과 데이터 타입이 같아야 한다.
select  employee_id, last_name, salary, commission_pct,
        nvl2(commission_pct, '급여+커미션금액','금액') salary_type,
        nvl2(commission_pct,'salary+commission','salary') type2,
        nvl2(commission_pct,'salary+commission',salary) type3,
        nvl2(commission_pct,'salary','salary+commission') type4,
        nvl2(commission_pct,to_char(salary),'salary+commission') type5
from employees;

3. 데이터값이 null인 경우 대체해서 반환 표현을 여러개 지정할 수 있는 형태 함수
: null 이 아닌 첫번째 데이터를 반환하는 함수
coalesce(대상표현, 대체표현1, 대체표현2, 대체표현3, ....);

select  coalesce('a','',null,'d') as n1,
        coalesce(null,'b',null,'d') as n2,
        coalesce(null,'','c','d') as n3,
        coalesce(null,'',null,'d') as n4,        
        coalesce(null,'',null,'') as n5
from dual;

실습 
사번, 성, 부서코드, 업무코드, 입사일자, 매니저존재여부 조회
매니저 존재여부는 각 사원에 대해 
사원의 관리자(매니저)가 있으면 -> 있음
                     없으면 -> 없음
-- my code
select  employee_id, last_name, nvl2(manager_id,'있음','없음'), 
        to_char(hire_date,'yyyy-mm-dd')
from employees, jobs;

-- master
select  employee_id, last_name, department_id, hire_date,
        nvl2(manager_id,'있음','없음') manager_exist
from employees;