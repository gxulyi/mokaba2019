<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../template/admin-header.jsp"%><!-- htnl头部文件 -->
<!doctype html>
<html>
	<head>
		
<meta charset="utf-8">
<base href="<%=basePath%>">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>后台管理 审核</title>
<meta name="description" content="这是一个 查询商品 页面">
<meta name="keywords" content="index">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="icon" type="image/png" href="css/template/images/favicon.png">
<link rel="apple-touch-icon-precomposed"
	href="css/template/images/app-icon72x72@2x.png">
<meta name="apple-mobile-web-app-title" content="Amaze UI" />
		<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
		<script type="text/javascript" src="js/banner.js"></script>
        <script type="text/javascript" src="js/ajax.js"></script>
		<script type="text/javascript" src="js/medicinefood/uitl.js"></script>
		<link rel="stylesheet" href="css/styles-news.css" type="text/css" >
<script>
function wait(vnl){
  		//alert(JSON.stringify(data.newsDate.news.length));
  		var htmlstr="";
  		var typeName="";
  		var object=vnl.object;
  		 if(object.news_type==1){
  		    typeName="知识";
  		 }
  		 if(object.news_type==2){
  		    typeName="动态";
  		 }
  		 if(object.news_type==3){
  		    typeName="基金";
  		 }
  		 if(object.news_type==4){
  		    typeName="视频";
  		 }
  		 /*如果类型为视频，则显示视频字段，否则隐藏  */
  		 var video="";
  		 var picture="";
  		 if(object.news_type!=4){
            document.getElementById("videos").style.display="block";
            document.getElementById("videos").innerHTML ="";
            document.getElementById("videos").href ="javascript:divhidden()";
  		    picture=object.news_picture;
  		    
  		 }else{
  		 var pv = new Array();
  		 pv=object.news_picture.split(";");
  		 video=pv[1];
  		 picture=pv[0];
  		 if(video==null||video==""){
  		 video='暂无视频';
  		 
  		 }
  		document.getElementById('video').innerHTML=video;	
  		 }
  		document.getElementById('title').innerHTML=object.news_title;
  		document.getElementById('type').innerHTML=typeName;
  		document.getElementById('date').innerHTML=formatDateTimeStr(object.add_date);
  		document.getElementById('picture').src='file/store/img/'+picture;
  		document.getElementById('content').innerHTML=object.detail_content;	
  		
  	}
function onloadd(){
      var news_id=document.getElementById("news_id11").value;
      //debugger;
      //alert(news_id);
	  var paramData;
	  var paramData={news_id:news_id};                               
	  var object = JSON.stringify(paramData);
	  ajaxPost("<%=basePath%>admin_news/findNewsId",object,"json","json",wait);
	  };
	window.onload=function(){
	  onloadd();
	  };
	  
	  
	  
function change() {
            var divDisp = document.getElementById("search").style.display;
            var divDisp2 = document.getElementById("search2").style.display;
           if (divDisp == "block") {
                document.getElementById("search").style.display = "none";
                
            } else {
                document.getElementById("search").style.display = "block";
            }
        }

function change1() {
            var divDisp = document.getElementById("search").style.display;
            var divDisp2 = document.getElementById("search2").style.display;
           
            
            if (divDisp2 == "block") {
                document.getElementById("search2").style.display = "none";
                
            } else {
                document.getElementById("search2").style.display = "block";
            }
        }
