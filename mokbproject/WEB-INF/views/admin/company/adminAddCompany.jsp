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
								<label class="am-u-sm-3 am-form-label" style="text-align: right;">代理商等级：</label>
								<div class="am-u-sm-9">
									<select onchange="findCompany(this.value)" id="company_lv"> 
										<option >选择代理商等级</option>
										<option value=2>省级代理</option>
										<option value=3>地区代理</option>
										<option value=4>县级代理</option>
									</select>
								</div>
							</div>
							<div class="am-form-group">
								<label class="am-u-sm-3 am-form-label" style="text-align: right;">代理商ID：</label>
								<div class="am-u-sm-9">
									<input type="text" placeholder="代理商ID" onchange="findUserInformation(this.value)" value="" id="user_basics_id">
								</div>
							</div>
							<div class="am-form-group" style="display:none" id="big_user_name">
								<label class="am-u-sm-3 am-form-label" style="text-align: right;">代理人真实姓名：</label>
								<div class="am-u-sm-9">
									<input type="text" id="big_user_name2" value="" readonly >
								</div>
							</div>
							<div class="am-form-group">
								<label class="am-u-sm-3 am-form-label" style="text-align: right;">推荐人ID：</label>
								<div class="am-u-sm-9">
									<input type="text" placeholder="没有推荐人则不填" onchange="findUserReferee(this.value)" value="" id="user_basics_id_referee3">
								</div>
							</div>
							<div class="am-form-group" style="display:none" id="user_basics_id_referee">
								<label class="am-u-sm-3 am-form-label" style="text-align: right;">推荐人真实姓名：</label>
								<div class="am-u-sm-9">
									<input type="text" id="user_basics_id_referee2" value="" readonly >
								</div>
							</div>
							<div class="am-form-group">
								<label class="am-u-sm-3 am-form-label" style="text-align: right;">代理商管理奖：</label>
								<div class="am-u-sm-9">
									<select id="if_founder"> 
										<option >代理商是否拿管理费</option>
										<option value=1>可以拿</option>
										<option value=2>不能拿</option>
									</select>
								</div>
							</div>
							<div class="am-form-group">
								<label class="am-u-sm-3 am-form-label" style="text-align: right;">代理名称：</label>
								<div class="am-u-sm-9">
									<input type="text" placeholder="代理名称" id="company_name">
								</div>
							</div>
							
							<div class="am-form-group">
								<label class="am-u-sm-3 am-form-label" style="text-align: right;">联系电话：</label>
								<div class="am-u-sm-9">
									<input type="text" placeholder="公司联系电话" id="company_telephone">
								</div>
							</div>
							<div class="am-form-group">
								<label class="am-u-sm-3 am-form-label" style="text-align: right;">代理账户号：</label>
								<div class="am-u-sm-9">
									<input type="text" placeholder="公司账户号" id="company_account">
								</div>
							</div>
							<div class="am-form-group">
								<label class="am-u-sm-3 am-form-label" style="text-align: right;">所在地：</label>
								<div class="am-u-sm-9 area-box">
									<select id="cmbProvince"></select>
									<select id="cmbCity"></select>
									<select id="cmbArea"></select>
								</div>
								<div class="am-u-sm-9">
									<textarea rows="2" cols="20" placeholder="详细地址" id="company_address"></textarea>
								</div>
							</div>
							<div class="am-form-group" style="margin-bottom:20px;">
								<label class="am-u-sm-3 am-form-label" style="text-align: right;">上级公司：</label>
								<div class="am-u-sm-9" id="superCom">
								<!-- 
									<div class="am-u-sm-6">
										<input type="radio" name="superior" />
									</div>
									 -->
								</div>
							</div>
							<div class="am-form-group">
								<label class="am-u-sm-3 am-form-label" style="text-align: right;">下级公司：</label>
								<div class="am-u-sm-9" id="lowCom">
									<!-- <div class="am-u-sm-6">
										<input type="checkbox" name="subordinate"/>测试测试测试测试测试测试测试
									</div>
									 -->
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
			
				// 省市县三级联动
				addressInit('cmbProvince', 'cmbCity', 'cmbArea', '贵州', '贵阳市', '南明区');
				
				//绑定提交按钮触发事件
				var submitForm = document.getElementById('submitForm'); //获取表单
				var submit = document.getElementById("submitbutton"); //获取提交按钮
				submit.onclick = function() { //提交按钮绑定点击事件
					//alert(GetSelectVal('cmbProvince')+GetSelectVal('cmbCity')+GetSelectVal('cmbArea'));
					var company_province=GetSelectVal('cmbProvince');
					var urban_district=GetSelectVal('cmbCity');
					var area=GetSelectVal('cmbArea');
					var user_basics_id=document.getElementById("user_basics_id").value;
					var user_basics_id_referee=document.getElementById("user_basics_id_referee3").value;
					//alert(user_basics_id);
					var company_name=document.getElementById("company_name").value;
					var company_telephone=document.getElementById("company_telephone").value;
					var company_account=document.getElementById("company_account").value;
					var company_address=document.getElementById("company_address").value;
					var super_company_id=$('input:radio[name="superior"]:checked').val();
					var if_founder=$("#if_founder option:selected").val();
					obj = document.getElementsByName("subordinate");
					var company_lv= $("#company_lv option:selected").val();
    	  			low_company_id ="";
  	      			for(i in obj){
          				if(obj[i].checked){
           					if(low_company_id==""){
           						low_company_id=obj[i].value;
           					}else{
           						low_company_id+=";"+obj[i].value;
           					}
             
           				}
    	  			}
					paramData={company_province:company_province,urban_district:urban_district,area:area,user_basics_id:user_basics_id,company_name:company_name,company_telephone:company_telephone,company_account:company_account,company_address:company_address,super_company_id:super_company_id,low_company_id:low_company_id,company_lv:company_lv,if_founder:if_founder,user_basics_id_referee:user_basics_id_referee};
					var object = JSON.stringify(paramData);
					ajaxPost("<%=basePath%>admin_company/addCompanySubsidiary", object, "json", "json", success);
				};
			};
			
			function success(data){
				if(data.state==0){
					alert("添加成功!");
					window.location.href="<%=basePath%>admin_company/tofindCompanyBasics";
				}else{
					alert("添加失败!");
				}
			}
			// 获取下拉框选中值
			function GetSelectVal(id){
				var obj = document.getElementById(id); //定位id
				var index = obj.selectedIndex; // 选中索引
				var value = obj.options[index].value; // 选中值
				return value;
			}
			
			// 获取复选框选中的值
			function checkBox(){
				
			}
			//查询代理人真实姓名
			function findUserInformation(user_basics_id) {
				var paramData;
				var paramData = {
					user_basics_id: user_basics_id
				};
				var object = JSON.stringify(paramData);
				ajaxPost("<%=basePath%>admin_user/findUserInformOne", object, "json", "json", showUserInfor);

			}
			//查询推荐人真实姓名
			function findUserReferee(user_basics_id) {
				var paramData;
				var paramData = {
					user_basics_id: user_basics_id
				};
				var object = JSON.stringify(paramData);
				ajaxPost("<%=basePath%>admin_user/findUserInformOne", object, "json", "json", showUserReferee);

			}
			
			function showUserReferee(data) {
				if(data.object == null) {
					alert("无该用户！");
					return;
				}
				var realName = data.object.information_compellation;
				//alert(realName);
				//alert(realName);
				if(realName == null) {
					alert("该用户未实名注册！");
					return;
				} else {
					document.getElementById("user_basics_id_referee2").value = realName;
					document.getElementById("user_basics_id_referee").style.display = "block";
				}
			}
			
			function showUserInfor(data) {
				if(data.object == null) {
					alert("无该用户！");
					return;
				}
				var realName = data.object.information_compellation;
				//alert(realName);
				//alert(realName);
				if(realName == null) {
					alert("该用户未实名注册！");
					return;
				} else {
					document.getElementById("big_user_name2").value = realName;
					document.getElementById("big_user_name").style.display = "block";
				}
			}

			function verifyCheck(submitForm) {
				//var inputs =submitForm.getElementsByTagName("input");
				var user_basics_id = document.getElementById('user_basics_id').value;
				if(user_basics_id == "") {
					alert("请输入用户编号！");
					return false;
				}
				var user_basics_name = document.getElementById('user_basics_name').value;
				if(user_basics_name == "") {
					alert("用户资料不全，请通知用户补充身份信息！");
					return false;
				}
				var company_address = document.getElementById('company_address').value;
				if(company_address == "") {
					alert("请输入分公司所在地址！");
					return false;
				}
				return true;
			}
			function findCompany(data){
			var data=parseInt(data);
				var paramData;
				var company_province=GetSelectVal('cmbProvince');
				paramData={company_lv:data-1,company_province:company_province};
				var object = JSON.stringify(paramData);
				ajaxPost("<%=basePath%>admin_company/findCompany", object, "json", "json", showSuper);
				
				var paramData2={company_lv:data+1,company_province:company_province};
				var object2 = JSON.stringify(paramData2);
				//alert(JSON.stringify(object2));
				ajaxPost("<%=basePath%>admin_company/findCompany", object2, "json", "json", showlow);
			}
			function showSuper(data){
				var company_lv= $("#company_lv option:selected").val();
				var objects=data.object;
				var str="";
				for(var i=0;i<objects.length;i++){
					var object=objects[i];
					var lv=object.company_lv;
					if(lv>=company_lv){
						continue;
					}
					var company_name=object.company_name;
					var company_id=object.company_id;
					str += "<div class='am-u-sm-6'>"+
						   "	<input type='radio' name='superior' value='"+company_id+"'/>"+company_name+
						   "</div>";
				}
				document.getElementById("superCom").innerHTML=str;
			}
			function showlow(data){
				var company_lv= $("#company_lv option:selected").val();
				var objects=data.object;
				var str="";
				for(var i=0;i<objects.length;i++){
					var object=objects[i];
					var lv=object.company_lv;
					if(lv<=company_lv){
						continue;
					}
					company_name=object.company_name;
					var company_id=object.company_id;
					str += "<div class='am-u-sm-6'>"+
						   "	<input type='checkbox' name='subordinate' value='"+company_id+"'/>"+company_name+""+
						   "</div>";
				}
				document.getElementById("lowCom").innerHTML=str;
			}
		</script>
	</body>

</html>