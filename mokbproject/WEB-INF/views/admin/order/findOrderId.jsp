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
      var store_id=document.getElementById("s_id").value;
      //debugger;
      var paramData;
	  var paramData={store_id:store_id};   
	 // alert(JSON.stringify(paramData));                            
	  var object = JSON.stringify(paramData);
	  ajaxPost("<%=basePath%>admin_order/findOrderId",object,"json","json",wait);
	  };
	window.onload=function(){
	  onloadd();
	  };
  
	function wait(data){
  		//alert(JSON.stringify(data.object));
  		//debugger;
  		var object=data.object;
  		var type="";
  		var state="";
  		if(object.store_type==0){
  		   type="商城";
  		}else{
  		   type="定制";
  		}
  		    document.getElementById('user_nickname').innerHTML=object.user_nickname;
  		    document.getElementById('store_name').innerHTML=object.store_name;
  			document.getElementById('store_price').innerHTML=object.store_price;
  			document.getElementById('store_picture').src='file/store/img/'+object.store_picture;
  			document.getElementById('add_date').innerHTML=formatDateTimeStr(object.add_date);
  			document.getElementById('store_type').innerHTML=type;
  			//document.getElementById('status_state').innerHTML=object.status_state;
  			document.getElementById('store_service').innerHTML=object.store_service;
  			document.getElementById('store_intro').src='file/store/img/'+object.store_intro;
  			
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
    <div  id="div" style="display: none" onMouseout="hidden();"><input id="s_id" value="${store_id}"></div>
      <div class="am-g">
      <div class="am-u-sm-12">
                <p>添加人：<span id="user_nickname"></span></p>
				<p>商品名称：<span id="store_name"></span></p>
				<p>商品价格：<span id="store_price"></span></p>
				<p>商品图片：<img id="store_picture" src=""></img></p>
				<p>添加时间：<span id="add_date"></span></p>
				<p>商品类型：<span id="store_type"></span></p>
				<!-- <p>商品状态： <span id="status_state"></span></p> -->
				<p>定制服务：<span id="store_service"></span></p>
				<p>商品简介：<img id="store_intro" src=""></img></p>
              
           
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
