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
		<title>分红积分</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />

		<link href="css/mui.min.css" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="css/fonts/iconfont/iconfont.css" />
		<link rel="stylesheet" type="text/css" href="css/public.css" />
		<link rel="stylesheet" type="text/css" href="css/mainstyle.css" />
		<link rel="stylesheet" type="text/css" href="css/reward.css" />
		<link rel="stylesheet" type="text/css" href="js/pop/custom-pop.css" />
		<script src="js/pop/custom-pop.js"></script>

	</head>

	<style type="text/css">
		
	</style>
	<script type="text/javascript" src="js/ajax.js"></script>
	<script type="text/javascript" src="js/medicinefood/uitl.js"></script>
	<script type="text/javascript">
		window.onload = function() {
			//var jsonData={"boss_user_basics_id":boss_user_basics_id};//ajax传入的参数 json对象
			//jsonData=JSON.stringify(jsonData);//将json对象转成json格式的字符串。 发送原生ajax请求只能支持json字符串。
			ajaxPost("<%=basePath%>maid/findIntegralBasics", "", "json", "json", setIntegralBasics);
			ajaxPost("<%=basePath%>maid/findIntegralBasicsAccount", "", "json", "json", setIntegralAccount); //异步获取当前用户晋升积分流水，并显示在当前页面
		};
	    
		function setIntegralBasics(jsonData) {
		var object = jsonData.object;
		document.getElementById("integralBasics").innerHTML = object;
		}
      
		function setIntegralAccount(jsonData) {
			var object = jsonData.object;
			var newDate = new Date();
			//console.log(formatDateTimeStr(object[0].account_add_date,2));
			var integralAccount = document.getElementById("integralAccount");
			var html = "";
			var integral_account_type; //流水触发原因
			object.forEach( //遍历object
				function(val, index, arr) {
					switch(parseInt(val.integral_account_type)) {
						case 1: //类型1为购买商品
							integral_account_type = "&nbsp&nbsp<a href>订单号 :" + val.integral_trigger + "</a>";
							break;

						default:
							break;
					}
					var integral_account_num; //更改的值（流水值）

					integral_account_num = parseInt(val.integral_account_num);
						var h5Str="";
						if(integral_account_num>0){
						h5Str='<h5 style="color:#62bca3;font-size: 16px;">' + integral_account_num + '</h5>';
						}
					html += '<div class="reward-detail-single">' +
						'<h5 class="default-text-color">' + val.integral_account_explain + '</h5>' +
						h5Str+
						'<div style="clear: both;">' +
						'</div>' +
						'<p class="default-text-color">' +
						'<span style="font-size: 12px;color:#666;">' + formatDateTimeStr(val.account_add_date) + '</span>' +
						'<span class="float-r">' + integral_account_type + '</span>' +
						'</p>' +
						'</div>';

				}
			);
			integralAccount.innerHTML = html;
		}
	</script>

	<body>
		<div class="mui-content">
			<!--搜索框-->
			<div class="search">
				<div class="search-left mui-action-back">
					<i class="iconfont icon-left"></i>
				</div>
				<div class="search-right">
					<span class="iconfont icon-tishishuoming float-r"></span>
				</div>
			</div>

			<div class="mdfd-content">

				<!--奖励积分显示-->
				<div class="position-relative">
					<div class="reward-show">
						<span style="color:#ffa954;font-size: 60px;" id="integralBasics"></span><br />
						<span style="color:#fff;font-size: 18px;">当前积分</span>
					</div>
				</div>

				<!--奖励积分明细-->
				<div class="reward-detail-box">
					<div class="reward-detail-single" style="border-bottom: none;">
						<p style="width:50%;font-size: 16px;color:#333;font-weight: none;text-align: center;float: left;color:#62bca3;" onclick="Convertibility(this,'integralAccount');">
							<span style="border-bottom:1px solid #62bca3;padding-bottom:3px;">获取记录</span>
						</p><!-- 明细 -->
						<p style="width:50%;font-size: 16px;color:#333;font-weight: none;text-align: center;float: left;border-left:1px solid #cccccc;" onclick="Convertibility(this,'integralRecord');">
							<span >兑换记录</span>
						</p>
						<div style="clear: both;"></div>
					</div>
					<!-- 获取记录 -->
					<div id="integralAccount" class="integral"></div>
					<!-- 兑换记录 -->
					<div id="integralRecord" class="integral" style="display: none;">
						<!-- <div class="reward-detail-single">
							<h5 class="default-text-color">null购买商品获取奖励</h5>
							<h5 style="color:#62bca3;font-size: 16px;">1</h5>
							<div style="clear: both;"></div>
							<p class="default-text-color">
								<span style="font-size: 12px;color:#666;">2018-07-26</span>
							</p>
						</div> -->
					</div>
				</div>
			</div>
		</div>
		<script src="js/mui.min.js"></script>
		<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
		<script type="text/javascript">
			/* 记录切换 */
			function Convertibility(e,id) {
				$(".integral").each(function(){
				if($(this).attr("id")==id){
					$(this).show();
				}else{
					$(this).hide();
				};
			});
			$(e).css("color","#62bca3");
			$(e).children("span").css({"border-bottom":"1px solid #62bca3","padding-bottom":"3px"});
			$(e).siblings().each(function(){
					$(this).css("color","#333");
					$(this).children("span").css({"border-bottom":"none","padding-bottom":"none"});
				});
			};
			
			
			(function($, doc) {
				$.init();

				// 简介点击事件
				$('.search-right').on('tap', '.iconfont', function() {
					var html = '<p>' +
						'<div>i、会员晋升积分，在下属五代会员范围内取得。</div>' +
						'<div>ii、注册会员及注册会员以上聘阶会员，在下属五代会员范围内，直接推荐或间接推荐1名注册会员，即可获得1个晋升积分。</div>' +
						'</p>';
					var popInfo = {
						title: '提示',
						content: html
					};
					popShowAndHidden(popInfo);
				});

				// 可换积分
				$('body').on('tap', '.mui-popover-action li>a', function() {
					var a = this,
						parent;

					for(parent = a.parentNode; parent != document.body; parent = parent.parentNode) {
						if(parent.classList.contains('mui-popover-action')) {
							break;
						}
					}

					mui('#' + parent.id).popover('toggle');
					if(a.id == 'medifoodcion') {
						var btnArray1 = ['取消', '确定'];
						$.prompt('', '请输入奖励积分', '兑换脉谛富德币', btnArray1, function(e) {
							if(e.index == 1) {
								if(e.value) {
									mui.alert('提交数据' + e.value);
								} else {
									mui.alert('请填写奖励积分后重试...');
								}
							} else {
								mui.toast('取消');
							}
						});
					} else if(a.id == 'menoy') {
						var btnArray1 = ['取消', '确定'];
						$.prompt('', '请输入奖励积分', '兑换提现', btnArray1, function(e) {
							if(e.index == 1) {
								if(e.value) {
									mui.alert('提交数据' + e.value);
								} else {
									mui.alert('请填写奖励积分后重试...');
								}
							} else {
								mui.toast('取消');
							}
						});
					}
				});

				// 待换积分
				$('.reward-option-box').on('tap', '#witereward', function() {
					mui.alert('请解锁操作！！！', '脉谛富德币', function() {});
				});
			})(mui, document);
		</script>
	</body>

</html>