<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ include file="../template/admin-header.jsp" %><!-- htnl头部文件 -->

<!doctype html>
<html class="no-js">
<head>
  <meta charset="utf-8">
  <base href="<%=basePath%>">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <script type="text/javascript" src="js/jquery-1.7.1.js"></script>
  <script type="text/javascript" src="js/jquery-form.js" ></script> 
  <script type="text/javascript" src="js/ajax.js"></script>
  <title>后台管理 添加商品</title>
  <script type="text/javascript">
	window.onload=function(){//大括号内为页面加载完成后执行
    	//绑定提交按钮触发事件
    	var submitForm = document.getElementById('submitForm');//获取表单
    	var submit = document.getElementById('submitbutton');//获取提交按钮
    	submit.onclick = function(){//提交按钮绑定点击事件
        	if(verifyCheck(submitForm)){//验证前端数据，返回true提交表单
          	submitForm.submit();//提交表单
        	}else{
        		location.reload(true);
        	}
    	};
  	};
  
  	function alter_page_tier(select){//改变记录页面层数的值
    	var index=select.selectedIndex;//获取选中option的下标
   		var option=select.options[index];//以下标获取到选中option
     	var page_tier= option.getAttribute("page_tier");//获取自定义属性（记录为选中上级菜单的层数等级）；
     	document.getElementById("page_tier").value=parseInt(page_tier)+1;//将页面层数赋值为上级菜单层数+1
  	}

    function verifyCheck(submitForm){
    	//var inputs =submitForm.getElementsByTagName("input");
    	var user_nickname=document.getElementById('user_nickname').value;
    	if(user_nickname==""){
    		alert("请输入用户昵称");
    		return false;
    	}else{
    		return true;
    	}        
    }
  </script>
  <meta name="description" content="这是一个 index 页面">
  <meta name="keywords" content="index">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="icon" type="image/png" href="css/template/images/favicon.png">
  <link rel="apple-touch-icon-precomposed" href="css/template/images/app-icon72x72@2x.png">
  <meta name="apple-mobile-web-app-title" content="Amaze UI" />
  <link rel="stylesheet" href="css/template/amazeui.min.css"/>
  <link rel="stylesheet" href="css/template/admin.css">
