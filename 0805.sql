데이터테스트를 위한 테이블: dummy table - dual;

1. 숫자함수
1) 반올림함수:  round(대상숫자데이터, 표현할 자릿수)
표현할 자릿수 음수지정 가능
표현할 자릿수 생략 가능: default 0 - 정수로 표현
소수 둘째자리까지 표현
round(1234.56789, 2) -> 1234.57
select round(1234.56789, 2) r1, 
       round(1234.56789, 0) r2 /* 1235 */,
       round(56789.32154, -2) r3 /* 56800 */, 
       round(1234.56789) r4 /* 1235 */
from dual;

2) 버림함수: trunc(대상숫자데이터, 표현할 자릿수) - 무조건 버림
   두번째 파라미터인 표현할 자릿수 생략 가능: default 0 - 정수표현
select trunc(1234.56789, 2)  t1 /* 1234.56 */,
       trunc(1234.56789, 0) t2 /* 1234 */,
       trunc(56789.32154, -2) t3 /* 56700 */,
       trunc(1234.56789) t4 /* 1234 */
from dual;

3) 올림의 정수함수: 올림의 정수를 반환하는 함수 : ceil(대상숫자데이터) - 무조건 올림의 정수
0 ~ 1 사이에는 무수히 많은 실수
0.9999999999999999999999 -> 1
0.000000000000000000000000000000001 -> 1

4) 버림의 정수함수: 버림의 정수를 반환하는 함수: floor(대상숫자데이터) - 무조건 버림의 정수
0 ~ 1 사이에는 무수히 많은 실수
0.9999999999999999999999 -> 0
0.000000000000000000000000000000001 -> 0

select ceil(12.0000000001) c1, floor(12.99999999999999999) f1
from dual;

숫자 데이터를 표현할 수 있는 함수: round, trunc, ceil, floor
소수점 데이터를 표현할 수 있는 함수: round, trunc
정수 데이터를 표현할 수 있는 함수: ceil, floor, round/trunc(두번째 파라미터가 0)

5) 나머지를 반환하는 함수: mod(대상숫자데이터, 나눌숫자데이터)
17 / 4 : 17 = 4 * 4 + 1
17 / -4 : 17 = -4 * -4 + 1
-17 / 4 : -17 = 4 * -4 - 1
17 / 0 : 17 = 0 * 754446878 + 17
select mod(17, 4) m1,  mod(17, -4) m2, mod(-17,4) m3, mod(17, 0) m4
from dual;

실습
우리회사 사원들 중 부서코드가 100, 110 인 부서에 속한 사원들의
사번, 성명, 급여, 15%인상된 급여 조회 - 인상된 급여는 정수로 표현
select employee_id, last_name||' '||first_name name, salary,
       --round( salary * 1.15 ) increased
       --ceil( salary * 1.15 ) increased
       --trunc( salary * 1.15 ) increased
       floor( salary * 1.15 ) increased
from employees
where department_id in (100, 110) ; --부서코드가 100, 110 인 부서에 속한

2. 문자함수
1) 대/소문자화함수: upper/lower(대상문자데이터)

문자/날짜 데이터 표현: ''
성이 King 인 사원들의 사번, 성, 명 조회
select employee_id, last_name, first_name, 
       upper(last_name) upper_name, lower(first_name) lower_name
from employees
where upper(last_name) = 'KING';
--Where lower(last_Name) = 'king';

성에 대소문자 무관하게 z 가 있는 사원들의 사번, 성, 명 조회
select employee_id, last_name, first_name
from employees
where upper(last_name) like '%Z%';
--where lower(last_name) like '%z%';
--where last_name like '%z%' or last_name like '%Z%' ; --성에 대소문자 무관하게 z 가 있는

2) 단어 단위로 첫문자는 대문자, 나머지는 소문자화 하는 함수: initcap(대상표현)   
select initcap('wE aRE sTDUYing oRAClE') title
/* We Are Studying Oracle */
from dual;

