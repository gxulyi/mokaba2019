<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../template/admin-header.jsp" %>

<!doctype html>
<html class="no-js">

	<head>
		<meta charset="utf-8">
		<base href="<%=basePath%>">
		<title>后台管理 添加公司</title>
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<link rel="icon" type="image/png" href="css/template/images/favicon.png">
		<link rel="apple-touch-icon-precomposed" href="css/template/images/app-icon72x72@2x.png">
		<link rel="stylesheet" href="css/template/amazeui.min.css" />
		<link rel="stylesheet" href="css/template/admin.css">
		<style type="text/css">
			.am-form,.am-form-group{
				position: relative;
			    clear: both;
			    overflow: hidden;
			}
			.am-u-sm-9 select{
				display: inline-block;
				margin-left: 5px;
				width: 32.5%;
			}
			.am-u-sm-9>select:first-child{
				margin-left: 0px;
			}
			.area-box,.am-u-sm-9 textarea{
				margin-bottom:20px;
			}
			
		</style>
	</head>
	<%@ include file="../template/admin-body-header.jsp" %>
	<!-- 内容头部 -->

	<body>
		<div class="am-cf admin-main">
			<%@ include file="../template/admin-body-sidebar.jsp" %>
			<!-- 侧边内容 -->
			<!-- content start -->
			<div class="admin-content">
				<%@ include file="../template/admin-content-heder.jsp" %>
				<!-- body 标题 -->
				<img style="width: 40px;height: 40px;cursor: pointer;position: absolute;top: 15px;right: 80px;" onclick="javascript:history.back(-1);" title="返回上一级" alt="" src="images/fhsyj.png">
				<div class="am-g">
					<div class="am-u-sm-12 am-u-md-4 am-u-md-push-8"></div>
					<div class="am-u-sm-12 am-u-md-8 am-u-md-pull-4">
						<div class="am-form">
						<!-- admin_company/addCompany -->
							<div class="am-form-group">
								<label class="am-u-sm-3 am-form-label" style="text-align: right;">品牌大使ID：</label>
								<div class="am-u-sm-9">
									<input type="text" placeholder="品牌大使ID" onchange="findUserInformation(this.value)" value="" id="user_basics_id">
								</div>
							</div>
							<div class="am-form-group" style="display:none" id="big_user_name">
								<label class="am-u-sm-3 am-form-label" style="text-align: right;">品牌大使真实姓名：</label>
								<div class="am-u-sm-9">
									<input type="text" id="big_user_name2" value="" readonly >
								</div>
							</div>
							<div class="am-form-group">
								<label class="am-u-sm-3 am-form-label" style="text-align: right;">公司ID：</label>
								<div class="am-u-sm-9">
									<input type="text" placeholder="公司ID" onchange="findComOne(this.value)" value="" id="user_basics_id_referee3">
								</div>
							</div>
							<div class="am-form-group" style="display:none" id="user_basics_id_referee">
								<label class="am-u-sm-3 am-form-label" style="text-align: right;">公司名称：</label>
								<div class="am-u-sm-9">
									<input type="text" id="user_basics_id_referee2" value="" readonly >
								</div>
							</div>
							<div class="am-form-group" style="display:none" id="user_basics_id_sup4">
								<label class="am-u-sm-3 am-form-label" style="text-align: right;">公司代理人编号：</label>
								<div class="am-u-sm-9">
									<input type="text" id="user_basics_id_sup3" value="" readonly >
								</div>
							</div>
							<div class="am-form-group" style="display:none" id="user_basics_id_sup">
								<label class="am-u-sm-3 am-form-label" style="text-align: right;">公司代理人真实姓名：</label>
								<div class="am-u-sm-9">
									<input type="text" id="user_basics_id_sup2" value="" readonly >
								</div>
							</div>
							<div class="am-form-group" style="text-align: center;">
								<input style="margin-left:25%;background:#55cbd2;border:none;color: #fff;border-radius:3px;padding:5px 20px;font-size:16px;" id="submitbutton" type="button" value="提  交" />
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="../template/admin-footer.jsp" %>
		<!-- 底部内容 -->
		<!--[if (gte IE 9)|!(IE)]><!-->
		<!-- <script src="js/template/jquery.min.js"></script> -->
		<script src="js/template/amazeui.min.js"></script>
		<!--<![endif]-->
		<script src="js/template/app.js"></script>
		<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
		<script type="text/javascript" src="js/jquery-form.js"></script>
		<script type="text/javascript" src="js/ajax.js"></script>
		<script src="js/jsAddress.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			var width = document.documentElement.clientWidth || document.body.clientWidth;
			$(".admin-content").css("width", width - 200);
			
			var status = '<%=request.getAttribute("status")%>';
			if(status == 0) {
				window.location.href = "<%=basePath%>weixinAdminController/iframeCompanyProfile";
			}
			
			window.onload = function() {
				//绑定提交按钮触发事件
				var submitForm = document.getElementById('submitForm'); //获取表单
				var submit = document.getElementById("submitbutton"); //获取提交按钮
				submit.onclick = function() { //提交按钮绑定点击事件
					var user_basics_id=document.getElementById("user_basics_id").value;//品牌大使编号
					var company_id=document.getElementById("user_basics_id_referee3").value;//公司编号
					var user_basics_id_sup=document.getElementById("user_basics_id_sup3").value;//公司编号
					var paramData={user_basics_id:user_basics_id,company_id:company_id,user_basics_id_sup:user_basics_id_sup};
					var object = JSON.stringify(paramData);
					ajaxPost("<%=basePath%>admin_company/adminAddCoFounder", object, "json", "json", success);
				};
			};
			
			function success(data){
				if(data.state==0){
					alert("添加成功!");
					window.location.href="<%=basePath%>admin_company/tofindCompanyBasicsDetails";
				}else if(data.state==-2){
					alert(data.message);
					return ;
				}else{
					alert("添加失败!");
				}
			}
			//查询品牌大使真实姓名
			function findUserInformation(user_basics_id) {
				var paramData;
				var paramData = {
					user_basics_id: user_basics_id
				};
				var object = JSON.stringify(paramData);
				ajaxPost("<%=basePath%>admin_user/findUserInformOne", object, "json", "json", showUserInfor);

			}
			//查询单个公司名称
			function findComOne(company_id) {
				if(company_id==1){
					alert("总公司不能添加品牌大使!");
					return;
				}
				var paramData;
				var paramData = {
					company_id: company_id
				};
				var object = JSON.stringify(paramData);
				ajaxPost("<%=basePath%>admin_company/findComOne", object, "json", "json", showComOne);
			}
			//展示单个公司名称
			function showComOne(data) {
				if(data.object == null) {
					alert("无该公司！");
					return;
				}
				var status_state=data.object.status_state;
				if(status_state!=0){
					alert("该公司未正常运行!");
					return;
				}
				var company_name = data.object.company_name;
				//alert(realName);
				//alert(realName);
				if(company_name == null) {
					alert("无该公司！");
					return;
				} else {
					document.getElementById("user_basics_id_referee2").value = company_name;
					document.getElementById("user_basics_id_referee").style.display = "block";
					document.getElementById("user_basics_id_sup3").value = data.object.user_basics_id;
					document.getElementById("user_basics_id_sup").style.display = "block";
					document.getElementById("user_basics_id_sup4").style.display = "block";
					var paramData;
					var paramData = {
						user_basics_id: data.object.user_basics_id
					};
					var object = JSON.stringify(paramData);
					ajaxPost("<%=basePath%>admin_user/findUserInformOne", object, "json", "json", showSupUser);
				}
			}
			function showSupUser(data){
			
				var realName = data.object.information_compellation;
				document.getElementById("user_basics_id_sup2").value = realName;
			}
			//查看用户是否实名认证
			function showUserInfor(data) {
				if(data.object == null) {
					alert("无该用户！");
					return;
				}
				var realName = data.object.information_compellation;
				if(realName == null) {
					alert("该用户未实名注册！");
					return;
				} else {
					document.getElementById("big_user_name2").value = realName;
					document.getElementById("big_user_name").style.display = "block";
				}
			}

		
		</script>
	</body>

</html>