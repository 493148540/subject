
function loginButton(){
		var btn = document.getElementById("login");
		//submit.href = "http://www.baidu.com";
		btn.onclick = function(){
			var user = getUser();
			if(user[0].value == "" || user[1].value == ""){
				alert("账号/密码为空");
				return false;
			}
			debugger;
			var login = $.ajax({
				url:"ManagerManage/login",
				datatype:"json",
				type: "POST",
               	data: {name:user[0].value,password:user[1].value},
              	async: "true",
              	success:function(data){
              		debugger;
              		alert(data.message);
              		if(data.state == true){
              			location.href="/LeasingSystem/basic";
              		}else
              			return;
              	},
              	error:function(a,b,c){
              		alert(a+":"+b+":"+c);
              		debugger;
              		
              	}	
			});
		}
	}
	
	function getUser(){
		var user = document.getElementsByName("user");
		return user;
	}
	
	