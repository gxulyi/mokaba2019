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
		<title>个人资料</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<script type="text/javascript" src="js/ajax.js"></script>
		<link href="css/mui.min.css" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="css/fonts/iconfont/iconfont.css"/>
		<link rel="stylesheet" type="text/css" href="css/public.css"/>
		<link rel="stylesheet" type="text/css" href="css/mainstyle.css"/>
		<style type="text/css">
			/*自定义TableView*/
			.mui-table-view{background-color: #fff !important;border: none;}
			/*自定义tableview样式*/
			.mui-content > .mui-table-view:first-child {margin-top: 0px !important;}
			/*自定义cell样式*/
			.custom-table-view-cell{border-bottom: 1px solid #f0f0f0;padding: 11px 15px;position: relative;color: #000;}
			.custom-table-view-cell > a:not(.mui-btn) {position: relative;display: block;overflow: hidden;margin: -11px -15px;padding: inherit;white-space: nowrap;text-overflow: ellipsis;color: #000;font-size: 16px;}
			/*修改tableview背景色*/
			.mui-table-view::before{background-color: #f0f0f0 !important;}
			.mui-table-view::after{background-color: #f0f0f0 !important;}
			.updata-person-info-box{position: relative;clear: all;overflow: hidden;text-align: center;line-height: 1.8;margin-top: 20px;}
			.updata-person-info-box input[type=button]{background-color: #62bca3;color: white;border: none;border-radius: 5px;}
			.custom-table-view-cell span{font-size: 14px;color:#666;}
		</style>
	</head>

	<body>
		<div class="mui-content">
			<!--搜索框-->
			<div class="search border-red">
				<div class="search-left mui-action-back">
					<i class="iconfont icon-left"></i>
				</div>
			</div>
			
			<div class="mdfd-content">
				<ul class="mui-table-view">
		            <li class="custom-table-view-cell">
		                <a>
		              		昵&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称：<span id="nick_name">昵称</span>
		                </a>
		            </li>
		            
		            <li class="custom-table-view-cell">
		                <a>
		              		QQ&nbsp;&nbsp;号&nbsp;&nbsp;&nbsp;码：<span id="qq_num">电话</span>
		                </a>
		            </li>
		            <li class="custom-table-view-cell">
		                <a>
		              		微&nbsp;&nbsp;&nbsp;&nbsp;信&nbsp;&nbsp;&nbsp;号：<span id="weixin_num">微信号</span>
		                </a>
		            </li>
		            <li class="custom-table-view-cell">
		                <a>
		              		邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱：<span id="email">邮箱</span>
		                </a>
		            </li>
		           	<li class="custom-table-view-cell">
		                <a>
		              		居&nbsp;&nbsp;&nbsp;&nbsp;住&nbsp;&nbsp;&nbsp;地：<span id="live_address">居住地</span>
		                </a>
		            </li>
		           	<li class="custom-table-view-cell">
		                <a>
		              		户籍所在地：<span id="old_address">户籍所在地</span>
		                </a>
		            </li>
		        </ul>
				<div class="updata-person-info-box">
					<input id="person_updata" type="button" value="修改资料">
				</div>
			</div>
			
		</div>
		<script src="js/mui.min.js"></script>
		<script type="text/javascript">
			function showinfomart(vc){
				var vc=vc.object;
				if(vc){
					document.getElementById("nick_name").innerHTML=vc.nick_name;
					document.getElementById("qq_num").innerHTML=vc.information_qq;
					document.getElementById("weixin_num").innerHTML=vc.information_weixin;
					document.getElementById("email").innerHTML=vc.information_Email;
					document.getElementById("live_address").innerHTML=vc.live_address;
					document.getElementById("old_address").innerHTML=vc.registered_address;
				}
			}
			
			function onloadd(){
	 	 		var paramData;
	 		 	var paramData={"1":"1"};                               
	 		 	var object = JSON.stringify(paramData);
	  		 	ajaxPost("<%=basePath%>user_weixin/findUserInformOne",object,"json","json",showinfomart);
	   		};
	   		
	 	  	window.onload=function(){
	  			onloadd();
	  	 	};
	  	 	
			(function($,doc){
				$.init();
				// 列表点击事件
				doc.getElementById('person_updata').addEventListener('tap',function(){
					window.location.href = './maid/personUpdata';
				},false);
				
			})(mui,document);
		</script>
	</body>

</html>