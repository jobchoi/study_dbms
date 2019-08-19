1. 사원의 사번, 성, 업무코드, 입사일자를 조회하시오
select employee_id, last_name, department_id, hire_date
from employees;

2. 급여가 12000 이상인 사원의 
사번, 성명, 급여를 조회하시오
성명은 성과 명 사이에 공백 문자를 두어 연결한다.
select employee_id, last_name||' '||first_name as name, salary
from employees
where salary >= 12000;

3. 사번이 176인 사원의 성명, 부서번호를 조회하시오.
select employee_id, last_name||' '||first_name as name
from employees
where employee_id = 176;

4. 급여가 8000 이상 12000 이하에 해당하지 않는 사원의 사번, 성명, 급여를 조회하시오.
select employee_id, last_name || ' ' || first_name as name, salary
from employees
where salary > 8000 and salary < 12000;

5. 2005년1월1일부터 2005년 6월 30일 까지 
입사한 사원의 사번, 성명, 업무코드, 입사일자를 조회하되 
입사일자를 기준으로 오름차순 정렬하시오.
select employee_id, last_name || ' ' || first_name as name, department_id, hire_date
from employees
--where field between to_date('20031120', 'YYYYMMDD') and to_date('20031201', 'YYYYMMDD')
where hire_date between to_date('20050101','yyyymmdd') and to_date('20050630','yyyymmdd'); 

6. 부서코드가 20 및 50에 속하는 사원들의 사번, 성명, 부서코드를 조회하되
성명을 기준으로 오름차순 정렬하시오.
select employee_id, last_name||' '||first_name, department_id
from employees
where department_id = 20 or department_id = 50;

7. 급여가 8000 이상 12000이하이고, 부서코드가 20,50에 해당하는 사원의 성명, 부서코드, 급여를 조회하되,
부서코드를 기준으로 오르마순, 급여를 기준으로 내림차순 정력하시오.
--만약 정렬할 필드가 두 개이상인 경우? 이 경우에는 어떻게할까요? 아래는 site, name 두개의 필드로 정렬하도록합니다.
--SELECT * FROM tableName WHERE site="webisfree.com" ORDER BY site ASC, name ASC
--// 다수의 필드명 site와 name으로 정렬함
select employee_id, last_name||' '||first_name as name,
department_id, salary
from employees
where salary >= 8000 and salary <= 12000 and department_id = 50
order by salary asc, department_id desc;

8. 매니저가 없는 사원의 성명, 업무코드를 조회 하시오.
select  last_name||' '||first_name, department_id, manager_id
from employees
where manager_id is null;

9. 커미션을 받는 사원의 성명, 급여, 커미션율을 조회하되,
급여를 기준으로 내림차수느 커미션율을 기준으로 내림차순 정렬하시오.



-- ================복습 ================
select employee_id, nvl(manager_id, 0)manager_id,
        nvl2(manager_id, '0', 'x') exist
from employees;

-- 조건문
* 부서별로 보너스를 지급, 부서코드가 10이면 -> 급여의 10%
                                 20이면 -> 급여의 20%
                                 30이면 -> 급여의 30%
if(부서코드 == 10){
    보너스 = 급여 * 0.1;
}if(부서코드 == 20){
    보너스 = 급여 * 0.2;
}if(부서코드 == 30){
    보너스 = 급여 * 0.3;
}
: decode(대상표현,  비교데이터표현1, 반환데이터1,
                   비교데이터표현2, 반환데이터2, 
                   비교데이터표현3, 반환데이터3,
                   나머지 부서원들은 급여의 5%)
사번, 성, 부서코드 , 급여, 보너스 조회
select  employee_id, last_name, department_id, salary,
        decode(department_id,   10, salary*0.1,
                                20, salary*0.2,
                                30, salary*0.3, 
                                salary*0.05) bonus
from employees;

