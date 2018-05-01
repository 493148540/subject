<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<title>后台管理系统</title>
	<link rel="stylesheet" type="text/css" href="easyui/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="easyui/icon.css">
	<link rel="stylesheet" type="text/css" href="css/basic.css">
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<script src="js/bootstrap.js"></script>
	<style type="text/css">
		#fmPwd{
			margin:0;
			padding:10px 30px;
		}
		.ftitle{
			font-size:14px;
			font-weight:bold;
			color:#666;
			padding:5px 0;
			margin-bottom:10px;
			border-bottom:1px solid #ccc;
		}
		.fitem{
			margin-bottom:5px;
		}
		.panel-body {
		    padding: 0px;
		}
		a {
    color: Black;
    text-decoration: none;
}

	.tabs-panels.tabs-panels-noborder{
		padding-left:15px
	}
	#modal-container-changepassword input{
		width:90%
	}
	.red {
		display:none;
		color:red;
	}
	</style>
	<script type="text/javascript">
	
	var _menus = {
			"children":[{"id":3,
			"menuid":"3",
			"iconCls":"icon-sys",
			"menuname":"管理",
			"menus":"31_32","state":"open",
			"children":[
				{
					"id":10,
					"menuid":"31",
					"iconCls":"icon-sys",
					"menuname":"菜单管理",
					"url":"basic/subjectmanage",
					"children":[],
					"_parentId":3,
					"state":"open"
				},
				{
					"id":10,
					"menuid":"31",
					"iconCls":"icon-sys",
					"menuname":"用户管理",
					"url":"basic/usermanage",
					"children":[],
					"_parentId":3,
					"state":"open"
				},
				{
					"id":10,
					"menuid":"31",
					"iconCls":"icon-sys",
					"menuname":"话题管理",
					"url":"basic/topictypemanage",
					"children":[],
					"_parentId":3,
					"state":"open"
				},
				{
					"id":10,
					"menuid":"31",
					"iconCls":"icon-sys",
					"menuname":"资源管理",
					"url":"basic/resmanage",
					"children":[],
					"_parentId":3,
					"state":"open"
				},
				{
					"id":10,
					"menuid":"31",
					"iconCls":"icon-sys",
					"menuname":"帖文管理",
					"url":"basic/postmanage",
					"children":[],
					"_parentId":3,
					"state":"open"
				},
				{
					"id":10,
					"menuid":"31",
					"iconCls":"icon-sys",
					"menuname":"字典管理",
					"url":"basic/dictionariesmanage",
					"children":[],
					"_parentId":3,
					"state":"open"
				}
				
				]}
			
			
			]};
		function SavePwd(){
			var passwords = document.getElementsByName("password");
			if(passwords[0].value == passwords[1].value){
				$('#fmPwd').form('submit',{
				url:'servlet/PassWordManagementServlet',
				onSubmit: function(){
					return $(this).form('validate');
					debugger;
				},
				success: function(result){
				debugger;
					var result = eval('('+result+')');
					if (result.success){
						alert(result.msg);
						$('#dlgPwd').dialog('close');		// close the dialog
					} else {
						$.messager.show({
							title: 'Error',
							msg: result.msg
						});
					}
				}
			});
			}
			debugger;
		
		}
	var _menus;
	function addTab(title,url){
		if($('#tabs').tabs('exists', title)){
			$('#tabs').tabs('select', title);
		}else{
		$('#tabs').tabs('add',{
		title:title, //标签页名
		content:'<iframe scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>', //url为标签页地址
		closable:true,
		border:false,
		tools:[{
			iconCls:'icon-mini-refresh',
			handler:function(){
				refeshCurrentTab(title);
		}
    }]
});
		}
	}
	function refeshCurrentTab(title) {
	      var tabPanel = $('#tabs');
	      var tab = tabPanel.tabs('getSelected');
	      //alert("传入的参数title:"+title+",tab选项卡选中按钮的title:"+tab.panel('options').title);      
	      var refeshTab = tabPanel.tabs("getTab", title);
	      if (tab != refeshTab) {
	        tabPanel.tabs("select", title);
	        tab = refeshTab;
	      }
	      var url = $(tab.panel('options').content).attr('src');
	      tabPanel.tabs('update', {
	        tab: tab,
	        options: {
	          content: createFrame(url)
	        }
	      });
	    };
	   function createFrame(url) {
	      return '<iframe scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';
	    };
	function initWest(){
	$('#nav').accordion({
		animate:false,
		fit:true,
		border:true
	
	});
		$.each(_menus.children,function(o,n){
			debugger;
			var menulist ='';
			menulist +='<ul class="navlist">';
     				$.each(n.children, function(j, o) {
				menulist += '<li><div ><a ref="'+o.menuid+'" href="javascript:void(0)" rel="' + o.url + '" ><span class="icon '+o.iconCls+'" ></span><span class="nav">' + o.menuname + '</span></a></div> ';
				if(o.child && o.child.length>0){
	//li.find('div').addClass('icon-arrow');
					menulist += '<ul class="third_ul">';
					$.each(o.child,function(k,p){
					menulist += '<li><div><a ref="'+p.menuid+'" href="javascript:void(0)" rel="' + p.url + '" ><span class="icon '+p.iconCls+'" ></span><span class="nav">' + p.menuname + '</span></a></div> </li>'
				});
				menulist += '</ul>';
			}

			menulist+='</li>';
   					  });
			menulist += '</ul>';
		debugger; 
			$('#nav').accordion('add', {
			//	title:n.menuname, //父标题
				content: menulist,
				selected: false
				
				});
			});
			$('.navlist li a').click(function(){
			debugger;
				var tabTitle = $(this).children('.nav').text();

				var url = $(this).attr("rel");
				var menuid = $(this).attr("ref");
				var icon = $(this).find('.icon').attr('class');

					addTab(tabTitle,url,icon);
					$('.navlist li div').removeClass("selected");
					$(this).parent().addClass("selected");
			//	}
				}).hover(function(){
					$(this).parent().addClass("hover");
				},function(){
					$(this).parent().removeClass("hover");
				});	
			debugger;
	}
		
		window.onload = function(){
		initWest();
		
		$('.panel-body.panel-body-noheader.accordion-body').css('display','block')
		var title = "java";
		}
		//setUserName();
	var updatePassword = function(){
			$('#modal-container-changepassword').modal('show');
		}
	var votifypassword = function(data){
		if($(data).val()=="")
			return;
		$.post('ManagerManage/updatePassword',{password:$(data).val()},function(data){
			debugger;
			if(data.state==false)
			$('.v1').show();
			else
				$('.v1').hide();
		})
	}
	var clearspan = function(){
		$('.v1').hide();
	}
	var clearthis = function(data){
		$(data).val('');
	}
	var votifypasswordagain = function(){
		debugger;
		var password = $('#modal-container-changepassword form input[name="password"]').val();
		var passwordagain = $('#modal-container-changepassword form input[name="passWordAgain"]').val();
		if(passwordagain==password)
		{
			$('.v3').hide();
		}else
			$('.v3').show();
	}
	var savePassword = function(){
		debugger;
		var lastpassword = $('#modal-container-changepassword form input[name="lastpassword"]').val();
		var password = $('#modal-container-changepassword form input[name="password"]').val();
		var repassword = $('#modal-container-changepassword form input[name="passWordAgain"]').val();
		if(lastpassword!=""&&password!=""&&repassword!=""&&password==repassword){
			if($('.v1').css("display")=="none"&& $('.v3').css("display")=='none')
				$.post('ManagerManage/saveNewPassword',{password:repassword},function(data){
					alert(data.message);
					if(data.state==true)
						$('#modal-container-changepassword').modal('hide');
				})
		}
		return;
		
	}
	
	</script>
	
	
