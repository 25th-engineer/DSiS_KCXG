<?php
$conn=mysql_connect("localhost","root","111");			//�������ݿ������
mysql_select_db("db_guestbook",$conn);					//����ָ�������ݿ�
mysql_query("set names gb2312");						//�����ݿ��б����ʽ����ת������������������������
?>