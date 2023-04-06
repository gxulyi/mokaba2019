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
  <title>后台管理 退款</title>
  <script type="text/javascript">
  	function notReMoney(){
  		alert("不让退款？");
  	}
  	function agree(vor){
  		if(vor.state==0){
  			alert("同意成功！");
  			window.location="<%=basePath%>admin_order/find";
  		}
  	}
  	function agreeReMoney(){
  		var order_id=document.getElementById("order_id").value;
  		var paramData={order_id:order_id};
		var object = JSON.stringify(paramData);
		ajaxPost("<%=basePath%>admin_order/agreeReMoney",object,"json","json",agree);
  	}
	function showRefund(vor){
		alert(JSON.stringify(vor.orderRefundData.orderRefund.reason_detail));
		var orderRefund=vor.orderRefundData.orderRefund;
		document.getElementById("order_id").value=orderRefund.order_id;
		document.getElementById("refund_reason").value=orderRefund.refund_reason;
		document.getElementById("store_price").value=orderRefund.store_price;
		document.getElementById("apply_date").value=orderRefund.apply_date;
		document.getElementById("reason_detail").innerHTML=orderRefund.reason_detail;
	}
	function findRefundOne(){
		var order_id=document.getElementById("order_id").value;
		var paramData={order_id:order_id};
		var object = JSON.stringify(paramData);
		ajaxPost("<%=basePath%>admin_order/adminFindReOrderOne",object,"json","json",showRefund);
	}
	window.onload=function(){
	    findRefundOne();
	};
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
      </div>

      <div class="am-u-sm-12 am-u-md-8 am-u-md-pull-4">
        <form class="am-form am-form-horizontal">
        
          <div class="am-form-group">
            <label for="order_id" class="am-u-sm-3 am-form-label">订单编号</label>
            <div class="am-u-sm-9">
              <input id="order_id" type="email" id="user-name" placeholder="" value="${ order_id}" readonly>
            </div>
          </div>
			
          <div class="am-form-group">
            <label for="refund_reason" class="am-u-sm-3 am-form-label">退款原因</label>
            <div class="am-u-sm-9">
              <input id="refund_reason" type="email" id="user-email" placeholder="" value="" readonly>
            </div>
          </div>
          
          <div class="am-form-group">
            <label for="store_price" class="am-u-sm-3 am-form-label">退款金额</label>
            <div class="am-u-sm-9">
              <input id="store_price" type="email" id="user-email" placeholder="" value="" readonly>
            </div>
          </div>
          <div class="am-form-group">
            <label for="apply_date" class="am-u-sm-3 am-form-label">退款申请时间</label>
            <div class="am-u-sm-9">
              <input id="apply_date" type="email" id="user-email" placeholder="" value="" readonly>
            </div>
          </div>
          
          <div class="am-form-group">
            <label for="reason_detail" class="am-u-sm-3 am-form-label">简退款详细原因</label>
            <div class="am-u-sm-9">
              <textarea id="reason_detail" class="" rows="5" id="user-intro" placeholder="" readonly></textarea>
              <small>退款详细原因。。。</small>
            </div>
          </div>

          <div class="am-form-group">
            <div class="am-u-sm-9 am-u-sm-push-3">
              <button type="button" class="am-btn am-btn-primary" onclick="agreeReMoney()">同意退款</button>
              <button type="button" class="am-btn am-btn-primary" onclick="notReMoney()">拒绝退款</button>
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
</body>
</html>
