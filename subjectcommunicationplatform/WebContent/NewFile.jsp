<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=0.5, minimum-scale=0.5, maximum-scale=0.5, user-scalable=no" />
<!-- base需要放到head中 -->    
    	<base href="<%=basePath%>"> 
<script src="jquery/jquery-3.2.1.min.js"></script>
<script src="bootstrap/bootstrap.min.js"></script>
<link href="bootstrap/bootstrap.min.css" rel="stylesheet">
<title>Insert title here</title>
<style>
.list-group-item:first-child{
border-radius: 0px;
 border-radius: 0px; 

}
.list-group-item:last-child{
border-radius: 0px;
 border-radius: 0px; 

}
</style>
</head>
<body>

		<div class="col-md-12 column" style="padding:0">
			<div class="list-group" >
				 <a href="javascript:void(0)" class="list-group-item active">Home</a>
				<div class="list-group-item">
					List header
				</div>
				<div class="list-group-item">
					<h4 class="list-group-item-heading">
						List group item heading
					</h4>
					<p class="list-group-item-text">
						...
					</p>
				</div>
				<div class="list-group-item">
					 <span class="badge">14</span> Help
				</div>
				 <a class="list-group-item active"> <span class="badge">14</span> Help</a>
				 <a class="list-group-item active"> <span class="badge">14</span> Help</a>
			</div>
		</div>
	

</body>
</html>