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
    <script type="text/javascript" src="js/ajax.js"></script>
    <title>添加地址页面</title>
    
	<script type="text/javascript">
	  //ajaxPost("<%=basePath%>/admin_store/addStore",paramData,paramType,resultType,functionname,functionparam);
	  function wait(data){
	  alert(data);
	  }
	  function test(){
	  
	      var user_details_id=document.getElementById("user_details_id").value;
	      var user_basics_id=document.getElementById("user_basics_id").value;
	      var details_value=document.getElementById("details_value").value;
	      var tel=document.getElementById("tel").value;
	      var addr=document.getElementById("addr").value;
	      var details_ps=document.getElementById("details_ps").value;
	  var paramData;
	  var paramData={user_details_id:user_details_id,user_basics_id:user_basics_id,name:details_value,details_ps:details_ps,tel:tel,addr:addr};                               
	  var object = JSON.stringify(paramData);
	  ajaxPost("<%=basePath%>/expand/addexpand",object,"json","json",wait);
	  }
    </script>
  </head>
  
  <body>
  <div>
  <span>添加地址<input type="button" onclick="test()" value="添加地址"></span><br>
  <span>信息id：<input id="user_details_id" type="text" name="user_details_id" value="1513153399999" /></span><br> 
  <span>用户id：<input id="user_basics_id" type="text" name="user_basics_id" value="" /></span><br>
  <span>姓名：<input id="details_value" type="text" name="details_value" value="" /></span><br>
  <span>电话：<input id="tel" type="text" name="details_value" value="" /></span><br>
  <span>地址：<input id="addr" type="text" name="addr" value="" /></span><br>
  <span>内容值备注：<input id="details_ps" type="text" name="details_ps" value="" /></span><br>  
 
  </div>
<div>-----------------------------------------</div>
  </body>
</html>