사원들의 사번, 성, 업무코드, 업무등급 조회
업무등급은 업무코드에 따라 분류한다. 
업무코드     업무등급
AD_PRES     A
ST_MAN      B
IT_PROG     C
그외          X
select  employee_id, last_name, department_id,job_id,
        decode(job_id, 'AD_PRES', 'A',
                        'ST_MAN', 'B',
                        'IT_PROG', 'C',
                        'x') as job_code
        case job_id when 'AD_PRES' then 'A'
                    when 'ST_MAN' then 'B'
                    when 'IT_PROG' then 'C' else 'x ' end k
from employees;

조건문에 해당하는 구문 : case ~ end | 함수가 아니므로 ,로 구분을 하지 않음
case 대상표현   when 비교데이터1 then  반환데이터1
               when 비교데이터2 then  반환데이터2
               when 비교데이터3 then  반환데이터3
               ...
end

사번, 성, 부서코드, 급여, 보너스
select employee_id, last_name, department_id, salary,
        case department_id when 10 then salary*0.1 
        when 20 then salary*0.2 
        when 30 then salary*0.3 
        else salary*0.05 end bonus
from employees;              



select employee_id, last_name, department_id, salary,
       case department_id when 10 then salary*0.1 
                          when 20 then salary*0.2
                          when 30 then salary*0.3 
                          else salary*0.05 end bonus
from employees;



select  employee_id, last_name, department_id, job_id,
        case job_id when 'AD_PRES' then 'A'
        else 'x' end grade
from employees;

범위 조건에 따라 데이터를 반환하는 경우의 case 
case    when 조건식1 then 반환데이터1
        when 조건식2 then 반환데이터2
        when 조건식3 then 반환데이터3
        else default 반환데이터
end

부서코드가   10~30 -> 급여의 10%
            40~60 -> 급여의 20%
            70~100 -> 급여의 30%
그외 부서원은 급여의 5%
사번, 성, 부서코드, 급여, 보너스 조회
select employee_id, last_name, department_id, salary,
case when department_id between 10 and 30 then salary*0.1
    when department_id between 40 and 60 then salary*0.2
    when department_id between 70 and 100 then salary*0.3
    else salary*0.05 end bonus
from employees;


부서코드가 30이하이면 급여의 10%
급여가 1000이상이면 급여의 5%
업무코드가 clerk종류의 업무이냐
select employee_id, last_name, department_id,salary,job_id,
--case when department_id <= 30 then 0.0
where department_id<=30
from employees;


모습 사원의 각 사원들의 근무년수, 근속상태를 파악하고자 한다.
사원들의 사번, 성, 입사일자, 근무년수 상태조회
근무년수는 오늘을 기준으로 근무한 년수를 정수로표현한다.
근무 상태는 근무년수 따라 표현
select employee_id, last_name, hire_date,
    trunc(months_between(sysdate,hire_date)/12) work_years,
    case when months_between(sysdate,hire_date)/12 < 12 then '12년 미만 근속'
    end work_status;
from employees;
-- holding


사원들의 사번, 성, 부서코드 조회
select employee_id, last_name, department_id
from employees;

기본적으로 데이터는 중복된 데이터행이 조회된다.
중복제거 : distinct -> null도 표현이 된다.
데이터행에 대해 distinct함.

null : 내림차순의 우선순위를 갖는다.
내림차순일 때 null을 마지막 데이터행으로 조회하려면 nulls last

사원들이 소속된 부서를 파악
사원들이 소속된 부서코드를 조회
select distinct department_id
from employees
order by 1 nulls first;

-- employee_id가 중복되는 것이 없어 distinct를 쓰는 의미가 없음.
select distinct department_id, employee_id
from employees;

실습 :
매니저로 있는 사원들이 누구인지파악하고자 한다.
select  employee_id,department_id
from employees
case when department_id=null;

select distinct manager_id
from employees
where manager_id is not null;


