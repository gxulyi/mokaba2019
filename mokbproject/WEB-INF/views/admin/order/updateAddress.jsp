<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <script type="text/javascript" src="js/jquery-1.7.1.js"></script>
    <script type="text/javascript" src="js/jquery-form.js" ></script> 
    <script type="text/javascript" src="js/ajax.js"></script>
    <title>添加收货地址页面</title>
    
	<script type="text/javascript">
		function updateAddress(){
		  var address_id=document.getElementById("address_id").value;
		  var user_name=document.getElementById("user_name").value;
		  var tel_phone=document.getElementById("tel_phone").value;
		  var order_addr=document.getElementById("order_addr").value;
	      var paramData;
	      var paramData={address_id:address_id,user_name:user_name,tel_phone:tel_phone,order_addr:order_addr};                               
	      var object = JSON.stringify(paramData);
	      ajaxPost("<%=basePath%>order_weixin/updateAddressOne",object,"json","json",wait);
		}
	
	  function wait(data){
	  alert(data);
	  }
	  function updateDefoult(){
	  var address_id=document.getElementById("address_id").value;
	  var paramData;
	  var paramData={address_id:address_id};                               
	  var object = JSON.stringify(paramData);
	  ajaxPost("<%=basePath%>order_weixin/updateLevel",object,"json","json",wait);
	  }
    </script>
  </head>
  
  <body>
  <div>
  <span>修改默认地址：<input type="button" onclick="updateDefoult()" value="修改默认地址"></span><br>
  <span>地址编号：<input id="address_id" type="text" name="address_id" value="2" /></span><br>  
  </div>
<div>-----------------------------------------</div>

<div>
  <span>修改地址：<input type="button" onclick="updateAddress()" value="修改地址"></span><br>
  <span>地址ID：<input id="address_id" type="text" name="address_id" value="2" /></span><br>  
  <span>联系人：<input id="user_name" type="text" name="user_name" value="" /></span><br> 
  <span>联系电话：<input id="tel_phone" type="text" name="tel_phone" value="" /></span><br>
  <span>地址头：<input id="addr_head" type="text" name="addr_head" value="贵州省贵阳市云岩区" /></span><br>
  <span>地址：<input id="order_addr" type="text" name="order_addr" value="" /></span><br>  
 
  </div>


  </body>
</html>
