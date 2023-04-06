<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    	<base href="<%=basePath%>">
  		<meta charset="UTF-8">
		<title>精华</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		
		<link href="css/mui.min.css" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="css/fonts/iconfont/iconfont.css"/>
		<link rel="stylesheet" type="text/css" href="css/public.css"/>
		<link rel="stylesheet" type="text/css" href="css/mainstyle.css"/>
		<link rel="stylesheet" type="text/css" href="css/essence.css"/>
		
	</head>

	<body>
		<!--主体部分-->
		<div class="mui-content">

			<!--搜索框 开始-->
			<div class="search">
				<div class="search-left" onclick="toBack();">
					<i class="iconfont icon-left"></i>
				</div>
				<div class="search-right">
					<i class="iconfont icon-sousuo"></i>
				</div>
			</div>
			<!--搜索框 开始-->
			
			<!-- 知识列表 开始 -->
			<div id="jinghua" class="list white"></div>
			<!-- 知识列表  结束 -->
		</div>
		<script src="js/mui.min.js"></script>
		<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
		<script type="text/javascript" src="js/jquery.cookie.js"></script>
		<script type="text/javascript" src="js/ajax.js"></script>
		<script src="js/timestampToTime.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			//返回上级
			function toBack() {
				window.location = "<%=basePath%>HomeController/home";
			}
			$(function(){
     			//获取url中的参数
        		function getUrlParam(name) {
            		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
            		var r = window.location.search.substr(1).match(reg);  //匹配目标参数
            		if (r != null) return unescape(r[2]); return null; //返回参数值
        		}
      			
				function findNews(data){ 
    				var Ahtml="";
             		var listGoods=data.newsDate.listNews;
             		for(var i=0;i<listGoods.length;i++){
             			var pictures=listGoods[i]["news_picture"];
						pictures=pictures.split(";");
						var picture1=pictures[0];
            			//下面有个一数组图片listGoods[i]["store_picture"].split(";")[0]
            			Ahtml += '<div class="default-text-color list-box" onclick=javascript:{window.location="HomeController/essence_detail?news_id=' + listGoods[i]["news_id"] + '"}>'+
								 '	<h4>' + listGoods[i]["news_title"] + '</h4>'+
								 '	<img src="file/news/img/' + picture1 + '" onerror="javascript:this.src=\'http://via.placeholder.com/360X150\'"/>'+
								 '	<div class="position-relative intro-box">'+
								 '		<label class="intro-data">' + timestampToTime(listGoods[i]["update_date"]) + '</label>'+
								 '		<label class="intro-options">'+
								 '			<span class="intro"><i class="iconfont shade icon-yueduliang"></i>&nbsp;&nbsp;<span>' + listGoods[i]["read_num"] + '</span></span>'+
								 '			<span class="intro"><i class="iconfont shade icon-zan"></i>&nbsp;&nbsp;<span>' + listGoods[i]["thumbs_up"] + '</span></span>'+
								 '		</label>'+
								 '	</div>'+
								 '</div>';
             		}
                	$("#jinghua").append(Ahtml);
        		}
        		var news_type=0;
         		var paramData={news_type:news_type}; 
	      		var object = JSON.stringify(paramData);
	      		ajaxPost("<%=basePath%>weixin_news/findEssence",object,"json","json",findNews);
       		});
		</script>
	</body>

</html>
