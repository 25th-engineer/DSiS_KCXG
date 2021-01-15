<?php
function unhtml($content)										//定义自定义函数的名称
 {
    $content=htmlspecialchars($content);						//转换文本中的特殊字符
	$content=str_replace("@","",$content);						//替换文本中的换行符
   return trim($content);										//删除文本中首尾的空格
 }																//定义一个用于截取一段字符串的函数msubstr()
 function msubstr($str,$start,$len) { 							//$str指的是字符串，$start指的是字符串的起始位置，$len指的是长度
    $strlen=$start+$len;                                        //用$strlen存储字符串的总长度（从字符串的起始位置到字符串的总长度）
	 $tmpstr="";                                                //声明一个变量，并赋值为空
    for($i=0;$i<$strlen;$i++) { 								//通过for循环语句，循环读取字符串
        if(ord(substr($str,$i,1))>0xa0) { 						//如果字符串首个字节的ASCII序数值大于0xa0，则表示汉字
            $tmpstr.=substr($str,$i,2); 						//每次取出两位字符赋给变量$tmpstr，即等于一个汉字
            $i++; 												//变量自加1
        } else 													//如果不是汉字，则每次取出一位字符赋给变量$tmpstr
            $tmpstr.=substr($str,$i,1); 
    } 
    return $tmpstr; 											//输出字符串
}
?>
