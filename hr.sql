--select employee_id, last_name || ''||first_name name, salary,
--    --round(salary * 1.15) increased
--    floor(salary*1.15) increased
--from employees
--WHERE department_id in (100, 110);

--2. ���� �Լ� 
--1)
--�� king

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

--6)���ڿ����� ���ڿ��� �Ϻθ� ��ȯ�ϴ� �Լ�
--select substr('You are not alone', 5,3) s1,
--    substr('You are not alone', 5) s2,
--    substr('You are not alone', -5, 3) s3,
--    substr('You are not alone', -5) s4
--from dual;    
--
----7) ���ڿ����� Ư�����ڿ��� ��ġ�� ������ġ�� ��ȯ�ϴ� �Լ�
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
        
100, 110�� �μ��� ���� ����� ���, ��, �޿�, 13% �λ�� �޿� ��ȸ
select employee_id, last_name, salary*1.13 increased_sal
from employees
where department_id in(100, 110)

* �����Լ�
���ĺ����ڿ� ���� ��/�ҹ���ȭ �Լ� : upper/lower(�����ǥ��)

select  'Our Subjects ar Java, View, Oracle' title,
        upper('Our Subjects ar Java, View, Oracle') as upper_title,
        lower('Our Subjects ar Java, View, Oracle') as lower_title
from dual;

�� - king
select  employee_id, last_name, first_name,
        upper(last_name) upper_name, lower(first_name) lower_name
from employees
where uppper(last_name) = 'KING';

select ltrim('���ڿ����� Ư�����ڸ� ���� ����','�ڹ�') t1,
        rtrim('���ڿ����� Ư�����ڸ� ���� ����','�ڹ�') t2,
        ltrim(ltrim('���ڿ����� Ư�����ڸ� ���� ����','�ڹ�'),'�ڹ�') t3 
from dual;

select  substr('���ڿ����� ���ڿ��� �Ϻθ� ��ȯ�ϴ� �Լ�', 12,2)as s1,
        substr('���ڿ����� ���ڿ��� �Ϻθ� ��ȯ�ϴ� �Լ�', 12) as s2,
        substr('���ڿ����� ���ڿ��� �Ϻθ� ��ȯ�ϴ� �Լ�', -12, 2) as s3
from dual;

str Ư�����ڿ� ������ġ ��ȯ
instr(���, ã�¹���, ������ġ, ���°��ġ����)
���° ������ ���ڸ� ã���� �������� - default
select  instr('���ڿ����� Ư�����ڰ� ��ġ�� ������ġ�� ��ȯ�ϴ� �����Լ�','����',5,2) as s1,
        instr('���ڿ����� Ư�����ڰ� ��ġ�� ������ġ�� ��ȯ�ϴ� �����Լ�','����',5) as s2,
        instr('���ڿ����� Ư�����ڰ� ��ġ�� ������ġ�� ��ȯ�ϴ� �����Լ�','����') as s3,
        instr('���ڿ����� Ư�����ڰ� ��ġ�� ������ġ�� ��ȯ�ϴ� �����Լ�','����',-5) as s4

from dual;

email                                   id              @��ġ       ����������
hong@naver.com                          hong            5           naver.com
jeon2019@hanuledu.co.kr                 jeon2019        9           hanuledu.ci.kr

select  'jeon2019@hanuledu.co.kr'    email,
        substr('jeon2019@hanul.co.kr',1,
            instr('sim77@daum.net','@')-1)  email_id,
        substr('sim77@daum.net', instr('sim77@daum.net','@')+1)    servicer
from dual;


�μ��ڵ尡 60,80,100�� �μ��� ���, ��, ��ȭ��ȣ ��ȸ
select employee_id, last_name, phone_number
from employees
where department_id in(60,80,100);
                                                                

�μ��ڵ尡 60,80,100�� �μ��� ���, ��, ��ȭ��ȣ,������ȣ, ���ι�ȣ ��ȸ
select employee_id, last_name, phone_number,
substr(phone_number, '.',-1,1) as list
from employees
where department_id in(60,80,100);



--substr(���ڿ�, ������ġ, ��Ÿ�� ����)
--substr('���ڿ����� ���ڿ��� �Ϻθ� ��ȯ�ϴ� �Լ�', 12)
�μ��ڵ尡 60,80,100�� �μ��� ���, ��, ��ȭ��ȣ,������ȣ, ���ι�ȣ ��ȸ
select  employee_id, last_name,phone_number,
        substr(phone_number,instr(phone_number, '.', -1, 1)+1) as unic_number,
        substr(phone_number, 1,instr(phone_number, '.', 1)-1) as area_number,
        instr(phone_number, '.', 1) as ������ȣ���ũ��
from employees
where department_id in(60,80,100);

---------------------------------------------------
* ���ڿ����� Ư�����ڿ��� ã�� �ٸ����ڿ��� �ٲ� ��ȯ�ϴ� �Լ�
replace() : (���, ã�¹��ڿ�, ��ü�� ���ڿ�)

select  replace('You are alone','You','we') as result1
        replace('You are alone','not') as result2
form dual;