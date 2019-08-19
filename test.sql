select  employee_id,first_name||''|| last_name as name,
        hire_date        
from employees

--일반함수 
--사번, 성, 급여, 커미션율, 총급여 조회
--총급이란 급여+커미션 급여

select  employee_id,first_name||''|| last_name as name,
        hire_date        
from employees

--where  add_months(hire_date, 12)