select to_number('1234') s1
from dual;

-- ����ǥ��
--õ���� ���н� �����
--9 : ���� �κ��� �������� ó��
--0 : 
select  1234 n, to_char(123456) s,
        1500000 n2, 
        (to_char(1500000,'L9,999,999,999')) s23,
        ltrim(to_char(1500000,'L9,999,999,999')) empty_space
from dual;


--��¥ -> ���� :to_char(���ǥ��)
--���� ���� : ��,��,�� 
--    �� : yyyy, yy, rr, rrrr
--    �� : mm, month(�ѱۿ���x, ���������Ҷ�) 
--    ���� : day, dy
--    �� : hh, hh24, �� : mi
--    �� : ss
select to_char(sysdate, 'yyyy-mm-dd- dy hh24:mi:ss') dateT
from dual;

--# �ǽ� 
--## �ֱ� �Ի��� ��������� ����
--* 04 ~ 05����� �Ի��� ������� ���, ����, �Ի糯¥, �Ի����� ������ ��ȸ�Ͽ� �ֱٿ� �Ի��� ��������� ����.
select  employee_id, last_name, first_name as s        
from dual;