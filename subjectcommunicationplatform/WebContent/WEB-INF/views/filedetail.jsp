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
    	
<%@include file="head.jsp" %>
<title>资源下载</title>
<style>

.resdetailbox:after{
content: "020"; 
  display: block; 
  height: 0; 
  clear: both; 
  visibility: hidden; 

}
dl:after{
content: "020"; 
  display: block; 
  height: 0; 
  clear: both; 
  visibility: hidden; 

}
dl{
margin: 0;}
dl dt{
float:left;

}
dl dd{
float:left;
}
dl .dl_b{
margin-left:20px;
font-size: 14px;
    color: #67769a;
    display: inline-block;
    vertical-align: middle;

}
.dl_b span:first-child{
font-size: 14px;
    color: #67769a;
    display: inline-block;
    vertical-align: middle;
    margin-right: 20px;
}
.describe{
    padding-top: 10px;
    padding-bottom: 10px;
    display:block;
}
.describe pre{
    /* margin-bottom: 14px; */
    margin: 0;
    white-space: pre-wrap;
    white-space: -moz-pre-wrap;
    white-space: -pre-wrap;
    white-space: -o-pre-wrap;
    word-wrap: break-word;
    border:none;
    }
    .describe{
    
    width:100%;
    }
.describe span{
font-size: 20px;
    color: #facc16;}  
    
 .describe span:first-child{
  margin-right:20px;
  }  
   .describe a{
    display:block;
    float:right;
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
					<div  style="    border: 1px solid #eee;
    padding: 10px 20px;">
    	<div class="resdetailbox">
    	<dl>
    	<dt><img style="width: 100%;
    height: 100%;
    max-width: 42px;
    max-height: 50px;"src="upload/image/${res.resIcon}.svg" onerror="this.src='upload/image/unkonw.svg'"/>
    </dt>
    	<dd><h3 style="margin: 0;    margin-left: 20px;">${res.resName}</h3>
    	<div class="dl_b"><span>${res.resUploadTime} 上传</span>
    				<span> 大小 :${res.resSize}</span>
    	</div>
    	</dd>
    	
    	</dl>
    	</div>
    	
    	<div class="describe">
    		<pre style="">${res.resDescribe}</pre>
    	</div>
    	
    	<div class="describe">
    		所需积分:<span>${res.resPoint}</span>下载个数:<span>${res.resDownloadCount}</span>
    		
							<a href="javascript:void(0)"  id="downloadbutton"data-url="download-${res.resId}"><button class="btn btn-default redbutton">下载资源</button></a>
						
						
    		
    	</div>
    </div>
					
					
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
	$('#downloadbutton').click(function(){
		var url = $(this).attr('data-url');
		if("${sessionScope.user.userName}"=='null' ||"${sessionScope.user.userName}"=="" )
		{
			alert("请登录后操作");
			return false;
		}
		
		/*if(parseInt("${sessionScope.user.userResPoint}")<parseInt("${res.resPoint}")){
			alert("积分不足");
			return false;
		}*/
		window.location.href=url;
	});
});

</script>
</html>