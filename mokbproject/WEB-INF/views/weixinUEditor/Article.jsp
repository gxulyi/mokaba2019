<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    <title></title>
  	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
	<link href="css/mui.min.css" rel="stylesheet" />
	<link rel="stylesheet" type="text/css" href="css/fonts/iconfont/iconfont.css"/>
	<link rel="stylesheet" type="text/css" href="css/public.css"/>
	<link rel="stylesheet" type="text/css" href="css/mainstyle.css"/>
  </head>
  
  <body>
  	<div class="mui-content">
		<!--搜索框-->
		<div class="search">
			<div class="search-left mui-action-back">
				<i class="iconfont icon-left"></i>
			</div>
		</div>
			
		<!--主体部分-->
		<div class="mdfd-content" id="contentid55"></div>
	</div>
	<script src="js/mui.min.js"></script>
	<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
	<script type="text/javascript" src="js/jquery.cookie.js"></script>
	<script type="text/javascript" src="js/ajax.js"></script>
	<script type="text/javascript">
		//获取url中的参数
        function getUrlParam(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
            var r = window.location.search.substr(1).match(reg);  //匹配目标参数
            if (r != null) return unescape(r[2]); return null; //返回参数值
        }

		var  article_id=getUrlParam("article_id");
	 	var paramData={article_id:article_id};                               
      	var object = JSON.stringify(paramData);
      	ajaxPost("<%=basePath%>UEditorTemplateController/SelectArticle",object,"json","json",SelectArticle);

   		function SelectArticle(data){        
			// $("body").append('<embed src="'+data.audio_url+'" autostart="true" loop="true" hidden="true"></embed>');
		  	// $("head").append('  <audio autoplay="autoplay" loop="loop">'+'<source src="'+data.audio_url+'" type="audio/mpeg">'+'</audio>');
 			//  $("head").append('<bgsound src="'+data.audio_url+'" autostart=true loop=infinite> ');
			
			$("body").append('<video autoplay="true" name="media" hidden="true"><source src="'+data.audio_url+'" type="audio/mpeg"></video>');
     		$("title").text(data.title);
           	$("#contentid55").append(data.content);
       	}
	</script>
  </body>
</html>

