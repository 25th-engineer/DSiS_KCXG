//��ʾ5��ͼƬ
var nn;
nn=1;
setTimeout('change_img()',3000);//�л�ͼƬ���ٶ�
function change_img()
{
	try
	{
         if(nn>5) nn=1
         setTimeout('setFocus1('+nn+')',3000);
         nn++;
         tt=setTimeout('change_img()',3000);
    }
    catch(e){}
    	
}
function setFocus1(i)
{
	try
	{
        selectLayer1(i);
    }
 catch(e){}
}
function selectLayer1(i)
{
	try
	{	
		
	    for(var j=1; j<6; j++)
	    {
	        if(j==i)
	        {
	           document.getElementById("focusPic"+j).style.display="block";
	           document.getElementById("focusPic"+j+"nav").style.display="block";
	         }
	        else
	        {
	           document.getElementById("focusPic"+j).style.display="none";
	           document.getElementById("focusPic"+j+"nav").style.display="none";
	        }
	    }
	    
	}
    catch(e){}    
	
}