3) 문자데이터표현에 특정 문자를 채워서 반환하는 함수 
- lpad/rpad(대상표현, 반환크기,충전문자)
  세번째 파라미터인 충전문자 생략 가능 : default 공백문자
select lpad('abc', 7,'?') p1 /* ????abc */,
       rpad('abc', 5, '#') p2 /* abc## */,
       '['||lpad('abc', 5) p3 /* __abc */,
       rpad('abc', 5)||']' p4 /* abc__ */
from dual;

4) 문자데이터표현에 특정문자를 제거하고 반환하는 함수
   : 제거할 문자는 한 개만 지정 가능
: trim( leading/trailing/both 제거문자 from 대상문자표현)
  제거할 위치 - 왼쪽:leading, 오른쪽:trailing, 양쪽:both
  제거할 위치 생략 가능 - default both
  제거문자 생략 가능 - default 공백문자
select  trim( leading 'a' from 'abcdcba') t1 /* bcdcba */,
        trim( trailing 'a' from 'abcdcbaaaaa') t2 /* abcdcb */,
        trim( both 'a' from 'abcdcbaaaaa') t3 /* bcdcb */,
        trim( 'a' from 'abcdcbaaaaa') t4 /* bcdcb */,
        '['||'  abcdcba '||']' t5, 
        '['||trim('  abcdcba ')||']' t6 /* abcdcba */
from dual;

5) 문자데이터표현에 특정문자를 제거하고 반환하는 함수
   : 제거할 문자를 여러 개 지정 가능
   ltrim/rtrim(대상문자표현, 제거할문자의 나열)
   두 번째 파라미터 생략 가능 - default 공백문자
select ltrim( 'abcdcba' , 'a' ) t1 /* bcdcba */,
       ltrim( 'abcdcba' , 'ba' ) t2 /* cdcba */,
       rtrim( 'abcdcba' , 'acb') t3 /* abcd */,
       rtrim( '   abcdcba   ') t4 /* abcdcba */
from dual;
   
6) 문자열에서 문자열의 일부를 반환하는 함수
: substr(대상문자표현, 시작위치, 반환길이)
  세번째 파라미터 반환길이 생략 가능 - 문자열의 끝까지 반환
  두번째 파라미터 시작위치 음수 지정 가능 - 오른쪽에서 부터
select substr('You are not alone', 5, 3) s1 /* are */,
       substr('You are not alone', 5) s2 /* are not alone */,
       substr('You are not alone', -5, 3) s3 /* alo */,
       substr('You are not alone', -5) s4 /* alone */
from dual;

7) 문자열에서 특정문자열이 위치한 시작위치를 반환하는 함수
: instr(대상문자표현, 찾는문자열, 찾기시작위치, 몇번째)
  네번째 파라미터 생략 가능 - default 1
  세번째 파라미터 음수 지정 가능 - 오른쪽에서부터 왼쪽방향으로
select instr('Every sha-la-la-la-la', 'la', 1, 2) s1 /* 14 */,
       instr('Every sha-la-la-la-la', 'la', 12, 2) s2 /* 17 */,
       instr('Every sha-la-la-la-la', 'la', 12, 4) s3 /* 0 */,
       instr('Every sha-la-la-la-la', 'la', 12) s4 /* 14 */,
       instr('Every sha-la-la-la-la', 'la', -3, 2) s5 /* 14 */,
       instr('Every sha-la-la-la-la', 'la', -10) s6 /* 11 */
from dual;

email                    id          서비스제공자
hong@naver.com           hong        naver.com
jeon2019@hanuledu.co.kr  jeon2019    hanuledu.co.kr   
sim77@daum.net           sim77       daum.net

본인의 이메일에서 이메일아이디를 조회
select 'hong@naver.com' email,   ? email_id
from dual;

























   
   
   
   
   



























































