<?php
function unhtml($content)										//�����Զ��庯��������
 {
    $content=htmlspecialchars($content);						//ת���ı��е������ַ�
	$content=str_replace("@","",$content);						//�滻�ı��еĻ��з�
   return trim($content);										//ɾ���ı�����β�Ŀո�
 }																//����һ�����ڽ�ȡһ���ַ����ĺ���msubstr()
 function msubstr($str,$start,$len) { 							//$strָ�����ַ�����$startָ�����ַ�������ʼλ�ã�$lenָ���ǳ���
    $strlen=$start+$len;                                        //��$strlen�洢�ַ������ܳ��ȣ����ַ�������ʼλ�õ��ַ������ܳ��ȣ�
	 $tmpstr="";                                                //����һ������������ֵΪ��
    for($i=0;$i<$strlen;$i++) { 								//ͨ��forѭ����䣬ѭ����ȡ�ַ���
        if(ord(substr($str,$i,1))>0xa0) { 						//����ַ����׸��ֽڵ�ASCII����ֵ����0xa0�����ʾ����
            $tmpstr.=substr($str,$i,2); 						//ÿ��ȡ����λ�ַ���������$tmpstr��������һ������
            $i++; 												//�����Լ�1
        } else 													//������Ǻ��֣���ÿ��ȡ��һλ�ַ���������$tmpstr
            $tmpstr.=substr($str,$i,1); 
    } 
    return $tmpstr; 											//����ַ���
}
?>
