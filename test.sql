select  employee_id,first_name||''|| last_name as name,
        hire_date        
from employees

--�Ϲ��Լ� 
--���, ��, �޿�, Ŀ�̼���, �ѱ޿� ��ȸ
--�ѱ��̶� �޿�+Ŀ�̼� �޿�

select  employee_id,first_name||''|| last_name as name,
        hire_date        
from employees

--where  add_months(hire_date, 12)