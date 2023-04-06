<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="css/shop.css" type="text/css" rel="stylesheet" />
<link href="skin/default/skin.css" rel="stylesheet" type="text/css" id="skin" />
<link href="css/Sellerber.css" type="text/css"  rel="stylesheet" />
<link href="css/bkg_ui.css" type="text/css"  rel="stylesheet" />
<link href="font/css/font-awesome.min.css"  rel="stylesheet" type="text/css" />
<script src="js/jquery-1.9.1.min.js" type="text/javascript" ></script>
<script src="js/layer/layer.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<script src="js/Sellerber.js" type="text/javascript"></script>
<script src="js/shopFrame.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery.cookie.js"></script>
<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
<script type="text/javascript" src="js/jquery-form.js"></script>
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript" src="js/medicinefood/uitl.js"></script>
<title>用户登录</title>
</head>

<body class="login_style login-layout">
 <div class="loginbody">
  <div class="login-container">
   <div class="login_logo"><img src="images/logo.png" /></div>
    <div class="position-relative">
     <div id="login_add" class="login-box widget-box no-border visible">
      <div class="widget-main">
      <h4 class="header blue lighter bigger"><i class="fa fa-coffee green"></i>&nbsp;&nbsp;&nbsp;管理员登录</h4>
      <form class="" id="loginForm" method="post" onkeydown="if(event.keyCode==13)return false;"
      action="<%=basePath%>admin/login" class="am-form" onsubmit="return submitVerify()">
	      <div class="clearfix">
	       <div class="login_icon"><img src="images/login_bg.png" /></div>
	       <div class="add_login_cont Reg_log_style ">
	        
	         <ul class="r_f">
	          <li class="frame_style form_error" style="position: relative;">
		          <label class="user_icon"></label>
		          <input name="account_num" data-name="用户名" type="text" id="user_account_num" value="用户名" onblur='user_account_numInputHint(this)'>
		          <font id="user_account_numHint" value='1'style="font-size: 10px;position: absolute;bottom:-28px;left:50px;"color="#e80624b5"></font>
	          </li>
	          <li class="frame_style form_error"><label class="password_icon"></label><input name="user_password" id="user_password" data-name="密码" type="password"></li>
	          <c:if test="${!empty visitsLogin&&visitsLogin.showVerifyPicture}">
	          <li class="frame_style form_error" style="position: relative;">
	          <label class="Codes_icon"></label>
	          <input type="hidden" onblur=''
							style="width:80px;padding:3px 5px;float: left;" type="text"
							placeholder="不区分大小写" name="verifyPictureValue"
							id="verifyPictureValue" value="">
	          <input onblur="javascript:{document.getElementById('verifyPictureValue').value=(document.getElementById('verifyPicture').value).toLocaleUpperCase();}"
	           name="verifyPicture" type="text"  data-name="验证码" id="verifyPicture" class="Codes_text">
	          <div class="Codes_region">
	          <img style="width: 80px;height:40px;cursor: pointer;"
				onclick="javascript:{document.getElementById('imgVerifyPicture').src='<%=basePath%>/login/verification?data='+new Date().getTime();}"
							id="imgVerifyPicture" src="<%=basePath%>/login/verification">
							</div>
	          <font id="user_passwordHint" value='1'
					style="position: absolute;bottom:-30px;left:50px;font-size: 12px;"
					color="#e80624b5"> ${visitsLogin.hintMessage }</font>
	          </li> 
	         </c:if>
	         </ul>       
	        
	       </div>
	       <div class="login_Click_Actions">          
	          <button id='submit' type="submit" class="button_width  btn btn-sm btn-primary" id="login_btn">
	          <i class="fa fa-key"></i>&nbsp;&nbsp;登录</button>
	          <p><label class="inline"><input id="remember-me" for="remember-me" type="checkbox" class="ace"><span class="lbl">保存密码</span></label></p>
	       </div>
	      </div>
      </form>
      <div class="social-or-login center"><span class="">通知</span></div>
      <div class="margin-top color center">本网站系统不再对IE8以下浏览器提供支持，请见谅。</div>
      </div>
     </div>
   </div>
   </div>
   </div>
</body>
</html>
<script type="text/javascript">
window.onload=function(){
     if(isIE()){//判断是否为ie浏览器
     
     window.event.returnValue;//将键盘事件的默认行为取消
     }else{
     event.preventDefault();//将键盘事件的默认行为取消
     }
    };
     document.onkeydown=function(e){//监听键盘
     var keycode = e.which || e.keyCode;
     switch (keycode) {
	 case 13:
			document.getElementById('loginForm').submit();
			alert(1);
		break;

	  default:
		break;
		};
		};
    
  	function wait(data){
  	debugger;
	  alert(data);
	  }
	  function test(){
	  var user_details_id=document.getElementById("user_details_id").value;
	  var user_basics_id=document.getElementById("user_basics_id").value;
	  var paramData;
	  var paramData={user_details_id:user_details_id,user_basics_id:user_basics_id};                               
	  var object = JSON.stringify(paramData);
	  ajaxPost("<%=basePath%>/expand/addexpand",object,"json","json",wait);
	  }
  	function submitVerify(){
  	if(window.event.keyCode == 13){
  	return false;
  	}
  	if(true){
  	      return true;
  	      }else{
  	      return false;
  	      }
	}
  	function loadUser_account_numHint(dataJson){
  	debugger;
  	if(dataJson.object){
  	document.getElementById("user_account_numHint").innerHTML="账号有效";
  	document.getElementById("user_account_numHint").color="#207b39";
  	document.getElementById("user_account_numHint").setAttribute('value', 0);
  	}else{
  	document.getElementById("user_account_numHint").color="#e80624b5";
  	document.getElementById("user_account_numHint").innerHTML="账号不存在";
  	document.getElementById("user_account_numHint").setAttribute('value', 1);
  	}
    }
    function user_account_numInputHint(inputDoc){//用户账号提示文本
    if(inputDoc.value==''){
    return;
    }
  	var object=JSON.stringify({user_account_num:inputDoc.value});
  	ajaxPost("<%=basePath%>/admin_user/isUserToAccountNum",object,"json","json",loadUser_account_numHint);
  	}
</script>
