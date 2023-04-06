<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>

	<head>
	<base href="<%=basePath%>">
		<meta charset="UTF-8">
	
		<title>定制</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		
		<link href="css/mui.min.css" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="css/fonts/iconfont/iconfont.css"/>
		<link rel="stylesheet" type="text/css" href="css/public.css"/>
		<link rel="stylesheet" type="text/css" href="css/mainstyle.css"/>
		<link rel="stylesheet" type="text/css" href="css/customizecss.css"/>
		<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
		<script type="text/javascript" src="js/ajax.js"></script>
		<script type="text/javascript" src="js/jquery.cookie.js"></script>
		<style type="text/css">
			.mui-slider-item{height: auto !important;}
		</style>
	</head>

	<body>
		
		<div class="mui-content">
			<!-- 顶部 -->
			<div class="top-img">
				<img src="file/jointly/images/icon/icon-customize-logo.png" />
			</div>
			<!-- 轮播图部分 -->
			<div class="Sowing-map">
				<!-- <img src="file/jointly/images/banner/customize/icon-customize.png" /> -->
					<!--商城轮播图-->
				<div id="slider" class="mui-slider">
			      	<div class="mui-slider-group mui-slider-loop">
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
							<%// 将请求、响应的编码均设置为UTF-8（防止中文乱码）
									request.setCharacterEncoding("UTF-8");
									response.setCharacterEncoding("UTF-8");
							List<HashMap<String, Object>> listMap=null;
							listMap=(List<HashMap<String, Object>>)request.getAttribute("listMap");%>
					        	<%if(listMap.size()>=1){
								for(int i=0;i<listMap.size()+2;i++){
					   				if(i==0){%>
					     				<div class="mui-slider-item mui-slider-item-duplicate">
											<%-- <a href="<%=basePath%>/UEditorTemplateController/SelectArticleDatail?article_id=<%=listMap.get(listMap.size()-1).get("article_id")%>" > --%>
										   	<a href="JavaScript:void(0);">
										   		<img src="<%=listMap.get(listMap.size()-1).get("pictures_url")%>" onerror="javascript:this.src='http://via.placeholder.com/216X120'">
										  	</a>
										 </div>
					 				<%}else if(i==listMap.size()+1){%>		   
					 					<div class="mui-slider-item mui-slider-item-duplicate">
											<%-- <a href="<%=basePath%>/UEditorTemplateController/SelectArticleDatail?article_id=<%=listMap.get(0).get("article_id")%>"> --%>
										    <a href="JavaScript:void(0);">
										    	<img src="<%=listMap.get(0).get("pictures_url")%>" onerror="javascript:this.src='http://via.placeholder.com/216X120'">
										    </a>
										</div>
									<% }else{%>
										 <div class="mui-slider-item">
											<%-- <a href="<%=basePath%>/UEditorTemplateController/SelectArticleDatail?article_id=<%=listMap.get(i-1).get("article_id")%>"> --%>
											<a href="JavaScript:void(0);">
												<img src="<%=listMap.get(i-1).get("pictures_url")%>" onerror="javascript:this.src='http://via.placeholder.com/216X120'">
											</a>
										 </div>
									<%} %>
									<%} %>
								<%}%>
			      	</div>
			    </div>
			</div>
			<!-- 下面部分-->
			<!-- <ul id="shangpingList" class="timeline"></ul> -->
			<!--商城列表-->
			<div id="shangpingList" class="store-product-box">
				<!--最后一条竖线-->
				<!-- <div class="product-box product-box-left"></div> -->
				
			</div>
			
		</div>  
		
		<!--底部导航栏-->
		<nav class="mui-bar mui-bar-tab" style="heigth:50px;">
		    <a class="mui-tab-item" href="home">
		        <span class="mui-icon iconfont shade icon-tabber-home"></span>
		        <span class="mui-tab-label">首页</span>
		    </a>
		    <a class="mui-tab-item" href="store">
		        <span class="mui-icon iconfont shade icon-tabber-store"></span>
		        <span class="mui-tab-label">自助区</span>
		    </a>
		    <a class="mui-tab-item mui-active" href="customize">
		        <span class="mui-icon iconfont shade-active icon-tabber-customize"></span>
		        <span class="mui-tab-label">定制</span>
		    </a>
		    <a class="mui-tab-item" href="maid">
		        <span class="mui-icon iconfont shade icon-tabber-maid"></span>
		        <span class="mui-tab-label">管家</span>
		    </a>
		</nav>
		
		<script src="js/mui.min.js"></script>
		<script src="js/wx_common.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			// 底部导航栏点击事件
			mui('.mui-bar').on('tap','.mui-tab-item',function(){
				var href_str = this.href;
				var hrefArr = href_str.split('/');
				var page_url = '/'+hrefArr[hrefArr.length-1];
				var page_id = hrefArr[hrefArr.length-1];
				var argument = '';
				page_url="HomeController"+page_url;
				OpenPage(page_url,page_id,argument);
			});
			
   			var paramData={};                               
	      	var object = JSON.stringify(paramData);
	      	ajaxPost("<%=basePath%>wenxin_store/customMade",object,"json","json",function_product);
	      	
	      	function function_product(data){
  				var Ahtml="";
             	var listGoods=data.sbd.storeBasicsList;
             	for(var i=0;i<listGoods.length;i++){
             		var store_picture=listGoods[i]["store_picture"];
             		var pic=store_picture.split(";");
             		
             		if(i%2 == 0){
             			Ahtml += '<div class="product-box product-box-left">'+
             					 '	<div class="dot dot-left"></div>'+
             					 '		<div class="ledgement ledgement-left">'+
             					 '			<div class="product product-left" onclick="window.location=\'<%=basePath%>HomeController/customize_product_details?store_id='+listGoods[i]["store_id"]+'\'">'+
             					 '				<div class="circle-big">'+
             					 '					<img src="file/store/img/'+listGoods[i]["store_picture"].split(";")[0]+'" onerror="javascript:this.src=\'http://via.placeholder.com/100X100\'"/>'+
             					 '				</div>'+
             					 '				<div class="product-circle-big-info">'+
             					 '					<h4>'+ reverseCutOutStr(listGoods[i]["store_name"],5) +'</h4>'+
             					 '					<div class="store-price"><span class="price-tip">年度服务费:</span><span class="price">'+listGoods[i]["store_price"].toFixed(2)+'</span>元/年</div>'+
             					 '				</div>'+
             					 '			</div>'+
             					 '		</div>'+
             					 '	</div>'+
             					 '</div>';
             		}else{
             			Ahtml += '<div class="product-box product-box-right">'+
             					 '	<div class="dot dot-right"></div>'+
             					 '		<div class="ledgement ledgement-right">'+
             					 '			<div class="product product-right" onclick="window.location=\'<%=basePath%>HomeController/customize_product_details?store_id='+listGoods[i]["store_id"]+'\'">'+
             					 '				<div class="circle-big">'+
             					 '					<img src="file/store/img/'+listGoods[i]["store_picture"].split(";")[0]+'" onerror="javascript:this.src=\'http://via.placeholder.com/100X100\'"/>'+
             					 '				</div>'+
             					 '				<div class="product-circle-big-info">'+
             					 '					<h4>'+ reverseCutOutStr(listGoods[i]["store_name"],5) +'</h4>'+
             					 '					<div class="store-price"><span class="price-tip">年度服务费:</span><span class="price">'+listGoods[i]["store_price"].toFixed(2)+'</span>元/年</div>'+
             					 '				</div>'+
             					 '		</div>'+
             					 '	</div>'+
             					 '</div>';
             		}
                }
                // 商品列表距离顶部高度
				var productSetTopHeight = document.getElementById('shangpingList').offsetTop;
				// 商品列表占用高度
				var productHeight = (listGoods.length-1)*120 + 80 + 51;
				// 计算屏幕占用高度
				var useredHeight = productSetTopHeight + productHeight;
				var winHeight = window.innerHeight;
				if(winHeight-useredHeight>200){
					// 屏幕剩余部分中间竖线
					Ahtml += '<div class="product-box product-box-left" style="height:calc(100vh - '+ useredHeight +'px);"></div>';
				}else{
					Ahtml += '<div class="product-box product-box-left" style="height: 200px;"></div>';
				}
                $("#shangpingList").append(Ahtml);
			}
			
			/**
			 * 反转截取字符串
			 * @param {Object} str 目标字符串
			 * @param {Object} num 反向截取位数
			 */
			function reverseCutOutStr(str,num){
				// 颠倒字符串
				var temStr = str.split("").reverse().join("");
				// 截取字符串
				var newStr = temStr.slice(num,temStr.length).split("").reverse().join("");
				return newStr;
			}
		</script>
	</body>
</html>
