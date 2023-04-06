<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<base href="<%=basePath%>">
		<title>谈茶论道</title>
		<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">

		<!--标准mui.css-->
		<link rel="stylesheet" href="css/mui.min.css">
		<link rel="stylesheet" href="css/icons-extra.css" />
		<link rel="stylesheet" href="css/article.css" />
		<script type="text/javascript" src="js/jquery-1.7.1.js" ></script>
		<script type="text/javascript" src="js/jquery.cookie.js"></script>
		<script type="text/javascript" src="js/ajax.js"></script>
		<script src="js/timestampToTime.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
			.mui-icon-home:before{
				content: '';
				display: block;
				width: 20px;
				height: 18px;
				background: url(images/nav_img/chadao.png) no-repeat;
				background-size:100% 100%;
				margin:5px 0 0 3px;
			}
			.mui-icon-email:before{
				content: '';
				display: block;
				width: 20px;
				height: 18px;
				background: url(images/nav_img/tclds.png) no-repeat;
				background-size:100% 100%;
				margin:5px 0 0 3px;
			}
			.mui-icon-contact:before{
				content: '';
				display: block;
				width: 20px;
				height: 18px;
				background: url(images/nav_img/cpw.png) no-repeat;
				background-size:100% 100%;
				margin:5px 0 0 3px;
			}
			.mui-icon-gear:before{
				content: '';
				display: block;
				width: 20px;
				height: 18px;
				background: url(images/nav_img/huiyuan.png) no-repeat;
				background-size:100% 100%;
				margin:5px 0 0 3px;
			}
		</style>
	</head>
	<body style="background: #FFFFFF;">
		<header class="mui-bar mui-bar-nav">
			<h1 class="mui-title">文章</h1>
		</header>
		<nav class="mui-bar mui-bar-tab">
			<a class="mui-tab-item" onclick="window.location='HomeController/home'">
				<span class="mui-icon mui-icon-home"></span>
				<span class="mui-tab-label">茶道</span>
			</a>
			<a class="mui-tab-item mui-active" onclick="window.location='weixin_news/article'">
				<span class="mui-icon mui-icon-email"></span>
				<span class="mui-tab-label">谈茶论道</span>
			</a>
			<a class="mui-tab-item" onclick="window.location='order_weixin/shopping_cart'">
				<span class="mui-icon mui-icon-contact"></span>
				<span class="mui-tab-label">焙茶屋</span>
			</a>
			<a class="mui-tab-item" onclick="window.location='HomeController/memberCenter'">
				<span class="mui-icon mui-icon-gear"></span>
				<span class="mui-tab-label">会员</span>
			</a>
		</nav>
		<div class="mui-content" id="newslist">
			<!-- <div class="article_div">
				<ul class="mui-table-view mui-grid-view">
			        <li class="mui-table-view-cell mui-media mui-col-xs-12">
			            <a href="#">
			                <img class="mui-media-object" src="images/17.png">
			                <div class="mui-media-body">摸鱼儿·更能消几番风雨</div>
			                <p class="mui-media-times">2018-10-10 12:30</p>
			            </a>
			        </li>
			    </ul>
			    <ul class="article_div_fwl">
		        	<li>
	        			<i  class="fx"></i>
	        			<i  class="fx1"></i>
	        			<i  class="fx2"></i>
	        			<label>2017访问</label>
		        	</li>
		        	<li>
	        			<i  class="pl"></i>
	        			<label>45</label>
		        	</li>
		        	<li>
	        			<i  class="dz"></i>
	        			<label>146</label>
		        	</li>
		        </ul>
		    </div> -->
		    <div class="article_div">
				<ul class="mui-table-view mui-grid-view">
			        <li class="mui-table-view-cell mui-media mui-col-xs-12">
			            <a href="#">
			                <img class="mui-media-object" src="images/17.png">
			                <div class="mui-media-body">摸鱼儿·更能消几番风雨</div>
			                <p class="mui-media-times">2018-10-10 12:30</p>
			            </a>
			        </li>
			    </ul>
			    <ul class="article_div_fwl">
		        	<li>
	        			<i  class="fx"></i>
	        			<i  class="fx1"></i>
	        			<i  class="fx2"></i>
	        			<label>2017访问</label>
		        	</li>
		        	<li>
	        			<i  class="pl"></i>
	        			<label>45</label>
		        	</li>
		        	<li>
	        			<i  class="dz"></i>
	        			<label>146</label>
		        	</li>
		        </ul>
		    </div>
		</div>
		<script src="js/mui.min.js"></script>
		<script type="text/javascript">
			$(function() {
				//获取url中的参数
				function getUrlParam(name) {
					var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
					var r = window.location.search.substr(1).match(reg); //匹配目标参数
					if(r != null) return unescape(r[2]);
					return null; //返回参数值
				}

				function findNews(data) {
					if(data.state==0){
						var Ahtml = "";
						var listGoods = data.newsDate.listNews;
						for(var i = 0; i < listGoods.length; i++) {
							var pictures = listGoods[i]["news_picture"];
							pictures = pictures.split(";");
							var picture1 = pictures[0];
							
							Ahtml +="<div class='article_div'>"+
								"<ul class='mui-table-view mui-grid-view'>"+
			     "   <li class='mui-table-view-cell mui-media mui-col-xs-12'>"+
			      "      <a onclick=javascript:{window.location='HomeController/knowledge_detail?news_id=" + listGoods[i]['news_id'] + "'}>"+
			       "         <img class='mui-media-object' src='file/news/img/" + picture1 + "'>"+
			        "        <div class='mui-media-body'>" + listGoods[i]["news_title"] + "</div>"+
			         "       <p class='mui-media-times'>" + timestampToTime(listGoods[i]["update_date"]) + "</p>"+
			          "  </a>"+
			      "  </li>"+
			    "</ul>"+
			    "<ul class='article_div_fwl'>"+
		        "	<li>"+
	        	"		<i  class='fx'></i>"+
	        	"		<i  class='fx1'></i>"+
	        	"		<i  class='fx2'></i>"+
	        	"		<label>2017访问</label>"+
		        "	</li>"+
		        "	<li>"+
	        		"	<i  class='pl'></i>"+
	        		"	<label>" + listGoods[i]["read_num"] + "</label>"+
		        "	</li>"+
		        "	<li>"+
	        	"		<i  class='dz'></i>"+
	        	"		<label>" + listGoods[i]["thumbs_up"] + "</label>"+
		        "	</li>"+
		        "</ul>"+
		    "</div>";
							
							/*  '<div class="default-text-color list-box" onclick=javascript:{window.location="HomeController/knowledge_detail?news_id=' + listGoods[i]["news_id"] + '"}>'+
									 '	<h4>' + listGoods[i]["news_title"] + '</h4>'+
									 '	<img src="file/news/img/' + picture1 + '" onerror="javascript:this.src=\'http://via.placeholder.com/360x150 \'"/>'+
									 '	<div class="position-relative intro-box">'+
									 '		<label class="intro-data">' + timestampToTime(listGoods[i]["update_date"]) + '</label>'+
									 '		<label class="intro-options">'+
									 '			<span class="intro"><i class="iconfont shade icon-yueduliang"></i>&nbsp;&nbsp;<span>' + listGoods[i]["read_num"] + '</span></span>'+
									 '			<span class="intro"><i class="iconfont shade icon-zan"></i>&nbsp;&nbsp;<span>' + listGoods[i]["thumbs_up"] + '</span></span>'+
									 '		</label>'+
									 '	</div>'+
									 '</div>'; */
						}
						document.getElementById("newslist").innerHTML=Ahtml;
						//$("#newslist").append(Ahtml);
					}else{
						mui.toast('网络请求异常，请稍后重试...');
						return;
					}
				}
				
				var news_type = 1;
				var paramData = {
					news_type: news_type
				};
				var object = JSON.stringify(paramData);
				ajaxPost("<%=basePath%>weixin_news/findNews", object, "json", "json", findNews);
			});
		</script>
		<script>
			mui.init({
				swipeBack:true //启用右滑关闭功能
			});
			mui('body').on('tap','a',function(){
				// 获取onclick
			    var str = this.onclick;
			    // 强制转换为字符串
			    str = String(str);
			    var functionString = str.substr(26,str.length - 27);
			    // 执行就好了
			    eval(functionString);
			});
		</script>
	</body>

</html>