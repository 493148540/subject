<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="toolbar" style="background:white">
		<div class="options">
			<button type="button" class="btn btn-default btn-sm" onclick="Add()">
				<span class="glyphicon glyphicon-plus-sign"></span> 添加
			</button> 
			<button type="button" class="btn btn-default btn-sm"  onclick="OpenMessage()">
				<span class="glyphicon glyphicon-remove"></span> 删除
			</button>
			<button type="button" class="btn btn-default btn-sm" onclick="Edit()">
				<span class="glyphicon glyphicon-edit" ></span> 编辑
			</button>
		</div>
		<form id="queryfm">	
		</form>
	</div>
