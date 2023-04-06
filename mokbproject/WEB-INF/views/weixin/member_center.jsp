<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="com.medicinefood.entity.weixin.oauth.SNSUserInfo"%>
<%@ page import="com.medicinefood.entity.SessionEntity"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<% 
SessionEntity sessionEntity=new SessionEntity(request);
Integer user_grade_id= sessionEntity.getUser_grade_id();
SNSUserInfo SNSUserInfo=new SNSUserInfo();
   Cookie[] cookies = request.getCookies();
     // 遍历数组,获得具体的Cookie
    if(cookies == null) {
        out.print("没有Cookie信息");
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
   	String headImgUrl=SNSUserInfo.getHeadImgUrl();
    String nickname=SNSUserInfo.getNickname();
 %>
<html>
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8">
		<title>会员中心</title>
		<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">

		<!--标准mui.css-->
		<link rel="stylesheet" href="css/mui.min.css">
		<link rel="stylesheet" href="css/icons-extra.css" />
		<link rel="stylesheet" href="css/Member_Center.css" />
		<script type="text/javascript" src="js/jquery-1.7.1.js" ></script>
		<script type="text/javascript" src="js/ajax.js"></script>
		<script type="text/javascript" src="js/jquery.cookie.js"></script>
		<style type="text/css">
			.mui-icon-home:before{
				content: '';
				display: block;
				width: 20px;
				height: 18px;
				background: url(images/nav_img/chadao.png) no-repeat;
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
				background: url(images/nav_img/huiyuans.png) no-repeat;
				background-size:100% 100%;
				margin:5px 0 0 3px;
			}
			.mui-tab-label{
				margin-top:6px;
			}
		</style>
	</head>
	<body>
		<nav class="mui-bar mui-bar-tab">
			<a class="mui-tab-item" onclick="window.location='HomeController/home'">
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
			<a class="mui-tab-item mui-active" onclick="window.location='HomeController/memberCenter'">
				<span class="mui-icon mui-icon-gear"></span>
				<span class="mui-tab-label">会员</span>
			</a>
		</nav>
		<div class="mui-content">
			<div class="member-center-top">
				<div class="member-center">
					<div class="user-portrait">
	            		<img id="headImgUrl" onerror="javascript:this.src='http://via.placeholder.com/100X100'" src="http://via.placeholder.com/100X100">
	            	</div>
	            	<div class="user-info" style="width:45%;">  
	            		<div style="font-size:18px;white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">昵称:<span id="nickname"></span></div>
	            		<div style="padding-top: 7px;font-size:13px;white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">会员等级：青铜会员</div>
	            		<div style="font-size:13px;">可用积分：<span id="conver_num"></span></div>
	            	</div>
            	</div>
            	<div style="width:auto;position: absolute;top:35px;right: 0;">
	            	<div class="jifen" onclick="tc()">签到送积分</div>
	            	<div class="zhuanpan">
	            		<div style="float: right;">
	            			<input id="randRomNum" type ="hidden" value ="">
	            			<img style="width: 6px;height: 10px;margin-top:12px;margin-left: 5px;" src="images/xy.png" />
	            		</div>
	            		 <div style="float: right;" onclick="luckdivShow()">幸运大转盘</div> 
<!-- 	            		<div style="float: right;" onclick="alert('敬请期待！')">幸运大转盘</div>
 -->	            	</div>
            	</div>
			</div>
			<ul class="mui-table-view mui-grid-view mui-grid-9" style="background: #FFFFFF !important;">
				<li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-4">
				    <a onclick="window.location='order_weixin/myorder'">
				    	<img style="width: 34px;height: 29px;margin-bottom: 5px;" src="images/dingdan.png"/>
				        <div class="mui-media-body" style="font-size: 14px;color: #444444;">我的订单</div>
				    </a>
				</li>
				<li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-4" >
				    <a onclick="window.location='order_weixin/address'">
				        <img style="width: 34px;height: 29px;margin-bottom: 5px;" src="images/shouhuodizhi.png"/>
				        <div class="mui-media-body" style="font-size: 14px;color: #444444;">收货地址</div>
				    </a>
				</li>
				<li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-4" >
				    <a onclick="alert('暂无积分!');">
				        <img style="width: 34px;height: 29px;margin-bottom: 5px;" src="images/shaidan.png"/>
				        <div class="mui-media-body" style="font-size: 14px;color: #444444;">我的发布</div>
				    </a>
				</li>
			</ul>
			<ul class="mui-table-view">
		        <li class="mui-table-view-cell" onclick="window.location='order_weixin/address'">
		        	<img class="custom-table-view-cell-icon" src="images/jfscimg.png">
		            <a class="mui-navigate-right" onclick="window.location='wenxin_store/integral'">
		                积分商城
		            </a>
		        </li>
		        <li class="mui-table-view-cell" >
		        	<img class="custom-table-view-cell-icon" src="images/jl.png">
		            <a class="mui-navigate-right" onclick="alert('暂无优惠券！')">
		                我的券包
		            </a>
		        </li>
		        <li class="mui-table-view-cell" >
		        	<img class="custom-table-view-cell-icon" src="images/ckmx.png">
		            <a class="mui-navigate-right" onclick="window.location='integra_weixin/myintegral'">
		                我的积分
		            </a>
		        </li>
		        <li class="mui-table-view-cell" >
		        	<img class="custom-table-view-cell-icon" src="images/td.png">
		            <a class="mui-navigate-right">
		                我的茶友
		            </a>
		        </li>
		    </ul>
		    <div style="height: 10px;"></div>
			<ul class="mui-table-view">
		        <li class="mui-table-view-cell" style="position: relative;">
		        	<img class="custom-table-view-cell-icon" src="images/sz.png">
		            <a class="mui-navigate-right" onclick="window.location='maid/myNews'">
		                我的消息
		            </a>
		        <p style="width:15px;height:15px;border-radius:50%;background: red;position: absolute;top:10px;left:120px;text-align: center;line-height: 15px;color:#fff;font-size: 12px;display:none" id="if_read"></p>
		        </li>
		        <li class="mui-table-view-cell">
		        	<img class="custom-table-view-cell-icon" src="images/ye.png">
		            <a class="mui-navigate-right" onclick="alert('开发中,敬请期待!');">
		                余额
		            </a>
		        </li>
		    </ul>
			<div style="height: 10px;"></div>
			<ul class="mui-table-view">
		        <li class="mui-table-view-cell">
		        	<img class="custom-table-view-cell-icon" src="images/ewm.png">
		            <a class="mui-navigate-right" onclick="window.location='QRcod/getqR'">
		                生成二维码
		            </a>
		        </li>
		    </ul>
			
		</div>
		<div class="box">
			<div class="box-title">
				<div style="float: left;">
					<div style="float: left;margin: 2px;margin-right: 5px;">
						<img style="width: 20px;height: 18px;" src="images/qdjl.png"/>
					</div>
					<span style="font-size: 11px;color: #474747;">签到记录</span>
				</div>
				<div style="float: right;" class="guanbie">
					<img style="width: 12px;height: 12px;" src="images/guanbi.png"/>
				</div>
				<div class="box-title-portrait">
					<span>本月已签到</span>
					<span id="mon_day"></span>
	        	</div>
			</div>
        	<div style="clear: both;"></div>
        	<div style="padding: 0 15px 15px 15px;">
				<div class="specific-date">
					<label id="current_time"></label>
				</div>
			</div>
			<div class="lingquanjifen">
				<ul class="mui-table-view mui-grid-view mui-grid-9">
					<li class="mui-table-view-cell mui-media mui-col-xs-3 mui-col-sm-3">
						<span>第1天</span>
						<div class="lingquanjifen-div" id="day1" onclick="linjuan_click(this,1)">
					        <img class="li-img" src="images/jifenimg.png" />
					        <div class="mui-media-body">1积分</div>
					        <div class="mengban" id="dayy1">
								<div class="mengban-div">已领取</div>
							</div>
				        </div>
					</li>
					<li class="mui-table-view-cell mui-media mui-col-xs-3 mui-col-sm-3">
						<span>第2天</span>
						<div class="lingquanjifen-div" id="day2" onclick="linjuan_click(this,2)">
					        <img class="li-img" src="images/jifenimg.png" />
					        <div class="mui-media-body">2积分</div>
					        <div class="mengban" id="dayy2">
								<div class="mengban-div">已领取</div>
							</div>
					    </div>
					</li>
					<li class="mui-table-view-cell mui-media mui-col-xs-3 mui-col-sm-3">
				        <span>第3天</span>
						<div class="lingquanjifen-div" id="day3" onclick="linjuan_click(this,3)">
					        <img class="li-img" src="images/jifenimg.png" />
					        <div class="mui-media-body">3积分</div>
					        <div class="mengban" id="dayy3">
								<div class="mengban-div">已领取</div>
							</div>
					    </div>
					</li>
					<li class="mui-table-view-cell mui-media mui-col-xs-3 mui-col-sm-3">
				        <span>第4天</span>
						<div class="lingquanjifen-div" id="day4" onclick="linjuan_click(this,4)">
					        <img class="li-img" src="images/jifenimg.png" />
					        <div class="mui-media-body">4积分</div>
					        <div class="mengban" id="dayy4">
								<div class="mengban-div">已领取</div>
							</div>
					    </div>
					</li>
				</ul>
				<ul class="mui-table-view mui-grid-view mui-grid-9 last-li">
					<li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-4">
						<span>第5天</span>
						<div class="lingquanjifen-div" id="day5" onclick="linjuan_click(this,5)">
					        <img class="li-img" src="images/jifenimg.png" />
					        <label class="mui-media-body">5积分</label>
					        <div class="mengban" id="dayy5">
								<div class="mengban-div">已领取</div>
							</div>
				        </div>
					</li>
					<li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-4">
						<span>第6天</span>
						<div class="lingquanjifen-div" id="day6" onclick="linjuan_click(this,6)">
					        <img class="li-img" src="images/jifenimg.png" />
					        <label class="mui-media-body">6积分</label>
					        <div class="mengban" id="dayy6">
								<div class="mengban-div">已领取</div>
							</div>
					    </div>
					</li>
					<li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-4">
						<span>第7天</span>
						<div class="lingquanjifen-div" id="day7" style="padding: 7px 6px;" onclick="linjuan_click(this,7)">
							<img style="float: left;width: 50px;margin-top: 10px;" src="images/fenxqt.png" />
							<label>连续签到7天送7积分</label>
							<div class="mengban" id="dayy7">
								<div class="mengban-div">已领取</div>
							</div>
					    </div>
					</li>
				</ul>
				<input id="sinnum" type="hidden" value="">
				<div class="last-li1">
					<span>月满签</span>
					<div class="lingquanjifen-div1" onclick="linjuan_click(this)">
						<img style="float: left;width: 65px;height:60px;" src="images/month.png" />
						<div style="padding: 8px 0;width: 55%;float: right;text-align: center;">
							<label>连续签到一个月送30积分</label>
						</div>
						<div class="mengban">
							<div class="mengban-div">已领取</div>
						</div>
				    </div>
				</div>	
			</div>
		</div>
		<div class="bgdiv"></div>
		<!--大转盘-->
		<div class="luckdraw_div"  id="luckdrawDiv">
			<div class="luckdraw_div_top">
				<span>赚取积分抽大奖</span>
				<span class="luckHide">关闭</span>
			</div>
			<div class="luckdraw_div_img">
				<div class="luckdraw_div_myluck">
					<div>我的积分：<span>${integral_basics}</span></div>
					<p>每次抽奖将消耗10积分</p>
				</div>
				<div class="luckdraw_div_bj">
					<div id="bg">
				    	<img class="bg_img"  id="bg_img" src="images/luckdraw/pointer.png" alt="pointer" style="">
				    	<img class="bg_img1" id="bg_img1" src="images/luckdraw/turnTables.png" alt="turntable" style="">
				    </div>
				    <p class="lottery-msg"></p>
				</div>
				<div class="luckdraw_div_winning">
					<div class="record">
						查看中奖纪录
					</div>
					<div class="rules">
						查看抽奖规则
					</div>
				</div>
			</div>
		</div>
		<script src="js/mui.min.js"></script>
		<script type="text/javascript" src="js/rotate.js"></script>
		<script type="text/javascript" src="js/jquery.easing.min.js"></script>
		<script type="text/javascript">
			var headImgUrl="<%=headImgUrl%>";
			var nickname="<%=nickname%>";
			if(headImgUrl!=null){
				document.getElementById("headImgUrl").src=headImgUrl;
			}
			if(nickname!=null){
				document.getElementById("nickname").innerHTML=nickname;
			}
			//当前积分
			 ajaxPost("<%=basePath%>maid/findIntegralBasics", "", "json", "json", showConverNum);//异步获取当前用户积分，并显示在当前页面
			// 历史积分
	      //	ajaxPost("<%=basePath%>maid/findRecordsIntegral", "", "json", "json", showConverNum); //异步获取当前用户晋升积分流水，并显示在当前页面	
			// 可使用积分
		//	ajaxPost("<%=basePath%>HomeController/findIntegralConverNum", "", "json", "json", showConverNum); //卡巴积分
			function showConverNum(data){
				var conver_num=data.object;
			    document.getElementById("conver_num").innerHTML = conver_num;
			}
			var today = new Date();
			var day   = today.getDate();
			var year  = today.getFullYear();
			var month = today.getMonth() + 1;
			month = month<10?"0"+month:month;
			day = day<10?"0"+day:day;
			var date_time = year+"年"+month+"月"+day+"日";
			document.getElementById("current_time").innerHTML = date_time;
			
			// 连续签到天数
			ajaxPost("<%=basePath%>integra_weixin/findSignIntegralDay", "", "json", "json", showSignIntegralDay); //签到天数
			function showSignIntegralDay(date){
				var sinnum=date.object;
				if(sinnum==0){
					document.getElementById("sinnum").value=sinnum;
					return;
				}
				document.getElementById("sinnum").value=sinnum;
				for(var i=1;i<=sinnum;i++){
					var day="day";
					var dayy="dayy";
					day=day+i;
					dayy=dayy+i;
					var d = document.getElementById(day);
					d.style.backgroundColor = "#3f9996";
					document.getElementById(dayy).style.display="block";
					document.getElementById(day).onclick="";
				};
			}
			ajaxPost("<%=basePath%>integra_weixin/findSignIntegralMon", "", "json", "json", showSignIntegralMon); //本月签到天数
			function showSignIntegralMon(data){
				if(data.state==0){
					document.getElementById("mon_day").innerHTML=data.object+"天";
				}
			}
		</script>
		<script>
		// 用户未读消息   UserMessage/findUserCount
	      	var jsiondat={"1":"1"};
	      	ajaxPost("<%=basePath%>UserMessage/findUserCount",jsiondat,"json","json",findUserCounts);//异步获取当前用户用户未读消息
	      	
	      	function findUserCounts(data){
	      		if(data.state==0){
	      			if(data.object>0){
	      				document.getElementById("if_read").style.display='block';
	      				document.getElementById("if_read").innerHTML=data.object;
	      			}
	      		}
	      		
	      	}
	      	
			mui.init({
				swipeBack:true //启用右滑关闭功能
			});
			mui('body').on('tap','a',function(){
				// 获取onclick
			    var str = this.onclick;
			    // 强制转换为字符串
			    str = String(str);
			    var functionString = str.substr(26,str.length - 27);
			    // 执行就好了
			    eval(functionString);
			});
			function tc(){
				$(".bgdiv,.box").fadeIn();
				var tops = $(document).scrollTop();//当页面滚动时，把当前距离赋值给页面，这样保持页面滚动条不动  
				$(document).bind("scroll",function (){$(document).scrollTop(tops); });
			};
			
			$(function() {
				$(".guanbie").click(function() {
					$(".bgdiv,.box").hide();
					$(document).unbind("scroll");
				});
			});
			
			//修改签到样式
			function linjuan_click(elm,num){
				var sinnum=document.getElementById("sinnum").value;
				if(num-1==sinnum){
					// 签到
					var paramData={"1":"1"};                               
	    			var object = JSON.stringify(paramData);
					ajaxPost("<%=basePath%>integra_weixin/signIntegral",object, "json", "json", successsin); 
				}else{
					return;
				}
				function successsin(data){
				if(data.state==0){
					alert(data.message);
					$(elm).css({
						"background":"#3f9996"//变色
					});
					$(elm).find("div.mengban").css("display","block");//显示
				}else{
					alert(data.message);
				}
			}
				
				
			}
			 
			$(function() {
				$(".luckHide").click(function() {
					$(".luckdraw_div").hide();
					$(document).unbind("scroll");
				});
				
			});
			//幸运大转盘
			function luckdivShow () {
				$(".luckdraw_div").fadeIn();
				var tops = $(document).scrollTop();//当页面滚动时，把当前距离赋值给页面，这样保持页面滚动条不动  
				$(document).bind("scroll",function (){$(document).scrollTop(tops); });
				 var offOn = false; //是否正在抽奖	
				 var count = 0;//控制每次抽奖完成后 ，偏角值的变化
		         //启动转盘
	             var  rotateFunc = function (angle, prize) {  //angle: 奖项对应的角度 prize:中奖金额 luckDrawCounts:抽奖次数
		              //alert(angle+1440);
		              $('#bg_img1').stopRotate();
		              $('#bg_img1').rotate({
		                 angle: 0,
		                 duration: 500,
		                 animateTo: angle+1440*(count+1), //angle是图片上各奖项对应的角度，1440是我要让指针旋转4圈。所以最后的结束的角度就是这样子^^
		                 callback: function () {
		                      //更改抽奖次数
		                     // $(".submit-msg").show();
		                     //$(".lucktime").html(luckDrawCounts);
		                     offOn = false;
		                     $(".lottery-msg").html('您抽中了' + prize + '，恭喜您。').css("color", "blue");
		                     count=count+1;
		                    //alert('您抽中了' + prize + '，恭喜您。');
		                   // history.go(0);
		                 }
		             });
		         };
				//触发转盘转动
			     $('#bg_img').rotate({
		              bind: {
		                 click: function () {
		                     if (offOn == false) {
		                        var paramData;
								var paramData = {"1": "1"};
								var object = JSON.stringify(paramData);
		                        ajaxPost("<%=basePath%>weixin_obtainAward/getObtainAward",object,"json","json",function(data){
		                          var dataObject = data.object;
						           if (data.state == 0) {
					                 if (dataObject.award_id == 3) {
					                     rotateFunc(360, dataObject.award_name);
					                 }
					                 if (dataObject.award_id == 1) {
					                     rotateFunc(300, dataObject.award_name);
					                 }
					                 if (dataObject.award_id == 4) {
					                     rotateFunc(240, dataObject.award_name);
					                 }
					                 if (dataObject.award_id == 6) {
					                     rotateFunc(180, dataObject.award_name);
					                 }
					                 if (dataObject.award_id == 2) {
					                     rotateFunc(120, dataObject.award_name);
					                }
					                 if (dataObject.award_id == 5) {
					                     rotateFunc(60, dataObject.award_name);
					                 }
					            }else {
					                 offOn = false;
					                 $(".lottery-msg").html(data.message).css("color", "red");
					            }
		                        });
		                     }else{
		                         if (offOn){
		                            $(".lottery-msg").html('请提交后再重新抽奖').css("color", "red");
		                         }else{
		                             $(".lottery-msg").html('对不起你的抽奖机会用完了').css("color", "red");
		                         }
		                     }
		                 }
		            }
		       });
			}
		</script>
	</body>

</html>