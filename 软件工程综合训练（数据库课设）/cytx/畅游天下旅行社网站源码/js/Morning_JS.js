// JScript File

///分隔
function expand()
{
	if(parent.fset.cols=="*,8,0")
	{
		document.all.expandpic.src="Images/Mid_2.gif";
		parent.fset.cols="*,8,168";
	}
	else
	{
		document.all.expandpic.src="Images/Mid_1.gif";
		parent.fset.cols="*,8,0";
	}
	
}




///显示时间
function getDate()
{
    var d = new Date();
	switch (d.getDay()) {
		case 0:
			strweek="日";
			break;
		case 1:
			strweek="一";
			break;
		case 2:
			strweek="二";
			break;
		case 3:
			strweek="三";
			break;
		case 4:
			strweek="四";
			break;
		case 5:
			strweek="五";
			break;
		case 6:
			strweek="六";
			break;
	}
	document.write((d.getYear())+"年"+(d.getMonth()+1)+"月"+d.getDate()+ "日"+" 星期"+ strweek);
}

function getTime()
{
    var d = new Date();
    sec = d.getSeconds(); 
    hr = d.getHours(); 
    min = d.getMinutes(); 
    if (hr <= 9) hr = "0" + hr; 
    if (min <= 9) min = "0" + min; 
    if (sec <= 9) sec = "0" + sec; 
    var t = " " + hr + ":" + min + ":" + sec; 
    document.getElementById("ShowTime").innerText = t;
}

function showTime()
{
    if (document.all) setInterval("getTime()",1000)
}




