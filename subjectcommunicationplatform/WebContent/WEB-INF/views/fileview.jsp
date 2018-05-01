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
    	<title>注册</title>
<%@include file="head.jsp" %>
<style>


.cate_list{
	padding:0px;
}
.cate_list li{
	float:left;
	list-style:none;
	margin-left:5px;
	margin-right:5px;
	

}
.cate_list li a{
	padding: 0px 5px;
    display: block;
    cursor: pointer;
    color: #333;
    padding-bottom: 5px;
	

}
.cate_list:after{

	content: "020"; 
  display: block; 
  height: 0; 
  clear: both; 
  visibility: hidden; 
}
.cate_box:after{

	content: "020"; 
  display: block; 
  height: 0; 
  clear: both; 
  visibility: hidden; 
}
.cate_box{
	padding: 10px 0px;
	margin:0px;
}
.cate_box dt{
	float:left;
	width:80px;
	
}
.cate_box dd{

	margin-left:80px;
	font-weight: 400;
}
.reslist{
border:1px solid #eee;
    padding: 10px 19px 9px;

}

.reslist dl{
	    padding: 15px 0;
    border-bottom: dashed 1px #e6e6e6;
    margin-bottom:0px;
}
.reslist dl:after{
	content: "020"; 
  display: block; 
  height: 0; 
  clear: both; 
  visibility: hidden; 
}
.reslist dt{
	float:left;
	
}
.reslist dt img{
	width: 42px;
    height: 48px;
}
.reslist dd{
    margin-left: 60px;
        font-size: 16px;
    color: #333;
    font-weight: 700;
}
.reslist p{
font-size: 12px;
    color: #333;
    padding-right: 30px;
    font-weight: 400;
    display: inline;}
.reslist dd a{
    width:100%;
    font-weight:700;
    color:#333;
    display: inline-block;
    cursor:pointer;
}
.reslist dd .auther span{
    font-size:12px;
    color: #959db1;
    font-size: 12px;
    color: #959db1;
    padding-right: 30px;
    font-weight: 400;
}
.user_info{

    text-align:  center;
    border: 1px solid #eee;
    /* padding: 20px; */
}
.user_info img{
border-radius: 50%;
width:120px;
height:auto;
}
.user_info table{

	width:100%;
}
.user_info table button{
	color:white;
	background-color:red;
}
.listitem{
border-bottom: 1px solid #eee;
margin-bottom:20px;
}
</style>
</head>
<body>



<div class="container">
<%@include file="loginbox.jsp"%>
	<div class="row clearfix">
		<div class="col-md-1 column">
		</div>
		<div class="col-md-10 column">
			<div class="row clearfix">
				<div class="col-md-9 column">
					<div style="border:1px solid #eee;padding: 10px 20px;">
						<dl class="cate_box">
							<dt>技术领域:</dt>
								<dd>
									<ul class="cate_list" id="cate_list">
										<li><a data-id="0" href="fileview-0-${restypeid}-1">全部</a></li>
										<c:forEach items="${subjectlist}"  var="item" varStatus="status">
										<li><a  data-id="${item.subjectId}" href="fileview-${item.subjectId}-${restypeid}-1">${item.subjectName}</a></li>
										</c:forEach>
									</ul>
								</dd>
						
						</dl>
						
						<dl class="cate_box">
							<dt>资源类型:</dt>
								<dd>
									<ul class="cate_list" id="restypelist">
										<li><a data-id="0" href="fileview-${subjectid}-0-1">全部</a></li>
										<c:forEach items="${restype.rows}"  var="item" varStatus="status">
										<li><a  data-id="${item.dictionariesCode}" href="fileview-${subjectid}-${item.dictionariesCode}-1">${item.dictionariesTypeName}</a></li>
										</c:forEach>	
									</ul>
								</dd>
						</dl>
					</div>
					
					<div class="reslist">
						<c:forEach items="${list.rows}"  var="item" varStatus="status">
							<div class="listitem">
							<dt>
								<img src="upload/image/${item.resIcon}.svg" onerror="this.src='upload/image/unkonw.svg'"/>
							</dt>
							<dd>
								<a href="filedetail-${item.resId}">${item.resName}</a>
								<p>${item.resDescribe}</p>
								<div class="auther"><span>上传者:tom</span> <span>上传时间:${item.resUploadTime}</span><span>资源大小:${item.resSize}</span><span>下载个数:${item.resDownloadCount}</span></div>
							</dd>
							</div>
						</c:forEach>
						
						
						
					</div>
					<%@include file="pagelist.jsp"%>
				</div>
		
				<div class="col-md-3 column">
					<%@include file="userinfo_res.jsp" %>
					
					
				</div>
			</div>
			
		</div>
		<div class="col-md-1 column">
		
		
		</div>
	</div>
	
</div>
</body>

<script>
	$(function(){
		debugger;
	
		$('#cate_list [data-id="${subjectid}"]').css('background-color','#EE3123');
		$('#cate_list [data-id="${subjectid}"]').css('font-weight','700');
		$('#cate_list [data-id="${subjectid}"]').css('color','#fff');
		$('#restypelist [data-id="${restypeid}"]').css('background-color','#EE3123');
		$('#restypelist [data-id="${restypeid}"]').css('font-weight','700');
		$('#restypelist [data-id="${restypeid}"]').css('color','#fff');
		$('#restypelist [data-id="${restypeid}"]');
		
		
		//设置分页组件
		setPages({
			url:"/subjectcommunicationplatform/fileview-${subjectid}-${restypeid}-",
			queryparam:""
		});
	
	})

</script>


</html>