<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.subjectmenu{
   border: 1px solid #CDCDCD;
    /* background-color: #F2F2F2; */
    margin-top: 8px;
    border-top: 0px;
    
    }
    
        
.subjectmenu dl{

	margin:0px;
}
.subjectmenu dl a{

	    padding-bottom: 2px;
    /* padding: 4px; */
    padding-top: 2px;
}
.subjectmenu dt{
	    overflow: hidden;
    height: 27px;
    line-height: 27px;
    border: solid #dcdcdc;
    border-width: 1px 0;
    background: #F5F9FB url(https://www.mukedaba.com/template/wxd_thinkpad/wxd_img/titlebg_sd.png) repeat-x 100% 0;
	background-position:100% -27px;
}
.subjectmenu dt a {
	text-decoration: none;
}
.subjectmenu dd:hover {
	cursor:pointer;
	text-decoration: underline;
}
.subjectmenu dd{
padding: 4px;
}

.subjectmenu a{

	
    padding: 0 10px;
    display:  block;
    color:#333;
	
}

</style>
<div  class="subjectmenu">

<c:forEach items="${subjectlist}"  var="item" varStatus="status">
	<dl>
		<dt><a href="javascript:void(0)" data-id="${item.subjectCode}">${item.subjectType}</a></dt>
		<c:forEach items="${item.subject}"  var="subject" varStatus="status">
		<dd><a href="/subjectcommunicationplatform/forum-${subject.subjectId}-1" id="subjectid-${subject.subjectId}">${subject.subjectName}</a></dd>
	
		</c:forEach>
	</dl>
	</c:forEach>
</div>

<script>



$(function(){
	$('.subjectmenu  dl dt').click(function(){
		if($(this).css('background-position')=="100% 0px"){
			$(this).css('background-position','100% -27px');
			$(this).nextAll('dd').css('display','block');
		}else{
			$(this).css('background-position','100% 0px');
			$(this).nextAll('dd').css('display','none');
		}
			
	})
	
	//var arr = location.pathname.replace('/subjectcommunicationplatform/forum-','').split('-');
	$('#subjectid-'+"${subjectid}").css('background-color','#EE3123');
	$('#subjectid-'+"${subjectid}").css('font-weight','700');
	$('#subjectid-'+"${subjectid}").css('color','#fff');
})


</script>