</head>

<body class="easyui-layout" >

	
		<div data-options="region:'north',border:false" style="background:#A4D3EE;height:100px">
		<div style="float:right; position:relative;right: 30px;top: 20px;">
		<span>欢迎,</span><a id="username" href="javascript:void(0)"  onclick="updatePassword()">${sessionScope.Manager.manager_name}</a> <a  href="ManagerManage/exitlogin">注销</a></div>
			
		</div>
		<div data-options="region:'south',border:false" style="height:50px;"></div>
		<!-- <div data-options="region:'east', title="East" style="width:100px;"></div> -->
		<div data-options="region:'west',split:true" title="导航菜单" style="width:200px;">
			<div id="nav">
				
			</div>
		
		</div>
		<div data-options="region:'center',border:false,iconCls:'icon-ok'">
			<div id="tabs" class="easyui-tabs" fit="true">
			</div>
		</div> 
		<div id="dlgPwd" class="easyui-dialog" style="width:400px;height:280px;padding:10px 20px"
			closed="true" buttons="#dlg-buttonsChangepwd">
		<div class="ftitle">密码修改</div>
		<form id="fmPwd" method="post" novalidate>
			<div class="fitem1">
				<label>password:</label>
				<input name="password" type="password" required="true">
			</div>
			<br>
			<br>
			<div class="fitem1">
				<label>password:</label>
				<input name="password" type="password" required="true">
			</div>		
		</form>
	</div>
	<div id="dlg-buttonsChangepwd">
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="SavePwd()">Save</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlgPwd').dialog('close')">Cancel</a>
	</div>
	
<div class="modal fade" id="modal-container-changepassword" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
				<h4 class="modal-title" id="myModalLabel">账号管理</h4>
			</div>
			<div class="modal-body">
				<form id="personal_from" role="form"
					style="height: 300px; OVERFLOW: auto;"
					action="PersonalHandlers/save" method="post">
					<div class="form-group">
						<label for="sex">您的登录帐号:</label> 
							<label for="userName">${sessionScope.Manager.manager_name}</label>
					</div>
					<div class="form-group">
						<label for="lastpassword">用户密码</label><input class="form-control"
							name="lastpassword" type="password" onfocus="clearspan()" onblur="votifypassword(this)"/>
					</div>
					<span class="v1 red">密码错误</span>
					<div class="form-group password">
						<label for="password">重置密码</label><input class="form-control"
							name="password" type="password" onfocus="clearthis(this)" onblur="votifypasswordagain()"/>
					</div>
					<span class="v2"></span>
					<div class="form-group">
						<label for="passWordAgain">再次输入密码</label><input class="form-control password"
							name="passWordAgain" type="password" onfocus="clearthis(this)" onblur="votifypasswordagain()"/>
					</div>
					<span class="v3 red">两次输入的密码不一致</span>
					<input type="hidden" name="user.id"
						value="${sessionScope.Manager.manager_id==null? "":sessionScope.Manager.manager_id}" >
					<input type="hidden" name="_method" value="POST">
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default">关闭</button>
				<button type="button" class="btn btn-primary"  onclick="savePassword()">保存</button>
			</div>
		</div>

	</div>

</div>

</body>
</html>