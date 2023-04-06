<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ include file="../template/admin-header.jsp" %><!-- htnl头部文件 -->
<!doctype html>
<html>
<head>
<base href="<%=basePath%>">
<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
  <script type="text/javascript" src="js/jquery-form.js" ></script> 
  <script type="text/javascript" src="js/ajax.js"></script>
  <meta charset="utf-8">
  <base href="<%=basePath%>">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>后台管理 商城</title>
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
  <script type="text/javascript" src="js/medicinefood/uitl.js"></script>
  <script type="text/javascript">
  	function onloadd(){
      var user_basics_id=document.getElementById("user_id").value;
      var paramData;
	  var paramData={user_basics_id:user_basics_id};   
	  var object = JSON.stringify(paramData);
	      ajaxPost("<%=basePath%>admin_integr/findUserWXIFGrade",object,"json","json",wait);
	  };
	window.onload=function(){
	  onloadd();
	  };
  
	function wait(data){
  		var weixin_follow_choice="";
  		var information_sex="";
  		var weixin_gender="";
  		var object=data.object;
  		if(object.information_sex==0){
  		    information_sex="女";
  		}else if(object.information_sex==1){
  		    information_sex="男";
  		}else{
  		    information_sex="未知";
  		}
  		if(object.weixin_gender==0){
  		    weixin_gender="女";
  		}else if(object.weixin_gender==1){
  		    weixin_gender="男";
  		}else{
  		    weixin_gender="未知";
  		}
  		if(object.weixin_follow_choice==0){
  		    weixin_follow_choice="已关注";
  		}else if(object.weixin_follow_choice==1){
  		    weixin_follow_choice="未关注";
  		}else{
  		    object.weixin_follow_choice;
  		}
  		
  		    document.getElementById('user_nickname').innerHTML=object.user_nickname;
  		    document.getElementById('user_register_data').innerHTML=formatDateTimeStr(object.user_register_data);
  		    document.getElementById('user_register_address').innerHTML=object.user_register_address;
  			document.getElementById('grade_name').innerHTML=object.grade_name;
  			document.getElementById('grade_nickname').innerHTML=object.grade_nickname;
  			document.getElementById('weixin_nickname').innerHTML=object.weixin_nickname;
  			document.getElementById('information_weixin').innerHTML=object.information_weixin;
  			document.getElementById('weixin_gender').innerHTML=weixin_gender;
  			document.getElementById('weixin_follow_choice').innerHTML=weixin_follow_choice;
  		    document.getElementById('information_phone').innerHTML=object.information_phone;
  			document.getElementById('information_qq').innerHTML=object.information_qq;
  			document.getElementById('information_Email').innerHTML=object.information_Email;
  			document.getElementById('information_compellation').innerHTML=object.information_compellation;
  			document.getElementById('information_card').innerHTML=object.information_card;
  			document.getElementById('card_picture').src='file/store/img/'+object.card_picture;
  			document.getElementById('card_end').innerHTML=formatDateTimeStr(object.card_end);
  			document.getElementById('information_sex').innerHTML=information_sex;
  			document.getElementById('information_age').innerHTML=object.information_age;
  			document.getElementById('live_address').innerHTML=object.live_address;
  			document.getElementById('registered_address').innerHTML=object.registered_address;
  			
  	}
  		
				
				
				
    </script>

</head>
<%@ include file="../template/admin-body-header.jsp" %><!-- 内容头部 -->
<body>


<div class="am-cf admin-main">
  <!-- sidebar start -->
  <%@ include file="../template/admin-body-sidebar.jsp" %><!-- 侧边内容 -->
  <!-- sidebar end -->
  <!-- content start -->
  <div class="admin-content">
    <%@ include file="../template/admin-content-heder.jsp" %><!-- body 标题 -->
    <img style="width: 40px;height: 40px;cursor: pointer;position: absolute;top: 15px;right: 80px;"onclick="javascript:history.back(-1);" title="返回上一级" alt="" src="images/fhsyj.png">
    <div class="am-g">
      <div class="am-u-md-6 am-cf">
        <div class="am-fl am-cf">
          <div class="am-btn-toolbar am-fl">
            <!-- <div class="am-btn-group am-btn-group-xs">
              <a href="admin_news/toAddNews" class="am-btn am-btn-default"><span class="am-icon-plus"></span>&nbsp;&nbsp;新增</a>
            </div> -->

            <div class="am-form-group am-margin-left am-fl">
            </div>
          </div>
        </div>
      </div>
    </div>
    <div  id="div" style="display: none" onMouseout="hidden();"><input id="user_id" value="${user_basics_id}"></div>
      <div class="am-g">
      <div class="am-u-sm-12">
                <p>用户昵称：<span id="user_nickname"></span></p>
				<p>注册时间：<span id="user_register_data"></span></p>
				<p>注册地址：<span id="user_register_address"></span></p>
				<p>会员等级：<span id="grade_name"></span>(<span id="grade_nickname"></span>)</p>
				<p>微信昵称：<span id="weixin_nickname"></span></p>
				<p>微信号：<span id="information_weixin"></span></p>
				<p>微信性别：<span id="weixin_gender"></span></p>
				<p>是否关注：<span id="weixin_follow_choice"></span></p>
				<p>手机号：<span id="information_phone"></span></p>
				<p>qq账号：<span id="information_qq"></span></p>
				<p>电子邮箱：<span id="information_Email"></span></p>
				<p>真实姓名：<span id="information_compellation"></span></p>
				<p>身份证号：<span id="information_card"></span></p>
				<p>身份证照片：<img id="card_picture" src=""></img></p>
				<p>身份证到期时间：<span id="card_end"></span></p>
				<p>用户性别：<span id="information_sex"></span></p>
				<p>年龄：<span id="information_age"></span></p>
				<p>现居住地：<span id="live_address"></span></p>
				<p>户口所在地：<span id="registered_address"></span></p>
				
        </div>

      </div>
 
     
  </div>
</div>
<%@ include file="../template/admin-footer.jsp" %><!-- 底部内容 -->
<script src="js/template/amazeui.min.js"></script>
<script type="text/javascript">
	var width = document.documentElement.clientWidth || document.body.clientWidth;
	$(".admin-content").css("width",width-200);
</script>
</body>
</html>
