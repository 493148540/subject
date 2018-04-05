<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="modal fade" id="myModal_uploadRes" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="    margin-top: 10%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel">资源上传</h4>
            </div>
            <div class="modal-body">
            	<form class="form-horizontal" role="form">
				  <div class="form-group">
				    <label for="firstname" class="col-sm-2 control-label">资源名</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" name="resName">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="lastname" class="col-sm-2 control-label">资源类型</label>
				    <div class="col-sm-5">
				     	<select class="form-control" name="resTypeId">
				     		<c:forEach items="${restype.rows}"  var="item" varStatus="status">
								<option  value="${item.dictionariesCode}">${item.dictionariesName}</option>
							</c:forEach>
				     	</select>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="lastname" class="col-sm-2 control-label">关键词</label>
				    <div class="col-sm-10">
				     	
				     		<input type="text" class="form-control" name="resTag">
				   
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="lastname" class="col-sm-2 control-label">技术分类</label>
				    <div class="col-sm-5">
				     	<select class="form-control" name="resSubjectId">
				     		<c:forEach items="${subjectlist}"  var="item" varStatus="status">
								<option  value="${item.subjectId}">${item.subjectName}</option>
							</c:forEach>
				     	</select>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="lastname" class="col-sm-2 control-label">资源分数</label>
				    <div class="col-sm-2">
				     	<select class="form-control" name="resPoint">
				     		<option value="2">2</option>
				     		<option value="5">5</option>
				     		<option value="8">8</option>
				     		<option value="10">10</option>
				     	</select>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="lastname" class="col-sm-2 control-label">资源描述</label>
				    <div class="col-sm-10">
				     	<textarea name="resDescribe" class="form-control"></textarea>
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="lastname" class="col-sm-2 control-label">文件</label>
				    <div class="col-sm-8">
				     	<input type="file" class="form-control">
				    </div>
				    <div class="col-sm-2">
				     	<button type="button" class="btn btn-default">上传</button>
				    </div>
				  </div>
		
				  <input type="hidden" value="" name="resCode">
				  <input type="hidden" value="${sessionScope.user.userId}" name="resUserId">
				   <input type="hidden" value="" name="resUploadTime">
				    <input type="hidden" value="" name="resSize">
				     <input type="hidden" value="0" name="resDownloadCount">
				     <input type="hidden" value="" name="resUrl">
				     <input type="hidden" value="" name="resIcon">
				  
				</form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="saveres">提交更改</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>
<script>
	$(function(){
		$('#saveres').click(function(){
			var form = new FormData($('#myModal_uploadRes').find('form')[0]);
			alert(form.get("resDescription"));
			$.ajax({
				url:'resmanage/add',
				type:'post',
				data:form,
				dataType:'JSON',
				cache: false,                      // 不缓存
			    processData: false,                // jQuery不要去处理发送的数据
			    contentType: false,                // jQuery不要去设置Content-Type请求头
				success:function(rsp){
					debugger;
					if(rsp.statecode==200)
						alert('true');
				},
				error:function(e){		
				}
			})
		});
	})

</script>
