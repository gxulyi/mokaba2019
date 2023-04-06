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
		<title>新增身份信息</title>
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
			.custom-table-view-cell{border-bottom: 1px solid #f0f0f0;position: relative;color: #46385A;}
			.custom-table-view-cell:last-child{border-bottom: none;}
			.custom-table-view-cell > a:not(.mui-btn) {position: relative;display: block;overflow: hidden;margin: -11px -15px;padding: inherit;white-space: nowrap;text-overflow: ellipsis;color: #46385A;}
			/*修改tableview背景色*/
			.mui-table-view::before{background-color: #f0f0f0 !important;}
			.mui-table-view::after{background-color: #f0f0f0 !important;}
			.mui-input-row label,.mui-input-row input[type=text],.mui-input-row section[name=sex],.mui-input-row input[type=number]{font-size: 14px;color:#333;}
			.mui-input-row label span{color: red;}
			.mui-input-row select {font-size: 14px;height: 37px; padding: 0;color: #666;}
			/*身份证信息提交按钮*/
			.submit-idcard-box{position: relative;clear: all;overflow: hidden;text-align: center;line-height: 1.8;margin-top: 20px;}
			.submit-idcard-box input[type=button]{background-color:#62bca3;color: white;border: none;border-radius: 5px;}
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
						    <label><span>*</span>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名: </label>
						    <input id="real_name" type="text" placeholder="真实姓名">
						</div>
		            </li>
		            
		            <li class="custom-table-view-cell">
		                <div class="mui-input-row">
						    <label><span>*</span>年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;龄: </label>
						    <input id="age" type="number" placeholder="年龄">
						</div>
		            </li>
		            <li class="custom-table-view-cell">
		                <div class="mui-input-row">
						    <label><span>*</span>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别:</label>
						   	<select id="sex" name="sex">
						   		<option>选择性别</option>
						   		<option value="1">男</option>
						   		<option value="0">女</option>
						   	</select>
						</div>
		            </li>
		            <li class="custom-table-view-cell">
		                <div class="mui-input-row">
						    <label><span>*</span>手机号码:</label>
						    <input id="tel_num" type="number" placeholder="手机号码">
						</div>
		            </li>
		            <li class="custom-table-view-cell">
		                <div class="mui-input-row">
						    <label><span>*</span>身份证号码:</label>
						    <input id="ID_card_num" type="text" placeholder="身份证号码">
						</div>
		            </li>
		           	<li class="custom-table-view-cell" style="display: none;">
		           		<div class="mui-input-row">
						    <label><span>*</span>有&nbsp;&nbsp;&nbsp;&nbsp;效&nbsp;&nbsp;&nbsp;期:</label>
						    <input id="validity" type="text" placeholder="身份证有效期">
						</div>
		            </li>
		           	<li class="custom-table-view-cell">
	           			<div class="mui-input-row">
						    <label><span>*</span>住&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址:</label>
						    <input id="original_address" type="text" placeholder="请填写和身份证一致">
						</div>
		            </li>
		        </ul>
				<div class="submit-idcard-box">
					<input type="button" onclick="submitIDCardInfo()" value="保存">
				</div>
			</div>
			
		</div>
		<script src="js/mui.min.js"></script>
		<script type="text/javascript" charset="UTF-8">
			
			window.onload=function(){
	  			var paramData;
			 	var paramData={"1":"1"};                               
			 	var object = JSON.stringify(paramData);
			  	ajaxPost("<%=basePath%>user_weixin/findUserInformOne",object,"json","json",showinfomart);
	   		};
		
			function showinfomart(vc){
				//alert(JSON.stringify(vc.object));
				var sex="";
				if(vc.information_sex==1){
					sex="男";
				}else if(vc.information_sex==0){
					sex="女";
				}else {
					sex="未知";
				}
				var vc=vc.object;
				document.getElementById("real_name").value=vc.information_compellation;
				//alert(vc.information_compellation);
				document.getElementById("age").value=vc.information_age;
				document.getElementById("sex").innerHTML='<option>' + sex + '</option><option value="1">男</option><option value="0">女</option>';
				document.getElementById("tel_num").value=vc.information_phone;
				document.getElementById("ID_card_num").value=vc.information_card;
				document.getElementById("validity").value=vc.card_end;
				document.getElementById("original_address").value=vc.registered_address;
			}
			
			// 提交身份信息
			function submitIDCardInfo(){
				var realName = document.getElementById('real_name').value;	// 真实姓名
				if(!realName){
					mui.alert("您的姓名为空，请填写...");
					return;
				}
				var age = document.getElementById('age').value; // 年龄
				if(!age){
					mui.alert("您的年龄为空，请填写...");
					return;
				}
				var sex = getSex();
				if(sex=='选择性别'){
					mui.alert("您的性别为空，请选择...");
					return;
				}
				
				var telNum = document.getElementById('tel_num').value; //身份证号码
				if(!telNum){
					mui.alert("您的手机号码为空，请填写...");
					return;
				}
				
				if(!is_TelPhoneNumber(telNum)){
					mui.alert("您的手机号码格式不正确，请填写...");
					return;	
				}
				var IDCardNum = document.getElementById('ID_card_num').value; //身份证号码
				if(!IDCardNum){
					mui.alert("您的身份证号码为空，请填写...");
					return;
				}
				if(!is_IDCard(IDCardNum)){
					return;
				}
				var validity = document.getElementById('validity').value; // 有效期
				/* if(!validity){
					mui.alert("您的身份证有效期为空，请填写...");
					return;
				} */
				var originalAddress = document.getElementById('original_address').value; // 住址
				if(!originalAddress){
					mui.alert("您的住址为空，请填写...");
					return;
				}
				var paramData;
			 	var paramData={information_compellation:realName,information_age:age,information_phone:telNum,information_card:IDCardNum,card_end:1,registered_address:originalAddress,information_sex:sex};                               
			 	var object = JSON.stringify(paramData);
			  	ajaxPost("<%=basePath%>user_weixin/updateUserInformation",object,"json","json",returnState);
			}
			
			function returnState(data){
				if(data.state==0){
					mui.alert("保存成功！");
					var page_url = './maid/personIdentityCard';
					window.location.href = page_url;
				}else{
					mui.alert("保存失败！");
					return;
				}
			}
			
			// 获取选择性别
			function getSex(){
	        	var objSex = document.getElementById("sex");
	        	var selectedSex = objSex.options[objSex.selectedIndex].value;
	        	return selectedSex;
	        }
			
			/**
			 * 判断是否是身份证
			 * @param {Object} cardnum  需要验证的身份证号码
			 */
			function is_IDCard(cardnum){ 
				// 身份证号码为15位或者18位，15位时全为数字，18位前17位为数字，最后一位是校验位，可能为数字或字符X 
				var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/; 
				if(reg.test(cardnum) === false){ 
					mui.alert("您输入的身份证号码不合法！请重新输入..."); 
					return false; 
				}else{
					return true;
				}
			}
			
			/**
			 * 手机号正则表达式
			 */
			 function is_TelPhoneNumber(telNum){
				 if(!(/^1[3|4|5|8][0-9]\d{4,8}$/.test(telNum))){ 
					 return false; 
				 }else{
				 	return true;
				 }
			 }
		</script>
	</body>

</html>
