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
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		 <!-- base需要放到head中 -->    
    	<base href="<%=basePath%>">   
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<script src="js/jquery.min.js"></script>
		<script src="js/bootstrap.js"></script>
		
		<link href="bootstrap-table/bootstrap-table.min.css" rel="stylesheet">	
		<script src="bootstrap-table/bootstrap-table.min.js"></script>
		<script src="bootstrap-table/bootstrap-table-zh-CN.js"></script>
		<link rel="stylesheet" href="css/jquery.Jcrop.css" type="text/css" />
		<title>商品管理</title>
</head>
<style>

	#toolbar {
		margin-top: 20px;
    margin-bottom: 40px;
    margin-left: 20px;
    border: none;
	}
	#toolbar .options{
	float:left
	}
	#queryfm {
		float: left;
    margin-left: 20px;
	}
	
	#fm label{
		width:20%;
	}
	#fm input{
		width:80%;
	}
	#fm .fitem{
		margin-top:10px;
		margin-buttom:10px;
	}

	#bg img {
	 width:50px;
 height:50px;
 max-width:100%;
 max-height:100%;
 min-width:100%;
 min-height:100%;
	}

	.red{
	
		color:red
	}
	.green{
	
		color:green
	}

</style>
<script>
	var url = 'resmanage/';
	$(function () {
		 
        //1.初始化Table
        var oTable = new TableInit();
        oTable.Init();
 
        //2.初始化Button的点击事件
        /* var oButtonInit = new ButtonInit();
        oButtonInit.Init(); */
        $.extend({
		    myTime: {
		      /**
		       * 当前时间戳
		       * @return <int>    unix时间戳(秒) 
		       */
		      CurTime: function(){
		        return Date.parse(new Date())/1000;
		      },
		      /**       
		       * 日期 转换为 Unix时间戳
		       * @param <string> 2014-01-01 20:20:20 日期格式       
		       * @return <int>    unix时间戳(秒)       
		       */
		      DateToUnix: function(string) {
		        var f = string.split(' ', 2);
		        var d = (f[0] ? f[0] : '').split('-', 3);
		        var t = (f[1] ? f[1] : '').split(':', 3);
		        return (new Date(
		            parseInt(d[0], 10) || null,
		            (parseInt(d[1], 10) || 1) - 1,
		            parseInt(d[2], 10) || null,
		            parseInt(t[0], 10) || null,
		            parseInt(t[1], 10) || null,
		            parseInt(t[2], 10) || null
		            )).getTime() / 1000;
		      },
		      /**       
		       * 时间戳转换日期       
		       * @param <int> unixTime  待时间戳(秒)       
		       * @param <bool> isFull  返回完整时间(Y-m-d 或者 Y-m-d H:i:s)       
		       * @param <int> timeZone  时区       
		       */
		      UnixToDate: function(unixTime, isFull, timeZone) {
		        if (typeof (timeZone) == 'number')
		        {
		          unixTime = parseInt(unixTime) + parseInt(timeZone) * 60 * 60;
		        }
		        var time = new Date(unixTime * 1000);
		        var ymdhis = "";
		        ymdhis += time.getUTCFullYear() + "-";
		        ymdhis += (time.getUTCMonth()+1) + "-";
		        ymdhis += time.getUTCDate();
		        if (isFull === true)
		        {
		          ymdhis += " " + time.getUTCHours() + ":";
		          ymdhis += time.getUTCMinutes() + ":";
		          ymdhis += time.getUTCSeconds();
		        }
		        return ymdhis;
		      }
		    }
		  });
    });
 
 
    var TableInit = function () {
        var oTableInit = new Object();
        //初始化Table
        oTableInit.Init = function () {
            $('#dg').bootstrapTable({
                url: url+'findbylist',         //请求后台的URL（*）
                method: 'get',                      //请求方式（*）
                toolbar: '#toolbar',                //工具按钮用哪个容器
              //  striped: true,                      //是否显示行间隔色
                cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                pagination: true,                   //是否显示分页（*）
                sortable: true,                     //是否启用排序
                sortOrder: "asc",                   //排序方式
                queryParams: oTableInit.queryParams,//传递参数（*）
                sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
                pageNumber:1,                       //初始化加载第一页，默认第一页
                pageSize: 50,                       //每页的记录行数（*）
                paginationLoop:true,
                pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
                strictSearch: true,
                clickToSelect: true,                //是否启用点击选中行
                height: 800,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
                uniqueId:"topicTypeId",                     //每一行的唯一标识，一般为主键列
                cardView: false,                    //是否显示详细视图
                detailView: false,                   //是否显示父子表
                
              
                columns: [{field:'',title:'请选择',radio:true,sortable:true},
                	{field:'resId',title:'id',sortable:true},
                	{field:'resName',title:'资源名称',sortable:true},
                	{field:'resUserId',title:'上传用户id',sortable:true},
                	{field:'resUploadTime',title:'上传时间',sortable:true},
                	{field:'resSize',title:'文件大小',sortable:true},
                	{field:'resDownloadCount',title:'下载次数',sortable:true},
                	{field:'resSubjectId',title:'所属学科id',sortable:true},
                	{field:'resTypeId',title:'所属资源类别id',sortable:true},
                	{field:'resDescribe',title:'描述',sortable:true},
                	{field:'resTag',title:'关键词',sortable:true},
                	{field:'resPoint',title:'资源积分',sortable:true},
                	{field:'resUrl',title:'资源路径',sortable:true},
                	{field:'resIcon',title:'文件类型',sortable:true}
    				]
            });
        };
 
        //得到查询的参数
      oTableInit.queryParams = function (params) {
        	debugger;
            var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
            		rows: params.limit,   //页面大小
                page: parseInt(params.offset)/params.limit+1,  
                sort:params.order,
                order:params.sort,
                name: $("#name").val(),
                pid: $("#pid").val(),
                sellerid: $("#sellerid").val(),
                orderid: $("#orderid").val(),
                CardNumber: $("#CardNumber").val(),
                portid: $("#portid").val(),
                CardNumber: $("#CardNumber").val(),
                tradetype:$('input:radio[name="tradetype"]:checked').val(),
                success:$('input:radio[name="success"]:checked').val()
            };
            return temp;
        };
        return oTableInit;
    };
   
	
		var thisurl;
		function Add(){
			$('#dataform')[0].reset();
			$('#edit').modal('show');
			
			thisurl = url+'add';
		}
		function Edit(){
			$('#dataform')[0].reset();
			var row = $('#dg').bootstrapTable('getSelections');
			if(row.length==0)
				return;
			setForm($('#dataform'),row);
			$('#edit').modal('show');
			thisurl = url+'edit';
		}
		function Save(){
			var form = new FormData(document.getElementById("dataform"));
	         $.ajax({
	             url:thisurl,
	             type:"post",
	             data:form,
	             processData:false,
	             contentType:false,
	             success:function(data){
		     		alert(data.message);
		     		$('#edit').modal('hide');
		     		$('#dg').bootstrapTable('refresh');
	             },
	             error:function(e){
	            	 alert("请求失败,服务器异常 and errorcode:"+e.status);
	                
	             }
	         });        
	      
			
		}
		function Remove(){
			debugger;
			var row = $('#dg').bootstrapTable('getSelections');
			$.post(url+'remove',{id:row[0].topicTypeId},function(data){
				alert(data.message);
			});
			$('#removeMsg').modal('hide');
			$('#dg').bootstrapTable('refresh');
		}
		
		function OpenMessage(){
			var row = $('#dg').bootstrapTable('getSelections');
			if(row.length>0)
				$('#removeMsg').modal('show');
		}
		function doSearch(){
			debugger;
			$('#dg').bootstrapTable('refresh');
		}
		function showDetail(){
			alert("1");
		}
		//form为jquery对象
		function setForm(form,row){
			form = form[0];
			row = row[0];
			row.ResponsibilityStatement = row.responsibilityStatement;
			debugger;
			for(var i in row){
				if(typeof(form[i])!="undefined" && form[i]!=null && form[i]!="")
				form[i].value = row[i];
			}
			 
		}
		
		 
</script>
<body>
	<table id="dg"></table>
	
		
	
	<!-- 表头窗口 -->
	<%@ include file="toolbar.jsp"%> 
	<!-- 详情窗口 
	<%@ include file="detail.jsp"%> -->
	<!-- 编辑窗口 -->
	<%@ include file="edit.jsp"%> 
	<!-- 图片详情-->
	<%@ include file="showImg.jsp"%>			
</body>
</html>