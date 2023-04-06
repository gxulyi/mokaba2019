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
  <title>后台管理 会员</title>
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
  var user_basics_id=${ user_basics_id};
  	function onloadd(){
      var paramData;
	  var paramData={user_basics_id:user_basics_id};   
	  var object = JSON.stringify(paramData);
	  ajaxPost("<%=basePath%>admin_user/findUserInformOne",object,"json","json",showInformation);
	  };
	window.onload=function(){
	  onloadd();
	  };
  
	function showInformation(data){
  		//alert(JSON.stringify(data.object));
  		var data=data.object;
  		//debugger;
  		var htmlstr="";
  		var sex="";
  		var age="";
  		var card="";
  		var name="";
  		var tel="";
  		var nick_name="";
  		var qq="";
  		var email="";
  		var weixin="";
  		var card_picture="";
  		if(data.information_sex==0){
  			sex="女";
  		}else if(data.information_sex==1){
  			sex="男";
  		}else{
  			sex="未知";
  		}
  		if(data.information_age==""||data.information_age==null){
  				age="未知";
  			}else{
  				age=object[i].information_age;
  			}
  			if(data.information_card==""||data.information_card==null){
  				card="未知";
  			}else{
  				card=data.information_card;
  			}
  			if(data.information_compellation==""||data.information_compellation==null){
  				name="未知";
  			}else{
  				name=data.information_compellation;
  			}
  			if(data.information_phone==""||data.information_phone==null){
  				tel="未知";
  			}else{
  				tel=data.information_phone;
  			}
  			if(data.nick_name==""||data.nick_name==null){
  				nick_name="未知";
  			}else{
  				nick_name=data.nick_name;
  			}
  			if(data.information_qq==""||data.information_qq==null){
  				qq="未知";
  			}else{
  				qq=data.information_qq;
  			}
  			if(data.information_Email==""||data.information_Email==null){
  				email="未知";
  			}else{
  				email=data.information_Email;
  			}
  			if(data.information_weixin==""||data.information_weixin==null){
  				weixin="未知";
  			}else{
  				weixin=data.information_weixin;
  			}
  			if(data.card_picture==""||data.card_picture==null){
  				card_picture="未知";
  			}else{
  				card_picture=data.card_picture;
  			}
  		
  			document.getElementById('user_basics_id').innerHTML=data.user_basics_id;
  			document.getElementById('information_compellation').innerHTML=name;
  			document.getElementById('information_sex').innerHTML=sex;
  			document.getElementById('information_age').innerHTML=age;
  			document.getElementById('information_card').innerHTML=card;
  			document.getElementById('nick_name').innerHTML=nick_name;
  			document.getElementById('information_phone').innerHTML=tel;
  			document.getElementById('information_qq').innerHTML=qq;
  			document.getElementById('information_Email').innerHTML=email;
  			document.getElementById('information_weixin').innerHTML=weixin;
  			document.getElementById('card_picture').innerHTML=card_picture;
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
                <p>用户编号：<span id="user_basics_id"></span></p>
                <p>姓       名：<span id="information_compellation"></span></p>
                <p>性       别：<span id="information_sex"></span></p>
                <p>年       龄：<span id="information_age"></span></p>
                <p>身份证号： <span id="information_card"></span></p>
                <p>昵       称：<span id="nick_name"></span></p>
				<p>手 机  号：<span id="information_phone"></span></p>
				<p>QQ    号：<span id="information_qq"></span></p>
				<p>邮       箱：<span id="information_Email"></span></p>
				<p>微 信  号：<span id="information_weixin"></span></p>
              	<p>身份证照片：<span id="card_picture"></span></p>
            <hr />
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
