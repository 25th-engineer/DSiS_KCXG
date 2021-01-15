<%@ Control Language="C#" AutoEventWireup="true" CodeFile="picmove.ascx.cs" Inherits="WebUserControl3" %>
<script language="JavaScript1.1" type="text/javascript">
<!--
var slidespeed=2000
var slideimages=new Array("../upload_files/0005817694.jpg","../upload_files/0005817688.jpg","../upload_files/0872204555142848.jpg","../upload_files/12910139.jpg","../upload_files/12910141.jpg")
var slidelinks=new Array("")

var imageholder=new Array()
var ie55=window.createPopup
for (i=0;i<slideimages.length;i++){
imageholder[i]=new Image()
imageholder[i].src=slideimages[i]
}

function gotoshow(){
window.location=slidelinks[whichlink]
}
//-->
          </script>
                  <a href="../news/index.aspx" onclick="return Listen(this.href);"> <img src="../upload_files/0872204555340368.jpg" name="slide" border="0" id="slide"  onmouseover="clearTimeout(myTimeout)" onmouseout="slideit()" style="StyleSheet:progid:DXImageTransform.Microsoft.Pixelate(MaxSquare=15,Duration=1)" width="300px" height="300px" /></a>
                  <script language="JavaScript1.1" type="text/javascript">
<!--
var whichlink=0
var whichimage=0
var pixeldelay=(ie55)? document.images.slide.filters[0].duration*1000 : 0
var myTimeout;
function slideit(){
if (!document.images) return
if (ie55) document.images.slide.filters[0].apply()
document.images.slide.src=imageholder[whichimage].src
if (ie55) document.images.slide.filters[0].play()
whichlink=whichimage
whichimage=(whichimage<slideimages.length-1)? whichimage+1 : 0
myTimeout=setTimeout("slideit()",slidespeed+pixeldelay)
}
slideit()
//-->
            </script>
             <%--<table style="width:95" border="0" cellpadding="0" cellspacing="0">
              <tr valign="top">
                <td style="width:19;height:19"><a style="cursor:hand" onmouseover="ove(0)" onmouseout="ou()">
                    <img src="../pic/1.gif" style="width:19;height:19" border="0" alt="" /></a></td>
                <td style="width:19;height:19"><a style="cursor:hand" onmouseover="ove(1)"onmouseout="ou()">
                    <img src="../pic/2.gif" style="width:19;height:19" border="0" alt="" /></a></td>
                <td style="width:19;height:19"><a style="cursor:hand" onmouseover="ove(2)" onmouseout="ou()">
                    <img src="../pic/3.gif" style="width:19;height:19" border="0" alt="" /></a></td>
                <td style="width:19;height:19"><a style="cursor:hand" onmouseover="ove(3)" onmouseout="ou()">
                    <img src="../pic/4.gif" style="width:19;height:19" border="0" alt="" /></a></td>
                <td style="width:19;height:19"><a style="cursor:hand" onmouseover="ove(4)" onmouseout="ou()">
                    <img src="../pic/5.gif" style="width:19;height:19" border="0" alt="" /></a></td>
              </tr>
            </table>--%>

