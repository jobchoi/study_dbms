--select employee_id, last_name || ''||first_name name, salary,
--    --round(salary * 1.15) increased
--    floor(salary*1.15) increased
--from employees
--WHERE department_id in (100, 110);

--2. 문자 함수 
--1)
--성 king

--select employee_id, last_name, first_name, 
--    upper(last_name) upper_name, lower(first_name) lower_name
--from employees
----where lower(last_name) = 'King';
--where upper(last_name) = 'King';


-- Error
--select employee_id, last_name, first_name
--from employees
--where uppper(last_name) like '%z%';
--
--select initcap('wE aRE sTDUYing oRACLE'), title
--from dual;



--select lpad('abc',7,'?') p1
--    rpad('abc', 5,'#'
--    '{' ||]pad'abc' 5, 3 
--
--select trim(leading 'a' from 'abcdda') 
--    '['||'trim(' abcdcba ')||']' t6
--from dual;
--
--select  ltrim('abcdef', 'a')    t1,
--        rtrim('abcdca','ba')    t2,
--        ltrim('abcdca', 'abc')  t3,
--        rtrim('   abcdca   ')   t4
--from dual;

--6)문자열에서 문자열의 일부를 변환하는 함수
--select substr('You are not alone', 5,3) s1,
--    substr('You are not alone', 5) s2,
--    substr('You are not alone', -5, 3) s3,
--    substr('You are not alone', -5) s4
--from dual;    
--
----7) 문자열에서 특정문자열이 위치한 시작위치를 반환하는 함수
--select  instr('Every sha-la-la-la-la','la', 2,2) s1,
--        instr('123456 sha-la-la-la-la','la', 14,1) s2,
--        instr('123456 sha-la-la-la-la','la', -12) s3
--from dual;


--'hong@naver.com' ,substr('hong@naver.com' , 1, instr('hong@naver.com','@',1,1)) sl

--select REGEXP_SUBSTR('hong@naver.com', '[^@]+', 1, 1) s1

select 'hong@naver.com' email, substr('hong@naver.com' , 1, instr('hong@naver.com','@',1)) sl
from dual;


select  round(1234.5678,2) as r1,
        trunc(1234.5678,1) as r2,
        round(1234.5678) as r3,
        trunc(1234.5678) as r4
from dual;


select ceil(1234.0000000000000000000000001) as n1,
        floor(1234.9999999999999999999999)as n2
        from dual;
        
100, 110번 부서에 속한 사원의 사번, 성, 급여, 13% 인상된 급여 조회
select employee_id, last_name, salary*1.13 increased_sal
from employees
where department_id in(100, 110)

* 문자함수
알파벳문자에 대한 대/소문자화 함수 : upper/lower(대상문자표현)

select  'Our Subjects ar Java, View, Oracle' title,
        upper('Our Subjects ar Java, View, Oracle') as upper_title,
        lower('Our Subjects ar Java, View, Oracle') as lower_title
from dual;

성 - king
select  employee_id, last_name, first_name,
        upper(last_name) upper_name, lower(first_name) lower_name
from employees
where uppper(last_name) = 'KING';

select ltrim('문자열에서 특정문자를 제거 문자','자문') t1,
        rtrim('문자열에서 특정문자를 제거 문자','자문') t2,
        ltrim(ltrim('문자열에서 특정문자를 제거 문자','자문'),'자문') t3 
from dual;

select  substr('문자열에서 문자열의 일부를 변환하는 함수', 12,2)as s1,
        substr('문자열에서 문자열의 일부를 변환하는 함수', 12) as s2,
        substr('문자열에서 문자열의 일부를 변환하는 함수', -12, 2) as s3
from dual;

str 특정문자에 시작위치 반환
instr(대상, 찾는문자, 시작위치, 몇번째위치인지)
몇번째 나오는 문자를 찾는지 생략가능 - default
select  instr('문자열에서 특정문자가 위치한 시작위치를 변환하는 문자함수','문자',5,2) as s1,
        instr('문자열에서 특정문자가 위치한 시작위치를 변환하는 문자함수','문자',5) as s2,
        instr('문자열에서 특정문자가 위치한 시작위치를 변환하는 문자함수','문자') as s3,
        instr('문자열에서 특정문자가 위치한 시작위치를 변환하는 문자함수','문자',-5) as s4

from dual;

email                                   id              @위치       서비스제공자
hong@naver.com                          hong            5           naver.com
jeon2019@hanuledu.co.kr                 jeon2019        9           hanuledu.ci.kr

select  'jeon2019@hanuledu.co.kr'    email,
        substr('jeon2019@hanul.co.kr',1,
            instr('sim77@daum.net','@')-1)  email_id,
        substr('sim77@daum.net', instr('sim77@daum.net','@')+1)    servicer
from dual;


부서코드가 60,80,100인 부서에 사번, 성, 전화번호 조회
select employee_id, last_name, phone_number
from employees
where department_id in(60,80,100);
                                                                

부서코드가 60,80,100인 부서에 사번, 성, 전화번호,지역번호, 개인번호 조회
select employee_id, last_name, phone_number,
substr(phone_number, '.',-1,1) as list
from employees
where department_id in(60,80,100);



--substr(문자열, 시작위치, 나타낼 개수)
--substr('문자열에서 문자열의 일부를 변환하는 함수', 12)
부서코드가 60,80,100인 부서에 사번, 성, 전화번호,지역번호, 개인번호 조회
select  employee_id, last_name,phone_number,
        substr(phone_number,instr(phone_number, '.', -1, 1)+1) as unic_number,
        substr(phone_number, 1,instr(phone_number, '.', 1)-1) as area_number,
        instr(phone_number, '.', 1) as 지역번호출력크기
from employees
where department_id in(60,80,100);

---------------------------------------------------
* 문자열에서 특정문자열을 찾아 다른문자열로 바꿔 반환하는 함수
replace() : (대상, 찾는문자열, 대체할 문자열)

select  replace('You are alone','You','we') as result1
        replace('You are alone','not') as result2
form dual;