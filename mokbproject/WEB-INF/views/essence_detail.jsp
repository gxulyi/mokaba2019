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
		<title>精华详情</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		
		<link href="css/mui.min.css" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="css/fonts/iconfont/iconfont.css"/>
		<link rel="stylesheet" type="text/css" href="css/public.css"/>
		<link rel="stylesheet" type="text/css" href="css/mainstyle.css"/>
		<link rel="stylesheet" type="text/css" href="css/essence_detail.css"/>
		
		<style type="text/css">
			p{
				margin-bottom:0px;
			}
		</style>
		
	</head>
		
	<body>
		<!--主体-->
		<div class="mui-content">
			<!--搜索框-->
			<div class="search">
				<div class="search-left" onclick="toBack();">
					<i class="iconfont icon-left"></i>
				</div>
				<div class="search-center">
					<h4 class="default-text-color"></h4>
				</div>
			</div>
			<!--知识列表-->
			<div class="detail" id="jinghua"></div>
			
			<div class="essence-comment-box" id="shangpingList1111">
				<p class="text-align-c">——评论——</p>
			<!-- <div class="essence-comment-list">
					<h5>往事随风</h5>
					<div class="essence-comment-user-portrait">
						<img src="file/jointly/images/maid/default-portrait.png"/>
					</div>
					<p class="essence-comment-content">楼主说得好！！！</p>
					<p class="text-align-r essence-comment-content">2018-1-30</p>
				</div>
				
				<div class="essence-comment-list">
					<h5>往事随风</h5>
					<div class="essence-comment-user-portrait">
						<img src="file/jointly/images/maid/default-portrait.png"/>
					</div>
					<p class="essence-comment-content">楼主说得好！！！</p>
					<p class="text-align-r essence-comment-content">2018-1-30</p>
				</div>
				
				<div class="essence-comment-list">
					<h5>往事随风</h5>
					<div class="essence-comment-user-portrait">
						<img src="file/jointly/images/maid/default-portrait.png"/>
					</div>
					<p class="essence-comment-content">楼主说得好！！！</p>
					<p class="text-align-r essence-comment-content">2018-1-30</p>
				</div>
				 -->	
				
			</div>
			<div class="essence-comment-submit-box">
				<form action="" method="post">
					<div class="essence-comment-submit">
						<input  type="text" id="evaluation_value" placeholder="说说你的看法..."/>
					</div>
					<div class="essence-comment-submit-btn">
						<input  type="button" onclick="addNewsEvaluation1111()" value="发表"/>
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
			function toBack() {
				window.location = "<%=basePath%>HomeController/essence";
			}
			//获取url中的参数
	        function getUrlParam(name) {
	            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
	            var r = window.location.search.substr(1).match(reg);  //匹配目标参数
	            if (r != null) return unescape(r[2]); return null; //返回参数值
	        }
	       
			var news_type;
			function findNews(data){
			    var Ahtml="";
				var listGoods=data.newsDate.news;
				var pictures=listGoods.news_picture;
				pictures=pictures.split(";");
				var picture1=pictures[0];
				news_type = listGoods.news_type;
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
			     $("#jinghua").append(Ahtml);
			}
	        var  news_id=getUrlParam("news_id");
	        var paramData={news_id:news_id};                               
		    var object = JSON.stringify(paramData);
		    ajaxPost("<%=basePath%>weixin_news/findNewsOne",object,"json","json",findNews);
		    ajaxPost("<%=basePath%>weixin_news/findEssenceEvaluation",object,"json","json",findEssenceEvaluation);
		    
			function findEssenceEvaluation(data){
				var Ahtml='';
				var listGoods=data.ned.listNewsEvaluation;
				for(var i=0;i<listGoods.length;i++){
					Ahtml += '<div class="essence-comment-list">'+
							 '	<h5>'+listGoods[i].weixin_nickname+'</h5>'+
							 '	<div class="essence-comment-user-portrait">'+
							 '		<img src="'+listGoods[i].weixin_portrait+'" onerror="javascript:this.src=\'http://via.placeholder.com/50X50\'"/>'+
							 '	</div>'+
							 '	<p class="essence-comment-content">'+listGoods[i].evaluation_value+'</p>'+
							 '	<p class="text-align-r essence-comment-content">'+timestampToTime(listGoods[i].add_date)+'</p>'+
							 '</div>';
			     }
			   	$("#shangpingList1111").append(Ahtml);
			}
			
			function addNewsEvaluation1111(){
				if($("#evaluation_value").val()==null || $("#evaluation_value").val() == ''){
					mui.alert('请输入您的看法或意见...');
					return;
				}else if(isEmojiCharacter($("#evaluation_value").val())){
					mui.alert('包含非法字符，请重新输入...');
					document.getElementById('evaluation_value').value=null;
					return false;
				}
				paramData["evaluation_value"]=$("#evaluation_value").val();
				paramData["super_evaluation_id"]=53;
				paramData["news_type"]=news_type;
				object = JSON.stringify(paramData);
				ajaxPost("<%=basePath%>weixin_news/addEssenceEvaluation",object,"json","json",addEssenceEvaluation);
				function addEssenceEvaluation(data){
					if(data.state==0){
			  		location.reload();
				  	}else{
				  		alert("服务器繁忙，请稍后再试...");
				  	}
			  	}
			}
			
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
