select to_number('1234') s1
from dual;

-- 숫자표현
--천단위 구분시 사용방법
--9 : 없는 부분은 공백으로 처리
--0 : 
select  1234 n, to_char(123456) s,
        1500000 n2, 
        (to_char(1500000,'L9,999,999,999')) s23,
        ltrim(to_char(1500000,'L9,999,999,999')) empty_space
from dual;


--날짜 -> 문자 :to_char(대상표현)
--파일 형식 : 년,월,일 
--    년 : yyyy, yy, rr, rrrr
--    월 : mm, month(한글에선x, 영문으로할때) 
--    요일 : day, dy
--    시 : hh, hh24, 분 : mi
--    초 : ss
select to_char(sysdate, 'yyyy-mm-dd- dy hh24:mi:ss') dateT
from dual;

--# 실습 
--## 최근 입사한 사원순으로 정렬
--* 04 ~ 05년까지 입사한 사원들의 사번, 성명, 입사날짜, 입사일의 요일을 조회하여 최근에 입사한 사원순으로 정렬.
select  employee_id, last_name, first_name as s        
from dual;