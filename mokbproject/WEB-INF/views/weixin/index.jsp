<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ page import="com.medicinefood.entity.weixin.oauth.SNSUserInfo"%>


<% 
  SNSUserInfo SNSUserInfo=new SNSUserInfo();
  
   Cookie[] cookies = request.getCookies();
    System.out.println(SNSUserInfo.getOpenId()) ;
     // 遍历数组,获得具体的Cookie
    if(cookies == null) {
     } else {
       for(int i=0; i<cookies.length; i++) {
            // 获得具体的Cookie
            Cookie cookie = cookies[i];
            
            if(cookie.getName().equals("getOpenId")){
            SNSUserInfo.setOpenId(cookie.getValue());
            
            }
            else if(cookie.getName().equals("getHeadImgUrl")){            
             SNSUserInfo.setHeadImgUrl(cookie.getValue());
            }
            else if(cookie.getName().equals("getNickname")){
            
             SNSUserInfo.setNickname(java.net.URLDecoder.decode(cookie.getValue(),"UTF-8"));
            }
             else if(cookie.getName().equals("getCity")){
              SNSUserInfo.setCity(cookie.getValue());
             
             }
         }
   } 
    %>
<!DOCTYPE HTML>
<html>

	<head>
		<meta charset="utf-8">
		<base href="<%=basePath%>">
		<title>茶道</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<!--标准mui.css-->
		<link rel="stylesheet" href="css/mui.min.css">
		<link rel="stylesheet" href="css/icons-extra.css">
		<link rel="stylesheet" href="css/style.css" />
		<style type="text/css">
			.mui-icon-home:before{
				content: '';
				display: block;
				width: 20px;
				height: 18px;
				background: url(images/nav_img/chadaos.png) no-repeat;
				background-size:100% 100%;
				margin:5px 0 0 3px;
			}
			.mui-icon-email:before{
				content: '';
				display: block;
				width: 20px;
				height: 18px;
				background: url(images/nav_img/tcld.png) no-repeat;
				background-size:100% 100%;
				margin:5px 0 0 3px;
			}
			.mui-icon-contact:before{
				content: '';
				display: block;
				width: 20px;
				height: 18px;
				background: url(images/nav_img/cpw.png) no-repeat;
				background-size:100% 100%;
				margin:5px 0 0 3px;
			}
			.mui-icon-gear:before{
				content: '';
				display: block;
				width: 20px;
				height: 18px;
				background: url(images/nav_img/huiyuan.png) no-repeat;
				background-size:100% 100%;
				margin:5px 0 0 3px;
			}
		</style>
	</head>
	<body>
		<nav class="mui-bar mui-bar-tab">
			<a class="mui-tab-item mui-active" onclick="window.location='HomeController/home'">
				<span class="mui-icon mui-icon-home"></span>
				<span class="mui-tab-label">茶道</span>
			</a>
			<a class="mui-tab-item" onclick="window.location='weixin_news/article'">
				<span class="mui-icon mui-icon-email"></span>
				<span class="mui-tab-label">谈茶论道</span>
			</a>
			<a class="mui-tab-item" onclick="window.location='order_weixin/shopping_cart'">
				<span class="mui-icon mui-icon-contact"></span>
				<span class="mui-tab-label">焙茶屋</span>
			</a>
			<a class="mui-tab-item" onclick="window.location='HomeController/memberCenter'">
				<span class="mui-icon mui-icon-gear"></span>
				<span class="mui-tab-label">会员</span>
			</a>
		</nav>
		<div class="mui-content" style="background: #04757d;">
			<div id="tabbar" class="mui-control-content mui-active" style="padding-bottom: 20px;">
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
				        <img src="images/17.png">
				      </a>
				    </div>
				    <!-- 额外增加的一个节点(循环轮播：最后一个节点是第一张轮播) -->
				    <div class="mui-slider-item mui-slider-item-duplicate">
				      <a href="javascript:void()">
				        <img src="images/17.png">
				      </a>
				    </div>
				  </div>
				  <!--<div class="mui-slider-indicator">
				    <div class="mui-indicator mui-active"></div>
				    <div class="mui-indicator"></div>
				    <div class="mui-indicator"></div>
				    <div class="mui-indicator"></div>
				  </div>-->
				</div>
				<!-- <ul class="mui-table-view mui-grid-view mui-grid-9">
					<li class="mui-table-view-cell mui-media mui-col-xs-4">
			            <div class="mui-linjuan" onclick="linjuan_click(this)">
			            	<span>￥</span>
			            	<span>20</span>
			            	<span>下单满299使用</span>
			            	<span>立即领劵</span>
			            </div>
					</li>
					<li class="mui-table-view-cell mui-media mui-col-xs-4">
					    <div class="mui-linjuan" onclick="linjuan_click(this)">
			            	<span>￥</span>
			            	<span>20</span>
			            	<span>下单满299使用</span>
			            	<span>立即领劵</span>
			            </div>
					</li>
					<li class="mui-table-view-cell mui-media mui-col-xs-4">
					    <div class="mui-linjuan" onclick="linjuan_click(this)">
			            	<span>￥</span>
			            	<span>20</span>
			            	<span>下单满299使用</span>
			            	<span>立即领劵</span>
			            </div>
					</li>
				</ul> -->
				<div class="slider-two">
					<div style="padding-top: 10px;">下单就送</div>
					<div><img src="images/tb.png" /></div>
					<div id="Gallery" class="mui-slider" >
						<div class="mui-slider-group">
							<!-- 额外增加的一个节点(循环轮播：第一个节点是最后一张轮播) -->
						       <div class="mui-slider-item mui-slider-item-duplicate" >
							    <ul class="mui-table-view mui-grid-view" id ="fullTextvalue">
								    <li class="mui-table-view-cell mui-media mui-col-xs-6">
								        <a href="jaavscript:void(0);" id="fullHref0">
								            <img class="mui-media-object" src="images/lmz.jpg" id="fullImg0">
								            <div class="mui-media-body">
								            	<span id="fullMoney0">满399送99元</span>
								            	<span></span>
								            </div>
								        </a>
								    </li>
								   <li class="mui-table-view-cell mui-media mui-col-xs-6">
								        <a href="jaavscript:void(0);" id="fullHref1">
								            <img class="mui-media-object" src="images/17.png" id="fullImg1">
								            <div class="mui-media-body">
								            	<span id="fullMoney1">满399送99元</span>
								            	<span></span>
								            </div>
								        </a>
								    </li>
								</ul> 
						    </div> 
							<!-- <div class="mui-slider-item">
								<ul class="mui-table-view mui-grid-view">
								    <li class="mui-table-view-cell mui-media mui-col-xs-6">
								        <a href="jaavscript:void(0);" id="fullHref2">
								            <img class="mui-media-object" src="images/lmz.jpg" id="fullImg2">
								            <div class="mui-media-body">
								            	<span id="fullMoney2">满399送99元</span>
								            	<span></span>
								            </div>
								        </a>
								    </li>
								    <li class="mui-table-view-cell mui-media mui-col-xs-6">
								        <a href="jaavscript:void(0);" id="fullHref3">
								            <img class="mui-media-object" src="images/17.png" id="fullImg3">
								            <div class="mui-media-body">
								            	<span id="fullMoney3">满399送99元</span>
								            	<span ></span>
								            </div>
								        </a>
								    </li>
								</ul>
							</div> -->
							<!-- 额外增加的一个节点(循环轮播：最后一个节点是第一张轮播) -->	
					 		<!--  <div class="mui-slider-item mui-slider-item-duplicate">
						      	<ul class="mui-table-view mui-grid-view">
								    <li class="mui-table-view-cell mui-media mui-col-xs-6">
								        <a href="javascript:ovid()">
								            <img class="mui-media-object" src="images/lmz.jpg">
								            <div class="mui-media-body">
								            	<span>满399送99元</span>
								            	<span>送茶壶具玲珑杯</span>
								            </div>
								        </a>
								    </li>
								    <li class="mui-table-view-cell mui-media mui-col-xs-6">
								        <a href="javascript:ovid()">
								            <img class="mui-media-object" src="images/17.png">
								            <div class="mui-media-body">
								            	<span>满399送99元</span>
								            	<span>送汝窑一壶四杯</span>
								            </div>
								        </a>
								    </li>
								</ul>
						    </div>  
						</div>
						<!--<div class="mui-slider-indicator">
							<div class="mui-indicator mui-active"></div>
						</div>-->
					</div>
				</div>
				<!--限时抢购-->
				<div id="qianggou3">
				<div class="mui-qianggou-time">
					 <div class="mui-qianggou-time-zi">
						<span>活动进行中&nbsp;</span>
						<!-- <p>00</p>
						<span>：</span>
						<p>00</p>
						<span>：</span>
						<p>00</p> -->
					</div>
				</div>
				<div class="slider-two" style="padding: 20px 5px;">
				<a data-href="" id="limitHref0">
						 <dl class="mui-popularity">
							<dt><img src="images/zyhzcdg.jpg" id="limitPurchaseImg0"/></dt>
							<dd class="limit0">
								<p id="limitstoreName0">遵义红庄园茶</p>
								<span style="height: 0"></span>
								<div style="margin-top: 10px;">
									<div class="mui-popularity-yuan">1</div>
									<div class="mui-popularity-nr">
										<label>已售：</label>
										<em id="limitSaleNum0"></em>
									</div>
									<div class="mui-popularity-yuan">2</div>
									<div class="mui-popularity-nr">
										<label>净含量：</label>
										<em id="limitNetWeight0"></em>
									</div>
									<div class="mui-popularity-yuan">3</div>
									<div class="mui-popularity-nr">
										<label>统一零售价：</label>
										<del id='limitPrimePrice0'></del>
									</div>
									<div class="mui-popularity-jiage">
										<label >抢购价:</label>
										<span id="limitStorePrice0"></span>
									</div>
								</div>
							</dd>
						</dl> 
					</a>
					<!--  <a data-href="" id="limitHref1">
						<dl class="mui-popularity">
							<dt class="limit1">
								<p id="limitstoreName1">遵义红庄园茶</p>
								<span>（丹桂）纯手工制作</span>
								<div style="margin-top: 10px;">
									<div class="mui-popularity-yuan">1</div>
									<div class="mui-popularity-nr">
										<label>已售：</label>
										<em id="limitSaleNum1">12312</em>
									</div>
									<div class="mui-popularity-yuan">2</div>
									<div class="mui-popularity-nr">
										<label>净含量：</label>
										<em id="limitNetWeight1">180g</em>
									</div>
									<div class="mui-popularity-yuan">3</div>
									<div class="mui-popularity-nr">
										<label>统一零售价：</label>
										<del id='limitPrimePrice1'>￥329.00</del>
									</div>
									<div class="mui-popularity-jiage">
										<label>抢购价:</label>
										<span id="limitStorePrice1">￥229</span>
									</div>
								</div>
							</dt>
							<dd>
								<img src="images/zyhzc.jpg"  id="limitPurchaseImg1" />
							</dd>
						</dl>
					</a> -->
					<!-- <a data-href="" id="limitHref2">
						<dl class="mui-popularity">
							<dt><img src="images/zyhzcdg.jpg" id="limitPurchaseImg2" /></dt>
							<dd class="limit2">
								<p id="limitStoreName2" >遵义红庄园茶</p>
								<span>（丹桂）纯手工制作</span>
								<div style="margin-top: 10px;">
									<div class="mui-popularity-yuan">1</div>
									<div class="mui-popularity-nr">
										<label>已售：</label>
										<em id="limitSaleNum2">12312</em>
									</div>
									<div class="mui-popularity-yuan">2</div>
									<div class="mui-popularity-nr">
										<label>净含量：</label>
										<em id="limitNetWeight2">180g</em>
									</div>
									<div class="mui-popularity-yuan">3</div>
									<div class="mui-popularity-nr">
										<label>统一零售价：</label>
										<del id='limitPrimePrice2'>￥329.00</del>
									</div>
									<div class="mui-popularity-jiage">
										<label>抢购价:</label>
										<span id="limitStorePrice2">￥229</span>
									</div>
								</div>
							</dd>
						</dl>
					</a>  -->
					<!-- <div style="color: #0B959E;font-size: 12px !important;float: right;" onclick="window.location='wenxin_store/flashSale'">
						<label>查看更多</label>
						<i style="font-size: 18px;" class="mui-icon mui-icon-arrowright"></i>
					</div> -->
					<div style="clear: both;"></div>
				</div>
				</div>
				<!--积分商城-->
				<div class="mui-Integral-mall"></div>
				<div class="slider-two">
					<div style="width: 30%;height: 45px;margin: 0 auto;">
						<img style="width: 100%;height: 100%;" src="images/sf.png" />
					</div>
					<div id="Gallery" class="mui-slider" style="width: 100%;">
						<div class="mui-slider-group">
							<!-- 额外增加的一个节点(循环轮播：第一个节点是最后一张轮播) -->
						    <div class="mui-slider-item mui-slider-item-duplicate">
							    <a data-href="" id="integralHref0">
									<dl class="mui-popularity">
										<dt><img src="images/zyhc.jpg" id="integralImg0"/></dt>
										<dd class= "integral0">
											<p id="integralStoreName0">庄园红茶</p>
											<span  style="font-size: 12px;">自己种 自己做 干净茶 放心茶</span>
											<div style="margin-top: 10px;">
												<div class="mui-popularity-yuan">1</div>
												<div class="mui-popularity-nr">
													<label>净含量：</label>
													<em id="integralNetWeight0"></em>
												</div>
												<div class="mui-popularity-yuan">2</div>
												<div class="mui-popularity-nr">
													<label>销售量：</label>
													<em id="integralSalesNum0"></em>
												</div>
												<div class="mui-popularity-nr">
													<label>最高可以积分：</label>
													<label id="requiredIntegral0"></label>
												</div>
												<div class="mui-unified-price">
													<label>统一零售价:</label>
													<span id="integralStorePrice0"></span>
												</div>
											</div>
										</dd>
									</dl>
								</a>
						    </div>
							<div class="mui-slider-item">
								<a data-href="" id="integralHref1">
									<dl class="mui-popularity">
										<dt><img src="images/zyhc.jpg" id="integralImg1" /></dt>
										<dd class= "integral1">
											<p id="integralStoreName1">庄园红茶</p>
											<span  style="font-size: 12px;">自己种 自己做 干净茶 放心茶</span>
											<div style="margin-top: 10px;">
												<div class="mui-popularity-yuan">1</div>
												<div class="mui-popularity-nr">
													<label>净含量：</label>
													<em id="integralNetWeight1">180g</em>
												</div>
												<div class="mui-popularity-yuan">2</div>
												<div class="mui-popularity-nr">
													<label>销售量：</label>
													<em id="integralSalesNum1">12312</em>
												</div>
												<div class="mui-popularity-nr">
													<label>最高可以积分：</label>
													<label id="requiredIntegral1">329分</label>
												</div>
												<div class="mui-unified-price">
													<label>统一零售价:</label>
													<span id="integralStorePrice1">￥229</span>
												</div>
											</div>
										</dd>
									</dl>
								</a>
							</div>
							<!-- 额外增加的一个节点(循环轮播：最后一个节点是第一张轮播) -->
						    <div class="mui-slider-item mui-slider-item-duplicate"> 
 								<a data-href="" id="integralHref2"> 
 									<dl class="mui-popularity"> 
 										<dt><img src="images/zyhc.jpg" id="integralImg2" /></dt> 
 										<dd class= "integral2"> 
 											<p id="integralStoreName2">庄园红茶</p> 
 											<span style="font-size: 12px;">纯手工制作&nbsp;保留原始茶香</span> 
 											<div style="margin-top: 10px;"> 
 												<div class="mui-popularity-yuan">1</div> 
 												<div class="mui-popularity-nr"> 
 													<label>净含量：</label> 
 													<em id="integralNetWeight2">g</em> 
 												</div> -->
 												<div class="mui-popularity-yuan">2</div> 
 												<div class="mui-popularity-nr"> 
 													<label >销售量：</label>
 													<em id="integralSalesNum2"></em> 
 												</div> -->
 												<div class="mui-popularity-nr"> 
													<label>最高可以积分：</label> 
 													<label id="requiredIntegral2">分</label> 
												</div> -->
												<div class="mui-unified-price"> 
 													<label>统一零售价:</label> 
 													<span id="integralStorePrice2">￥</span> 
 												</div> 
 											</div> 
 										</dd> 
 									</dl> 
 								</a> 
 						    </div> 
						</div>
						<!--<div class="mui-slider-indicator">
							<div class="mui-indicator mui-active"></div>
						</div>-->
					</div>
					<div style="color: #0B959E;font-size: 12px !important;float: right;line-height: 40px;margin-right: 5px;"
					onclick="window.location='wenxin_store/integral'">
						<label>查看更多</label>
						<i style="font-size: 18px;" class="mui-icon mui-icon-arrowright"></i>
					</div>
					<div style="clear: both;"></div>
				</div>
				<!--茶道人生-->
				<div class="mui-Tea-life"></div>
				<div class="mui-Tea-life-div">
					<ul class="mui-table-view mui-grid-view" id="primeTextvalue" >
					   <li class="mui-table-view-cell mui-media mui-col-xs-6" >
					        <a href="javascript:void()">
					        	<div style="background: #FFFFFF;padding-bottom: 10px;">
						            <img class="mui-media-object" src="images/lmz.jpg">
						            <div class="mui-media-body">
						            	<label>毛峰（袋）净含量：200g</label>
						            </div>
					            </div>
					            <div class="Concessional-rate">
						        	<label>优惠价￥</label>
						        	<span>58</span>
						        	<img src="images/ljqg.png"/>
						        </div>
					        </a>
					    </li>
					   <!-- <li class="mui-table-view-cell mui-media mui-col-xs-6">
					        <a href="#">
					        	<div style="background: #FFFFFF;padding-bottom: 10px;">
						            <img class="mui-media-object" src="images/17.png">
						            <div class="mui-media-body">
						            	<label>绿茗珠（袋）净含量：100g</label>
						            </div>
						        </div>
						        <div class="Concessional-rate">
						        	<label>优惠价￥</label>
						        	<span>58</span>
						        	<img src="images/ljqg.png"/>
						        </div>
					        </a>
					    </li>
					    <li class="mui-table-view-cell mui-media mui-col-xs-6">
					        <a href="#">
					        	<div style="background: #FFFFFF;padding-bottom: 10px;">
						            <img class="mui-media-object" src="images/lmz.jpg">
						            <div class="mui-media-body">
						            	<label>毛峰（袋）净含量：200g</label>
						            </div>
					            </div>
					            <div class="Concessional-rate">
						        	<label>优惠价￥</label>
						        	<span>58</span>
						        	<img src="images/ljqg.png"/>
						        </div>
					        </a>
					    </li>
					    <li class="mui-table-view-cell mui-media mui-col-xs-6">
					        <a href="#">
					        	<div style="background: #FFFFFF;padding-bottom: 10px;">
						            <img class="mui-media-object" src="images/17.png">
						            <div class="mui-media-body">
						            	<label>绿茗珠（袋）净含量：100g</label>
						            </div>
						        </div>
						        <div class="Concessional-rate">
						        	<label>优惠价￥</label>
						        	<span>58</span>
						        	<img src="images/ljqg.png"/>
						        </div>
					        </a>
					    </li> -->
					</ul>
				</div>
			</div>
			
			<!--<div id="tabbar-with-chat" class="mui-control-content">
				
			</div>
			<div id="tabbar-with-contact" class="mui-control-content">
				
			</div>
			<div id="tabbar-with-map" class="mui-control-content">
				
			</div>-->
		</div>
		<script type="text/javascript" src="js/jquery-1.7.1.js" ></script>
		<script type="text/javascript" src="js/jquery.cookie.js"></script>
 		<script type="text/javascript" src="js/ajax.js"></script>
 		<script src="js/mui.min.js"></script>
		<script>
	   	 function onloadd(){
		    var paramData;
		    var paramData={1:1};                               
		    var object = JSON.stringify(paramData);
		    ajaxPost("<%=basePath%>wenxin_store/findStoreByState1",object,"json","json",showStoreByType1);
		    ajaxPost("<%=basePath%>wenxin_store/findStoreByState2",object,"json","json",showStoreByType2);
		    ajaxPost("<%=basePath%>wenxin_store/findStoreByState3",object,"json","json",showStoreByType3);
		    ajaxPost("<%=basePath%>wenxin_store/findStoreByState4",object,"json","json",showStoreByType4);
		    var paramData={voucher_type:2};                               
		    var object = JSON.stringify(paramData);
		   // ajaxPost("<%=basePath%>weixin_voucher/findVoucher",object,"json","json",showVoucher);
		 };
		 window.onload=function(){
		  onloadd();
		 };
		 //展示满减券
		 function showVoucher(data){
		 	
		 }
		 /*根据商品类型查询原价商品回调函数*/
	    function showStoreByType1(data){
	    // alert(JSON.stringify(data.object));
	     //debugger;
	     var htmlstr = "";
			var dataList =data.object;
	       if(dataList != null){
	          for(var i =0 ;i<dataList.length ;i++){
	          htmlstr +='<li class="mui-table-view-cell mui-media mui-col-xs-6">'+
					        '<a href="<%=basePath%>wenxin_store/storeDetail?store_id='+dataList[i].store_id+'">'+
					        	'<div style="background: #FFFFFF;padding-bottom: 10px;">'+
						            '<img class="mui-media-object" src="<%=basePath%>file/store/img/'+dataList[i].store_picture+'">'+
						            '<div class="mui-media-body">'+
						            	'<label>'+dataList[i].store_name+'（袋）净含量：'+dataList[i].net_weight+'g</label>'+
						            '</div>'+
					            '</div>'+
					            '<div class="Concessional-rate">'+
						        	'<label>优惠价￥</label>'+
						        	'<span>'+dataList[i].store_price+'</span>'+
						        	'<img src="images/ljqg.png"/>'+
						        '</div>'+
					        '</a>'+
					    '</li>'; 
	         }
	           document.getElementById("primeTextvalue").innerHTML=htmlstr;
        }else{
	         alert("请求数据为空");
	       }
		 };
		 
		 /*根据商品类型查询满减商品回调函数*/
	    function showStoreByType2(data){
	     //alert(JSON.stringify(data));
			var dataList =data.object;
	       if(dataList != null){
	        document.getElementById("fullImg0").src = "<%=basePath%>file/store/img/"+ dataList[0].store_picture;
	        document.getElementById("fullMoney0").innerHTML = '满'+dataList[0].full_money+'元送'+dataList[0].give_money+'元';
 	        document.getElementById("fullHref0").href  = "<%=basePath%>wenxin_store/storeDetail?store_id="+dataList[0].store_id;
 	
	       	document.getElementById("fullImg1").src = "<%=basePath%>file/store/img/"+ dataList[1].store_picture;
	        document.getElementById("fullMoney1").innerHTML = '满'+dataList[1].full_money+'元送'+dataList[1].give_money+'元';
 	        document.getElementById("fullHref1").href  = "<%=basePath%>wenxin_store/storeDetail?store_id="+dataList[1].store_id;
	
	        document.getElementById("fullImg2").src = "<%=basePath%>file/store/img/"+ dataList[2].store_picture;
	        document.getElementById("fullMoney2").innerHTML = '满'+dataList[2].full_money+'元送'+dataList[2].give_money+'元';
 	        document.getElementById("fullHref2").href  = "<%=basePath%>wenxin_store/storeDetail?store_id="+dataList[2].store_id;

 		    document.getElementById("fullImg3").src = "<%=basePath%>file/store/img/"+ dataList[3].store_picture;
	        document.getElementById("fullMoney3").innerHTML = '满'+dataList[3].full_money+'元送'+dataList[3].give_money+'元';
      	    document.getElementById("fullHref3").href  = "<%=basePath%>wenxin_store/storeDetail?store_id="+dataList[3].store_id;

	       	
	       }else{
	         alert("请求数据为空");
	       }
		 };
		 /*根据商品类型查询积分商品回调函数*/
	     function showStoreByType3(data){
	     //alert(JSON.stringify(data));
			var dataList =data.object;
	       if(dataList != null){
	       	document.getElementById("integralImg0").src = "<%=basePath%>file/store/img/"+ dataList[0].store_picture;
	        $('.integral0').children("p").html(dataList[0].store_name);
	        document.getElementById("integralNetWeight0").innerHTML = dataList[0].net_weight +'g';
	        document.getElementById("integralSalesNum0").innerHTML = dataList[0].sales_num;
	        document.getElementById("requiredIntegral0").innerHTML = dataList[0].required_integral;
	        document.getElementById("integralStorePrice0").innerHTML ='￥'+ dataList[0].store_price;
	        document.getElementById("integralHref0").href  = "<%=basePath%>wenxin_store/storeDetail?store_id="+dataList[0].store_id;
	      
 	  	    document.getElementById("integralImg1").src = "<%=basePath%>file/store/img/"+ dataList[1].store_picture;
	        $('.integral1').children("p").html(dataList[1].store_name);
	        document.getElementById("integralNetWeight1").innerHTML = dataList[1].net_weight +'g';
	        document.getElementById("integralSalesNum1").innerHTML = dataList[1].sales_num;
	        document.getElementById("requiredIntegral1").innerHTML = dataList[1].required_integral;
	        document.getElementById("integralStorePrice1").innerHTML ='￥'+ dataList[1].store_price;
	        document.getElementById("integralHref1").href  = "<%=basePath%>wenxin_store/storeDetail?store_id="+dataList[1].store_id;
 
    	    document.getElementById("integralImg2").src = "<%=basePath%>file/store/img/"+ dataList[2].store_picture;
	        $('.integral2').children("p").html(dataList[2].store_name);
	        document.getElementById("integralNetWeight2").innerHTML = dataList[2].net_weight +'g';
	        document.getElementById("integralSalesNum2").innerHTML = dataList[2].sales_num;
	        document.getElementById("requiredIntegral2").innerHTML = dataList[2].required_integral;
	        document.getElementById("integralStorePrice2").innerHTML ='￥'+ dataList[2].store_price;
   	        document.getElementById("integralHref2").href  = "<%=basePath%>wenxin_store/storeDetail?store_id="+dataList[2].store_id;
 
	       }else{
	         alert("请求数据为空");
	       }
		 };
		 /*根据商品类型查询限时抢购商品回调函数*/
	     function showStoreByType4(data){
	     //alert(JSON.stringify(data));
	     //debugger;
			var dataList =data.object;
			//alert(dataList[0].store_name);
	       if(dataList != null){
	        document.getElementById("limitPurchaseImg0").src = "<%=basePath%>file/store/img/"+ dataList[0].store_picture;
	        $('.limit0').children("p").html(dataList[0].store_name);
	        document.getElementById("limitSaleNum0").innerHTML = dataList[0].sales_num;
	        document.getElementById("limitNetWeight0").innerHTML = dataList[0].net_weight+'g';
	        document.getElementById("limitPrimePrice0").innerHTML ='￥'+ dataList[0].prime_price;
	        document.getElementById("limitStorePrice0").innerHTML ='￥'+ dataList[0].store_price;
	        document.getElementById("limitHref0").href  = "<%=basePath%>wenxin_store/storeDetail?store_id="+dataList[0].store_id;
	        
	        document.getElementById("limitPurchaseImg1").src = "<%=basePath%>file/store/img/"+ dataList[1].store_picture;
	        $('.limit1').children("p").html(dataList[1].store_name);
	        document.getElementById("limitSaleNum1").innerHTML = dataList[1].sales_num;
	        document.getElementById("limitNetWeight1").innerHTML = dataList[1].net_weight+'g';
	        document.getElementById("limitPrimePrice1").innerHTML ='￥'+ dataList[1].prime_price;
	        document.getElementById("limitStorePrice1").innerHTML ='￥'+ dataList[1].store_price;
	       	document.getElementById("limitHref1").href  = "<%=basePath%>wenxin_store/storeDetail?store_id="+dataList[1].store_id;
	       
	        document.getElementById("limitPurchaseImg2").src = "<%=basePath%>file/store/img/"+ dataList[2].store_picture;
	        $('.limit2').children("p").html(dataList[2].store_name);
	        document.getElementById("limitSaleNum2").innerHTML = dataList[2].sales_num;
	        document.getElementById("limitNetWeight2").innerHTML = dataList[2].net_weight+'g';
	        document.getElementById("limitPrimePrice2").innerHTML ='￥'+ dataList[2].prime_price;
	        document.getElementById("limitStorePrice2").innerHTML ='￥'+ dataList[2].store_price;
	        document.getElementById("limitHref2").href  = "<%=basePath%>wenxin_store/storeDetail?store_id="+dataList[2].store_id;
	       }else{
	       	 document.getElementById("qianggou3").style.display="none";
	         alert("请求数据为空");
	       }
		 };
	
		function linjuan_click(elm){
		//变颜色
			//$(elm).find("span:eq(3)").css({
	       //     "color":"#e1fffc",
	        //    "background":"#999999"
	      //  });
	        alert("暂无优惠券！");
		}
		mui.init({
			swipeBack:true //启用右滑关闭功能
		});
		
		mui.ready(function() {
			var slider = document.getElementById('Gallery');
			var group = slider.querySelector('.mui-slider-group');
			var items = mui('.mui-slider-item', group);
			//克隆第一个节点
			var first = items[0].cloneNode(true);
			first.classList.add('mui-slider-item-duplicate');
			//克隆最后一个节点
			var last = items[items.length - 1].cloneNode(true);
			last.classList.add('mui-slider-item-duplicate');
			//处理是否循环逻辑，若支持循环，需支持两点：
			//1、在.mui-slider-group节点上增加.mui-slider-loop类
			//2、重复增加2个循环节点，图片顺序变为：N、1、2...N、1
			var sliderApi = mui(slider).slider();

			function toggleLoop(loop) {
					if (loop) {
						group.classList.add('mui-slider-loop');
						group.insertBefore(last, group.firstChild);
						group.appendChild(first);
						sliderApi.refresh();
						sliderApi.gotoItem(0);
					} else {
						group.classList.remove('mui-slider-loop');
						group.removeChild(first);
						group.removeChild(last);
						sliderApi.refresh();
						sliderApi.gotoItem(0);
					}
				}
			/* 	//按下“循环”按钮的处理逻辑；
			document.getElementById('Gallery_Toggle').addEventListener('toggle', function(e) {
				var loop = e.detail.isActive;
				toggleLoop(loop); });*/
			
		});
		
		var weixin_id="<%=SNSUserInfo.getOpenId()%>"; 
 			// o340P1hTZQNb3UhIkI54LPy6vT4Q";
			var getHeadImgUrl=$.cookie('getHeadImgUrl');
			var getNickname=$.cookie('getNickname');

			function function_login(data){  
	    		//$.cookie('cookieName',data.message, {path: '/' });
	  			//$.cookie('user_grade_id', basicsUser.user_grade_id);//过期时间1天
      			//$.cookie('weixin_id',weixin_id);//过期时间7天
     			//$.cookie('cookieName',JSON.stringify(basicsUser));//过期时间7天
     			//$.cookie('cookieName888', "{\"user_basics_id\":53,\"user_nickname\":null,\"user_password\":\"null\",\"user_register_data\":1517221855834,\"user_register_address\":\"null\",\"user_grade_id\":1}", {path: "/" });//过期时间7天
      			//SetCookie("cookieName999",encodeURIComponent(JSON.stringify(basicsUser)));
      			//$.cookie('basicsUser', JSON.stringify(basicsUser), { expires:7, path:  "/" });//过期时间7天
        
     			// 取的时候是这样取：
     			// var user_basics_id=$.cookie('user_basics_id');
    			// var dhfs=JSON.stringify(getNickname);//json转字符串
    			// var sdfh= JSON.parse(getNickname);//转对象
        	}
        
        	var weixin_nickname="<%=SNSUserInfo.getNickname()%>";
        	var weixin_portrait="<%=SNSUserInfo.getHeadImgUrl()%>";
        	var paramData={weixin_id:weixin_id,weixin_nickname:weixin_nickname,weixin_portrait:weixin_portrait};                               
	      	var object = JSON.stringify(paramData);
	      	ajaxPost("<%=basePath%>user_weixin/findUserWeixin",object,"json","json",function_login);
	</script>
	</body>
	
</html>