<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>

.pgs{
margin-top:10px;
}
.pagelist{
	line-height:26px;
	float:right;
}
.pagelist a{
	float: left;
    display: inline;
    margin-left: 4px;
    padding: 0 8px;
    height: 26px;
    border: 1px solid;
    border-color: #C2D5E3;
    background-color: #FFF;
    background-repeat: no-repeat;
    color: #333;
    overflow: hidden;
    text-decoration: none;}
.pagelist span{
	float: left;
    display: inline;
    margin-left: 4px;
    padding: 0 8px;
    height: 26px;
    border: 1px solid;
    border-color: #C2D5E3;
    background-color: #FFF;
    background-repeat: no-repeat;
    color: #333;
    overflow: hidden;
    text-decoration: none;
}
.pgs:after{
	content: ".";
    display: block;
    height: 0;
    clear: both;
    visibility: hidden;
}
.pagelist .px{

	padding: 0;
    width: 25px;
    height: 16px;
    border: 1px solid;
    border-color: #848484 #E0E0E0 #E0E0E0 #848484;
    background: #FFF;
    line-height: 16px;
}
.pagelist a.thispage{

background-color: #E5EDF2;
}
</style>
<div class="pgs">
<div class="pagelist">
<input type="hidden" id="maxpage"  name="maxpage"value="${list.maxpage}"/>
<input type="hidden" id="thispage" name="thispage" value="${thispage}"/>
<input type="hidden" id="queryparam" name="queryparam" value="postTopicTypeId=${param.postTopicTypeId}"/>
</div>
</div>


<script>
function setPages(data){
	var maxpage = parseInt($('.pagelist #maxpage').val());
	var thispage =parseInt($('.pagelist #thispage').val()) ;
	var pagelist = $('.pagelist');
	var queryparam = data.queryparam;
	var url = data.url;
	var list="";
	if(maxpage<=5){
		for(var i = 1;i<thispage;i++)
			list += "<a href='"+url+i+"?"+queryparam+"'>"+i+"</a>"	;
		//list += '<span><input class="px" type="text" onkeydown="if(event.keyCode==13) {window.location=\'"+url+"page=this.value\'}">/'+maxpage+'</span>';
			list += "<a class='thispage' href='"+url+i+"?"+queryparam+"'>"+i+"</a>"	;
		for(++i;i<=maxpage;i++)
			list += "<a href='"+url+i+"?"+queryparam+"'>"+i+"</a>"	;
	}
	else if(thispage-3<=0){
		for(var i = 1;i<thispage;i++)
			list += "<a href='"+url+i+"?"+queryparam+"'>"+i+"</a>"	;
		
			list += "<a class='thispage' href='"+url+i+"?"+queryparam+"'>"+i+"</a>"	;
		for(++i;i<=5;i++)
			list += "<a href='"+url+i+"?"+queryparam+"'>"+i+"</a>"	;
			
		list += "<a href='"+url+"page="+maxpage+"'>..."+maxpage+"</a>"	;
	}
	else if(thispage+3>maxpage){
		list += "<a href='"+url+"page="+1+"'>..."+1+"</a>"	;
		for(var i=maxpage-4;i<thispage;i++)
			list += "<a href='"+url+i+"?"+queryparam+"'>"+i+"</a>"	;
		list += "<a class='thispage' href='"+url+i+"?"+queryparam+"'>"+i+"</a>";
		for(++i;i<=maxpage;i++)
			list += "<a href='"+url+i+"?"+queryparam+"'>"+i+"</a>"	;
	}
	else{
		list += "<a href='"+url+"page="+1+"'>..."+1+"</a>"	;
		for(var i=thispage-2;i<thispage;i++)
			list += "<a href='"+url+i+"?"+queryparam+"'>"+i+"</a>"	;
		list += "<a class='thispage' href='"+url+i+"?"+queryparam+"'>"+i+"</a>";
		for(++i;i<=thispage+2;i++)
			list += "<a href='"+url+i+"?"+queryparam+"'>"+i+"</a>"	;
		list += "<a href='"+url+"page="+maxpage+"'>..."+maxpage+"</a>"	;
	}
	
	list += '<span><input class="px" type="text" onkeydown="if(event.keyCode==13) {window.location=\''+url+'page=\'+this.value+\'\'}">/'+maxpage+'</span>';
	pagelist.append($(list));
	
	
}

</script>