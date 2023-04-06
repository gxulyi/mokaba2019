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
    <title>麦迪夫的登陆页面</title>
    
	<script type="text/javascript">
	  function wait11(){
	
	  }
	  function wait(data){
	    if(data.state==0){
	    window.location="<%=basePath%>/order_weixin/add";
	    
	    
	    
	  }else{
	     alert("登录失败，请重新登录");
	     request.getRequestDispather("<%=basePath%>/user_weixin/test").forward(request,response);
	  }
	  //self.location="http://www.baidu.com";  
	  alert(data);
	  
	  
	  }
	  function test(){
	  var weixin_id=document.getElementById("weixin_id").value;
	      var weixin_portrait=document.getElementById("weixin_portrait").value;
	      var weixin_nickname=document.getElementById("weixin_nickname").value;
	      var weixin_gender=document.getElementById("weixin_gender").value;
	      var weixin_follow_choice=document.getElementById("weixin_follow_choice").value;
	      var weixin_follow_data_yes=document.getElementById("weixin_follow_data_yes").value;
	      var weixin_follow_data_no=document.getElementById("weixin_follow_data_no").value;
	      var user_register_data=document.getElementById("user_register_data").value;
	      var user_password=document.getElementById("user_password").value;
	      var user_register_address=document.getElementById("user_register_address").value;
	      var recommend_superior_winxin=document.getElementById("recommend_superior_winxin").value;
	  var paramData;
	  var paramData={weixin_id:weixin_id,weixin_portrait:weixin_portrait,weixin_nickname:weixin_nickname,weixin_gender:weixin_gender,weixin_follow_choice:weixin_follow_choice,weixin_follow_data_yes:weixin_follow_data_yes,weixin_follow_data_no:weixin_follow_data_no,user_register_data:user_register_data,user_password:user_password,user_register_address:user_register_address,recommend_superior_winxin:recommend_superior_winxin};                               
	  var object = JSON.stringify(paramData);
	  ajaxPost("<%=basePath%>/user_weixin/findUserWeixin",object,"json","json",wait);
	  }
	   function test1(){
	  var weixin_id=document.getElementById("weixin_id").value;
	      var weixin_portrait=document.getElementById("weixin_portrait").value;
	      var weixin_nickname=document.getElementById("weixin_nickname").value;
	      var weixin_gender=document.getElementById("weixin_gender").value;
	      var weixin_follow_choice=document.getElementById("weixin_follow_choice").value;
	      var weixin_follow_data_yes=document.getElementById("weixin_follow_data_yes").value;
	      var weixin_follow_data_no=document.getElementById("weixin_follow_data_no").value;
	      var user_register_data=document.getElementById("user_register_data").value;
	      var user_password=document.getElementById("user_password").value;
	      var user_register_address=document.getElementById("user_register_address").value;
	      var recommend_superior_winxin=document.getElementById("recommend_superior_winxin").value;
	  var paramData;
	  var paramData={weixin_id:weixin_id,weixin_portrait:weixin_portrait,weixin_nickname:weixin_nickname,weixin_gender:weixin_gender,weixin_follow_choice:weixin_follow_choice,weixin_follow_data_yes:weixin_follow_data_yes,weixin_follow_data_no:weixin_follow_data_no,user_register_data:user_register_data,user_password:user_password,user_register_address:user_register_address,recommend_superior_winxin:recommend_superior_winxin};                               
	  var object = JSON.stringify(paramData);
	  ajaxPost("<%=basePath%>/user_weixin/addUserBasic",object,"json","json",wait);
	  }
    </script>
  </head>
  
  <body>
  <div>
   <span>微信登陆/注册 测试<input type="button" onclick="test()" value="登陆/注册"></span><br>
  <!-- <span>微信/注册 测试<input type="button" onclick="test1()" value="登陆/注册"></span><br>-->
  <span>微信ID：<input id="weixin_id" type="text" name="weixin_id" value="" /></span><br>
  <span>微信头像：<input id="weixin_portrait" type="text" name="weixin_portrait" value="" /></span><br>
  <span>微信昵称：<input id="weixin_nickname" type="text" name="weixin_nickname" value="" /></span><br>  
  <span>微信性别：<input id="weixin_gender" type="text" name="weixin_gender" value="" /></span><br>   
  <span>是否关注：<input id="weixin_follow_choice" type="text" name="weixin_follow_choice" value="" /></span><br> 
  <span>关注时间：<input id="weixin_follow_data_yes" type="text" name="weixin_follow_data_yes" value="1513153399999" /></span><br> 
  <span>取消关注时间：<input id="weixin_follow_data_no" type="text" name="weixin_follow_data_no" value="1513153444888" /></span><br> 
  <span>注册时间：<input id="user_register_data" type="text" name="user_register_data" value="1513153344888" /></span><br> 
  <span>注册时间：<input id="user_password" type="text" name="user_password" value="" /></span><br>
  <span>注册地址：<input id="user_register_address" type="text" name="user_register_address" value="" /></span><br>
  <span>推荐人微信号：<input id="recommend_superior_winxin" type="text" name="recommend_superior_winxin" value="" /></span><br>
  </div>
<div>-----------------------------------------</div>
  </body>
</html>
