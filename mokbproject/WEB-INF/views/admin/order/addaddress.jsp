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

	
	  function wait(data){
	  alert(data);
	  }
	  function adddnews(){
	      var user_basics_id=document.getElementById("user_basics_id").value;
	      var tel_phone=document.getElementById("tel_phone").value;
	      var user_name=document.getElementById("user_name").value;
	      var order_addr=document.getElementById("order_addr").value;
	      var addr_head=document.getElementById("addr_head").value;
	      var priority_level=document.getElementById("priority_level").value;
	  var paramData;
	  var paramData={user_basics_id:user_basics_id,tel_phone:tel_phone,user_name:user_name,order_addr:order_addr,addr_head:addr_head,priority_level:priority_level};                               
	  var object = JSON.stringify(paramData);
	  ajaxPost("<%=basePath%>order_weixin/addOrderAddr",object,"json","json",wait);
	  }
    </script>
  </head>
  
  <body>
  <div>
  <span>添加知识<input type="button" onclick="adddnews()" value="添加收货地址"></span><br>
  <span>用户ID：<input id="user_basics_id" type="text" name="user_basics_id" value="5" /></span><br> 
  <span>电话：<input id="tel_phone" type="text" name="tel_phone" value="" /></span><br> 
  <span>收货人姓名：<input id="user_name" type="text" name="user_name" value="" /></span><br>
  <span>收货地址：<input id="order_addr" type="text" name="order_addr" value="" /></span><br>
  <span>地址头：<input id="addr_head" type="text" name="addr_head" value="贵州省贵阳市云岩区" /></span><br>  
  <span>优先级：<input id="priority_level" type="text" name="priority_level" value="2" /></span><br>  
 
  </div>
<div>-----------------------------------------</div>




  </body>
</html>
