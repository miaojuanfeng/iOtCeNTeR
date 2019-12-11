// JavaScript Document
function MyTime(){
	var day1;
    var mydate= new Date();
	var year=mydate.getFullYear();
	var month=mydate.getMonth()+1;
	var date=mydate.getDate();
	var s=year+"年"+month+"月"+date+"日";
    var day=mydate.getDay();
	switch(day){
		case 0: day1= "日";
		break;
		case 1: day1= "一";
		break;
		case 2: day1= "二";
		break;
		case 3: day1= "三";
		break;
		case 4: day1= "四";
		break;
		case 5: day1= "五";
		break;
		case 6: day1= "六";
		break;
		}
	var s1="星期"+day1;
	//var time=mydate.toLocaleTimeString();
	var Time=s+"&nbsp;&nbsp;"+s1;
	$("#time").html(Time);
}
setInterval("MyTime()",3600000);
document.onreadystatechange = subSomething;
	function subSomething(){ 
		if(document.readyState == "complete"||document.readyState == "interactive")
		{
			$(".form_text").eq(0).val("");
			$(".form_text").eq(1).val("");
			if(document.activeElement.id=="username") {$(".form_text").eq(0).next(".ts_text").hide();}
			if(document.activeElement.id=="password") {$(".form_text").eq(1).next(".ts_text").hide();}
		}
	} 
$(document).ready(function(e) {
	$(".form_text").eq(0).val("");
	$(".form_text").eq(1).val("");
	MyTime();	
	$(".form_text").focus(function(){
		$(this).next(".ts_text").hide();	
	});
	$(".form_text").blur(function(){
		if($(this).val()==null||$(this).val()==""){
			$(this).next(".ts_text").show();
		}
	});
	$(".ts_text").click(function(){
		$(this).prev(".form_text").focus();
		});
	$(".button").click(function(){
			if($(".form_text").eq(0).val()==null||$(".form_text").eq(0).val()==""){
				alert("请输出用户名");
				return false;
				}else if($(".form_text").eq(1).val()==null||$(".form_text").eq(1).val()==""){
				alert("请输出密码");
				return false;	
				}else{return true;}
		});
	var H=$(window).height();
	if(H>700){
		var h=(H-700)/2;
		$(".form_layout").css("margin-top",h);
		$(".floor").css("margin-top",h);
		}
	$(window).resize(function(e) {
		H=$(window).height();
        if(H>700){
			var h=(H-700)/2;
			$(".form_layout").css("margin-top",h);
			$(".floor").css("margin-top",h);
		}else{
			$(".form_layout").css("margin-top",0);
			$(".floor").css("margin-top",0);
		}
    });
	$(".button").hover(function(){
		$(this).css("background","url(../../cloud/skin/images/loagin_hoverformbg_03.png) no-repeat");
		},function(){
		$(this).css("background","url(../../cloud/skin/images/loagin_formbg_07.png) no-repeat");
		});
});