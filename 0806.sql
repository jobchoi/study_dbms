복습
숫자함수: 소수점데이터표현 가능 
반올림/버림 - round/trunc(대상표현, 자릿수)
자릿수 생략 - default 0 - 정수표현
select round(1234.5678, 2) r1 /* 1234.57 */,
       trunc(1234.5678, 1) r2 /* 1234.5 */,
       round(1234.5678) r3 /* 1235 */,
       trunc(1234.5678) r4 /* 1234 */       
from dual;

정수표현 가능한 올림/버림 : ceil/floor(대상표현)
select ceil(1234.0000000001) n1 /* 1235 */,
       floor(1234.9999999999) n2 /* 1234 */
from dual;

100, 100번 부서에 속한 사원의 사번, 성, 급여, 13% 인상된 급여 조회
인상된 급여는 정수로 표현
select employee_id, last_name, salary, ceil(salary*1.13) increased_sal
from employees
where department_id in (100,110);

* 문자함수
알파벳문자에 대한 대/소문자화 함수: upper/lower(대상문자표현)
select 'Our Subjects ar Java, View, Oracle' title,
      upper('Our Subjects ar Java, View, Oracle') upper_title,
      lower('Our Subjects ar Java, View, Oracle') lower_title
from dual;

성이 king 인 사원들의 사번, 성, 명 조회
select employee_id, last_name, first_name, 
      upper(last_name) upper_name, lower(first_name) lower_name
from employees
where upper(last_name) = 'KING';
--where lower(last_name) = 'king';

특정문자를 채워서 반환하는 함수 : lpad/rpad(대상표현, 반환데이터길이, 채울문자)
select lpad('abc', 10, '@') p1
from dual;

select employee_id, lpad(last_name , 20, ' ') last_name
from employees;

문자열에서 특정문자를 제거하여 반환하는 함수: 
trim( 제거할 위치 제거문자 한 개 from 대상표현)
제거할 위치: 왼쪽-leading, 오른쪽-trailing, 양쪽- both(default)
select trim( leading '문' from '문자열에서 특정문자를 제거') t1 
    /* 자열에서 특정문자를 제거 */,
        trim( trailing '자' from '문자열에서 특정문자를 제거한 문자') t2
        /* 문자열에서 특정문자를 제거한 문 */,
        trim(  '문' from '문자열에서 특정문자를 제거한 문자문') t3
        /* 자열에서 특정문자를 제거한 문자 */
from dual;

문자열에서 특정문자를 제거하여 반환하는 함수 - 제거문자를 여러 개 지정 가능
: ltrim/rtrim(대상표현, 제거할문자의 나열)
select ltrim('문자열에서 특정문자를 제거한 문자', '자문') t1
        /* 열에서 특정문자를 제거한 문자 */,
       rtrim('문자열에서 특정문자를 제거한 문자', '자문') t2 
       /* 문자열에서 특정문자를 제거한  */,
       rtrim( ltrim('문자열에서 특정문자를 제거한 문자', '자문'), '자문' ) t3
from dual;


문자열에서 문자열의 일부를 반환하는 함수 
: substr(대상표현, 시작위치, 반환문자길이)
  반환문자길이 생략 가능 - 대상표현문자열의 끝까지 반환
  시작위치 -를 지정하면 오른쪽에서부터 세어 시작위치를 잡는다.
select substr('문자열에서 문자열의 일부를 반환하는 함수', 12, 2) s1 /* 일부 */,
substr('문자열에서 문자열의 일부를 반환하는 함수', 12) s2 /* 일부를 반환하는 함수 */,
substr('문자열에서 문자열의 일부를 반환하는 함수', -12, 2) s3 
      /* _일 */,
substr('문자열에서 문자열의 일부를 반환하는 함수', -12) s4
      /* _일부를 반환하는 함수 */            
from dual;

문자열에서 특정문자가 위치한 시작위치를 반환하는 함수 
: instr(대상표현, 찾는문자, 시작위치, 몇번째나오는)
  몇번째나오는 문자를 찾는지 생략 가능 - default 1
  시작위치 생략 가능 - default 1
  시작위치 음수 지정 가능 - 오른쪽에서부터 왼쪽방향으로 찾는다.

