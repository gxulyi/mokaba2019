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
		<title>修改个人资料</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<script type="text/javascript" src="js/ajax.js"></script>
		<link href="css/mui.min.css" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="css/fonts/iconfont/iconfont.css"/>
		<link rel="stylesheet" type="text/css" href="css/public.css"/>
		<link rel="stylesheet" type="text/css" href="css/mainstyle.css"/>
		<style type="text/css">
			/*自定义TableView*/
			.mui-table-view{background-color: #fff !important;border: none;padding: 0 5px;margin-bottom: 10px;}
			/*自定义tableview样式*/
			.mui-content > .mui-table-view:first-child {margin-top: 0px !important;}
			/*自定义cell样式*/
			.custom-table-view-cell{border-bottom: 1px solid #f0f0f0;/*padding: 11px 15px;*/position: relative;color: #46385A;}
			.custom-table-view-cell:last-child{border-bottom: none;}
			.custom-table-view-cell > a:not(.mui-btn) {position: relative;display: block;overflow: hidden;margin: -11px -15px;padding: inherit;white-space: nowrap;text-overflow: ellipsis;color: #46385A;}
			/*修改tableview背景色*/
			.mui-table-view::before{background-color: #f0f0f0 !important;}
			.mui-table-view::after{background-color: #f0f0f0 !important;}
			.submit-personinfo-box{position: relative;clear: all;overflow: hidden;text-align: center;line-height: 1.8;margin-top: 20px;}
			.submit-personinfo-box input[type=button]{background-color:#62bca3;color: white;border: none;border-radius: 5px;}
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
		                <div class="mui-input-row">
						    <label>昵&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称: </label>
						    <input id="nick_name" type="text" value="昵称">
						</div>
		            </li>
		            
		            <li class="custom-table-view-cell">
		                <div class="mui-input-row">
						    <label>QQ&nbsp;&nbsp;号&nbsp;&nbsp;&nbsp;码: </label>
						    <input id="qq_num" type="number" value="QQ">
						</div>
		            </li>
		            <li class="custom-table-view-cell">
		                <div class="mui-input-row">
						    <label>微&nbsp;&nbsp;&nbsp;&nbsp;信&nbsp;&nbsp;&nbsp;号:</label>
						    <input id="weichat_num" type="text" value="微信号">
						</div>
		            </li>
		            <li class="custom-table-view-cell">
		                <div class="mui-input-row">
						    <label>邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱:</label>
						    <input id="email_num" type="text" value="邮箱">
						</div>
		            </li>
		           	<li class="custom-table-view-cell">
		           		<div class="mui-input-row">
						    <label>居&nbsp;&nbsp;&nbsp;&nbsp;住&nbsp;&nbsp;&nbsp;地:</label>
						    <input id="now_address" type="text" value="居住地">
						</div>
		            </li>
		           	<li class="custom-table-view-cell">
	           			<div class="mui-input-row">
						    <label>户籍所在地:</label>
						    <input id="place_domicile" type="text" value="户籍所在地">
						</div>
		            </li>
		        </ul>
				<div class="submit-personinfo-box">
					<input type="button" value="保存" onclick="savePersonInfoData()">
				</div>
			</div>
			
		</div>
		<script src="js/mui.min.js"></script>
		<script type="text/javascript">
			
			function onloadd(){
	 	 	var paramData;
	 		 var paramData={"1":"1"};                               
	 		 var object = JSON.stringify(paramData);
	  		 ajaxPost("<%=basePath%>user_weixin/findUserInformOne",object,"json","json",showinfomart);
	   		 };
	 	  	window.onload=function(){
	  			onloadd();
	  	 	};
	  	 	
			function savePersonInfoData(){
				var nickName = document.getElementById('nick_name').value;//昵称
				if (!nickName) {
					mui.alert('您的昵称为空，请输入...');
					return;
				}
				var qqNum = document.getElementById('qq_num').value;// QQ号码
				if (!qqNum) {
					mui.alert('您的qq号为空，请输入...');
					return;
				}
				var weichatNum = document.getElementById('weichat_num').value;//微信号
				if (!weichatNum) {
					mui.alert('您的微信号为空，请输入...');
					return;
				}
				var emailNum = document.getElementById('email_num').value;//邮箱
				if (!emailNum) {
					mui.alert('您的邮箱号为空，请输入...');
					return;
				}
				if(!is_Email(emailNum)){
					mui.alert('您输入的邮箱号不正确，请重新输入...');
					return;
				}
				var nowAddress = document.getElementById('now_address').value;//现居地
				if (!nowAddress) {
					mui.alert('您的居住地为空，请输入...');
					return;
				}
				var placeDomicile = document.getElementById('place_domicile').value;//户籍所在地
				if (!placeDomicile) {
					mui.alert('您的户籍所在地为空，请输入...');
					return;
				}
				
				var paramData;
			 	var paramData={nick_name:nickName,information_qq:qqNum,information_weixin:weichatNum,information_Email:emailNum,live_address:nowAddress,registered_address:placeDomicile};                               
			 	var object = JSON.stringify(paramData);
			  	ajaxPost("<%=basePath%>user_weixin/updateUserInformation",object,"json","json",returnState);
			}
			function returnState(data){
			//alert(JSON.stringify(data));
				if(data.state==0){
					alert("保存成功！");
					var page_url = './maid/personData';
					window.location.href = page_url;
				}else{
					alert("保存失败！");
				}
			}
			function showinfomart(vc){
				var vc=vc.object;
				document.getElementById("nick_name").value=vc.nick_name;
				document.getElementById("qq_num").value=vc.information_qq;
				document.getElementById("weichat_num").value=vc.information_weixin;
				document.getElementById("email_num").value=vc.information_Email;
				document.getElementById("now_address").value=vc.live_address;
				document.getElementById("place_domicile").value=vc.registered_address;
			}
			/**
			 * 验证是否是邮箱号
			 * @param {Object} emailNum
			 */
			function is_Email(emailNum){
				var emailReg=/^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z0-9]{2,6}$/;
				var isTrue=emailReg.test(emailNum);
				if (isTrue) {
					return true;
				} else{
					return false;
				}
			}
		</script>
	</body>

</html>