여러행으로 부터 하나의 결과를 반환하는 형태의 함수 : 그룹함수
- null을 제외함
1. 데이터행의 갯수를 세어 반환하는 함수 : count(대상표현)
select count (*) cnt1, count(employee_id) cnt2, 
        count(department_id) cnt3
from employees;

부서배치를 받은 사원의 수를 조회
select count(department_id) cnt
from employees;

매니저인 사원
select distinct manager_id
from employees
where manager_id is not null;

select count(distinct manager_id) cnt
from employees;

사원들중 커미션을 받는 사원들이 모두 몇명인가?
select count(*) cnt
from employees
where COMMISSION_PCT is not null;

select count(distinct COMMISSION_PCT) cnt
from employees;

1. 데이터값을 합하여 반환하는 함수 : sum(대상표현)
사원들의 급여 합계 조회
select sum(salary) sum_sal
from employees;

3. 데이터 값 중 가장 큰/작은 값을 반환하는 함수 : max(대상표현)/min(대상표현)
가장 높은 연봉
select max(salary) max_sal
from employees;

select min(salary) min_sal
from employees;




매니저에 있는 사원들을 파악하고자 한다.
매니저인 사원들의 사번조회
select distinct manager_id
from employees
where manager_id is not null;

그룹함수 - 여러개의 데이터 행으로부터 하난의 결과를 반환하는 함수
1. count(컬럼표현) : 데이터행의 갯수를 반환
우리회사 사원수, 부서배치 받은 사원수 조회

select  count(*) cnt, count(department_id) dept_cnt,
        count(commission_pct) comm_cnt
from employees;

사원들중 부서코드 60번 부서에 속한 사원들의 수를 파악하고자 한다.
부서코드 60번 부서에 속한 사원ㄷ수 조회
select count(*) cnt
from employees
where department_id=60;

사원들중 clerk종류의 업무를 하는 사원들의 수를 파악하고자 한다.
clerk종류의 업무를 하는 사원수 조회
select count(*) cnt
from employees
where lower(job_id) like '%clerk%';

sum(대상표현) : 데이터값을 모두 합한 결과를 반환 - 대상표현은 숫자만 가능.
회사 모든 사원들의 급여를 합한 결과를 조회
select sum(salary) sum_salary
from employees;

회사 부서코드 60번 부서에 속한 사원들의 급여를 합한 결과를 조회
select sum(salary) sum_sal
from employees
where department_id=60;


account 업무를 하는 사원들의 급여를 합한 결과 조회
select sum(salary) sum_acc
from employees
where lower(job_id) like '%account%';

max/min : 데이터값들 중 가장 큰/작은 값을 반환. - 숫자적용가능. 
- 숫자, 문자, 날짜 적용가능.

회사 사원들 급여중 가장 많은 급여를 조회
select max(salary) max_sal, min(salary) min_sal
from employees;

사원들중 가장 먼저 오는 성을 조회
select min(last_name) min_name, max(last_name) max_name
from employees;

사원들중 가장 먼저 입사한 사원의 입사일자 조회
select min(hire_date) min_hire_date, max(hire_date) max_hire_date
from employees;


부서코드 60번인 부서에 속한 사원들 중 가장 많은 급여, 적은 급여 조회
select max(salary)max_sal, min(salary)min_sal
from emplyees
where department_id=60;

clerk 종류의 업무를 하는 사원들의 입사 정보를 파악하고자 한다.
clerk종류의 업무를 하느 사원들중 
가장 먼저 입사한 입사일자, 가장 최근 입사한 입사일자 조회
select min(hire_date) first_date, max(hire_date) last_date
from employees
where lower(job_id) like '%clerk%'

급여 평균
avg(표현식)데이터 값의 평균을 구하는 법 - 숫자만 가능.
select  sum(salary)/count(*) avg_sal,
        round(avg((salary),2) avg_sal2)
from employees;

부서코드 60인 부서에 속한 사원들의 급여평균 조회
급여평균은 소수 둘때자리까지 반올림해서 표현
select round(avg(salary),2) avg_sal
from employees
where department_id =60;

