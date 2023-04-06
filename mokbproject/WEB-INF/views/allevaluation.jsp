<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>

	<head>
		<base href="<%=basePath%>">
		<meta charset="UTF-8">
		<title>评价</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />

		<link href="css/mui.min.css" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="css/fonts/iconfont/iconfont.css" />
		<link rel="stylesheet" type="text/css" href="css/public.css" />
		<link rel="stylesheet" type="text/css" href="css/mainstyle.css" />
		<link rel="stylesheet" type="text/css" href="css/allevaluation.css" />

	</head>

	<body>
		<!--主体-->
		<div class="mui-content">
			<!--搜索框-->
			<div class="search border-knowledge">
				<div class="search-left mui-action-back">
					<i class="iconfont icon-left"></i>
				</div>
			</div>
			<!--评价列表-->
			<div class="mdfd-content" id="pingjia"></div>
		</div>
		<script src="js/mui.min.js"></script>
		<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
		<script type="text/javascript" src="js/jquery.cookie.js"></script>
		<script type="text/javascript" src="js/ajax.js"></script>
		<script src="js/timestampToTime.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			$(function() {
				var store_id = getUrlParam('store_id');
				var storteName = "";

				var paramData = {
					store_id: store_id
				};
				var object = JSON.stringify(paramData);
				ajaxPost("<%=basePath%>wenxin_store/findStore", object, "json", "json", function_product);

				var object = JSON.stringify(paramData);
				ajaxPost("<%=basePath%>wenxin_store/findEvaluation", object, "json", "json", findEvaluation);
			});
			
			//获取url中的参数
			function getUrlParam(name) {
				var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
				var r = window.location.search.substr(1).match(reg); //匹配目标参数
				if(r != null) return unescape(r[2]);
				return null; //返回参数值
			}
			
			function function_product(data) {
				var storeBasics = data.sbd.storeBasics;
				storteName = storeBasics.store_name;
			}
			
			function findEvaluation(data) {
				var ListStoreEvaluation = data.sed.listStoreEvaluation;
				if(ListStoreEvaluation.length < 1) {
					var wupingjia = '<p style="text-align: center;margin-top: 70px;">当前暂无评价哦</p>';
					$("#pingjia").append(wupingjia);
				} else {
					var pingjia = "";
					for(var i = 0; i < ListStoreEvaluation.length; i++) {
						//alert(ListStoreEvaluation[i].weixin_nickname);
						//图片数组
						// var list_store_picture=ListStoreEvaluation.store_picture.split(";")
						pingjia  += '<div class="evaluation-list-box">' +
									'		<div class="evaluation-list">' +
									'			<div class="evaluation-head">' +
									'				<div class="evaluation-head-touxiang">';
						if(ListStoreEvaluation[i].weixin_portrait != null) {
						 	pingjia += '				<img src="file/jointly/images/maid/'+ ListStoreEvaluation[i].weixin_portrait +'"/>';
						} else {
							pingjia += '				<img src="file/jointly/images/maid/default-portrait.png"/>';
						}
						pingjia += '				</div>' +
								   '				<h4>' + ListStoreEvaluation[i].weixin_nickname + '</h4>' +
								   '			</div>' +
								   '			<p class="evaluation-content-box">' +
								   '				<div class="default-text-color evaluation-content">' + ListStoreEvaluation[i].evaluation_value + '</div>' +
								   '				<div class="position-relative">' +
								   '					<div class="evaluation-content-img">' +
								   //'						<img src="file/jointly/images/banner/home/banner2.png"/>'+
								   '					</div>' +
								   '					<div class="evaluation-content-img">' +
								   //'						<img src="file/jointly/images/banner/home/banner2.png"/>'+
								   '					</div>' +
								   '					<div class="evaluation-content-img">' +
								   //'						<img src="file/jointly/images/banner/home/banner2.png"/>'+
								   '					</div>' +
								   '				</div>' +
								   '			</p>' +
								   '			<p><span>' + timestampToTime(ListStoreEvaluation[i].evaluation_date) + '</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>' + storteName + '</span></p>' +
								   '			<p class="position-relative">' +
								   //'				<div class="default-text-color evaluation-foot">回复<span>2</span>次</div>'+
								   '				<div class="default-text-color evaluation-foot">' +
								   //'					<i class="iconfont icon-yueduliang shade"></i>&nbsp;&nbsp;<span>250</span>'+
								   '			</div>' +
								   '	</p>' +
								   '</div>';
					}
					$("#pingjia").append(pingjia);
				}
			}
			
		</script>

	</body>

</html>