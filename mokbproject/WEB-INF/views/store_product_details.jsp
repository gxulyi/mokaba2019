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
		<title>产品详情</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />

		<link href="css/mui.min.css" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="css/fonts/iconfont/iconfont.css" />
		<link rel="stylesheet" type="text/css" href="css/public.css" />
		<link rel="stylesheet" type="text/css" href="css/mainstyle.css" />
		<link rel="stylesheet" type="text/css" href="css/store_product_details.css" />
		<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
		<script type="text/javascript" src="js/ajax.js"></script>

	</head>

	<body>
		<!--主体部分-->
		<div class="mui-content">
			<!--搜索框-->
			<div class="search">
				<div class="search-left mui-action-back">
					<i class="iconfont icon-left"></i>
				</div>
			</div>

			<div class="mdfd-content">
				<div class="position-relative">
					<!--产品详情轮播图开始-->
					<div id="banner" class="position-relative"></div>
					<!--产品详情轮播图结束-->

					<!--详情介绍-->
					<div class="position-relative" id="gooddetai"></div>

					<!--评价-->
					<div class="evaluation">
						<h4>评价</h4>
						<div class="evaluation-single-box">
							<div class="evaluation-single" id="pinglun"></div>
						</div>
						<a onclick="opendurl()" class="allevaluation-btn">全部评价&gt;</a>
					</div>

					<!--产品详情-->
					<div class="detail-detail">
						<p class="detail-tip">--详情--</p>
						<div class="position-relative" id="store_pictures"></div>
					</div>
				</div>
			</div>
		</div>

		<script src="js/mui.min.js"></script>
		<script type="text/javascript">
			//获取url中的参数
			function getUrlParam(name) {
				var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
				var r = window.location.search.substr(1).match(reg); //匹配目标参数
				if(r != null) return unescape(r[2]);
				return null; //返回参数值
			}

			// 请求商品信息
			var store_id = getUrlParam('store_id');
			var paramData = {
				store_id: store_id
			};
			var object = JSON.stringify(paramData);
			ajaxPost("<%=basePath%>wenxin_store/findStore", object, "json", "json", function_product);

			var storteName = "";

			// 获取商品信息
			function function_product(data) {
				var storeBasics = data.sbd.storeBasics;
				storteName = storeBasics.store_name;
				var tutorNum = storeBasics.tutor_num;
				//图片数组
				var list_store_picture = storeBasics.store_picture.split(";");
				// 去掉图片数组的第一张图片
				var picArr = list_store_picture.splice(tutorNum, (list_store_picture.length - 1));
				var parentElementObj = document.getElementById('banner');
				SiderOnload(picArr, parentElementObj);

				// 商品详情
				var store_intro = storeBasics.store_intro;
				document.getElementById("store_pictures").innerHTML = store_intro;

				var goodhtml = '<div class="detail-info-box">' +
					'	<h4 class="default-text-color">' + storeBasics.store_name + '</h4>' +
					'	<p class="default-text-color price">' +
					'		<span>￥' + storeBasics.store_price.toFixed(2) + '</span>&nbsp;&nbsp;' +
					'		<a href="<%=basePath%>HomeController/product_pay?store_id=' + storeBasics.store_id + '">立即购买</a>' +
					'	</p>' +
					'</div>';
				var store_picture_html = '';
				$("#gooddetai").append(goodhtml);

			}

			/**
			 * 动态加载轮播图
			 * @param {Object} imgArr 图片数组
			 * @param {Object} elementObj 加入的位置的id
			 * @data 2018年4月26日
			 * @author xyl
			 * @version 1.0.0
			 */
			function SiderOnload(imgArr, elementObj) {
				// 轮播框
				var sliderDiv = document.createElement('div');
				sliderDiv.className = 'mui-slider';
				sliderDiv.id = 'slider';
				elementObj.appendChild(sliderDiv);

				// 图片层
				var sliderGroup = document.createElement('div');
				sliderGroup.className = 'mui-slider-group mui-slider-loop';
				sliderGroup.id = 'slidergroup';
				document.getElementById('slider').appendChild(sliderGroup);
				var html = '';
				for(var i = 0; i < imgArr.length + 2; i++) {
					if(i == 0) {
						html += '<div class="mui-slider-item mui-slider-item-duplicate slider">' +
							'	<a href="javascript:void(0);">' +
							'		<img src="file/store/img/' + imgArr[imgArr.length - 1] + '" onerror="javascript:this.src=\'http://via.placeholder.com/216X120\'">' +
							'	</a>' +
							'</div>';
					} else if(i == imgArr.length + 1) {
						html += '<div class="mui-slider-item mui-slider-item-duplicate slider">' +
							'	<a href="javascript:void(0);">' +
							'		<img src="file/store/img/' + imgArr[0] + '" onerror="javascript:this.src=\'http://via.placeholder.com/216X120\'">' +
							'	</a>' +
							'</div>';
					} else {
						var k = i - 1;
						html += '<div class="mui-slider-item">' +
							'	<a href="javascript:void(0);">' +
							'		<img src="file/store/img/' + imgArr[k] + '" onerror="javascript:this.src=\'http://via.placeholder.com/216X120\'">' +
							'	</a>' +
							'</div>';
					}
				}
				document.getElementById('slidergroup').innerHTML = html;
				// 图片下面的圆点
				var sliderIndicator = document.createElement('div');
				sliderIndicator.className = 'mui-slider-indicator';
				sliderIndicator.id = 'sliderindicator';
				document.getElementById('slider').appendChild(sliderIndicator);
				var indicatorHTML = '';
				for(var j = 0; j < imgArr.length; j++) {
					if(j == 0) {
						indicatorHTML += '<div class="mui-indicator mui-active"></div>';
					} else {
						indicatorHTML += '<div class="mui-indicator"></div>';
					}
				}
				document.getElementById('sliderindicator').innerHTML = indicatorHTML;
				var slider = mui('#slider');
				//轮播图滚动方法
				slider.slider({
					interval: 5000
				});
			}

			function getMyDate(str) {
				var oDate = new Date(str),
					oYear = oDate.getFullYear(),
					oMonth = oDate.getMonth() + 1,
					oDay = oDate.getDate(),
					oHour = oDate.getHours(),
					oMin = oDate.getMinutes(),
					oSen = oDate.getSeconds(),
					oTime = oYear + '-' + getzf(oMonth) + '-' + getzf(oDay); //最后拼接时间  
				return oTime;
			};

			//补0操作
			function getzf(num) {
				if(parseInt(num) < 10) {
					num = '0' + num;
				}
				return num;
			}

			//查询最新商品评论
			function findEvaluationNew(data) {
				var storeEvaluation = data.sed.storeEvaluation;
				if(storeEvaluation == null) {
					var htmlpinglun = '<div class="position-relative">' +
						'		<div class="evaluation-touxiang">' +
						//'			<img src="file/jointly/images/maid/default-portrait.png"/>'+
						'		</div>' +
						//'		<h4 class="evaluation-nickname">往事随风</h4>'+
						'</div>' +
						'<p class="default-text-color" style="margin-top: 10px;">暂无评价</p>';
					$("#pinglun").append(htmlpinglun);
				} else {
					var htmlpinglun = '<div class="position-relative">' +
						'		<div class="evaluation-touxiang">' +
						'			<img src="file/jointly/images/maid/default-portrait.png"/>' +
						'		</div>' +
						'		<h4 class="evaluation-nickname">' + storeEvaluation.weixin_nickname + '</h4>' +
						'</div>' +
						'<p class="default-text-color">' + storeEvaluation.evaluation_value + '</p>' +
						'<p><span>' + getMyDate(storeEvaluation.evaluation_date) + '</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>' + storteName + '</span></p>';
					$("#pinglun").append(htmlpinglun);
				}
			}
			ajaxPost("<%=basePath%>wenxin_store/findEvaluationNew", object, "json", "json", findEvaluationNew);

			function opendurl() {
				window.location.href = 'HomeController/allevaluation?store_id=' + store_id;
			}
		</script>
	</body>

</html>