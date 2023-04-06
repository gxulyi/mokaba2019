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
		<title>定制详情</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		
		<link href="css/mui.min.css" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="css/fonts/iconfont/iconfont.css"/>
		<link rel="stylesheet" type="text/css" href="css/public.css"/>
		<link rel="stylesheet" type="text/css" href="css/mainstyle.css"/>
		<link rel="stylesheet" type="text/css" href="css/customize_product_details.css"/>
		
		<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
		<script type="text/javascript" src="js/jquery-form.js" ></script>
		<script type="text/javascript" src="js/ajax.js"></script>
		<script type="text/javascript" src="js/jquery.cookie.js"></script>
	    
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
				<div class="position-relative" style="background-color: #f0f0f0;">
					<!--产品详情轮播图开始-->
					<div id="banner" class="position-relative"></div>
				    <!--产品详情轮播图结束-->
				    <input id="store_id" value="${store_id}"  style="display: none">
					<!--定制产品详情-->
					<div class="position-relative">
						<div class="detail-info-box" style="background-color: #ffffff;height: 75px;">
							<div style="float:left;width:70%;overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
								<h4 class="default-text-color" id="store_name" style="font-size: 17px;color:#333;line-height: 25px;margin-top:10px;"></h4>
								<div class="default-text-color price" style="font-size: 18px;color:#333;line-height: 25px;">
									<span><span style="color:#f39616;">￥<span id="store_price"></span></span>元/年</span>
								</div>
							</div>
							<div style="float:right;width:30%;padding:20px 0;font-size: 15px;" class="price">
								<a id="payBtn" style="padding: 2px 8px;background: #62bca3;" href="<%=basePath%>HomeController/product_pay?store_id=${store_id}">立即交纳</a>
							</div>
						</div>
						<div class="evaluation" style="background-color: #ffffff;padding:0 10px;">
							<div class="" style="padding-top:10px;">
								<span style="font-size: 16px;color:#333;">评价</span>
								<a onclick="opendurl()" style="float:right;font-size: 13px;color: #62bca3;">查看全部 &gt;</a>	
							</div>
							<div id="pinglun"></div>
						</div>
						
						<!--定制产品详情-->
						<div  class="detail-detail" style="background-color:#ffffff;padding:10px;">
							<div class="" style="padding-top:10px;">
								<span style="font-size: 16px;color:#333;">详情</span>
							</div>
							<ul style="list-style: none;margin:10px 0px;padding:0;" id="sver_id" ></ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<script src="js/mui.min.js"></script>
		<script src="js/timestampToTime.js"></script>
		<script type="text/javascript">
		
			function showSver(vsi){
				var str = "";
				var lps = vsi.personalServerData.listPersonalServer;
				for(var i = 0;i < lps.length;i ++){
					str += "<li class='detail-detail_li' onclick=javascript:{window.location='weixin_personal/toFindSverOne?server_id=" + lps[i].server_id + "'}>"+
						   "	<div class='detail-detail_li_img'>"+
						   "		<img style='width:100%;height: 100%;' src='/medicinefood/file/store/img/"+lps[i].server_picture +"'>"+
						   "	</div>"+
						   "	<span>"+
						   "		<a href='javascript:void(0);' class='default-text-color' style='line-height: 1.2;border-bottom: 1px solid #fff;padding-bottom: 5px;display: block;'>" + lps[i].server_name + "</a>"+
						   "	</span>"+
						   "</li>";
				}
				document.getElementById("sver_id").innerHTML=str;
			}
		
			function showStore(vsi){
				var picStr="";
				var storeBasics=vsi.sbd.storeBasics;
				document.getElementById("store_name").innerHTML=storeBasics.store_name;
				document.getElementById("store_price").innerHTML=storeBasics.store_price.toFixed(2) ;
				var pictures=storeBasics.store_picture;
				
				var pic=pictures.split(";");
				// 去掉图片数组的第一张图片
				var picArr = pic.splice(1,(pic.length-1)) ;
				var parentElementObj = document.getElementById('banner');
				SiderOnload(picArr,parentElementObj);
				
				// 商品简介
				/* var store_intro=storeBasics.store_intro;
				document.getElementById("picture").innerHTML=store_intro; */
				
				
				var store_services=storeBasics.store_service;
				var paramData={store_services:store_services};
				var object = JSON.stringify(paramData);
				ajaxPost("<%=basePath%>weixin_personal/findBagSver",object,"json","json",showSver);
				
				
			}
		
			/**
			 * 动态加载轮播图
			 * @param {Object} imgArr 图片数组
			 * @param {Object} elementObj 加入的位置的id
			 * @data 2018年4月26日
			 * @author xyl
			 * @version 1.0.0
			 */
			function SiderOnload(imgArr,elementObj){
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
				var html ='';
				for(var i = 0;i<imgArr.length+2;i++){
					if(i==0){
						html += '<div class="mui-slider-item mui-slider-item-duplicate slider">'+
								'	<a href="javascript:void(0);">'+
								'		<img src="file/store/img/'+imgArr[imgArr.length-1]+'" onerror="javascript:this.src=\'http://via.placeholder.com/216X120\'">'+
								'	</a>'+
								'</div>';
					}
					else if(i==imgArr.length+1){
						html += '<div class="mui-slider-item mui-slider-item-duplicate slider">'+
								'	<a href="javascript:void(0);">'+
								'		<img src="file/store/img/'+imgArr[0]+'" onerror="javascript:this.src=\'http://via.placeholder.com/216X120\'">'+
								'	</a>'+
								'</div>';
					}else{
						var k = i-1;
						html += '<div class="mui-slider-item">'+
								'	<a href="javascript:void(0);">'+
								'		<img src="file/store/img/'+imgArr[k]+'" onerror="javascript:this.src=\'http://via.placeholder.com/216X120\'">'+
								'	</a>'+
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
				for(var j = 0;j<imgArr.length;j++){
					if(j==0){
						indicatorHTML += '<div class="mui-indicator mui-active"></div>';
					}else{
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
			
			function findStore(){
				ajaxPost("<%=basePath%>wenxin_store/findStore",object,"json","json",showStore);
			}
			window.onload=function(){
		    	findStore();
			};
			
			function opendurl(){
				window.location.href='HomeController/allevaluation?store_id='+document.getElementById("store_id").value;
			}
			
			var store_id=document.getElementById("store_id").value;
			var paramData={store_id:store_id};
			var object = JSON.stringify(paramData);
		 	ajaxPost("<%=basePath%>wenxin_store/findEvaluationNew",object,"json","json",findEvaluationNew);
		 	
		 	function findEvaluationNew(data){
				var storeEvaluation=data.sed.storeEvaluation;
		 		if(storeEvaluation==null){
		 	 	var htmlpinglun =  '<p class="" style="margin-top: 5px;margin-left:30px;">暂无评价</p>';
		 	 		$("#pinglun").append(htmlpinglun);
			 	}else{
		 	  		var htmlpinglun = '<div style="height:35px;line-height: 35px;">'+
							   '<div style="float:left;width:23px;height:23px;border-radius:100%;margin:5px;">'+
							  	'<img src="file/jointly/images/maid/default-portrait.png" style="width:100%;height:100%;">' +
							   '</div>'+
							   '<p style="color:#333;float:left;font-size: 14px;margin-left:5px;margin-bottom: 0px;">'+storeEvaluation.weixin_nickname+'</p>'+
							  '</div>'+
							  '<p style="margin-left: 35px;color:#999;font-size: 14px;line-height: 30px;overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">'+storeEvaluation.evaluation_value+'</p>';
					$("#pinglun").append(htmlpinglun);
		 		}
		 
		 	}
		 	
		</script>
	</body>

</html>