����
�����Լ�: �Ҽ���������ǥ�� ���� 
�ݿø�/���� - round/trunc(���ǥ��, �ڸ���)
�ڸ��� ���� - default 0 - ����ǥ��
select round(1234.5678, 2) r1 /* 1234.57 */,
       trunc(1234.5678, 1) r2 /* 1234.5 */,
       round(1234.5678) r3 /* 1235 */,
       trunc(1234.5678) r4 /* 1234 */       
from dual;

����ǥ�� ������ �ø�/���� : ceil/floor(���ǥ��)
select ceil(1234.0000000001) n1 /* 1235 */,
       floor(1234.9999999999) n2 /* 1234 */
from dual;

100, 100�� �μ��� ���� ����� ���, ��, �޿�, 13% �λ�� �޿� ��ȸ
�λ�� �޿��� ������ ǥ��
select employee_id, last_name, salary, ceil(salary*1.13) increased_sal
from employees
where department_id in (100,110);

* �����Լ�
���ĺ����ڿ� ���� ��/�ҹ���ȭ �Լ�: upper/lower(�����ǥ��)
select 'Our Subjects ar Java, View, Oracle' title,
      upper('Our Subjects ar Java, View, Oracle') upper_title,
      lower('Our Subjects ar Java, View, Oracle') lower_title
from dual;

���� king �� ������� ���, ��, �� ��ȸ
select employee_id, last_name, first_name, 
      upper(last_name) upper_name, lower(first_name) lower_name
from employees
where upper(last_name) = 'KING';
--where lower(last_name) = 'king';

Ư�����ڸ� ä���� ��ȯ�ϴ� �Լ� : lpad/rpad(���ǥ��, ��ȯ�����ͱ���, ä�﹮��)
select lpad('abc', 10, '@') p1
from dual;

select employee_id, lpad(last_name , 20, ' ') last_name
from employees;

���ڿ����� Ư�����ڸ� �����Ͽ� ��ȯ�ϴ� �Լ�: 
trim( ������ ��ġ ���Ź��� �� �� from ���ǥ��)
������ ��ġ: ����-leading, ������-trailing, ����- both(default)
select trim( leading '��' from '���ڿ����� Ư�����ڸ� ����') t1 
    /* �ڿ����� Ư�����ڸ� ���� */,
        trim( trailing '��' from '���ڿ����� Ư�����ڸ� ������ ����') t2
        /* ���ڿ����� Ư�����ڸ� ������ �� */,
        trim(  '��' from '���ڿ����� Ư�����ڸ� ������ ���ڹ�') t3
        /* �ڿ����� Ư�����ڸ� ������ ���� */
from dual;

���ڿ����� Ư�����ڸ� �����Ͽ� ��ȯ�ϴ� �Լ� - ���Ź��ڸ� ���� �� ���� ����
: ltrim/rtrim(���ǥ��, �����ҹ����� ����)
select ltrim('���ڿ����� Ư�����ڸ� ������ ����', '�ڹ�') t1
        /* ������ Ư�����ڸ� ������ ���� */,
       rtrim('���ڿ����� Ư�����ڸ� ������ ����', '�ڹ�') t2 
       /* ���ڿ����� Ư�����ڸ� ������  */,
       rtrim( ltrim('���ڿ����� Ư�����ڸ� ������ ����', '�ڹ�'), '�ڹ�' ) t3
from dual;


���ڿ����� ���ڿ��� �Ϻθ� ��ȯ�ϴ� �Լ� 
: substr(���ǥ��, ������ġ, ��ȯ���ڱ���)
  ��ȯ���ڱ��� ���� ���� - ���ǥ�����ڿ��� ������ ��ȯ
  ������ġ -�� �����ϸ� �����ʿ������� ���� ������ġ�� ��´�.
select substr('���ڿ����� ���ڿ��� �Ϻθ� ��ȯ�ϴ� �Լ�', 12, 2) s1 /* �Ϻ� */,
substr('���ڿ����� ���ڿ��� �Ϻθ� ��ȯ�ϴ� �Լ�', 12) s2 /* �Ϻθ� ��ȯ�ϴ� �Լ� */,
substr('���ڿ����� ���ڿ��� �Ϻθ� ��ȯ�ϴ� �Լ�', -12, 2) s3 
      /* _�� */,
substr('���ڿ����� ���ڿ��� �Ϻθ� ��ȯ�ϴ� �Լ�', -12) s4
      /* _�Ϻθ� ��ȯ�ϴ� �Լ� */            
from dual;

���ڿ����� Ư�����ڰ� ��ġ�� ������ġ�� ��ȯ�ϴ� �Լ� 
: instr(���ǥ��, ã�¹���, ������ġ, ���°������)
  ���°������ ���ڸ� ã���� ���� ���� - default 1
  ������ġ ���� ���� - default 1
  ������ġ ���� ���� ���� - �����ʿ������� ���ʹ������� ã�´�.