</script>
	</head>
	<body>
	    <div  id="div" style="display: none" onMouseout="hidden();"><input id="news_id11" value="${news_id}"></div>
		<div style="width: auto; height: auto;">
		<div style="width: 500px; height: 500px;">
			<table class="am-table am-table-striped am-table-hover table-main">
				<ul>
				 <!--    去掉li前的黑点    style="list-style-type:none;" -->
				 <!-- 标题 -->
				 <li class="table-title" style="list-style-type:none;">
				   <p id="" style=" font-size: 20px; color: silver;">
				      <samp style="color: red;">*</samp> 标题：<span id='title'></span></p>
				     
				 </li>
				 <!-- 发布类型 -->
				 <li class="table-type" style="list-style-type:none;">
			       <p style=" font-size: 20px; color: silver;">
				      <samp style="color: red;">*</samp> 发布类型:<span id='type'></span></p>
				 </li>
				 <!-- 发布时间 -->
			     <li class="table-type" style="list-style-type:none;">
				   <p style=" font-size: 20px; color: silver;">
				      <samp style="color: red;">*</samp> 发布时间：<span id='date'></span></p>
				 </li>
			     <li id='videos' class="table-author" style="list-style-type:none;">
				   <p style=" font-size: 20px; color: silver;">
				      <samp style="color: red;">*</samp> 视频：</p>
				 <!-- 点击视频的图片链接 -->
				 <div style="margin-top: -35PX;margin-left: 50PX;"onclick="change1();" >
				   <a>
				      <span id='video'></span>
				      <img src="images/bofang.png" width="25" height="25" style="line-height:-10px;webkit-border-radius:15px;moz-border-radius:15px;border-radius: 15px;"/>
				   </a>
				 </div>
				 </li>
				 <!-- 图片 -->
				 <li class="table-author" style="list-style-type:none;">
					<p style=" font-size: 20px; color: silver;float: left;">
				    	<samp style="color: red;">*</samp> 图片：<img id='picture' alt="" src=""> 
				    </p>
			        <div style="width: 50px; height: 20px;float: left;">
				    	<input id="btnChange" type="button" onclick="change();"style="background:#55cbd2;border:none;color: #fff;border-radius:3px;padding:5px 10px;" value="查看" ></input>
			        </div>
			        <div style="clear: both;"></div>
				 </li>
				 <li class="table-type" style="list-style-type:none;">
				    <p style=" font-size: 20px; color: silver;">
				      <samp style="color: red;">*</samp> 详情内容：</p>
				       <div style="width: 1000px; height: 300px; border: 1px solid silver;"><span id='content'></span></div></li>
			</ul>
		</table>
		
		</div>
		<!--  点击查看图片显示  图片框   -->
		<div id="search" style="width: 700px; height: 500px;position: absolute;left: 50%;top: 50%;transform: translate(-50%,-50%);background-color: silver; display:none;  ">
			<div id="btnChange" onclick="change();" style="width: 30px;height: 30px;position: absolute;top:5px;right:5px;cursor: pointer;">
			  <img id='picture' style="width:100%;height: 100%;" alt="" src="images/gb.png">
			</div>
		<div style="width: 450px; height: 300px; margin-left: 120px; margin-top: 50px;">
			
		<!--全屏滚动-->
		<div class="banner" style="width: 500px;height: 500px;">
		  <div class="b-img" style="width: 500px; height: 500px;">
		  	<a href="#" style=" center no-repeat;" style="width: 450px; height: 300px;"><img src="" width="450" height="300" /> </a>
		  	<a href="#" style=" center no-repeat;" style="width: 450px; height: 300px;"><img src="" width="450" height="300" /></a>
		  	<a href="#" style=" center no-repeat;" style="width: 450px; height: 300px;"><img src="" width="450" height="300" /></a>
		  </div>
		  <div class="b-list"></div>
		  <a class="bar-left" href="#"><em></em></a>
		  <a class="bar-right" href="#"><em></em></a>
		</div>
			
		</div>
		</div>
		<!--  点击查看视频 视频框   -->
		<div id="search2" style="width: 700px; height: 500px; border: 1px solid silver; margin-top: -503px; margin-left: 400px;background-color: silver; display:none;  ">
				<div id="btnChange" type="button" onclick="change1();" style="width: 50px; height: 20px;margin-top: 5px; margin-left: 640px;  "><img src="img/return.png" /> </div>	
		</div>
		</div>
	</body>
</html>
