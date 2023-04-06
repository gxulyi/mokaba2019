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
		<title>基金详情</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />

		<link href="css/mui.min.css" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="css/fonts/iconfont/iconfont.css" />
		<link rel="stylesheet" type="text/css" href="css/public.css" />
		<link rel="stylesheet" type="text/css" href="css/mainstyle.css" />
	</head>

	<body>
		<!--主体-->
		<div class="mui-content">
			<!--搜索框-->
			<div class="search border-knowledge">
				<div class="search-left" onclick="toBack();">
					<i class="iconfont icon-left"></i>
				</div>
			</div>
			<!--动态列表-->
			<div class="detail" id="gongyi"></div>
		</div>

		<script src="js/mui.min.js"></script>
		<script src="js/wx_common.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
		<script type="text/javascript" src="js/jquery.cookie.js"></script>
		<script type="text/javascript" src="js/ajax.js"></script>
		<script src="js/timestampToTime.js" type="text/javascript" charset="utf-8"></script>
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
					var Ahtml = "";
					var listGoods = data.newsDate.news;
					var pictures = listGoods.news_picture;
					pictures = pictures.split(";");
					var picture1 = pictures[0];
					 var Ahtml = '<div class="title">' +
						        '	<img src="file/news/img/' + picture1 + '" onerror="javascript:this.src=\'http://via.placeholder.com/360x150 \'"/>' +
						        '	<div style="position: relative;padding: 5px 10px;">' +
						        '		<div class="data">' + timestampToTime(listGoods.update_date) + '</div>' +
						        '		<div class="interact">' +
						        '			<div class="yueduliang">' +
						        '				<i class="iconfont shade icon-yueduliang"></i>&nbsp;&nbsp;<span>' + listGoods.read_num + '</span>' +
						        '			</div>' +
						        '			<div class="dianzan" onclick="dianZan()">' +
						        '				<i class="iconfont shade icon-zan"></i>&nbsp;&nbsp;<span id="zan">' + listGoods.thumbs_up + '</span>' +
						        '			</div>' +
						        '		</div>' +
						        '	</div>' +
						        '	<h4>' + listGoods.news_title + '</h4>' +
						        '</div>' +
						        '<div class="detail-content">' + listGoods.detail_content + '</div>';
					$("#gongyi").append(Ahtml);
				}

				var news_type = 3;
				var news_id = getUrlParam("news_id");
				var paramData = {
					news_type: news_type,
					news_id: news_id
				};
				var object = JSON.stringify(paramData);
				ajaxPost("<%=basePath%>weixin_news/findNewsOne", object, "json", "json", findNews);
			});
			
			//返回上级
			function toBack() {
				window.location = "<%=basePath%>HomeController/fund";
			}
		</script>
	</body>

</html>