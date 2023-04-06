<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>

	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8">
		<title>限时抢购</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">

		<!--标准mui.css-->
		<link rel="stylesheet" href="css/mui.min.css">
		<link rel="stylesheet" href="css/icons-extra.css" />
		<link rel="stylesheet" href="css/flash_sale.css" />
		<script type="text/javascript" src="js/jquery-1.7.1.js" ></script>
	</head>
	<body>
		<div class="mui-content" style="margin-bottom: 45px;">
			<div id="slider" class="mui-slider" style="position: relative;">
			  <div class="mui-slider-group mui-slider-loop">
			    <!-- 额外增加的一个节点(循环轮播：第一个节点是最后一张轮播) -->
			    <div class="mui-slider-item mui-slider-item-duplicate">
			      <a href="#">
			        <img src="http://placehold.it/400x200">
			      </a>
			    </div>
			    <!-- 第一张 -->
			    <div class="mui-slider-item">
			      <a href="#">
			        <img src="http://placehold.it/400x200">
			      </a>
			    </div>
			    <!-- 第二张 -->
			    <div class="mui-slider-item">
			      <a href="#">
			        <img src="http://placehold.it/400x200">
			      </a>
			    </div>
			    <!-- 额外增加的一个节点(循环轮播：最后一个节点是第一张轮播) -->
			    <div class="mui-slider-item mui-slider-item-duplicate">
			      <a href="#">
			        <img src="http://placehold.it/400x200">
			      </a>
			    </div>
			  </div>
			</div>
			<ul class="flash-sale-time">
				<li>
					<span>16：00场</span><br />
					<span>已开抢</span>
				</li>
				<li style="background: #04757D;color: #FFFFFF;">
					<span>17：00场</span><br />
					<span>正在进行中</span>
				</li>
				<li>
					<span>18：00场</span><br />
					<span>即将开场</span>
				</li>
			</ul>
			<div class="jiezhi-time">
				<label>抢购截止时间：</label>
				<span>2018-10-26</span>
				<span>00:00:00</span>
			</div>
			<!-- <ul class="mui-table-view">
			    <li class="mui-table-view-cell mui-media">
			        <a href="javascript:;">
			            <img class="mui-media-object mui-pull-left" src="http://placehold.it/97x75">
			            <div class="mui-media-body">
			              	  创意520黑白情侣对杯
			                <div class="mui-ellipsis" style="float: left;line-height: 30px;width: 60%;">
								<label style="color: #D02368;font-size: 11px;">￥</label>
								<span style="color: #D02368 !important;font-size: 15px;">229</span>
								<del style="font-size: 12px;color: #999;"><label style="font-size: 12px;">￥</label>188</del>
			                	<div class="progress">
									<div class="bar" style="width: 80%;">80%</div>
								</div>
			                </div>
			                <div class="mashangqiang">马上抢</div>
			            </div>
			        </a>
			    </li>
			</ul>
			<div style="height: 5px;"></div>
			<ul class="mui-table-view">
			    <li class="mui-table-view-cell mui-media">
			        <a href="javascript:;">
			            <img class="mui-media-object mui-pull-left" src="http://placehold.it/97x75">
			           	<div class="mui-media-body">
			              	  创意520黑白情侣对杯
			                <div class="mui-ellipsis" style="float: left;line-height: 30px;width: 60%;">
								<label style="color: #D02368;font-size: 11px;">￥</label>
								<span style="color: #D02368 !important;font-size: 15px;">229</span>
								<del style="font-size: 12px;color: #999;"><label style="font-size: 12px;">￥</label>188</del>
			                	<div class="progress">
									<div class="bar" style="width: 40%;">40%</div>
								</div>
			                </div>
			                <div class="mashangqiang">马上抢</div>
			            </div>
			        </a>
			    </li>
			</ul> -->
			<!-- <div style="height: 5px;"></div>
			<ul class="mui-table-view">
			    <li class="mui-table-view-cell mui-media">
			        <a href="javascript:;">
			            <img class="mui-media-object mui-pull-left" src="http://placehold.it/97x75">
			            <div class="mui-media-body">
			              	  创意520黑白情侣对杯
			            	<div class="mui-ellipsis" style="float: left;line-height: 30px;width: 60%;">
								<label style="color: #D02368;font-size: 11px;">￥</label>
								<span style="color: #D02368 !important;font-size: 15px;">229</span>
								<del style="font-size: 12px;color: #999;"><label style="font-size: 12px;">￥</label>188</del>
			                	<div class="progress">
									<div class="bar" style="width: 0%;">0%</div>
								</div>
			                </div>
			                <div class="mashangqiang">马上抢</div>
			            </div>
			        </a>
			    </li>
			</ul> -->
			<!-- <div style="height: 5px;"></div> -->
			<!-- <ul class="mui-table-view">
			    <li class="mui-table-view-cell mui-media">
			        <a href="javascript:;">
			            <img class="mui-media-object mui-pull-left" src="http://placehold.it/97x75">
			            <div class="mui-media-body">
			              	  创意520黑白情侣对杯
			            	<div class="mui-ellipsis" style="float: left;line-height: 30px;width: 60%;">
								<label style="color: #D02368;font-size: 11px;">￥</label>
								<span style="color: #D02368 !important;font-size: 15px;">229</span>
								<del style="font-size: 12px;color: #999;"><label style="font-size: 12px;">￥</label>188</del>
			                	<div class="progress">
									<div class="bar" style="width: 0%;">0%</div>
								</div>
			                </div>
			                <div class="mashangqiang">马上抢</div>
			            </div>
			        </a>
			    </li>
			</ul> -->
			<div style="height: 5px;"></div>
			<ul class="mui-table-view" id="textValue1">
			    <!-- <li class="mui-table-view-cell mui-media">
			        <a href="javascript:;">
			            <img class="mui-media-object mui-pull-left" src="http://placehold.it/97x75">
			            <div class="mui-media-body">
			              	  创意520黑白情侣对杯
			            	<div class="mui-ellipsis" style="float: left;line-height: 30px;width: 60%;">
								<label style="color: #D02368;font-size: 11px;">￥</label>
								<span style="color: #D02368 !important;font-size: 15px;">229</span>
								<del style="font-size: 12px;color: #999;"><label style="font-size: 12px;">￥</label>188</del>
			                	<div class="progress">
									<div class="bar" style="width: 0%;">0%</div>
								</div>
			                </div>
			                <div class="mashangqiang">马上抢</div>
			            </div>
			        </a>
			    </li> -->
			</ul>
		</div> 
		<div class="return-div" onclick="window.history.back(-1);">返回</div>
		<script type="text/javascript" src="js/jquery-1.7.1.js" ></script>
		<script type="text/javascript" src="js/jquery.cookie.js"></script>
 		<script type="text/javascript" src="js/ajax.js"></script>
		<script src="js/mui.min.js"></script>
		<script>
		  function onloadd(){
		    var paramData;
		    var paramData={1:1};                               
		    var object = JSON.stringify(paramData);
		    ajaxPost("<%=basePath%>wenxin_store/findStoreByState4",object,"json","json",showStoreByType4);
		 };
		 window.onload=function(){
		  onloadd();
		 };
		 /*获取商品列表信息*/
		 function showStoreByType4(data){
		 ///alert(JSON.stringify(data.object));
		 //debugger;
		  var htmlstr ="";
		  var dataList =data.object;
		  if(dataList != null){
		   for(var i = 0 ; i< dataList.length; i++){
		     htmlstr +='<li class="mui-table-view-cell mui-media">'+
			            '<img class="mui-media-object mui-pull-left" id="storeImg" onclick="storeDetail('+ dataList[i].store_id +')" src="<%=basePath%>file/store/img/'+dataList[i].store_picture+'">'+
			            '<div class="mui-media-body">'+dataList[i].store_name+
			            	'<div class="mui-ellipsis" style="float: left;line-height: 30px;width: 60%;">'+
								'<label style="color: #D02368;font-size: 11px;">￥</label>'+
								'<span style="color: #D02368 !important;font-size: 15px;">'+dataList[i].store_price+'</span>'+
								'<del style="font-size: 12px;color: #999;"><label style="font-size: 12px;">￥</label>'+dataList[i].prime_price+'</del>'+
			                	'<div class="progress">'+
									'<div class="bar" style="width: 0%;">'+0+'%</div>'+
								'</div>'+
			                '</div>'+
			                '<div class="mashangqiang" onclick="addcar('+dataList[i].store_id+')">'+
			                '马上抢</div>'+
			            '</div>'+
			    '</li>';
		   }
		  	document.getElementById("textValue1").innerHTML = htmlstr;
		  }else{
		   alert("数据请求为空！");
		  }
		 };
		  /*点击商品图片跳转至商品详情页面*/
		 function storeDetail(store_id){
		  window.location="<%=basePath%>wenxin_store/storeDetail?store_id="+store_id;
		 }
		 function addcar(store_id){
		 	window.location="<%=basePath%>order_weixin/shopping_cart?store_id="+store_id;
		 }
			mui.init({
				swipeBack:true //启用右滑关闭功能
			});
			
		</script>
	</body>
</html>