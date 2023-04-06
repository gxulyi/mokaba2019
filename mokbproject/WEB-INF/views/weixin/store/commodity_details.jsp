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
		<title>商品详情</title>
		<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">

		<!--标准mui.css-->
		<link rel="stylesheet" href="css/mui.min.css">
		<link rel="stylesheet" href="css/style.css" />
		<link rel="stylesheet" href="css/Commodity_details.css" />
		<link rel="stylesheet" href="css/icons-extra.css" />
		<link rel="stylesheet" type="text/css" href="http://cdn.bootcss.com/font-awesome/4.6.0/css/font-awesome.min.css">
		<script type="text/javascript" src="js/jquery-1.7.1.js" ></script>
		<style>
			.mui-table-view::before{
				height: auto !important;
			}
		</style>
	</head>
	<body>
		<header class="mui-bar mui-bar-nav" style="background: #04757D;">
			<div class="title_div">
				<div class="title_div_li" onclick="clickShowDiv(this,'shiping_div');">
					<span style="border-bottom:2px solid #fff;padding-bottom:3px;">商品</span>
				</div>
				<div class="title_div_li" onclick="clickShowDiv(this,'pingjia_div');">
					<span>评价</span>
				</div>
				<div class="title_div_li" onclick="clickShowDiv(this,'xiagnqing_div');">
					<span>详情</span>
				</div>
			</div>
		</header>
		<div class="mui-content">
			<div id="shiping_div" class="kbsj_div_ul">
				<div id="slider" class="mui-slider" >
				  <div class="mui-slider-group mui-slider-loop">
				    <!-- 额外增加的一个节点(循环轮播：第一个节点是最后一张轮播) -->
				    <div class="mui-slider-item mui-slider-item-duplicate">
				      <a href="javascript:void()">
				        <img src="images/17.png">
				      </a>
				    </div>
				    <!-- 第一张 -->
				    <div class="mui-slider-item">
				      <a href="javascript:void()">
				        <img src="images/17.png" id="store_img">
				      </a>
				    </div>
				    <!-- 额外增加的一个节点(循环轮播：最后一个节点是第一张轮播) -->
				    <div class="mui-slider-item mui-slider-item-duplicate">
				      <a href="javascript:void()">
				        <img src="images/17.png">
				      </a>
				    </div>
				  </div>
				  <div class="banner-guang" id ="limitPurchase">
				  	<span style="font-size: 13px;" id="yiqianggou">已抢购：1份</span>
				  	<!-- <div class="mui-qianggou-time-zi1">
						<span>15点场结束还有&nbsp;</span>
						<p>01</p>
						<span>：</span>
						<p>22</p>
						<span>：</span>
						<p>03</p>
					</div> -->
				  </div>
				</div>
				<div class="Commodity-details">
					<div class="Commodity-details-div">
						<span id="storeName">庄园红茶</span>
						<span  style="font-size: 12px;">自己种 自己做 干净茶 放心茶</span>
					</div>
					<div class="Commodity-details-jiage">
						<label>￥</label>
						<span id="storePrice">26</span>
						<del id="primePrice">￥329.00</del>
					</div>
					<div class="max-integral"  >
						<div class="max-integral-div" id= "highestIntegral">
							<span>最高可用积分：</span>
							<label id="requiredIntegral">100</label>
							<span>分</span>
						</div>
						<div class="max-integral-xq" >
							<div id="salesNum">已售：12321</div>
							<div id="netWeight">净含量：11g</div>
							<div>好评：98%</div>
						</div>
					</div>
				</div>
				<div id="store_detail" >
				
				</div>
				<!-- <div class="Related-products">
					<ul class="mui-table-view" style="border-bottom: 1px solid #c8c7cc;">
					    <li class="mui-table-view-cell">
					        <a class="mui-navigate-right">相关商品</a>
					    </li>
					</ul> -->
					<!-- <div  id="textValue">
					<a data-href="">
						<dl class="mui-popularity">
							<dt style="width: 40%;"><img src="images/zyhzcdg.jpg"></dt>
							<dd style="width: 60%;">
								<p style="font-size: 15px; color: #0F0F0F;font-family: '微软雅黑';">绿茗珠（袋）净含量：100g</p>
								<div style="margin-top: 10px;">
									<div class="mui-popularity-jiage" style="height: 40px;line-height: 40px;">
										<div style="float: left;">
											<label style="color: #D02368;font-size: 11px;">￥</label>
											<span style="color: #D02368 !important;font-size: 18px;">229</span>
											<del style="font-size: 13px;color: #999;"><label style="font-size: 10px;">￥</label>188</del>
										</div>
										<div class="lingquan"onclick="linjuan_click(this)">领券立减5元</div>
									</div>
									<div style="clear: both;"></div>
									<div class="mui-popularity-nr" style="float: left;color: #666;">
										<label>净含量:</label>
										<em>180g</em>
									</div>
									<div class="mui-popularity-nr" style="float: left;margin-left: 20px;color: #666;">
										<label>销售量:</label>
										<em>12312</em>
									</div>
								</div>
							</dd>
						</dl>
					</a> 
				 </div>
				</div>-->
			</div>
			
			<!--评论-->
			<div id="pingjia_div" class="kbsj_div_ul" style="display: none;">
				暂无评价！
				<!-- <div class="evaluate-div">
					<div class="evaluate-div-span">
						<span>综合评价</span>
					</div>
					<div class="evaluate-div-xx">
						<div class="icons">
							<i data-index="1" class="mui-icon mui-icon-star"></i>
							<i data-index="2" class="mui-icon mui-icon-star"></i>
							<i data-index="3" class="mui-icon mui-icon-star"></i>
							<i data-index="4" class="mui-icon mui-icon-star"></i>
							<i data-index="5" class="mui-icon mui-icon-star"></i>
						</div>
					</div>
				</div>
				<ul class="evaluate-div-xq">
					<li>
						<div class="evaluate-div-xq-li">
							<div class="evaluate-li-div">
								<div class="evaluate-li-img"> 
									<img src="images/Commodity_details/kfs.png" />
								</div>
								<div class="evaluate-li-wz">糖果</div>
								<div class="evaluate-div-icon">
									<div class="icons">
										<i data-index="1" class="mui-icon mui-icon-star"></i>
										<i data-index="2" class="mui-icon mui-icon-star"></i>
										<i data-index="3" class="mui-icon mui-icon-star"></i>
										<i data-index="4" class="mui-icon mui-icon-star"></i>
										<i data-index="5" class="mui-icon mui-icon-star"></i>
									</div>
								</div>
							</div>
							<div class="evaluate-div-pl">
								<label>多边形背景，用ps直接制作多边形背景图片</label>
							</div>
							<ul class="evaluate-imges">
								<li><img src="images/Commodity_details/kfs.png"/></li>
							</ul>
							<div style="clear: both;"></div>
							<p class="evaluate-time">
								<label>2018-10-31</label>
							</p>
						</div>
					</li>
					<li>
						<div class="evaluate-div-xq-li">
							<div class="evaluate-li-div">
								<div class="evaluate-li-img"> 
									<img src="images/Commodity_details/kfs.png" />
								</div>
								<div class="evaluate-li-wz">糖果</div>
								<div class="evaluate-div-icon">
									<div class="icons">
										<i data-index="1" class="mui-icon mui-icon-star"></i>
										<i data-index="2" class="mui-icon mui-icon-star"></i>
										<i data-index="3" class="mui-icon mui-icon-star"></i>
										<i data-index="4" class="mui-icon mui-icon-star"></i>
										<i data-index="5" class="mui-icon mui-icon-star"></i>
									</div>
								</div>
							</div>
							<div class="evaluate-div-pl">
								<label>多边形背景，用ps直接制作多边形背景图片</label>
							</div>
							<ul class="evaluate-imges">
								<li><img src="images/Commodity_details/kfs.png"/></li>
							</ul>
							<div style="clear: both;"></div>
							<p class="evaluate-time">
								<label>2018-10-31</label>
							</p>
						</div>
					</li>
					<li>
						<div class="evaluate-div-xq-li">
							<div class="evaluate-li-div">
								<div class="evaluate-li-img"> 
									<img src="images/Commodity_details/kfs.png" />
								</div>
								<div class="evaluate-li-wz">糖果</div>
								<div class="evaluate-div-icon">
									<div class="icons">
										<i data-index="1" class="mui-icon mui-icon-star"></i>
										<i data-index="2" class="mui-icon mui-icon-star"></i>
										<i data-index="3" class="mui-icon mui-icon-star"></i>
										<i data-index="4" class="mui-icon mui-icon-star"></i>
										<i data-index="5" class="mui-icon mui-icon-star"></i>
									</div>
								</div>
							</div>
							<div class="evaluate-div-pl">
								<label>多边形背景，用ps直接制作多边形背景图片</label>
							</div>
							<ul class="evaluate-imges">
								<li><img src="images/Commodity_details/kfs.png"/></li>
							</ul>
							<div style="clear: both;"></div>
							<p class="evaluate-time">
								<label>2018-10-31</label>
							</p>
						</div>
					</li>
				</ul> -->
			</div>
			
			
			<!--详情-->
			<div id="xiagnqing_div" class="kbsj_div_ul" style="display: none;">详情</div>
			
			
			<nav class="mui-bar mui-bar-tab">
				<a class="mui-tab-item" href="index.html" style="border-right: 1px solid #CCCCCC;width: 28%;" onclick="window.location='HomeController/home'">
					<span class="mui-icon mui-icon-home" style="font-size: 30px;"></span>
				</a>
				<a class="mui-tab-item" href="" style="border-right: 1px solid #CCCCCC;width: 28%;" onclick="shoping();">
					<span class="mui-icon-extra mui-icon-extra-cart" style="font-size: 30px;"></span>
				</a>
				<a href="javascript:void(0);" class="mui-tab-item mui-active" onclick="gobay(this);" style="width: 44%;background-image:-webkit-linear-gradient(left,#5dbeb3,#04757d);">
					<span class="mui-tab-label"  style="color: #fff;font-size: 18px;">立即购买</span>
				</a>		
			</nav>
		</div>
		<script type="text/javascript" src="js/jquery-1.7.1.js" ></script>
		<script type="text/javascript" src="js/jquery.cookie.js"></script>
 		<script type="text/javascript" src="js/ajax.js"></script>
		<script src="js/mui.min.js"></script>
		<script>
		var endtime=0;
			function shoping(store_id){
				var timestamp = Date.parse(new Date());
				var store_id  ='${store_id}';
				if(endtime<timestamp&&endtime!=null&&endtime!=0){
	        		alert("该商品活动已结束");
	        		return;
	        	}
				window.location="<%=basePath%>order_weixin/shopping_cart?store_id="+store_id;
			}
			function gobay(one1){
				$(this).attr("disabled","disabled"); //只能点一次
				var jsonArray=[];
				var store_id  ='${store_id}';
				/* var data={id:store_id,num:1}; */
				var timestamp = Date.parse(new Date());
	       	 	if(endtime<timestamp&&endtime!=null&&endtime!=0){
	        		alert("该商品活动已结束");
	        		return;
	        	}
	        	var str="order_id="+store_id+"&"+store_id+"=1";
	        	window.location="<%=basePath%>order_weixin/confirmation-order?"+str;
				<%-- jsonArray.push(data);
				jsonArray=JSON.stringify(jsonArray);
       			ajaxPost("<%=basePath%>order_weixin/weixinAddOrder", jsonArray, "json", "json", success); --%>
			}
			<%--  function success(data){
				if(data.state==0){
					var order_id=data.object.order_id;
					window.location="<%=basePath%>order_weixin/confirmation-order?order_id="+order_id;
				}else{
					alert(data.message);
				}
			}  --%>
			function onloadd(){
		      //alert('${store_id}');
		        var store_id  ='${store_id}';
			    var paramData;
			    var paramData={store_id:store_id};                               
			    var object = JSON.stringify(paramData);
			    ajaxPost("<%=basePath%>wenxin_store/findStore",object,"json","json",showStoreById);
			    //ajaxPost("<%=basePath%>wenxin_store/findStoreByState4",object,"json","json",commendStoreList);
			 };
			 window.onload=function(){
			  onloadd();
			 }; 
			/*商品详情页回调函数*/
			function showStoreById(data){
			var dataObject  = data.object ;
			var storeType = dataObject.store_type;//定义商品类型
			//alert(dataObject.store_price);
			//debugger;
				if(storeType == 1){
				  /*样式判断*/
		          document.getElementById("limitPurchase").style.display="none";
		  	      document.getElementById("highestIntegral").style.display="none";
		  	      /*数据加载*/
		  	      document.getElementById("storeName").innerHTML = dataObject.store_name;
		  	      document.getElementById("storePrice").innerHTML = dataObject.store_price;
		  	      document.getElementById("primePrice").innerHTML = dataObject.prime_price;
		  	      document.getElementById("store_detail").innerHTML = dataObject.store_intro;
		  	      document.getElementById("xiagnqing_div").innerHTML = dataObject.store_intro;//详情
		  	      document.getElementById("salesNum").innerHTML ="已售："+ dataObject.sales_num;
		  	      document.getElementById("yiqianggou").innerHTML ="已抢购："+ dataObject.sales_num+"份";
		  	      document.getElementById("netWeight").innerHTML ="净含量："+ dataObject.net_weight;
		  	      document.getElementById("store_img").src ="<%=basePath%>file/store/img/"+dataObject.store_picture;
				}else if(storeType == 2){
				  /*样式判断*/
		  	      document.getElementById("limitPurchase").style.display="none";
		  	      document.getElementById("highestIntegral").style.display="none";
		  	      /*数据加载*/
		  	      document.getElementById("storePrice").innerHTML = dataObject.store_price;//商品售价
		  	      document.getElementById("primePrice").innerHTML = dataObject.prime_price;//商品原价
		  	      document.getElementById("storeName").innerHTML = dataObject.store_name;//商品名称
		  	      document.getElementById("salesNum").innerHTML ="已售："+ dataObject.sales_num;
		  	      document.getElementById("yiqianggou").innerHTML ="已抢购："+ dataObject.sales_num+"份";
		  	      document.getElementById("netWeight").innerHTML ="净含量："+ dataObject.net_weight;
		  	      document.getElementById("store_detail").innerHTML = dataObject.store_intro;//商品介绍
		  	      document.getElementById("xiagnqing_div").innerHTML = dataObject.store_intro;//详情
		  	      document.getElementById("store_img").src = "<%=basePath%>file/store/img/"+dataObject.store_picture;
				}else if(storeType == 3){
				  /*样式判断*/
		  	      document.getElementById("limitPurchase").style.display="none";
		  	      /*数据加载*/
		  	      document.getElementById("storePrice").innerHTML = dataObject.store_price;//商品售价
		  	      document.getElementById("primePrice").innerHTML = dataObject.prime_price;//商品原价
		  	      document.getElementById("storeName").innerHTML = dataObject.store_name;//商品名称
		  	      document.getElementById("requiredIntegral").innerHTML = dataObject.required_integral;//所需积分
		  	      document.getElementById("salesNum").innerHTML ="已售："+ dataObject.sales_num;
		  	      document.getElementById("yiqianggou").innerHTML ="已抢购："+ dataObject.sales_num+"份";
		  	      document.getElementById("netWeight").innerHTML ="净含量："+ dataObject.net_weight;
		  	      document.getElementById("store_detail").innerHTML = dataObject.store_intro;//商品介绍
		  	      document.getElementById("xiagnqing_div").innerHTML = dataObject.store_intro;//详情
		  	      document.getElementById("store_img").src = "<%=basePath%>file/store/img/"+dataObject.store_picture;
				}else if(storeType == 4){
					endtime=dataObject.end_date;
				  	/*样式判断*/
				  document.getElementById("highestIntegral").style.display="none";
				  /*数据加载*/ 
				  document.getElementById("storeName").innerHTML = dataObject.store_name;
				  document.getElementById("storePrice").innerHTML = dataObject.store_price;
		  	      document.getElementById("primePrice").innerHTML = dataObject.prime_price;
		  	      document.getElementById("store_detail").innerHTML = dataObject.store_intro;
		  	      document.getElementById("xiagnqing_div").innerHTML = dataObject.store_intro;//详情
		  	      document.getElementById("salesNum").innerHTML ="已售："+ dataObject.sales_num;
		  	      document.getElementById("yiqianggou").innerHTML ="已抢购："+ dataObject.sales_num+"份";
		  	      document.getElementById("netWeight").innerHTML ="净含量："+ dataObject.net_weight;
		  	      document.getElementById("store_img").src = "<%=basePath%>file/store/img/"+dataObject.store_picture;
				}
			}
			/*推荐相关商品的回调函数*/
			<%-- function commendStoreList(data){
			  var dataList  = data.object;
			  var htmlStr  = ""; 
			   if(dataList != null ){
			    for(var  i =0 ; i<1 ;i++){
			    htmlStr += '<a href="javascript:void(0);">'+
						'<dl class="mui-popularity">'+
							'<dt style="width: 40%;"><img  onclick="storeDetail('+ dataList[i].store_id +')"   src="<%=basePath%>file/store/img/'+dataList[i].store_picture+'">'+
							'</dt>'+
							'<dd style="width: 60%;">'+
								'<p style="font-size: 15px; color: #0F0F0F;font-family:微软雅黑;">'+dataList[i].store_name+'（袋）净含量：'+dataList[i].net_weight+'g</p>'+
								'<div style="margin-top: 10px;">'+
									'<div class="mui-popularity-jiage" style="height: 40px;line-height: 40px;">'+
										'<div style="float: left;">'+
											'<label style="color: #D02368;font-size: 11px;">￥</label>'+
											'<span style="color: #D02368 !important;font-size: 18px;">'+dataList[i].prime_price+'</span>'+
                                            '<del style="font-size: 13px;color: #999;"><label style="font-size: 10px;">￥</label>'+dataList[i].store_price+'</del>'+
										'</div>'+
										'<div class="lingquan"onclick="linjuan_click(this)">领券立减5元</div>'+
									'</div>'+
									'<div style="clear: both;"></div>'+
									'<div class="mui-popularity-nr" style="float: left;color: #666;">'+
										'<label>净含量:</label>'+
										'<em>'+dataList[i].net_weight+'g</em>'+
									'</div>'+
									'<div class="mui-popularity-nr" style="float: left;margin-left: 20px;color: #666;">'+
										'<label>销售量:</label>'+
										'<em>'+dataList[i].sales_num +'</em>'+
									'</div>'+
								'</div>'+
							'</dd>'+
						'</dl>'+
					'</a>';
			    }
			    document.getElementById("textValue").innerHTML = htmlStr;
			   }else{
			    alert("数据请求为空！");
			   }
			} --%>
			function storeDetail(store_id){
			 window.location="<%=basePath%>wenxin_store/storeDetail?store_id="+store_id;
			}
			function linjuan_click(elm){
				$(elm).css({
			            "color":"#ccc"
			        });
				}
			function clickShowDiv(e,id){
				//菜单切换
				$(".kbsj_div_ul").each(function(){
					if($(this).attr("id")==id){
						$(this).show();
					}else{
						$(this).hide();
					}
				});
				$(e).children("span").css({
					"border-bottom":"2px solid #fff",
					"padding-bottom":"3px"
					});
				$(e).siblings().each(function(){
					if($(this).attr("class")=="title_div_li"){
						$(this).children("span").css({
						"border-bottom":"2px solid #04757d",
						"padding-bottom":"3px"
					});
					}
				});
			}
			function details_click(elm){
		       var div=$(elm).find("div.evaluate-div-is");
				if(div.css("display")=="block"){
					div.css("display","none");
				}else{
					div.css("display","block");
				}

			}
			mui('.icons').on('click','i',function(){
		      	var index = parseInt(this.getAttribute("data-index"));//获取当前元素的索引值
		      	var parent = this.parentNode;//获取当前元素的父节点
		      	var children = parent.children;//获取父节点下所有子元素
		      	if(this.classList.contains("mui-icon-star")){//判断当前节点列表中是否含有.mui-icon-star元素
		      		for(var i=0;i<index;i++){//亮星
		      				children[i].classList.remove('mui-icon-star');
		      				children[i].classList.add('mui-icon-star-filled');
		      		}
		      	}else{//重置已经亮星的元素
		      		for (var i = index; i < 5; i++) {
		      			children[i].classList.add('mui-icon-star')
		      			children[i].classList.remove('mui-icon-star-filled')
		      		}
		      	}
		      })
			mui.init({
				swipeBack:true //启用右滑关闭功能
			});
		</script>
	</body>

</html>