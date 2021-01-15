/**
 * 幻灯片
 */
$(function() {
	var SliderModule = (function() {
		var pb = {};
		pb.el = $('#slider');
		pb.items = {
			panel: pb.el.find('li')
		}

		// Variables Necesarias
		var SliderInterval,
			currentSlider = 0,
			nextSlider = 1,
			lengthSlider = pb.items.panel.length;

		// Initialize
		pb.init = function(settings) {
			this.settings = settings || {duration: 8000} 
			var output = '';

			// Activamos nuestro slider
			SliderInit();

			for(var i = 0; i < lengthSlider; i++) {
				if (i == 0) {
					output += '<li class="active"></li>'; 
				} else {
					output += '<li></li>';
				}
			}

			// Controles del Slider
			$('#slider-controls').html(output).on('click', 'li', function (e){
				var $this = $(this);
				if (currentSlider !== $this.index()) {
					changePanel($this.index());
				};
			});
		}

		var SliderInit = function() {
			SliderInterval = setInterval(pb.startSlider, pb.settings.duration);
		}

		pb.startSlider = function() {
			var panels = pb.items.panel,
				controls = $('#slider-controls li');

			if (nextSlider >= lengthSlider) {
				nextSlider = 0;
				currentSlider = lengthSlider-1;
			}

			// Efectos
			controls.removeClass('active').eq(nextSlider).addClass('active');
			panels.eq(currentSlider).fadeOut('slow');
			panels.eq(nextSlider).fadeIn('slow');

			// Actualizamos nuestros datos
			currentSlider = nextSlider;
			nextSlider += 1; 
		}

		// Funcion para controles del slider
		var changePanel = function(id) {
			clearInterval(SliderInterval);
			var panels = pb.items.panel,
				controls = $('#slider-controls li');

			// Comprobamos el ID
			if (id >= lengthSlider) {
				id = 0;
			} else if (id < 0) {
				id = lengthSlider-1;
			}

			// Efectos
			controls.removeClass('active').eq(id).addClass('active');
			panels.eq(currentSlider).fadeOut('slow');
			panels.eq(id).fadeIn('slow');

			// Actualizamos nuestros datos
			currentSlider = id;
			nextSlider = id+1;

			// Reactivamos el slider
			SliderInit();
		}


		return pb;
	}());
	SliderModule.init({duration: 4000});
});


/* 折叠 */
$(function()  
  {  
        $("#zhe1").click(function()  
            {  
            if($(this).text()=="展开剩余分类")  
                {  
                  $(".changeTr1").removeAttr("style");  
                  $("#zhe1").text("收起");  
				  $("#triangle1").attr('src','../static/frontimages/triangle2.jpg');
                }  
            else  
                {  
                  $(".changeTr1").css("display","none");  
                  $("#zhe1").text("展开剩余分类");  
				  $("#triangle2").attr('src','../static/frontimages/triangle.jpg');
                }  
            });   
  });  
$(function()  
  {  
        $("#zhe2").click(function()  
            {  
            if($(this).text()=="展开查看全部培训机构")  
                {  
                  $(".changeTr2").removeAttr("style");  
                  $("#zhe2").text("收起");  
				  $("#triangle2").attr('src','../static/frontimages/triangle2.jpg');
                }  
            else  
                {  
                  $(".changeTr2").css("display","none");  
                  $("#zhe2").text("展开查看全部培训机构");  
				  $("#triangle2").attr('src','../static/frontimages/triangle.jpg');
                }  
            });   
  }); 


function deleteLogin(){
	var del=document.getElementById("login_box");
	var bg_filter=document.getElementById("bg_filter");
	var bg_ground=document.getElementById("backgroundImg");
	bg_ground.style.display="none";
	bg_filter.style.display="none";
	del.style.display="none";
    $(".bcde").text("");
    $(".error_pwd").text("");
}
function deleteRegist(){
	var del=document.getElementById("regist_box");
	var bg_filter=document.getElementById("bg_filter");
	var bg_ground=document.getElementById("backgroundImg");
	bg_filter.style.display="none";
	bg_ground.style.display="none";
	del.style.display="none";
    $(".bcd").text("");
    $("#spinfo1").text("");
    $("#spinfo2").text("");
    $("#spinfo3").text("");
}
function showBox(){
	var show=document.getElementById("login_box");
	var bg_filter=document.getElementById("bg_filter");
	var bg_ground=document.getElementById("backgroundImg");
	show.style.display="block";
	bg_filter.style.display="block";
	bg_ground.style.display="block";

}
function registBox(){
	var show=document.getElementById("regist_box");
	var bg_filter=document.getElementById("bg_filter");
	var bg_ground=document.getElementById("backgroundImg");
	show.style.display="block";
	bg_ground.style.display="block";
	bg_filter.style.display="block";
	
}
function regist(){
	deleteLogin();
	registBox();
}
 	function check_box() {
                if ($(".email-b").val() == '') {
                    $(".bcd").text("邮箱不能为空");
                }
                else {
                    if (/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/.test($(".email-b").val()) == false) {
                        $(".bcd").text("邮箱格式不正确");
                    }
                    else {
                        $(".bcd").text('');
                   
                    }
                }
        }
    function check_box1() {
    	if($(".email-a").val() == "") {
    			$(".bcde").text("邮箱不能为空")
    		}
    	else {
    		  if (/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/.test($(".email-a").val()) == false) {
                  $(".bcde").text("邮箱格式不正确");
              }
              else {
                  $(".bcde").text('');
              }
    	}
    }
    function check_box2() {
                if ($("#pwd_login").val() == '') {
                    $(".error_pwd").text("请输入密码");    
                }
                else {
                    $(".error_pwd").text('');
                }
    }
 	function Mous(){
                if ($("#phone").val() == '') {
                    $("#spinfo1").text("手机号不能为空");
                }
                else {
                	var myreg=/^[1][3,4,5,7,8][0-9]{9}$/; 
                    if (myreg.test($("#phone").val()) == false) {
                        $("#spinfo1").text("手机号格式不正确，请重新填写");
                    }
                    else {
                        $("#spinfo1").text('');
                        
                    }
                }
 	}
 	function check(){
                if ($("#pwd_regist").val() == '') {
                    $("#spinfo2").text("密码不能为空");
                }
                else {
                	var myreg=/^[0-9a-z_A-Z]{6,16}$/i; 
                    if (myreg.test($("#pwd_regist").val()) == false) {
                        $("#spinfo2").text("密码格式不正确");
                    }
                    else {
                        $("#spinfo2").text('');
                       
                    }
                }
 	}
 	function check_again(){
                if ($("#pwd_regist").val() != $("#pwd_pwd").val()) {
                    $("#spinfo3").text("密码不一致");
                }
                else {
                	$("#spinfo3").text('');     
                }
       }