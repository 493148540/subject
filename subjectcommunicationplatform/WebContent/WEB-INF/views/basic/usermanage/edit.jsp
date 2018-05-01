<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style type="text/css">
        div{
            width:100%;
        }
    </style>
<title>Insert title here</title>
<script>
$(function(){
	
	//textarea支持tab缩进
	 var ue = UE.getEditor('editor');
	 var ue = UE.getEditor('appinfo_useragreement');
	 
	 
})</script>
</head>
<body>
	<!-- 模态框（Modal） -->
<div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel">app信息</h4>
            </div>
            <div class="modal-body"  style="height:600px; overflow-y: scroll;">
            <form id="dataform" role="form">	            
				<div class="form-group" >
				    <label for="userName">用户名</label>
				    <input class="form-control" name="userName">
			 	</div>	
			 	<div class="form-group" >
				    <label for="userPassWord">密码</label>
				    <input class="form-control" name="userPassword">
			 	</div>	
			 	<div class="form-group" >
				    <label for="userHead">用户头像</label>
				    <input class="form-control" name="userHead">
			 	</div>
			 	<div class="form-group" >
				    <label for="userHead">用户积分</label>
				    <input class="form-control" name="userResPoint">
			 	</div>	
			 	<input type="hidden"class="form-control" name="userId">
			 	<input type="hidden"class="form-control" name="userEmail" value="">
			</form></div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="Save()">提交更改</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>
<!-- /.modal -->


<div class="modal fade" id="removeMsg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel">提示</h4>
            </div>
            <div class="modal-body"  style="height:100px; ">
            	确定要删除吗?
            </div> +
            <div class="modal-footer" style="text-align:center">
            	<button type="button" class="btn btn-primary" onclick="Remove()">确定</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>
</body>
</html>