select  instr('���ڿ����� Ư�����ڰ� ��ġ�� ������ġ�� ��ȯ�ϴ� �����Լ�', 
                            '����', 5, 2) s1 /* 28 */,
        instr('���ڿ����� Ư�����ڰ� ��ġ�� ������ġ�� ��ȯ�ϴ� �����Լ�',
                            '����', 5) s2 /* 9 */,
        instr('���ڿ����� Ư�����ڰ� ��ġ�� ������ġ�� ��ȯ�ϴ� �����Լ�',
                            '����') s3 /* 1 */,
        instr('���ڿ����� Ư�����ڰ� ��ġ�� ������ġ�� ��ȯ�ϴ� �����Լ�',
                            '����', -5) s4 /* 9 */,
        instr('���ڿ����� Ư�����ڰ� ��ġ�� ������ġ�� ��ȯ�ϴ� �����Լ�',
                            '����', -5, 2) s5 /* 1 */,
        instr('���ڿ����� Ư�����ڰ� ��ġ�� ������ġ�� ��ȯ�ϴ� �����Լ�',
                            '����', -5, 3) s6 /* 0 */                                                        
from dual;

email                    id                @��ġ   ����������
hong@naver.com           hong       1, 4   5       naver.com       6, 9
jeon2019@hanuledu.co.kr  jeon2019   1, 8   9       hanuledu.co.kr  10, 14  
sim77@daum.net           sim77      1, 5   6       daum.net        7, 8

������ �̸��Ͽ��� �̸��Ͼ��̵� ��ȸ
select 'sim77@daum.net' email,   
    substr( 'sim77@daum.net', 1, 
            instr('sim77@daum.net', '@')-1  ) email_id,
    substr( 'sim77@daum.net', instr('sim77@daum.net', '@')+1) servicer
from dual;

�μ��ڵ尡 60,80, 100 �� �μ��� ���� ������� 
���, ��, ��ȭ��ȣ, ������ȣ, ���ι�ȣ ��ȸ
select employee_id, last_name, phone_number ,
      substr(phone_number, 1, instr(phone_number, '.')-1 ) local_number,
      substr(phone_number, instr(phone_number, '.', -1)+1 ) private_number
from employees
where department_id in (60,80,100);
                           ������ȣ        ���ι�ȣ  
�ڹ���  515.124.4567         515           4567
�Ӳ���  011.44.1344.467268   011           467268 
ȫ�浿  02.1234.5678         02            5678
����ġ  062.9874.5422        062           5422
��û    0652.4523.6221       0652          6221
-----------------------------------------------

8) ���ڿ����� Ư�����ڿ��� ã�� �ٸ����ڿ��� �ٲ� ��ȯ�ϴ� �Լ�
: replace(�����ǥ��, ã�¹��ڿ�, ��ü�ɹ��ڿ�)
����° �Ű�����(�Ķ����) ��ü�ɹ��ڿ� ���� ���� : default - null
You -> We
select replace('You are not alone', 'You', 'We') s1 
        /* We are not alone */,
        replace('You are not alone', 'not') s2 
        /* You are  alone */
from dual;

9) ���ڿ����� Ư�����ڸ� ã�Ƽ� �ٸ� ���ڷ� �ٲ� ��ȯ�ϴ� �Լ�
: ã�¹���, ��ü�ɹ���- ������ ����
translate(�����ǥ��, ã�¹����ǳ���, ��ü�ɹ����ǳ���)
Y -> W, o -> e, u -> null
select translate('You are not alone', 'You', 'We') s1
                /*We are net alene */
from dual;


                  �ʴ� ���� �𸣴µ� ���� �ʸ� �˰ڴ���
replace �����     ���� ���� �𸣴µ� ���� ���� �˰ڴ��� 
select replace(replace('�ʴ� ���� �𸣴µ� ���� �ʸ� �˰ڴ���', '�ʴ�', '����' ), '�ʸ�','����') s1,
       replace('�ʴ� ���� �𸣴µ� ���� �ʸ� �˰ڴ���', '��', '��' ) s2
             /* ���� ���� �𸣴µ� ���� ���� �˰ڴ��� */
from dual;

translate �����   ���� �ʸ� �𸣴µ� �ʴ� ���� �˰ڴ��� 
select translate('�ʴ� ���� �𸣴µ� ���� �ʸ� �˰ڴ���','����', '�ʳ�') s1
               /* ���� �ʸ� �𸣴µ� �ʴ� ���� �˰ڴ���  */
from dual;

* ��¥�Լ�
1) �ý����� ���� ��¥�� ��ȯ�ϴ� �Լ� - sysdate
select sysdate
from dual;

���ó�¥ + 1 -> ���ϳ�¥
���ó�¥ - 1 -> ������¥
select sysdate + 1 tomorrow, sysdate-1 yesterday
from dual;

���ó�¥ - ������¥ -> �ϼ�����
���ó�¥�� ���� �� ����: 
select sysdate + 30 after1M
from dual;

2) Ư����¥�κ��� �� ���� ��/�� �� ��¥ ��ȯ�ϴ� �Լ�
: add_months(���¥ǥ��, ������)
���÷κ��� 6���� ���� ��¥ ��ȸ, ���÷κ��� 3���� ���� ��¥ ��ȸ
select add_months(sysdate,6) after6M, add_months(sysdate, -3) before3M
from dual;

���ó�¥ - 2019/03/15 -> �������� ����
3) �� ��¥ ������ �������� ���̸� ��ȯ�ϴ� �Լ�
: months_between(��¥ǥ��1, ��¥ǥ��2) ��¥ǥ��1 > ��¥ǥ��2
�Ҽ� ù°�ڸ����� ǥ��
select trunc(months_between(sysdate, '19/03/15'),1) diff
from dual;












































































