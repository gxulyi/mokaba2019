<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>

	<head>
		<base href="<%=basePath%>">
		<meta charset="UTF-8">
		<title>自助区</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />

		<link href="css/mui.min.css" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="css/fonts/iconfont/iconfont.css" />
		<link rel="stylesheet" type="text/css" href="css/public.css" />
		<link rel="stylesheet" type="text/css" href="css/mainstyle.css" />
		<link rel="stylesheet" type="text/css" href="css/store.css" />
		<script type="text/javascript" src="js/jquery-1.7.1.js"></script>

	</head>

	<body>
		<div class="mui-content">
			<!--导航栏-->
			<div class="search">
				<div class="search-center">
					<h4 class="default-text-color">
						<span class="category" onclick="window.location.href = 'https://weidian.com/?userid=1339305930&spider_token=2bbc&spider=seller_pc.decoration_pc.btn.1'">商品</span>
						<span class="category category-active">摩尔卡巴大学</span>
					</h4>
				</div>
			</div>
			
			<!--轮播图-->
			<div class="store-banner-box">
				<!--商城轮播图-->
				<div id="storeslider" class="mui-slider">
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
							<%-- <a href="<%=basePath%>/UEditorTemplateController/SelectArticleDatail?article_id=<%=listMap.get(listMap.size()-1).get("article_id")%>"> --%>
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
							<a href="JavaScript:void(0);">
								<%-- <a href="<%=basePath%>/UEditorTemplateController/SelectArticleDatail?article_id=<%=listMap.get(i-1).get("article_id")%>"> --%>
								<img src="<%=listMap.get(i-1).get("pictures_url")%>" onerror="javascript:this.src='http://via.placeholder.com/216X120'">
							</a>
						</div>

						<%} %>
						<%}%>
					</div>
					<%}%>
				</div>
			</div>
			
			<!--商城列表-->
			<div id="shangpingList" class="store-product-box"></div>
		</div>

		<!--底部导航栏-->
		<nav class="mui-bar mui-bar-tab">
			<a class="mui-tab-item" href="home">
				<span class="mui-icon iconfont shade icon-tabber-home"></span>
				<span class="mui-tab-label">首页</span>
			</a>
			<a class="mui-tab-item mui-active" href="store">
				<span class="mui-icon iconfont shade-active icon-tabber-store"></span>
				<span class="mui-tab-label">自助区</span>
			</a>
			<a class="mui-tab-item" href="customize">
				<span class="mui-icon iconfont shade icon-tabber-customize"></span>
				<span class="mui-tab-label">定制</span>
			</a>
			<a class="mui-tab-item" href="maid">
				<span class="mui-icon iconfont shade icon-tabber-maid"></span>
				<span class="mui-tab-label">管家</span>
			</a>
		</nav>

		<script src="js/mui.min.js"></script>
		<script src="js/wx_common.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript" src="js/jquery.cookie.js"></script>
		<script type="text/javascript" src="js/ajax.js"></script>
		<script type="text/javascript">

			mui('.mui-bar').on('tap', '.mui-tab-item', function() {
				var href_str = this.href;
				var hrefArr = href_str.split('/');
				var page_url = '/' + hrefArr[hrefArr.length - 1];
				var page_id = hrefArr[hrefArr.length - 1];
				var argument = '';
				page_url = "HomeController" + page_url;
				OpenPage(page_url, page_id, argument);
			});
			
			var slider = mui('#storeslider');
			//轮播图滚动方法
			slider.slider({
				interval: 5000
			});
			
			$.post("<%=basePath%>wenxin_store/findAllStore", getStoreProduct);

			function getStoreProduct(data) {
				$("#shangpingList").show();
				var Ahtml = "";
				var listGoods = data.sbd.storeBasicsList;
				var listGoodsLength = listGoods.length;	
				for(var i = 0; i < listGoodsLength; i++) {
					var tutorNum = listGoods[i].tutor_num;
					/* 判断数奇偶数 */
					if(i%2 == 0){
						Ahtml += '<div class="product-box product-box-left">'+
								 '	<div class="dot dot-left"></div>'+
								 '		<div class="ledgement ledgement-left">'+
								 '			<div class="product product-left" onclick="window.location=\'<%=basePath%>HomeController/store_product_details?store_id=' + listGoods[i]["store_id"] + '\'">';
								if(tutorNum == 2){
									Ahtml += '	<div class="circle-small circle-small-left"><img src="file/store/img/'+ listGoods[i]["store_picture"].split(";")[0] +'" onerror="javascript:this.src=\'http://via.placeholder.com/100X100\'"/></div>'+
									 		 '	<div class="circle-small circle-small-right"><img src="file/store/img/'+ listGoods[i]["store_picture"].split(";")[1] +'" onerror="javascript:this.src=\'http://via.placeholder.com/100X100\'"/></div>'+
									 		 '	<div class="product-circle-small-info">'+
									 		  '		<h4>'+
									 		 '			<span style="display:block;">课程:</span>'+
									 		 ' 			<span>'+ listGoods[i].store_name +'</span>' +
									 		 '		</h4>'+
									 		 '		<div class="class-hour">学时:'+ listGoods[i].class_hour +'</div>'+
									 		 '		<div class="store-price">'+
									 		 '			<span class="price-tip">课时费:</span>'+
									 		 '			<span class="price">'+ listGoods[i].store_price.toFixed(2) +'</span>元'+
									 		 '		</div>'+
									 		 '	</div>';
								}else if(tutorNum == 1){
									Ahtml += '	<div class="circle-big"><img src="file/store/img/'+ listGoods[i]["store_picture"].split(";")[0] +'" onerror="javascript:this.src=\'http://via.placeholder.com/100X100\'"/></div>'+
									 		 '	<div class="product-circle-big-info">'+
									 		  '		<h4>'+
									 		 '			<span style="display:block;">课程:</span>'+
									 		 ' 			<span>'+ listGoods[i].store_name +'</span>' +
									 		 '		</h4>'+
									 		 '		<div class="class-hour">学时:'+ listGoods[i].class_hour +'</div>'+
									 		 '		<div class="store-price">'+
									 		 '			<span class="price-tip">课时费:</span>'+
									 		 '			<span class="price">'+ listGoods[i].store_price.toFixed(2) +'</span>元'+
									 		 '		</div>'+
									 		 '	</div>';
								};
						Ahtml += '			</div>'+
								 '		</div>'+
								 '</div>';	
					}else if(i%2 != 0){
						Ahtml += '<div class="product-box product-box-right">'+
								 '	<div class="dot dot-right"></div>'+
								 '		<div class="ledgement ledgement-right">'+
								 '			<div class="product product-right" onclick="window.location=\'<%=basePath%>HomeController/store_product_details?store_id=' + listGoods[i]["store_id"] + '\'">';
								if(tutorNum == 2){
									Ahtml += '	<div class="circle-small circle-small-left"><img src="file/store/img/'+ listGoods[i]["store_picture"].split(";")[0] +'" onerror="javascript:this.src=\'http://via.placeholder.com/100X100\'"/></div>'+
									 		 '	<div class="circle-small circle-small-right"><img src="file/store/img/'+ listGoods[i]["store_picture"].split(";")[1] +'" onerror="javascript:this.src=\'http://via.placeholder.com/100X100\'"/></div>'+
									 		 '	<div class="product-circle-small-info">'+
									 		 '		<h4>'+
									 		 '			<span style="display:block;">课程:</span>'+
									 		 ' 			<span>'+ listGoods[i].store_name +'</span>' +
									 		 '		</h4>'+
									 		 '		<div class="class-hour">学时:'+ listGoods[i].class_hour +'</div>'+
									 		 '		<div class="store-price">'+
									 		 '			<span class="price-tip">课时费:</span>'+
									 		 '			<span class="price">'+ listGoods[i].store_price.toFixed(2) +'</span>元'+
									 		 '		</div>'+
									 		 '	</div>';
								}else if(tutorNum == 1){
									Ahtml += '	<div class="circle-big"><img src="file/store/img/'+ listGoods[i]["store_picture"].split(";")[0] +'" onerror="javascript:this.src=\'http://via.placeholder.com/100X100\'"/></div>'+
									 		 '	<div class="product-circle-big-info">'+
									 		  '		<h4>'+
									 		 '			<span style="display:block;">课程:</span>'+
									 		 ' 			<span class="price">'+ listGoods[i].store_name +'</span>' +
									 		 '		</h4>'+
									 		 '		<div class="class-hour">学时:'+ listGoods[i].class_hour +'</div>'+
									 		 '		<div class="store-price">'+
									 		 '			<span class="price-tip">课时费:</span>'+
									 		 '			<span class="price">'+ listGoods[i].store_price.toFixed(2) +'</span>元'+
									 		 '		</div>'+
									 		 '	</div>';
								};
						Ahtml += '			</div>'+
								 '		</div>'+
								 '</div>';
					}
				}
					// 商品列表距离顶部高度
					var productSetTopHeight = document.getElementById('shangpingList').offsetTop;
					// 商品列表占用高度
					var productHeight = (listGoodsLength-1)*120 + 50 + 51;
					// 计算屏幕占用高度
					var useredHeight = productSetTopHeight + productHeight;
					var winHeight = window.innerHeight;
					if(winHeight-useredHeight>0){
						// 屏幕剩余部分中间竖线
						Ahtml += '<div class="product-box product-box-left" style="height:calc(100vh - '+ useredHeight +'px);"></div>';
					}else{
						Ahtml += '<div class="product-box product-box-left" style="height: 220px;"></div>';
					}
					
				$("#shangpingList").append(Ahtml);
			}
			
			//获取url中的参数
			function getUrlParam(name) {
				var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
				var r = window.location.search.substr(1).match(reg); //匹配目标参数
				if(r != null) return unescape(r[2]);
				return null; //返回参数值
			};

		</script>
	</body>

</html>