<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<base href="<%=basePath%>">
		<title>积分商城</title>
		<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">

		<!--标准mui.css-->
		<link rel="stylesheet" href="css/mui.min.css">
		<link rel="stylesheet" href="css/icons-extra.css" />
		<link rel="stylesheet" href="css/integral.css" />
		<script type="text/javascript" src="js/jquery-1.7.1.js" ></script>
	</head>
	<body>
		<div class="mui-content">
			<!--轮播图-->
			<div id="slider" class="mui-slider" style="position: relative;">
			  <div class="mui-slider-group mui-slider-loop">
			    <!-- 额外增加的一个节点(循环轮播：第一个节点是最后一张轮播) -->
			    <div class="mui-slider-item mui-slider-item-duplicate">
			      <a href="#">
			        <img src="images/integral/banner.png">
			      </a>
			    </div>
			    <!-- 第一张 -->
			    <div class="mui-slider-item">
			      <a href="#">
			        <img src="images/integral/banner.png">
			      </a>
			    </div>
			    <!-- 额外增加的一个节点(循环轮播：最后一个节点是第一张轮播) -->
			    <div class="mui-slider-item mui-slider-item-duplicate">
			      <a href="#">
			        <img src="images/integral/banner.png">
			      </a>
			    </div>
			  </div>
			</div>
			<ul class="mui-table-view mui-grid-view mui-grid-9 ul-div">
				<li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3 ui-li">
				    <a onclick="window.location='integra_weixin/myintegral'">
				        <img style="width: 18px;height: 19px;" src="images/integral/zhuanqujifen.png"/>
				        <div class="mui-media-body" style="font-size: 12px;color: #666;margin-top: 5px;">
							<label></label>
							<label>积分</label>
						</div>
				    </a>
				</li>
				<li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3 ui-li">
				    <a onclick="window.location='integra_weixin/myintegral'">
				       <img style="width: 18px;height: 19px;" src="images/integral/jifenmingxi.png"/>
				        <div class="mui-media-body" style="font-size: 12px;color: #666;margin-top: 5px;">积分明细</div>
				    </a>
				</li>
				<li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3 ui-li">
				    <a onclick="window.location='integra_weixin/myintegral'">
				        <img style="width: 18px;height: 19px;" src="images/integral/dunhuan.png"/>
				        <div class="mui-media-body" style="font-size: 12px;color: #666;margin-top: 5px;">兑换记录</div>
				    </a>
				</li>
			   </ul>
			<!--商城列表-->
			<ul class="mui-table-view mui-grid-view commsd" id ="textValue">
		        <!-- <li class="mui-table-view-cell mui-media mui-col-xs-6">
	            	<div class="commodity-exchange-img">
	            		<img alt="" src="images/integral/shangpin.png">
	            	</div>
	            	<div class="commodity-exchange-price">
	            		<span>￥144.00</span>
	            		<span>立即兑换</span>
	            	</div>
	            	<div class="commodity-exchange-name">良品竹匠抽纸1提</div>
	            	<div class="commodity-exchange-jifen">
	            		<span>可用300积分</span>
	            		<span>运费：10.00</span>
	            	</div>
		        </li>
		      	<li class="mui-table-view-cell mui-media mui-col-xs-6">
	            	<div class="commodity-exchange-img">
	            		<img alt="" src="images/integral/shangpin.png">
	            	</div>
	            	<div class="commodity-exchange-price">
	            		<span>￥144.00</span>
	            		<span>立即兑换</span>
	            	</div>
	            	<div class="commodity-exchange-name">良品竹匠抽纸1提</div>
	            	<div class="commodity-exchange-jifen">
	            		<span>可用300积分</span>
	            		<span>运费：10.00</span>
	            	</div>
		        </li>
		        <li class="mui-table-view-cell mui-media mui-col-xs-6">
	            	<div class="commodity-exchange-img">
	            		<img alt="" src="images/integral/shangpin.png">
	            	</div>
	            	<div class="commodity-exchange-price">
	            		<span>￥144.00</span>
	            		<span>立即兑换</span>
	            	</div>
	            	<div class="commodity-exchange-name">良品竹匠抽纸1提</div>
	            	<div class="commodity-exchange-jifen">
	            		<span>可用300积分</span>
	            		<span>运费：10.00</span>
	            	</div>
		        </li>
		      	<li class="mui-table-view-cell mui-media mui-col-xs-6">
	            	<div class="commodity-exchange-img">
	            		<img alt="" src="images/integral/shangpin.png">
	            	</div>
	            	<div class="commodity-exchange-price">
	            		<span>￥144.00</span>
	            		<span>立即兑换</span>
	            	</div>
	            	<div class="commodity-exchange-name">良品竹匠抽纸1提</div>
	            	<div class="commodity-exchange-jifen">
	            		<span>可用300积分</span>
	            		<span>运费：10.00</span>
	            	</div>
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
		    ajaxPost("<%=basePath%>wenxin_store/findStoreByState3",object,"json","json",showStoreByType3);
		 };
		 window.onload=function(){
		  onloadd();
		 };
		 /*查询积分商品所有信息*/
		 function showStoreByType3(data){
		 	var htmlstr = "";
		 	var dataList = data.object ;
		 	if(dataList != null){
		 	  for(var i = 0 ;i < dataList.length ; i++){
		 	  	htmlstr +='<li class="mui-table-view-cell mui-media mui-col-xs-6">'+
	            	'<div class="commodity-exchange-img" onclick="storeDetail('+ dataList[i].store_id +')">'+
	            		'<img alt="" src="<%=basePath%>file/store/img/'+dataList[i].store_picture+'">'+
	            	'</div>'+
	            	'<div class="commodity-exchange-price">'+
	            		'<span>￥'+dataList[i].store_price+'</span>'+
	            		'<span>立即兑换</span>'+
	            	'</div>'+
	            	'<div class="commodity-exchange-name">'+dataList[i].store_name+'</div>'+
	            	'<div class="commodity-exchange-jifen">'+
	            		'<span>可用'+dataList[i].required_integral+'积分</span>'+
	            		//'<span>运费：10.00</span>'+
	            	'</div>'+
		        '</li>';
		 	  }
		 	  document.getElementById("textValue").innerHTML=htmlstr;
		 	}else{
				alert("请求数据为空");		 	
		 	}		 
		 }	
		 /*点击商品图片跳转至商品详情页面*/
		 function storeDetail(store_id){
		  window.location="<%=basePath%>wenxin_store/storeDetail?store_id="+store_id;
		 }
			mui.init({
				swipeBack:true //启用右滑关闭功能
			});
			
		</script>
	</body>

</html>