�������׽�Ʈ�� ���� ���̺�: dummy table - dual;

1. �����Լ�
1) �ݿø��Լ�:  round(�����ڵ�����, ǥ���� �ڸ���)
ǥ���� �ڸ��� �������� ����
ǥ���� �ڸ��� ���� ����: default 0 - ������ ǥ��
�Ҽ� ��°�ڸ����� ǥ��
round(1234.56789, 2) -> 1234.57
select round(1234.56789, 2) r1, 
       round(1234.56789, 0) r2 /* 1235 */,
       round(56789.32154, -2) r3 /* 56800 */, 
       round(1234.56789) r4 /* 1235 */
from dual;

2) �����Լ�: trunc(�����ڵ�����, ǥ���� �ڸ���) - ������ ����
   �ι�° �Ķ������ ǥ���� �ڸ��� ���� ����: default 0 - ����ǥ��
select trunc(1234.56789, 2)  t1 /* 1234.56 */,
       trunc(1234.56789, 0) t2 /* 1234 */,
       trunc(56789.32154, -2) t3 /* 56700 */,
       trunc(1234.56789) t4 /* 1234 */
from dual;

3) �ø��� �����Լ�: �ø��� ������ ��ȯ�ϴ� �Լ� : ceil(�����ڵ�����) - ������ �ø��� ����
0 ~ 1 ���̿��� ������ ���� �Ǽ�
0.9999999999999999999999 -> 1
0.000000000000000000000000000000001 -> 1

4) ������ �����Լ�: ������ ������ ��ȯ�ϴ� �Լ�: floor(�����ڵ�����) - ������ ������ ����
0 ~ 1 ���̿��� ������ ���� �Ǽ�
0.9999999999999999999999 -> 0
0.000000000000000000000000000000001 -> 0

select ceil(12.0000000001) c1, floor(12.99999999999999999) f1
from dual;

���� �����͸� ǥ���� �� �ִ� �Լ�: round, trunc, ceil, floor
�Ҽ��� �����͸� ǥ���� �� �ִ� �Լ�: round, trunc
���� �����͸� ǥ���� �� �ִ� �Լ�: ceil, floor, round/trunc(�ι�° �Ķ���Ͱ� 0)

5) �������� ��ȯ�ϴ� �Լ�: mod(�����ڵ�����, �������ڵ�����)
17 / 4 : 17 = 4 * 4 + 1
17 / -4 : 17 = -4 * -4 + 1
-17 / 4 : -17 = 4 * -4 - 1
17 / 0 : 17 = 0 * 754446878 + 17
select mod(17, 4) m1,  mod(17, -4) m2, mod(-17,4) m3, mod(17, 0) m4
from dual;

�ǽ�
�츮ȸ�� ����� �� �μ��ڵ尡 100, 110 �� �μ��� ���� �������
���, ����, �޿�, 15%�λ�� �޿� ��ȸ - �λ�� �޿��� ������ ǥ��
select employee_id, last_name||' '||first_name name, salary,
       --round( salary * 1.15 ) increased
       --ceil( salary * 1.15 ) increased
       --trunc( salary * 1.15 ) increased
       floor( salary * 1.15 ) increased
from employees
where department_id in (100, 110) ; --�μ��ڵ尡 100, 110 �� �μ��� ����

2. �����Լ�
1) ��/�ҹ���ȭ�Լ�: upper/lower(����ڵ�����)

����/��¥ ������ ǥ��: ''
���� King �� ������� ���, ��, �� ��ȸ
select employee_id, last_name, first_name, 
       upper(last_name) upper_name, lower(first_name) lower_name
from employees
where upper(last_name) = 'KING';
--Where lower(last_Name) = 'king';

���� ��ҹ��� �����ϰ� z �� �ִ� ������� ���, ��, �� ��ȸ
select employee_id, last_name, first_name
from employees
where upper(last_name) like '%Z%';
--where lower(last_name) like '%z%';
--where last_name like '%z%' or last_name like '%Z%' ; --���� ��ҹ��� �����ϰ� z �� �ִ�

2) �ܾ� ������ ù���ڴ� �빮��, �������� �ҹ���ȭ �ϴ� �Լ�: initcap(���ǥ��)   
select initcap('wE aRE sTDUYing oRAClE') title
/* We Are Studying Oracle */
from dual;

