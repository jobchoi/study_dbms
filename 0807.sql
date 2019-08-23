복습
문자열에서 특정 문자열을 다른 문자열로 바꿔 반환하는 함수
: replace(대상표현,  찾는문자열, 대체될문자열)
문자열에서 특정 문자를 다른 문자로 바꿔 반환하는 함수
: translate(대상표현, 찾는문자의 나열, 대체될문자의 나열)

select replace('문자열에서 특정 문자열을 다른 문자열로 바꿔 반환하는 함수'
                , '문자열', '숫자') s1                
           /* 숫자에서 특정 숫자을 다른 숫자로 바꿔 반환하는 함수 */,
       translate( '문자열에서 특정 문자열을 다른 문자열로 바꿔 반환하는 함수'
                , '문열', '숫' ) s2
from dual;

문자열에서 문자일부를 반환하는 함수: 
substr(대상표현, 시작위치, 길이)
select substr('문자열에서 특정 문자열을 다른 문자열로 바꿔 반환하는 함수', 7, 6) s
from dual;

문자열에서 특정문자열이 있는 위치를 반환하는 함수: 
instr(대상표현, 찾는문자열, 찾기시작할 위치, 몇번째나오는것)
몇 번째 나오는것을 찾는지 생략 가능 : default 1
찾기시작할 위치 생략 가능 : default 1
select instr('문자열에서 특정 문자열을 다른 문자열로 바꿔 반환하는 함수',
                '문자열' ,5, 1) s1,
       instr('문자열에서 특정 문자열을 다른 문자열로 바꿔 반환하는 함수',
                '문자열' ,5, 2) s2                 
from dual;

사원테이블에서 사번, 성, 전화번호
select employee_id, last_name, phone_number, 
       substr(phone_number, 1, 
             instr(phone_number, '.', 1, 1)-1
       /*첫번째.의 위치*/  ) local,
       substr(phone_number, instr(phone_number, '.', -1, 1)+1 ) private
       /*마지막.의 위치=오른쪽에서 첫번째.의 위치*/ 
from employees;

날짜함수
시스템의 오늘날짜를 반환하는 함수: sysdate
select sysdate
from dual;

날짜 +- 숫자 -> 날짜
날짜 - 날짜 -> 숫자

특정날짜로부터 몇 개월 후/전 의 날짜를 반환함수
: add_months(날짜표현, 개월수)
오늘로부터 3개월 전의 날짜가 몇일인지 파악하고자 한다.
오늘로부터 3개월 전, 6개월 후의 날짜 조회
select add_months(sysdate, -3) before3M, 
       add_months(sysdate, 6) after6M
from dual;

두 날짜사이의 개월수의 차이를 반환함수
: months_between(날짜1, 날짜2) 날짜1 > 날짜2
소수 첫째 자리까지 표현
select trunc( months_between(sysdate, '19/06/20' ), 1) diff
from dual;

우리회사 사번 100번인 사원 의 
사번, 성, 입사일자, 근무개월수, 근무년수 조회
- 근무개월수, 근무년수는 오늘을 기준으로 계산하여 정수로 표현 
예를 들어 오늘은 2019/08/07 이고, 2019/05/27 일에 입사했다면  2개월 근무한 것
select employee_id, last_name, hire_date, 
       floor(months_between(sysdate, hire_date) ) work_months,
       floor(months_between(sysdate, hire_date)/12 ) work_years
from employees
where employee_id = 100;
------------------------------------------------------

4) 해당 월의 마지막 날짜를 반환하는 함수
: last_day(날짜표현)
select last_day(sysdate) s1, 
        last_day(add_months(sysdate, -6)) s2,
       --오늘로부터 6개월전인 달의 마지막 날짜
       last_day(add_months(sysdate, 6)) s3
       --오늘로부터 6개월 후인 달의 마지막 날짜
from dual;

* 형변환함수
   to_char     to_date
    ->          ->
숫자        문자      날짜
     <-           <-  
   to_number    to_char 

문자화함수: to_char
숫자화함수: to_number
날짜화함수: to_date

1. 숫자화함수: to_number 문자->숫자
'가나다', 'abc', '19/02/05' -> 숫자로 변환 불가
select to_number('1245') s1, 1245 s2
from dual;

2. 문자화함수: to_char
1) 숫자->문자: to_char(대상표현, 포맷형식)
   포맷형식: 9:공백,0   천단위,표현  통화기호L
select 12345 n1, to_char(123456) s1, 
       1500000 n2, 
              
       '['|| ltrim(to_char(1500000, 'L9,999,999,999'), ' ' ) s21, 
       '['|| ltrim(to_char(1500000, 'L9,999,999,999') ) s22, 
       '['|| trim( leading ' '
                    from to_char(1500000, 'L9,999,999,999') ) s23, 
       '['|| trim(  ' ' from to_char(1500000, 'L9,999,999,999') ) s24, 
       '['|| trim( to_char(1500000, 'L9,999,999,999') ) s25, 
       
       to_char(1500000,'0,000,000,000') s3       
from dual;

2) 날짜->문자: to_char(대상표현, 표현형식)
표현형식: 년-yyyy, yy, rr, rrrr 월-mm, month, mon 일-dd  
         요일-day, dy
         시-hh, hh24   분-mi   초-ss
select to_char(sysdate, 'yyyy-mm-dd dy hh24:mi:ss') d1
from dual;


3. 날짜화함수: to_date(대상표현, 표현형식)  
'19-08-04' -> 변환가능:날짜형식, 
'가나다', 'adb' -> 변환불가
select to_date('19-08-04') d1, to_date('190804') d2,
       to_date('19-08-04', 'dd-mm-yy') d3
from dual;

select 10 + 20 n1, '10' + '20' n2, 10 + '20' n3
from dual;

10
2

실습
1. 2005 년 전(2004년까지)에 입사한 사원들의 
   사번, 성명, 입사일자, 입사일의 요일 을 조회하여 
   최근에 입사한 사원순으로 정렬한다.
select employee_id, last_name|| ' '|| first_name name,
      hire_date, to_char(hire_date, 'day') hire_day
from employees 
where to_char(hire_date, 'yyyy') < 2005 
order by hire_date desc; --입사한 해 < 2005; 
--where hire_date <= '2004/12/31'; 
--where hire_date < '2005/01/01';  --2005 년 전(2004년까지)에 입사한;      

2. 급여가 10000 이상인 사원들의 사번, 성명, 급여를 조회하여
   급여순으로 정렬한다.
   급여는 공백없이 천단위 기호를 사용하여 표현한다.
select employee_id, last_name||' '||first_name name, 
       trim(to_char(salary, '9,999,999,999')) salary
from employees
where salary >= 10000 --급여가 10000 이상
order by salary asc;

* 일반함수
사번, 성, 급여, 커미션요율, 총급여 조회
총급여란 급여+커미션금액 
select employee_id, last_name, salary, commission_pct,
       salary * (1+commission_pct) total_salary
from employees;









































