select  instr('문자열에서 특정문자가 위치한 시작위치를 반환하는 문자함수', 
                            '문자', 5, 2) s1 /* 28 */,
        instr('문자열에서 특정문자가 위치한 시작위치를 반환하는 문자함수',
                            '문자', 5) s2 /* 9 */,
        instr('문자열에서 특정문자가 위치한 시작위치를 반환하는 문자함수',
                            '문자') s3 /* 1 */,
        instr('문자열에서 특정문자가 위치한 시작위치를 반환하는 문자함수',
                            '문자', -5) s4 /* 9 */,
        instr('문자열에서 특정문자가 위치한 시작위치를 반환하는 문자함수',
                            '문자', -5, 2) s5 /* 1 */,
        instr('문자열에서 특정문자가 위치한 시작위치를 반환하는 문자함수',
                            '문자', -5, 3) s6 /* 0 */                                                        
from dual;

email                    id                @위치   서비스제공자
hong@naver.com           hong       1, 4   5       naver.com       6, 9
jeon2019@hanuledu.co.kr  jeon2019   1, 8   9       hanuledu.co.kr  10, 14  
sim77@daum.net           sim77      1, 5   6       daum.net        7, 8

본인의 이메일에서 이메일아이디를 조회
select 'sim77@daum.net' email,   
    substr( 'sim77@daum.net', 1, 
            instr('sim77@daum.net', '@')-1  ) email_id,
    substr( 'sim77@daum.net', instr('sim77@daum.net', '@')+1) servicer
from dual;

부서코드가 60,80, 100 인 부서에 속한 사원들의 
사번, 성, 전화번호, 지역번호, 개인번호 조회
select employee_id, last_name, phone_number ,
      substr(phone_number, 1, instr(phone_number, '.')-1 ) local_number,
      substr(phone_number, instr(phone_number, '.', -1)+1 ) private_number
from employees
where department_id in (60,80,100);
                           지역번호        개인번호  
박문수  515.124.4567         515           4567
임꺽저  011.44.1344.467268   011           467268 
홍길동  02.1234.5678         02            5678
전우치  062.9874.5422        062           5422
심청    0652.4523.6221       0652          6221
-----------------------------------------------

8) 문자열에서 특정문자열을 찾아 다른문자열로 바꿔 반환하는 함수
: replace(대상문자표현, 찾는문자열, 대체될문자열)
세번째 매개변수(파라미터) 대체될문자열 생략 가능 : default - null
You -> We
select replace('You are not alone', 'You', 'We') s1 
        /* We are not alone */,
        replace('You are not alone', 'not') s2 
        /* You are  alone */
from dual;

9) 문자열에서 특정문자를 찾아서 다른 문자로 바꿔 반환하는 함수
: 찾는문자, 대체될문자- 문자의 나열
translate(대상문자표현, 찾는문자의나열, 대체될문자의나열)
Y -> W, o -> e, u -> null
select translate('You are not alone', 'You', 'We') s1
                /*We are net alene */
from dual;


                  너는 나를 모르는데 나는 너를 알겠느냐
replace 사용해     나는 나를 모르는데 나는 나를 알겠느냐 
select replace(replace('너는 나를 모르는데 나는 너를 알겠느냐', '너는', '나는' ), '너를','나를') s1,
       replace('너는 나를 모르는데 나는 너를 알겠느냐', '너', '나' ) s2
             /* 나는 나를 모르는데 나는 나를 알겠느냐 */
from dual;

translate 사용해   나는 너를 모르는데 너는 나를 알겠느냐 
select translate('너는 나를 모르는데 나는 너를 알겠느냐','나너', '너나') s1
               /* 나는 너를 모르는데 너는 나를 알겠느냐  */
from dual;

* 날짜함수
1) 시스템의 현재 날짜를 반환하는 함수 - sysdate
select sysdate
from dual;

오늘날짜 + 1 -> 내일날짜
오늘날짜 - 1 -> 어제날짜
select sysdate + 1 tomorrow, sysdate-1 yesterday
from dual;

오늘날짜 - 그제날짜 -> 일수차이
오늘날짜로 부터 한 달후: 
select sysdate + 30 after1M
from dual;

2) 특정날짜로부터 몇 개월 후/전 의 날짜 반환하는 함수
: add_months(대상날짜표현, 개월수)
오늘로부터 6개월 후의 날짜 조회, 오늘로부터 3개월 전의 날짜 조회
select add_months(sysdate,6) after6M, add_months(sysdate, -3) before3M
from dual;

오늘날짜 - 2019/03/15 -> 개월수의 차이
3) 두 날짜 사이의 개월수의 차이를 반환하는 함수
: months_between(날짜표현1, 날짜표현2) 날짜표현1 > 날짜표현2
소수 첫째자리까지 표현
select trunc(months_between(sysdate, '19/03/15'),1) diff
from dual;












































































