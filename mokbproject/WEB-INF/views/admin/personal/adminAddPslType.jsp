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
  <title>后台管理 添加服务方式</title>
  <script type="text/javascript">
	  function wait(data){
	  alert("添加服务方式成功");
	  }
	  
	  function addType(){
	    var type_name=document.getElementById("type_name").value;
	    var paramData;
	    var paramData={type_name:type_name};                               
	    var object = JSON.stringify(paramData);
	    ajaxPost("<%=basePath%>/admin_personal/addType",object,"json","json",wait);
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
 
<%@ include file="../template/admin-body-sidebar.jsp" %><!-- 侧边内容 -->
  <!-- sidebar end -->
  <!-- content start -->
  <div class="admin-content">
<%@ include file="../template/admin-content-heder.jsp" %><!-- body 标题 -->

    <div class="am-g">
    
      <div class="am-u-sm-12 am-u-md-4 am-u-md-push-8">
        <div class="">
          <div class="">
            <div class="">
              <div> 
                 <br>
                 <br>
                 <br>
                 <br>
             </div>
            </div>
          </div>
        </div>
      </div>

      <div class="am-u-sm-12 am-u-md-8 am-u-md-pull-4">
        <form class="am-form am-form-horizontal">
        <br>
          <br>
          <br>
          <div class="am-form-group">
            <span for="type_name" class="am-u-sm-3 am-form-label">服务方式名称：</span>
            <div class="am-u-sm-9">
              <input id="type_name" type="email" id="user-name" placeholder="服务方式名称" value="">
            </div>
          </div>
			<br>
			<br>
          <br>
          <br>
          <br>
          <br>
          <div class="am-form-group">
            <div class="am-u-sm-9 am-u-sm-push-3">
              <button type="button" class="am-btn am-btn-primary" style="background: #55cbd2;border: none;border-radius: 3px;" onclick="addType()">确认添加</button>
            </div>
          </div>
        </form>
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
