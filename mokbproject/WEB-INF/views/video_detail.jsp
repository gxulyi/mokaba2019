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
		<title>视频详情</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		
		<link href="css/mui.min.css" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="css/fonts/iconfont/iconfont.css"/>
		<link rel="stylesheet" type="text/css" href="css/public.css"/>
		<link rel="stylesheet" type="text/css" href="css/mainstyle.css"/>
		<link rel="stylesheet" type="text/css" href="css/video_detail.css"/>
		
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
			
			<!--视频列表-->
			<div class="mdfd-content">
				<!--视频播放器-->
				<div class="media-box" id="shiping" >
					<script src='//player.polyv.net/script/polyvplayer.min.js'></script>
					<div id='video'></div>
				</div>
				
				<!--视频名称-->
				<div class="media-title-box">
					<h5 class="default-text-color" id="title"></h5>
					<p>
						<!-- <label class="default-text-color media-title-interact">
							<span>
								<i class="iconfont icon-yueduliang shade"></i>&nbsp;&nbsp;<span>1000</span>
							</span>
							<span id="dianzan">
								<i class="iconfont icon-zan shade"></i>&nbsp;&nbsp;<span id="zan">8000</span>
							</span>
						</label> -->
						<!-- <label class="media-title-data" id="riqi">2018-1-30</label> -->
					</p>
				</div>
				<!--简介-->
				<div class="media-abstract-box">
					<p class="text-align-c">—— 简介 ——</p>
					<p id="content"></p>
				</div>
				
				<!--评论-->
				<div class="media-comment-box">
					<p class="text-align-c">—— 评论 ——</p>
					<div id="mediaComment" class="media-comment-list">
						<!-- <div class="media-comment">
							<label class="media-comment-user-portrait">
								<img src="file/jointly/images/maid/default-portrait.png"/>
							</label>
							<h4 class="default-text-color media-comment-user-nickname">往事随风</h4>
							<p>测试视频评论</p>
							<p><label class="media-comment-user-data">2018.1.30</label></p>
						</div> -->
						
					</div>
				</div>
			</div>
			
			<div class="media-comment-submit-box">
				<form method="post">
					<div class="media-comment-submit">
						<input  type="text" id="evaluation_value" placeholder="说说你的看法..."/>
						<input id="newsid" value="" type="hidden"/>
					</div>
					<div class="media-comment-submit-btn">
						<input  type="button"  onclick="saveUserEvaluation();" value="发表"/>
					</div>
				</form>
			</div>
		</div>
		
		<script src="js/mui.min.js"></script>
		<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
		<script type="text/javascript" src="js/jquery.cookie.js"></script>
		<script type="text/javascript" src="js/ajax.js"></script>
		<script src="js/timestampToTime.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			//返回上级
			function toBack(){
				window.location="<%=basePath%>HomeController/video";
			}
			
			//获取url中的参数
	        function getUrlParam(name) {
	            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
	            var r = window.location.search.substr(1).match(reg);  //匹配目标参数
	            if (r != null) return unescape(r[2]); return null; //返回参数值
	        }
      	
			function findNews(data){
	    		var Ahtml="";
	            var listGoods=data.newsDate.news;
	            var pictures=listGoods.news_picture;
				pictures=pictures.split(";");
				var views=pictures[pictures.length-1];
				var newsid=views.slice(4);
				var picture1=pictures[0]; 
	          	$("#content").html(listGoods.detail_content);
	           	$("#title").html(listGoods.news_title);
	           	$("#page_title").html(listGoods.news_title);
	            $("#riqi").html(timestampToTime(listGoods.update_date));
	            $("#video").attr('id',views);
	            polyvObject("#"+views+"").videoPlayer({
				    'width':'100%',
				  	'height':'',
				    'vid' : newsid
				});
	            
			}      
	        
	        var news_type=4;
	       	var  news_id=getUrlParam("news_id");
	       	document.getElementById("newsid").value=news_id;//赋值id
	        var paramData={news_type:news_type,news_id:news_id};                               
		    var object = JSON.stringify(paramData);
		    ajaxPost("<%=basePath%>weixin_news/findNewsOne",object,"json","json",findNews);
			
	    	ajaxPost("<%=basePath%>weixin_news/findViewEvaluation",object,"json","json",findViewEvaluation);
			
			// 追加视频评论样式
	     	function findViewEvaluation(data){
	      		var Ahtml="";
	      		if(data.ned!=null){
	      			var listGoods=data.ned.listNewsEvaluation;
	           		for(var i=0;i<listGoods.length;i++){
	            		Ahtml += '<div class="media-comment">'+
	            			  	 '	<label class="media-comment-user-portrait">'+
	            			  	 '		<img src=""  onerror="javascript:this.src=\'http://via.placeholder.com/100X100\'"/>'+
	            			  	 '	</label>'+
	            			  	 '	<h4 class="default-text-color media-comment-user-nickname">'+ listGoods[i].weixin_nickname +'</h4>'+
	            			  	 '	<p>'+ listGoods[i].evaluation_value +'</p>'+
	            			  	 '	<p><label class="media-comment-user-data">'+ timestampToTime(listGoods[i].add_date) +'</label></p>'+
	            			  	 '</div>';
	            	}
	           		 $("#mediaComment").append(Ahtml);
	      		}
	            
	     	}
			
			// 提交视频评论
			function saveUserEvaluation(){
				if($("#evaluation_value").val()==null || $("#evaluation_value").val() == ''){
					mui.alert('请输入您的看法或意见...');
					return;
				}else if(isEmojiCharacter($("#evaluation_value").val())){
					mui.alert('包含非法字符，请重新输入...');
					document.getElementById('evaluation_value').value=null;
					return false;
				}
				var evaluation_value=$("#evaluation_value").val();
				var news_id=document.getElementById("newsid").value;
				var paramData={evaluation_value:evaluation_value,news_id:news_id,news_type:4,super_evaluation_id:52};
			   	var object = JSON.stringify(paramData);
		     	ajaxPost("<%=basePath%>weixin_news/addViewEvaluation",object,"json","json",finishAdd);
		  		document.getElementById('evaluation_value').value=null;
			}
			
			function finishAdd(data){
		  		if(data.state==0){
		  			alert("添加成功！");
		  		}
		  	}
			
			// 屏蔽特殊字符
			function isEmojiCharacter(substring) { 
		        for ( var i = 0; i < substring.length; i++) {  
		            var hs = substring.charCodeAt(i);  
		            if (0xd800 <= hs && hs <= 0xdbff) {  
		                if (substring.length > 1) {  
		                    var ls = substring.charCodeAt(i + 1);  
		                    var uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;  
		                    if (0x1d000 <= uc && uc <= 0x1f77f) {  
		                        return true;  
		                    }  
		                }  
		            } else if (substring.length > 1) {  
		                var ls = substring.charCodeAt(i + 1);  
		                if (ls == 0x20e3) {  
		                    return true;  
		                }  
		            } else {  
		                if (0x2100 <= hs && hs <= 0x27ff) {  
		                    return true;  
		                } else if (0x2B05 <= hs && hs <= 0x2b07) {  
		                    return true;  
		                } else if (0x2934 <= hs && hs <= 0x2935) {  
		                    return true;  
		                } else if (0x3297 <= hs && hs <= 0x3299) {  
		                    return true;  
		                } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030  
		                        || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b  
		                        || hs == 0x2b50) {  
		                    return true;  
		                }  
		            }  
		        }  
		    } 
		</script>
		
	</body>

</html>