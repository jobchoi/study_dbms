복습
몇개월 후/전의 날짜를 반환하는 함수: add_months(대상표현, 개월수)
select add_months(sysdate, 3) after3M
from dual;
두 날짜 사이의 개월수의 차이를 반환하는 함수
: months_between(대상날짜표현1, 대상날짜표현2 )
  대상날짜표현1 > 대상날짜표현2 
각 사원들이 근무한 근무개월수를 파악하고자 한다.
사번, 성, 입사일자, 근무개월수 조회. 많이 근무한 사원순으로 정렬
근무개월수는 정수로 표현
select employee_id, last_name, hire_date, 
       floor(months_between(sysdate, hire_date)) work_months
from employees
order by work_months desc;
--order by hire_date asc;

특정날짜 해당월의 마지막 날짜를 반환하는 함수: last_day(대상표현)
select last_day( '19/05/05' ) d1
from dual;

문자 -> 숫자: 숫자화: to_number(대상표현)
select to_number( '12000' ) n1
from dual;

숫자 -> 문자: 문자화 : to_char(대상표현, 표현형식)
12,000
표현형식 : 9/0 로 표현 9로 표현시 공백으로 채워지고
                     0로 표현시 0으로 채워진다.
          천단위 , 기호문자 표현
          통화기호 표현 L
select 12000 n1,  to_char(12000) n2,
       trim(to_char(1212000, 'L9,999,999,999')) n3,
       to_char(1212000, 'L00,000,000,000') n4
from dual;


날짜 -> 문자: 문자화 : to_char(대상표현, 표현형식)
표현형식 : 년-yyyy, yy, rrrr, rr    월-mm    일-dd   요일-day,dy
          시-hh, hh24     분-mi    초-ss
select sysdate today, 
       to_char(sysdate, 'yyyy-mm-dd dy hh:mi:ss') today2
from dual;

문자 -> 날짜: 날짜화 : to_date(대상표현, 표현형식)
select '191210' s1, to_date('19-12-10') s2,
      to_date('191210', 'ddmmrr') s3
from dual;
-----------------------------------------------

* 일반함수
1. 데이터값이 null 인 경우 다른 값으로 대체하여 반환하는 함수
   : nvl(대상표현, null일때 반환 표현)
     null 일때 반환 표현의 데이터타입은 대상표현의 데이터타입과 같아야 한다.
사번, 성, 급여, 커미션요율, 총급여 조회
총급여란 급여+커미션금액 
select employee_id, last_name, salary, commission_pct,
       salary * (1+  nvl(commission_pct, 0)  ) total_salary
from employees;


2. 데이터값이 null 인 경우 반환 표현과 
            null 이 아닌 경우 반환 표현을 각각 지정할 수 있는 형태의 함수
: nvl2( 대상표현, null 아닌경우 반환표현, null 인 경우 반환표현)            
  null 인 경우 반환표현은 null 아닌경우 반환표현과 데이터타입이 같아야 한다.
커미션을 받는 사원은 총급여가 급여+커미션금액
        받지 않는 사원은    급여
사번, 성, 급여, 커미션요율, 총급여형태 조회
select employee_id, last_name, salary, commission_pct,
       nvl2(commission_pct, '급여+커미션금액', '급여' ) salary_type ,
       nvl2(commission_pct, 'salary+commission', 'salary') type2,
       nvl2(commission_pct, 'salary+commission', salary) type3,
       nvl2(commission_pct, 'salary', 'salary+commission') type4,
       nvl2(commission_pct, to_char(salary), 'salary+commission') type5
from employees;

3. 데이터값이 null 인 경우 대체해서 반환 표현을 여러 개 지정할 수 있는 형태 함수
  : null 이 아닌 첫번째 데이터를 반환하는 함수
 coalesce(대상표현, 대체표현1, 대체표현2, 대체표현3, ...)  
 null 은 null, ''
 select coalesce('a', '', null, 'd') n1,
        coalesce(null, 'b', null, 'd') n2, 
        coalesce(null, '', 'c', 'd') n3,
        coalesce(null, '', null, 'd') n4,
        coalesce(null, '', null, '') n5
 from dual;
           휴대폰            집         사무실
홍길동  010-1234-5212
심청                     062-4115-54412
전우치                                    062-7815-4111
coalesce(휴대폰, 사무실, 집)

실습
사번, 성, 부서코드, 업무코드, 입사일자, 매니저존재여부 조회
매니저존재여부는 각 사원에 대해 
사원의 관리자(매니저)가 있으면  있음 으로
      관리자(매니저)가 없으면  없음 으로 조회되게 한다.
select employee_id, last_name, department_id, job_id, hire_date,
       nvl2(manager_id, '있음', '없음')  manager_exist,
       nvl2(manager_id, 'ㅠㅠ', '^^')  manager_exist2
from employees;        










      













        
        







































