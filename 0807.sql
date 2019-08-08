select  
LAST_DAY(add_months(sysdate, -6)) as before_mon,
LAST_DAY(add_months(sysdate, 6)) as after_mon
from dual

select '1234' as str1,
        1234 as num1
from dual;