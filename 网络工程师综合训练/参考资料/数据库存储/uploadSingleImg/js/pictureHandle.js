$(function(){
    var _upFile=document.getElementById("upFile");

    _upFile.addEventListener("change",function(){
  
    if (_upFile.files.length === 0) {  
        alert("请选择图片");  
        return; }  
    var oFile = _upFile.files[0]; 
    //if (!rFilter.test(oFile.type)) { alert("You must select a valid image file!"); return; }  
  
    /*  if(oFile.size>5*1024*1024){  
     message(myCache.par.lang,{cn:"照片上传：文件不能超过5MB!请使用容量更小的照片。",en:"证书上传：文件不能超过100K!"})  
     
     return;  
     }*/  
    if(!new RegExp("(jpg|jpeg|png)+","gi").test(oFile.type)){  
        alert("照片上传：文件类型必须是JPG、JPEG、PNG");  
        return;  
    }
  
            var reader = new FileReader();  
            reader.onload = function(e) {  
                var base64Img= e.target.result;
                //压缩前预览
                $("#preview").attr("src",base64Img);  
  
                //--执行resize。  
                var _ir=ImageResizer({  
                        resizeMode:"auto"  
                        ,dataSource:base64Img  
                        ,dataSourceType:"base64"  
                        ,maxWidth:1200 //允许的最大宽度  
                        ,maxHeight:600 //允许的最大高度。  
                        ,onTmpImgGenerate:function(img){  
  
                        }  
                        ,success:function(resizeImgBase64,canvas){
                            //压缩后预览
                            $("#nextview").attr("src",resizeImgBase64); 

                            //赋值到隐藏域传给后台
                            $('#imgOne').val(resizeImgBase64.substr(22));

                            $('#upTo').on('click',function(){
                                //alert('传给后台base64文件数据为：'+resizeImgBase64.substr(22));
                                $.ajax({
                                    url:'server.php',
                                    type:'POST',
                                    dataType:'json',
                                    data:{
                                        imgOne:$('#imgOne').val()
                                    },
                                    success:function(data){
                                        alert(data.msg);
                                    }
                                });
                            });
  
                        }  
                        ,debug:true  
                });  
  
            };  
            reader.readAsDataURL(oFile);  
  
    },false);  

});