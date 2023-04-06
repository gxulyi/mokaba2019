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
  	function onloadd(){
      var user_basics_id=document.getElementById("user_id").value;
      //debugger;
      var paramData;
	  var paramData={user_basics_id:user_basics_id};   
	 // alert(JSON.stringify(paramData));                            
	  var object = JSON.stringify(paramData);
	  ajaxPost("<%=basePath%>admin_user/findUserBasicsAndGradeId",object,"json","json",wait);
	  };
	window.onload=function(){
	  onloadd();
	  };
  
	function wait(data){
  		//alert(JSON.stringify(data.object));
  		//debugger;
  		var object=data.object;
  			document.getElementById('grade_name').innerHTML=object.grade_name;
  			document.getElementById('user_register_data').innerHTML=formatDateTimeStr(object.user_register_data);
  			document.getElementById('user_register_address').innerHTML=object.user_register_address;
  			document.getElementById('grade_nickname').innerHTML=object.grade_nickname;
  			document.getElementById('grade_describe').innerHTML=object.grade_describe;
  			document.getElementById('grade_benefit').innerHTML=object.grade_benefit;
  			document.getElementById('upgrade_order').innerHTML=object.upgrade_order;
  			document.getElementById('user_nickname').innerHTML=object.user_nickname;
  			/* document.getElementById('grade_introduce').innerHTML=object.grade_introduce; */
  			
  			
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
                <p>用户名：<span id="user_nickname"></span></p>
				<p>会员昵称：<span id="grade_name"></span></p>
				<p>注册时间：<span id="user_register_data"></span></p>
				<p>注册地址：<span id="user_register_address"></span></p>
				<p>等级昵称：<span id="grade_nickname"></span></p>
				<p>等级描述： <span id="grade_describe"></span></p>
				<p>等级受益：<span id="grade_benefit"></span></p>
				<p>升级顺序：<span id="upgrade_order"></span></p>
				<!-- <p>会员等级介绍：<span id="grade_introduce"></span></p> -->
              
           
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
