<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>

	<head>
		<base href="<%=basePath%>">
		<meta charset="UTF-8">
		<title>知识详情</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />

		<link href="css/mui.min.css" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="css/fonts/iconfont/iconfont.css" />
		<link rel="stylesheet" type="text/css" href="css/public.css" />
		<link rel="stylesheet" type="text/css" href="css/mainstyle.css" />
		<link rel="stylesheet" type="text/css" href="css/knowledge_detail.css">
		
	</head>

	<body>
		<!--主体-->
		<div class="mui-content">
			<!--搜索框-->
			<div class="search">
				<div class="search-left" onclick="toBack();">
					<i class="iconfont icon-left"></i>
				</div>
			</div>
			<!--知识列表-->
			<div class="detail" id="shangpingList">
				<!-- 
				<div class="title">	
					<img src="file/news/img/1536023920557.octet-stream" onerror="javascript:this.src='http://via.placeholder.com/360x150 '">	
					<div style="position: relative;padding: 5px 10px;">		
						<div class="data">2018-09-04</div>		
						<div class="interact">			
							<div class="yueduliang">
								<i class="iconfont shade icon-yueduliang"></i>&nbsp;&nbsp;<span>4</span>			
							</div>			
							<div class="dianzan" onclick="dianZan()">				
								<i class="iconfont shade icon-zan"></i>&nbsp;&nbsp;<span id="zan">0</span>			
							</div>		
						</div>	
					</div>	
					<h4>测试音频</h4>
				</div>
				
				<div class="detail-content">
					<div class="audio-box">
						<audio style="display: none;" src=""></audio>
						<div class="audio-btn"></div>
						<div class="audio-prosses">
							<div class="audio-prosses-bg">
								<div class="audio-prosses-bg-active"></div>
							</div>
						</div>
					</div>
					<div>
						<p>测试音频文件</p>
					</div>
				</div>
				-->
			</div> 
		</div>

		<script src="js/mui.min.js"></script>
		<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
		<script type="text/javascript" src="js/jquery.cookie.js"></script>
		<script type="text/javascript" src="js/ajax.js"></script>
		<script src="js/timestampToTime.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			//返回上级
			function toBack() {
				window.location = "<%=basePath%>weixin_news/article";
			}

			//获取url中的参数
			function getUrlParam(name) {
				var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
				var r = window.location.search.substr(1).match(reg); //匹配目标参数
				if(r != null) return unescape(r[2]);
				return null; //返回参数值
			}

			var news_type = 1;
			var news_id = getUrlParam("news_id");

			//在数组中查找所有出现的x，并返回一个包含匹配索引的数组
			function findall(a, x) {
				var results = [],
					len = a.length,
					pos = 0;
				while(pos < len) {
					pos = a.indexOf(x, pos);
					if(pos === -1) { //未找到就退出循环完成搜索
						break;
					}
					results.push(pos); //找到就存储索引
					pos += 1; //并从下个位置开始搜索
				}
				return results;
			}

			//点赞事件
			function dianZan() {
				var jsonNewid11 = $.cookie('jsonNewid');
				if(jsonNewid11 == null) {
					var jsonNewid = {
						"jsonNewid1": [],
						"jsonNewid2": [],
						"jsonNewid3": []
					};
					$.cookie('jsonNewid', JSON.stringify(jsonNewid), {
						expires: 10,
						path: "/"
					}); //过期时间7天
				}
				var jsonread = $.cookie('jsonNewid');
				var jsonNewid = JSON.parse(jsonread); //转对象
				var index = findall(jsonNewid.jsonNewid1, parseInt(news_id));
				if(index.length > 0) {
					mui.alert("你已经点赞了哦");
				} else {
					function thumbsUp(data) {
						if(data.state == 0) {
							var zainum = parseInt($("#zan").text()) + 1;
							$("#zan").html(zainum);
							jsonNewid.jsonNewid1.push(parseInt(news_id));
							$.cookie('jsonNewid', JSON.stringify(jsonNewid), {
								expires: 7,
								path: "/"
							}); //过期时间7天
						}
					}
					var paramData = {
						news_type: news_type,
						news_id: news_id
					};
					var object = JSON.stringify(paramData);
					ajaxPost("<%=basePath%>weixin_news/thumbsUp", object, "json", "json", thumbsUp);
				}
			}
			
			var paramData = {
				news_type: news_type,
				news_id: news_id
			};
			var object = JSON.stringify(paramData);
			ajaxPost("<%=basePath%>weixin_news/findNewsOne", object, "json", "json", findNews);
			ajaxPost("<%=basePath%>weixin_news/browseNum", object, "json", "json", function() {});
			
			function findNews(data) {
				var listGoods = data.newsDate.news;
				var pictures = listGoods.news_picture;
				pictures = pictures.split(";");
				var picture1 = pictures[0];
				var audioHtml = '';
				if(listGoods.news_mp3){
			       	audioHtml = '	<div class="audio-box">'+
						        '		<div class="audio-btn" audio-src="'+ listGoods.news_mp3 +'" onclick="playMusic(this)"></div>'+
						        '		<div class="audio-prosses">'+
						        '			<div class="audio-prosses-bg">'+
						        '				<div id="audioActive" class="audio-prosses-bg-active"></div>'+
						        '			</div>'+
						        '		</div>'+
						        '	</div>';
			    }
				var	Ahtml = '<div class="title">' +
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
					        '<div class="detail-content">'+ audioHtml +
					        '	<div>'+listGoods.detail_content + '</div>'+
					        '</div>';
				$("#shangpingList").append(Ahtml);
			}
			
			// 音乐播放器
			function playMusic(ele){
				var music = new Audio();
				music.src = ele.getAttribute('audio-src');
				music.load();
				// 获取音频总时长
				music.oncanplay = function () {
			     };
				music.play();
				var interval = setInterval(function() {
  				var widthline = Math.round(music.currentTime)/Math.round(music.duration) * 100;
				  	document.getElementById('audioActive').style.width = widthline + "%";
			    },1000);
			}
			
		</script>
	
</body>

</html>