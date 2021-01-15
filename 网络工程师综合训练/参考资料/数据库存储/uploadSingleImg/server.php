<?php
	//解码
	$tmp = base64_decode($_POST['imgOne']);

	//写文件
	file_put_contents("D://img.jpg", $tmp);



	echo '{"msg":"上传成功!"}';
?>