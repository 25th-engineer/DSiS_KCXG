
function calendar(objName,name,date,width,height){
	this.objName=objName;
	this.calendarName=name!=null?name.toString():'calendar';
	this.width=width!=null?width:'100%';
	this.height=height!=null?height:'100%';
	this.dayName=['日','一','二','三','四','五','六'];
	this.nowDate=new Date();
	this.dateTime=date!=null?date:new Date();
	this.str='';
	this.dateTable='';
	this.days=31;
	this.pastDays=0;
	this.generated=false;
	
	this.channel='news';

	this.generate=generate;
	this.getTable=getTable;
	this.focusDate=focusDate;
	this.attachLink=attachLink;
	this.refresh=refresh;
	this.previewMonth=previewMonth;
	this.nextMonth=nextMonth;
	this.setDate=setDate;
	this.afterRefresh=function(){};

	function generate(date){
		this.str='<table id="'+this.calendarName+'" class="cal" cellspacing="0" cellpadding="2" border="0" width="'
			+this.width+'" height="'
			+this.width+'"><tr><th onselectstart="return(false)"><font style="font-size:9pt">'
			+this.dayName.join('</th><th onselectstart="return(false)"><font style="font-size:9pt">')+'</font></th></tr>';
		this.dateTime=date!=null?new Date(date):this.dateTime;
		this.days=new Date(this.dateTime.getYear(),this.dateTime.getMonth()+1,0).getDate();
		this.pastDays=new Date(this.dateTime.getFullYear()+'/'+(this.dateTime.getMonth()+1)+'/1').getDay();
		this.str+='<tr><td colspan="7" id="'+this.calendarName+'Td" style="filter:blendtrans(duration=0.1)">';
		this.getTable();
		this.str+=this.dateTable+'</td></tr></table>';
		this.generated=true;
		return this.str;
	}
	
	
	function getTable(){
		this.dateTable='<table width="100%" height="100%" cellspacing="2" cellpadding="1" class="caltb"><tr>'
			+new Array(this.pastDays+1).join('<td></td>');
		for(var i=1;i<=this.days;i++){
		var monthValue = (this.dateTime.getMonth()+1);
		if(monthValue <10) monthValue="0"+monthValue;
		var dayValue = i;
		if(i<10) dayValue ="0"+dayValue;
		
		var openurl = '<td id="'+this.calendarName+i+'">'+'<a href="http://www.xinhuanet.com/history/'+this.channel+'/'+this.dateTime.getFullYear()+monthValue+'/'+dayValue+'_1.htm" target="_blank">'+i+'</a></td>';
		var ropenurl = '<td id="'+this.calendarName+i+'">'+'<a href="http://www.xinhuanet.com/history/'+this.channel+'/'+this.dateTime.getFullYear()+monthValue+'/'+dayValue+'_1.htm" target="_blank"><font color="red">'+i+'</font></a></td>';
		var closeurl='<td id="'+this.calendarName+i+'">'+i+'</td>';
		
		if(this.dateTime.getFullYear() > this.nowDate.getFullYear())
		{
			this.dateTable+=closeurl;
		}
		else
		if(this.dateTime.getFullYear()== this.nowDate.getFullYear())
		{
			if(this.dateTime.getMonth() > this.nowDate.getMonth())
			{
				this.dateTable+=closeurl;
			}
			else
			if(this.dateTime.getMonth() == this.nowDate.getMonth())
			{
				if(i<=this.nowDate.getDate())
				{
					if(i == this.nowDate.getDate())
					{
						this.dateTable+=ropenurl;
					}
					else
					this.dateTable+=openurl;
				}
				else
				{
					this.dateTable+=closeurl;
				}
			}
			else
			{
				this.dateTable+=openurl;
			}
		}
		else
			this.dateTable+=openurl;
				if((i+this.pastDays)%7==0)this.dateTable+='</tr><tr>';
		}
		for(var i=1;i<=37-this.days-this.pastDays;i++){
			this.dateTable+='<td></td>';
			if((i+this.pastDays+this.days)%7==0)this.dateTable+='</tr><tr>';
		}
		if((this.dateTime.getFullYear()<=2004) && (this.dateTime.getMonth()<9))
		{
					this.dateTable+='<td><button hidefocus="true"><span style="font-family:Webdings"><img src="images/mark_1.gif" width="10" height="10" /></span></button></td>'
			+'<td colspan="2">'+this.dateTime.getFullYear().toString().bold()+'</td>'
			+'<td>'+(this.dateTime.getMonth()+1).toString().bold()+'</td>'
			+'<td><button onmouseup="void('+this.objName+'.nextMonth())" hidefocus="true"><span style="font-family:Webdings"><img src="images/mark_0.gif" width="10" height="10" /></span></button></td>'
			+'</tr></table>';
		}
		else
		{
		this.dateTable+='<td><button onmouseup="void('+this.objName+'.previewMonth())" hidefocus="true"><span style="font-family:Webdings"><img src="images/mark_1.gif" width="10" height="10" /></span></button></td>'
			+'<td colspan="2">'+this.dateTime.getFullYear().toString().bold()+'</td>'
			+'<td>'+(this.dateTime.getMonth()+1).toString().bold()+'</td>'
			+'<td><button onmouseup="void('+this.objName+'.nextMonth())" hidefocus="true"><span style="font-family:Webdings"><img src="images/mark_0.gif" width="10" height="10" /></span></button></td>'
			+'</tr></table>';
		}
		return this.dateTable;
	}
	function focusDate(date){
		try{
			eval(this.calendarName+(date!=null?date|0:new Date().getDate())+'.className="focus"');
			return(true);
		} catch(e) { return(false); }
	}
	function attachLink(date,link,target,title){
		try{
			eval(this.calendarName+(date!=null?date|0:new Date().getDate())
				+'.innerHTML="<a href=\\"'+link+'\\"'
				+' target=\\"'+(target!=null?target:'_self')+'\\"'
				+' title=\\"'+(title!=null?title:'')+'\\">'+date.toString()+'</a>"');
			return(true);
		} catch(e) { alert(e.message);return(false); }
	}
	function refresh(){
		try{
			eval(this.calendarName+'Td.filters[0].apply()');
			eval(this.calendarName+'Td.innerHTML=\''+this.getTable()+'\'');
			eval(this.calendarName+'Td.filters[0].play()');
			this.afterRefresh();
			return(true);
		} catch(e) { return(false); }
	}
	function previewMonth(){
		try{
			this.dateTime.setMonth(this.dateTime.getMonth()-1)
			this.generate();
			this.refresh();
			return(true);
		} catch(e) { return(false); }
	}
	function nextMonth(){
		try{
			this.dateTime.setMonth(this.dateTime.getMonth()+1)
			this.generate();
			this.refresh();
			return(true);
		} catch(e) { return(false); }
	}
	function setDate(dateStr){
		try{
			this.dateTime=new Date(dateStr);
			return(true);
		} catch(e) { return(false); }
	}
}