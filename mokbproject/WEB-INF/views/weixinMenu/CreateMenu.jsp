<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="com.medicinefood.controller.weixinEvent.MenuManagerController" %>
<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>CreateMenu.jsp</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  <script type="text/javascript" src="../../../js/jquery-1.7.1.js"></script></head>
  
  <body>
    <a id="adlkjf">点击我创建菜单</a>
  </body>
</html>

<script type="text/javascript">
$("adlkjf").click(function(){
   $.post("<%=basePath%>/MenuManagerController/CreateMenu",{},function(result){
   if(result=="0"){
   alert("创建菜单成功");
   
   }else{
   
   alert("失败");
   }
  });
});

</script>
