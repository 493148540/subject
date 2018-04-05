<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <link rel="shortcut icon" href="#" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
　　　　　　#div1{
　		    position: absolute;
　　　　　　　　width: 300px;
　　　　　　　　height: 300px;
　　　　　　　　background-color: #ccc;
　　　　　　　　/*一定要绝对定位*/
　　　　　　　
　　　　　　}
　　　　</style>
　　</head>
　　<body>
ssssssss
　　　　<div id="div1"></div>
　
　　</body>
</html>
<script>

window.onload = function(){
	　　var div1 = document.getElementById("div1");
	　　div1.onmousedown = function(ev){
	　　　　var oevent = ev || event;

	　　　　var distanceX = oevent.clientX - div1.offsetLeft;
	　　　　var distanceY = oevent.clientY - div1.offsetTop;

	　　　　document.onmousemove = function(ev){
	　　　　　　var oevent = ev || event;
	　　　　　　div1.style.left = oevent.clientX - distanceX + 'px';
	　　　　　　div1.style.top = oevent.clientY - distanceY + 'px'; 
	　　　　};
	　　　　document.onmouseup = function(){
	　　　　　　document.onmousemove = null;
	　　　　　　document.onmouseup = null;
	　　　　};
	　　
	}
};
</script>