3) ���ڵ�����ǥ���� Ư�� ���ڸ� ä���� ��ȯ�ϴ� �Լ� 
- lpad/rpad(���ǥ��, ��ȯũ��,��������)
  ����° �Ķ������ �������� ���� ���� : default ���鹮��
select lpad('abc', 7,'?') p1 /* ????abc */,
       rpad('abc', 5, '#') p2 /* abc## */,
       '['||lpad('abc', 5) p3 /* __abc */,
       rpad('abc', 5)||']' p4 /* abc__ */
from dual;

4) ���ڵ�����ǥ���� Ư�����ڸ� �����ϰ� ��ȯ�ϴ� �Լ�
   : ������ ���ڴ� �� ���� ���� ����
: trim( leading/trailing/both ���Ź��� from �����ǥ��)
  ������ ��ġ - ����:leading, ������:trailing, ����:both
  ������ ��ġ ���� ���� - default both
  ���Ź��� ���� ���� - default ���鹮��
select  trim( leading 'a' from 'abcdcba') t1 /* bcdcba */,
        trim( trailing 'a' from 'abcdcbaaaaa') t2 /* abcdcb */,
        trim( both 'a' from 'abcdcbaaaaa') t3 /* bcdcb */,
        trim( 'a' from 'abcdcbaaaaa') t4 /* bcdcb */,
        '['||'  abcdcba '||']' t5, 
        '['||trim('  abcdcba ')||']' t6 /* abcdcba */
from dual;

5) ���ڵ�����ǥ���� Ư�����ڸ� �����ϰ� ��ȯ�ϴ� �Լ�
   : ������ ���ڸ� ���� �� ���� ����
   ltrim/rtrim(�����ǥ��, �����ҹ����� ����)
   �� ��° �Ķ���� ���� ���� - default ���鹮��
select ltrim( 'abcdcba' , 'a' ) t1 /* bcdcba */,
       ltrim( 'abcdcba' , 'ba' ) t2 /* cdcba */,
       rtrim( 'abcdcba' , 'acb') t3 /* abcd */,
       rtrim( '   abcdcba   ') t4 /* abcdcba */
from dual;
   
6) ���ڿ����� ���ڿ��� �Ϻθ� ��ȯ�ϴ� �Լ�
: substr(�����ǥ��, ������ġ, ��ȯ����)
  ����° �Ķ���� ��ȯ���� ���� ���� - ���ڿ��� ������ ��ȯ
  �ι�° �Ķ���� ������ġ ���� ���� ���� - �����ʿ��� ����
select substr('You are not alone', 5, 3) s1 /* are */,
       substr('You are not alone', 5) s2 /* are not alone */,
       substr('You are not alone', -5, 3) s3 /* alo */,
       substr('You are not alone', -5) s4 /* alone */
from dual;

7) ���ڿ����� Ư�����ڿ��� ��ġ�� ������ġ�� ��ȯ�ϴ� �Լ�
: instr(�����ǥ��, ã�¹��ڿ�, ã�������ġ, ���°)
  �׹�° �Ķ���� ���� ���� - default 1
  ����° �Ķ���� ���� ���� ���� - �����ʿ������� ���ʹ�������
select instr('Every sha-la-la-la-la', 'la', 1, 2) s1 /* 14 */,
       instr('Every sha-la-la-la-la', 'la', 12, 2) s2 /* 17 */,
       instr('Every sha-la-la-la-la', 'la', 12, 4) s3 /* 0 */,
       instr('Every sha-la-la-la-la', 'la', 12) s4 /* 14 */,
       instr('Every sha-la-la-la-la', 'la', -3, 2) s5 /* 14 */,
       instr('Every sha-la-la-la-la', 'la', -10) s6 /* 11 */
from dual;

email                    id          ����������
hong@naver.com           hong        naver.com
jeon2019@hanuledu.co.kr  jeon2019    hanuledu.co.kr   
sim77@daum.net           sim77       daum.net

������ �̸��Ͽ��� �̸��Ͼ��̵� ��ȸ
select 'hong@naver.com' email,   ? email_id
from dual;

























   
   
   
   
   



























































