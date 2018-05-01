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
	
	 
	 
})</script>
</head>
<body>
	<!-- 模态框（Modal） -->
<div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel">资源信息</h4>
            </div>
            <div class="modal-body"  style="height:600px; overflow-y: scroll;">
            <form id="dataform" role="form">	            
				<div class="form-group" >
				    <label for="resName">资源名称</label>
				    <input class="form-control" name="resName">
			 	</div>	
			 	<div class="form-group" >
				    <label for="resUserId">上传用户Id</label>
				    <input class="form-control" name="resUserId">
			 	</div>
			 	<div class="form-group" >
				    <label for="resUploadTime">上传时间</label>
				    <input class="form-control" name="resUploadTime">
			 	</div>
			 	<div class="form-group" >
				    <label for="resUploadTime">资源大小</label>
				    <input class="form-control" name="resSize">
			 	</div>
			 	<div class="form-group" >
				    <label for="resUploadTime">下载次数</label>
				    <input class="form-control" name="resDownloadCount">
			 	</div>
			 	<div class="form-group" >
				    <label for="resUploadTime">所属学科id</label>
				    <input class="form-control" name="resSubjectId">
			 	</div>
			 	<div class="form-group" >
				    <label for="resTypeId">资源类型id</label>
				    <input class="form-control" name="resTypeId">
			 	</div>
			 	<div class="form-group" >
				    <label for="resDescribe">资源描述</label>
				    <input class="form-control" name="resDescribe">
			 	</div>
			 	<div class="form-group" >
				    <label for="resTag">关键词</label>
				    <input class="form-control" name="resTag">
			 	</div>
			 	<div class="form-group" >
				    <label for="resPoint">资源积分</label>
				    <input class="form-control" name="resPoint">
			 	</div>
			 	<div class="form-group" >
				    <label for="resUrl">资源路径</label>
				    <input class="form-control" name="resUrl">
			 	</div>
			 	<div class="form-group" >
				    <label for="resIcon">文件类型</label>
				    <input class="form-control" name="resIcon">
			 	</div>
			 	<input type="hidden"class="form-control" name="resCode" value="">
			 	<input type="hidden"class="form-control" name="resId">
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