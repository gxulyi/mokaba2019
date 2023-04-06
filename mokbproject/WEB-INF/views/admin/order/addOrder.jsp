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
    <title>订单页面</title>
    
	<script type="text/javascript">
	function updateAddress(){
		window.location="<%=basePath%>order_weixin/updateAddress";
	}
	function addOrderaddress(){
	    window.location="<%=basePath%>order_weixin/addaddress";
	}
	
	
	
	function findOrderaddress(){
	var paramData;
	  var paramData={"1":"1"};                               
	  var object = JSON.stringify(paramData);
	   ajaxPost("<%=basePath%>order_weixin/findOrderAddr",object,"json","json",shownews);
	  //  window.location="<%=basePath%>order_weixin/addaddress";
	}
	function addex(){
		window.location="<%=basePath%>expand/toaddexpand";
	}
	
	 function findStore(){
	 	window.location="<%=basePath%>admin_store/toFindStore";
	 }
	function addStore(){
	window.location="<%=basePath%>admin_store/toAddStore";
	}
	function addNews(){
		window.location="<%=basePath%>weixin_news/toAddnews";
	}
	
	
	function findNews(){
		var paramData;
	  var paramData={news_type:"1"};                               
	  var object = JSON.stringify(paramData);
	   ajaxPost("<%=basePath%>weixin_news/findNews",object,"json","json",shownews);
	}
	function shownews(data){
		alert(data);
		
	}
	  function findNewsOne(){
	  var paramData;
	  var paramData={news_type:"1",news_id:"4"};                               
	  var object = JSON.stringify(paramData);
	   ajaxPost("<%=basePath%>weixin_news/findNewsOne",object,"json","json",shownews);
	  
	  }
	  function wait(data){
	  alert(data);
	  }
	  function test(){
	  
	  var order_add_date=document.getElementById("order_add_date").value;
	      var order_status=document.getElementById("order_status").value;
	      var order_edit_date=document.getElementById("order_edit_date").value;
	      var user_basics_id=document.getElementById("user_basics_id").value;
	      var store_id=document.getElementById("store_id").value;
	      var store_amount=document.getElementById("store_amount").value;
	  var paramData;
	  var paramData={order_add_date:order_add_date,order_status:order_status,order_edit_date:order_edit_date,user_basics_id:user_basics_id,store_id:store_id,store_amount:store_amount};                               
	  var object = JSON.stringify(paramData);
	  ajaxPost("<%=basePath%>/order_weixin/addOrder",object,"json","json",wait);
	  }
    </script>
  </head>
  
  <body>
  <div>
  <span>添加订单<input type="button" onclick="test()" value="添加订单"></span><br>
  <span>添加订单时间：<input id="order_add_date" type="text" name="order_add_date" value="1513153399999" /></span><br> 
  <span>订单状态：<input id="order_status" type="text" name="order_status" value="" /></span><br>
  <span>修改订单时间：<input id="order_edit_date" type="text" name="order_edit_date" value="1513153399999" /></span><br>
  <span>购买人ID：<input id="user_basics_id" type="text" name="user_basics_id" value="" /></span><br>  
  <span>商品编号：<input id="store_id" type="text" name="store_id" value="" /></span><br>   
  <span>商品数量：<input id="store_amount" type="text" name="store_amount" value="" /></span><br> 
 
  </div>
<div>-----------------------------------------</div>
<div>
<input type="button" onclick="findStore()" value="查看商品"><br>
<input type="button" onclick="addStore()" value="添加商品"><br>
<input type="button" onclick="addNews()" value="添加知识"><br>
<input type="button" onclick="findNews()" value="查看知识"><br>
<input type="button" onclick="findNewsOne()" value="查看单个知识"><br>
<input type="button" onclick="addex()" value="添加用户补充信息"><br>
<input type="button" onclick="addOrderaddress()" value="添加收货地址"><br>
<input type="button" onclick="updateAddress()" value="修改收货地址"><br>

<input type="button" onclick="findOrderaddress()" value="查询收货地址"><br>


</div>
  </body>
</html>