사원들중 clerk종류의 업무를 하는 사원들의 급여평균,
급여 평균은 소수 둘째짜리까지 반올림해서 표현
select round(avg(salary),2) avg_sal
from employees
where lower(job_id) like '%clerk%';

성에 대소문자 무관하게z 가 포함된 성을 가진 사원들이 모두 몇명인지 파악하고자 한다.
성에 대소문자 무관하게 z가 포함된 성을 가진 사원들의 수를 조회하시오
select count(*) cnt
from employees
where lower(last_name) like '%z%';

사원들 최고급여와 최고급여와 최저급여 간 급여차를 파악하고자 한다
회사 최고급여와 최저급여의 급여차를 조회.
select  max(salary) - min(salary) diff
from employees;


회사에 매니저로 있는 사원들의 수를 파악하고자 한다
매니저인 사원들의 수를 조회하시오
select distinct manager_id
from employees;



account업무를 하는 사원들의 평균 급여를 조회
select found(avg(salary),2) avg_sal;
from employees;
where lower(job_id) like '%account%';


사원들의 사번, 성, 부서코드, 급여 조회
select count(*) cnt
from empoyees;


전체 데이터행을 하난의 그룹으로 보고 그룹함수로 데이터를 조회
--select - 조회하고자 하는 컬럼 목록
--from - select절의 컬럼이 있는 에이블
--where - 조검만 맞는 데이터행을 조회하고자 할때
--group by - 특정기준으로 그룹을 지을때
--order by - 데이터행의 정렬


부서별 급여합계를 파악하고자 한한다.
각 부서별 부서코드, 급여합계, 평균합계, 부서원수를 조회하시오
select  department_id, sum(salary) sum_sal,
        round(avg(salary)) avg_sal, count(*) cnt
from employees
group by department_id
order by 1;


select 목록에 그룹함수를 사용한 표현과 
             그룹함수를 사용하지 않은 표현이 함께 있다면
             반.드.시 그룹함수를 사용하지 않은 표현에 대해서는
             group by의 기준으로 명시해야만 한다.
             그룹함수를 사용하지 않은경우 + 그룹함수 사용한것이 섞여 있을때 group by로 명시해주어야 함;

사번, 성, 부서코드, 업무코드, 급여조회

select employee_id, last_name, department_id, job_id, salary
from employees;

각 부서벼르 업무별, 사원의 정보를 파악하고자 한다.
각 부서별, 업무별로 급여합계, 급여평균, 사원수를 조회
select department_id, job_id, sum(salary) sum_sal, round(avg(salary)) avg_sal, count(*) cnt
from employees
group by department_id, job_id
order by 1;

부서코드 10,20,30,40,60 번 부서에 속한 사원들의 정보를 파악하고자 한다.
해당부서별로 부서코드, 부서원수, 부서평균급여 조회

--ERROR 
select department_id, count(*) cnt, round(avg(salary)) avg_sal
from employees
where department_id(10,20,30,40,60)
group by department_id;

clerk종류의 업무를 하는 사원들의 정보를 파악, 
clerk종류의 업무별로 업무코드, 업무하는 사원수, 
업무하는 사우너들의 평균급여 조회
select job_id, count(*) cnt, round(avg(salary),2) avg_sal
from employees
where lower(job_id) like '%clerk%'
group by job_id
order by 1;


회사 부서코드 10,20,30,40,60번 부서에 속한 사원들은 어떤 업무를 하는 파악하고자 한다.
해당부서에 속한 사원들이 하는 업무코드를 조회
select distinct(job_id)
from employees
where department_id in (10,20,30,40,60);

select distinct(job_id)
from employees
where department_id in (10,20,30,40,60)
group by job_id;

회사 사원들에 대해 각 년도별 입사한 사원수를 파악하고자 한다.
년도, 사원수 조회
select to_char(hire_date, 'yyyy') ,count (*) E_cnt
from employees
group by hire_date;