</head>
<%@ include file="../template/admin-body-header.jsp" %><!-- 内容头部 -->
<body>
	<div class="am-cf admin-main">
    <%@ include file="../template/admin-body-sidebar.jsp" %><!-- 侧边内容 -->
  	<!-- content start -->
  		<div class="admin-content">
		<%@ include file="../template/admin-content-heder.jsp" %><!-- body 标题 -->
			<img style="width: 40px;height: 40px;cursor: pointer;position: absolute;top: 15px;right: 80px;"onclick="javascript:history.back(-1);" title="返回上一级" alt="" src="images/fhsyj.png">
			<div class="am-g">
      			<div class="am-u-sm-12 am-u-md-4 am-u-md-push-8"></div>
      			<div class="am-u-sm-12 am-u-md-8 am-u-md-pull-4">
        			<form id="submitForm" class="am-form " method="post" action="admin_user/addUser">
         				<!--  
         				<div class="am-form-group">
            				<label for="user-name" class="am-u-sm-3 am-form-label">公司老总</label>
            				<div class="am-u-sm-9">
              					<select onchange="alter_page_tier(this)" name="page_superior_id" id="page_superior_id1" style="width: 180px">
                  					<option value="0">选择公司老总</option>
              					</select>
              					<input name="page_tier" id="page_tier" type="hidden" value="1">
            				</div>
          				</div>
          				-->
           				<div class="am-form-group">
            				<label for="user-name" class="am-u-sm-3 am-form-label" style="text-align: right;">用户昵称：</label>
           					<div class="am-u-sm-9">
             					<input style="width: 260px" type="text" name="user_nickname" id="user_nickname" placeholder="输入用户昵称/账号" value="">
           					</div>
				        </div>
				        &nbsp;&nbsp;&nbsp;
				        <div class="am-form-group">
			            	<label for="user-name" class="am-u-sm-3 am-form-label" style="text-align: right;">用户推荐人：</label>
			            	<div class="am-u-sm-9">
			              		<input style="width: 260px" id="recommend_superior" type="text" name="recommend_superior"  placeholder="用户推荐人" value="">
			            	</div>
			          	</div>
						<!--  
						<div class="am-form-group">
							<label for="user-name" class="am-u-sm-3 am-form-label">用户所在公司</label>
								<div class="am-u-sm-9">
									<input style="width: 170px" id="company_id" type="text" name="company_id"  placeholder="用户所在公司" value="">
								</div>
							</div>
						</div>
						-->
						&nbsp;&nbsp;&nbsp;
           				<div class="am-form-group">
            				<label for="user-name" class="am-u-sm-3 am-form-label" style="text-align: right;">用户密码：</label>
            				<div class="am-u-sm-9">
             	 				<input style="width: 260px" id="user_password" type="text" name="user_password" placeholder="输入用户密码" value="">
            				</div>
          				</div>
          				&nbsp;&nbsp;&nbsp;
           				<div class="am-form-group">
            				<label for="user-name" class="am-u-sm-3 am-form-label" style="text-align: right;">真实姓名：</label>
            				<div class="am-u-sm-9">
              					<input style="width: 260px" type="text" name="information_compellation" id="information_compellation" placeholder="输入真实姓名" value="">
            				</div>
          				</div>
          				&nbsp;&nbsp;&nbsp;
          				<div class="am-form-group">
            				<label for="user-name" class="am-u-sm-3 am-form-label" style="text-align: right;">手机号码：</label>
            				<div class="am-u-sm-9">
              					<input style="width: 260px" id="information_phone" type="text" name="information_phone"  placeholder="手机号码" value="">
            				</div>
          				</div>
          				&nbsp;&nbsp;&nbsp;
          				<div class="am-form-group">
            				<label for="user-name" class="am-u-sm-3 am-form-label" style="text-align: right;">身份证号：</label>
           					<div class="am-u-sm-9">
             						<input style="width: 260px" id="information_card" type="text" name="information_card"  placeholder="身份证号" value="">
           					</div>
         				</div>
         				&nbsp;&nbsp;&nbsp;
						<div class="am-form-group">
            				<label for="user-name" class="am-u-sm-3 am-form-label" style="text-align: right;">电子邮箱：</label>
            				<div class="am-u-sm-9">
              					<input style="width: 260px" id="information_Email" type="text" name="information_Email"  placeholder="电子邮箱" value="">
            				</div>
         				</div>
         				&nbsp;&nbsp;&nbsp;
          				<div class="am-form-group">
            				<label for="user-name" class="am-u-sm-3 am-form-label" style="text-align: right;">QQ号码：</label>
            				<div class="am-u-sm-9">
              					<input style="width: 260px" id="information_qq" type="text" name="information_qq"  placeholder="qq号码" value="">
            				</div>
         				</div>
         				&nbsp;&nbsp;&nbsp;
          				<div class="am-form-group">
             				<input style="margin-left:25%;background:#55cbd2;border:none;color: #fff;border-radius:3px;padding:5px 10px;" id="submitbutton" type="button" value="提交" />
          				</div>    
        			</form>
      			</div>
    		</div>
  		</div>
 </div>
<%@ include file="../template/admin-footer.jsp" %><!-- 底部内容 -->
<!--[if (gte IE 9)|!(IE)]><!-->
<!-- <script src="js/template/jquery.min.js"></script> -->
<script src="js/template/amazeui.min.js"></script>
<!--<![endif]-->
<script src="js/template/app.js"></script>
<script type="text/javascript">
	var width = document.documentElement.clientWidth || document.body.clientWidth;
	$(".admin-content").css("width",width-200);
</script>
</body>
</html>
