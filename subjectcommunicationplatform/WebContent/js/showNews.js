// var tds = document.getElementById('table1').getElementsByTagName('li');
	
	
	function setpages(data){
		
		
		var href = location.href.replace(/[#].*/,"")+'#content';
		var count = data.count;
		var thispage = getthispage();
		var maxpage = parseInt((count-1)/10)+1;
		$('.pages .datalist .page').remove();
		var beginpage = parseInt(thispage)-4;
		var endpage = parseInt(thispage)+5;
		if(beginpage<1)
			beginpage=1;
		if(maxpage-endpage<1)
			endpage=maxpage;
		for(var i = beginpage;i<thispage;i++){
			$('.pages .datalist .next').before('<li class="page"><a href="'+href+'">'+i+'</a></li>');
		}
		$('.pages .datalist .next').before('<li class="page active"><a href="'+href+'")#content">'+thispage+'</a></li>');
		for(var i = parseInt(thispage)+1;i<=endpage;i++){
			$('.pages .datalist .next').before('<li class="page"><a href="'+href+'")#content">'+i+'</a></li>');
		}
		
		$('.pages .datalist .page').removeClass('active');
		$('.pages .datalist li.page:eq('+(thispage-1)+')').addClass('active');
		
		$('.pages .datalist li.page a').unbind("click").click(function(){
			$('.pages #table1 input[name="page"]').val($(this).text());
			querylist({"newstype":$('article .news_title .active a').attr('href').replace('#panel-',""),"page":$(this).text()});
		})
	
		$('.pages .datalist li.first a').unbind('click').click(function(){
				$('.pages #table1 input[name="page"]').val(1);
				querylist({"newstype":$('article .news_title .active a').attr('href').replace('#panel-',""),"page":1});
			})
			$('.pages .datalist li.previous a').unbind('click').click(function(){
				if(parseInt(getthispage())-1 <1)
						return;
				$('.pages #table1 input[name="page"]').val(getthispage()-1);
				querylist({"newstype":$('article .news_title .active a').attr('href').replace('#panel-',""),"page":getthispage()});
			})
			$('.pages .datalist li.next a').unbind('click').click(function(){
				debugger;
				if(parseInt(getthispage())+1 >maxpage)
					return;
				$('.pages #table1 input[name="page"]').val(parseInt(getthispage())+1);
				querylist({"newstype":$('article .news_title .active a').attr('href').replace('#panel-',""),"page":getthispage()});
			})
			$('.pages .datalist li.last a').unbind('click').click(function(){
				$('.pages #table1 input[name="page"]').val(maxpage);
				querylist({"newstype":$('article .news_title .active a').attr('href').replace('#panel-',""),"page":maxpage});
			})
			$('.pages .datalist .gotopage').unbind('click').click(function(){
			var page = $('.pages .datalist li input').val();
			if(page=="" || page>maxpage || page<1)
				return;
			$('.pages #table1 input[name="page"]').val(page);
			querylist({"newstype":$('article .news_title .active a').attr('href').replace('#panel-',""),"page":page});
		})
	}
	
	function getthispage(){
		var page = $('.pages #table1 input[name="page"]').val();
	//	page
		if(page==null || page == "")
			return 1;
		return page;
	}
	function querylist(param){

		$.get('index/getNews'+'/'+param.newstype+'/'+param.page,function(data){
			if(data != null && data.obj!=null && data.obj.count>0){
				debugger;
				setData(data.obj);
			}
				
		});
	}
	function setData(data){
		setpages(data);
		var list = data.list;
		var tab = getthisTab(list[0].newstype);
		tab.empty();
		for(var i=0;i<list.length;i++){
			
			$('<div class="all_content">'+
			'<div class="left_content">'+
				'<div class="title_nes">'+list[i].title+'</div>'+
				'<div class="come_where">'+'来源：'+list[i].forcompany+' '+ list[i].forauthor+'</div>'+
				'<div class="des">'+list[i].abstracttext+'</div>'+
				'<div class="check">'+'['+list[i].newsdate+']'+' &nbsp;&nbsp;&nbsp;'+'<a href="javascript:void(0)">查看详情></a></div>'+
			'</div>'+
			'<div class="right_content">'+
				'<img src="upload/image/'+list[i].img+'">'+
			'</div>'+
		'</div>').appendTo(tab);	
		}	
		tab.append('<div style="border: 1px solid #ddd;"></div>')
	}
	
	function getthisTab(type){
		return $('#panel-'+type);
	}
	
	function getNewsType(){
		return $('.newscontent.tab-content .active').attr('id').replace('panel-',"");
	}

