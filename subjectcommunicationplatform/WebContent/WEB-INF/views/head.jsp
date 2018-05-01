<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="jquery/jquery-3.2.1.min.js"></script>
<script src="bootstrap/bootstrap.min.js"></script>
<link href="bootstrap/bootstrap.min.css" rel="stylesheet">
<link href="umeditor/themes/default/css/umeditor.min.css" type="text/css" rel="stylesheet">
<script type="text/javascript" charset="utf-8" src="umeditor/umeditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="umeditor/umeditor.js"></script>
<script type="text/javascript" src="umeditor/lang/zh-cn/zh-cn.js"></script>
<script>

var getTime = function(format){
	format = format.toLocaleLowerCase()
	var date = new Date();
	var year = date.getYear()+1900;
	var month = date.getMonth()+1<10?"0"+date.getMonth():date.getMonth(); //getMonth返回的月数从0算起
	var day = date.getDate()<10?"0"+date.getDate():date.getDate();	
	return format.replace("yyyy",year).replace("mm",month).replace("dd",day);
	
}
var getFileSize = function(size){
	size = parseInt(size);
	
	if(size<1024)
		return size+"字节";
	kb = size/1024;
	if(kb<1024)
		return kb.toFixed(1)+"kb";
	mb = kb/1024;
	if(mb<1024)
		return mb.toFixed(1)+"mb";
	gb = mb/1024;
	if(gb<1024)
		return gb.toFixed(1)+"gb";
}

</script>