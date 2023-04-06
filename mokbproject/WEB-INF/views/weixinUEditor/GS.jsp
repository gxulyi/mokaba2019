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
  
		<!--主体部分-->
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%
  // 将请求、响应的编码均设置为UTF-8（防止中文乱码）
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
HashMap<String, Object> map=null;
map=(HashMap<String, Object>)request.getAttribute("map");%>
			<%if(map.get("content")!=null){ %>
			<div class="mdfd-content" style="padding:0px 10px;" id="contentid55">
				<!--列表-->
				<%=map.get("content") %>
			</div>
			<%} else{%>
			<div class="mdfd-content" style="text-align: center;">
				暂无数据
			</div>
			<%}%>
		
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
        		document.title = data.title;
                $("#contentid55").append(data.content);
           	}
		</script>
  </body>
</html>

