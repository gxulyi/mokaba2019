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
		<title>我的团队</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
		<link href="css/mui.min.css" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="css/fonts/iconfont/iconfont.css" />
		<link rel="stylesheet" type="text/css" href="css/public.css" />
		<link rel="stylesheet" type="text/css" href="css/mainstyle.css" />
		<link rel="stylesheet" type="text/css" href="css/myteam.css" />
		
	</head>

	<body>
		<div class="mui-content">
			<!--搜索框-->
			<div class="search border-red">
				<div class="search-left mui-action-back">
					<i class="iconfont icon-left"></i>
				</div>
			</div>

			<div class="mdfd-content">
				<div class="bonus-show default-text-color">
					<span style="color:#ffa954;font-size: 60px;" id="amount"></span><br />
					<span style="color:#fff;font-size: 18px;">团队总人数</span>
				</div>
				<ul class="mdfd-content_huiyuan">
					<li style="border-right: 1px solid #ccc;width: 49%;" onclick="clickShowDiv(this,'yghy_div');">
						<span>已购会员</span>
						<i class="mui-icon mui-icon-arrowdown" style="display: none;color:#62bca3"></i>
						<i class="mui-icon mui-icon-arrowup" ></i>
					</li>
					<li style="" onclick="clickShowDiv(this,'wghy_div');">
						<span>未购会员</span>
						<i class="mui-icon mui-icon-arrowdown" style="display: none;color:#62bca3"></i>
						<i class="mui-icon mui-icon-arrowup" ></i>
					</li>
				</ul>

				<div class="mdfd-content_huiyuans" id="yghy_div">
					<p id="yghy_num" style="color: #62bca3;"></p>
					<ul id="yghy_detail" style="list-style: none;margin:10px 0px;padding:0;">
						<!-- <li class="mdfd-content_huiyuans_li">
							<div class="mdfd-content_huiyuans_li_img">
								<img style="width:100%;height: 100%;" alt="" src="" onerror="javascript:this.src='http://via.placeholder.com/60x60'">
							</div>
							<span>用户：23435</span>
						</li>-->
					</ul>
					<div class="mdfd-content_zonghuiyuan">
						<p>已购会员总人数：<span id="buyAmount"></span>人</p>
						<ul id="buyMemberSubordinate">
							<li><span>第一代会员</span></li>
							<li><span>第二代会员</span></li>
							<li><span>第三代会员</span></li>
							<li><span>第四代会员</span></li>
							<li><span>第五代会员</span></li>
						</ul>
					</div>
				</div>
				<div class="mdfd-content_huiyuans" id="wghy_div" style="display: none;">
					<p id="wghy_num" style="color: #62bca3;"></p>
					<ul id="wghy_detail" style="list-style: none;margin:10px 0px;padding:0;">
						<!--  <li class="mdfd-content_huiyuans_li">
							<div class="mdfd-content_huiyuans_li_img">
								<img style="width:100%;height: 100%;" alt="" src="" onerror="javascript:this.src='http://via.placeholder.com/60x60'">
							</div>
							<span>用户：23435</span>
						</li> -->
					</ul>
					<div class="mdfd-content_zonghuiyuan">
						<p>未购会员总人数：<span id="buyAmountNo"></span>人</p>
						<ul id="buyMemberSubordinateNo">
							<li><span>第一代会员</span></li>
							<li><span>第二代会员</span></li>
							<li><span>第三代会员</span></li>
							<li><span>第四代会员</span></li>
							<li><span>第五代会员</span></li>
						</ul>
					</div>
				</div>
				<!-- 
				
				<div class="teamnumber">
					<span >总人数</span>
					<span>0</span>
				</div>
				<div class="mui-navigate-right teamnumber">
					<span>已购人员</span>
					<span id="buyAmount">0</span>
				</div>
				<div class="mui-navigate-right teamnumber">
					<span>未购人员</span>
					<span id="buyAmountNo">0</span>
				</div> -->
			</div>

		</div>
		<script src="js/mui.min.js"></script>
		<script type="text/javascript" src="js/ajax.js"></script>
		<script type="text/javascript" src="js/medicinefood/team.js"></script>
		<script type="text/javascript">
			window.onload = function() {
				// 获取会员总人数
				ajaxPost("<%=basePath%>user_weixin/findUserSubordinateInculdeOrderBasics5", "", "json", "json", showMyteamNum);
			};

			function showMyteamNum(data) {
				var amount; //总人数
				var buyAmount; //已购买人数
				var object =data.object;//后台数据库返回数据
				var subordinate1=object[1];//一级下属
				var subordinateBuy1,subordinateBuyNo1;//一级未购和已购下属 
				var subordinate2=object[2];//二级下属
				var subordinateBuy2,subordinateBuyNo2;//二级未购和已购下属
				var subordinate3=object[3];//三级下属
				var subordinateBuy3,subordinateBuyNo3;//三级未购和已购下属
				var subordinate4=object[4];//四级下属
				var subordinateBuy4,subordinateBuyNo4;//四级未购和已购下属
				var subordinate5=object[5];//五级下属
				var subordinateBuy5,subordinateBuyNo5;//五级未购和已购下属
				
				subordinateBuy1 = getBuySubordinate(subordinate1, 11); //得到一级以购买下属
				subordinateBuy2 = getBuySubordinate(subordinate2, 11); //得到二级以购买下属
				subordinateBuy3 = getBuySubordinate(subordinate3, 11); //得到三级以购买下属
				subordinateBuy4 = getBuySubordinate(subordinate4, 11); //得到四级以购买下属
				subordinateBuy5 = getBuySubordinate(subordinate5, 11); //得到五级以购买下属
				
				subordinateBuyNo1=getBuySubordinateNo(subordinate1,11);//得到一级未购买下属
				subordinateBuyNo2=getBuySubordinateNo(subordinate2,11);//得到二级未购买下属
				subordinateBuyNo3=getBuySubordinateNo(subordinate3,11);//得到三级未购买下属
				subordinateBuyNo4=getBuySubordinateNo(subordinate4,11);//得到四级未购买下属
				subordinateBuyNo5=getBuySubordinateNo(subordinate5,11);//得到五级未购买下属
				
				amount = subordinate1.length + subordinate2.length + subordinate3.length + subordinate4.length + subordinate5.length; //得到总人数
				buyAmount = subordinateBuy1.length + subordinateBuy2.length + subordinateBuy3.length + subordinateBuy4.length + subordinateBuy5.length; //已购买人数
				
				// 总人数、已购总人数、未购总人数数据填充
				document.getElementById("amount").innerHTML = amount;
				document.getElementById("buyAmount").innerHTML = buyAmount;
				document.getElementById("buyAmountNo").innerHTML = parseInt(amount) - parseInt(buyAmount);
				
				// 数据填充
				setBuyPeople(subordinateBuy1,'第一代已购');
				
				// 已购会员级数选择
				$("#buyMemberSubordinate li").each(function(i,btn) {
					var subordinate = eval('subordinateBuy'+(i+1));
					var subordinateNum = '';
					switch (i){
						case 0:
							subordinateNum = '第一代已购';
							break;
						case 1:
							subordinateNum = '第二代已购';
							break;
						case 2:
							subordinateNum = '第三代已购';
							break;
						case 3:
							subordinateNum = '第四代已购';
							break;
						case 4:
							subordinateNum = '第五代已购';
							break;
					}
					btn.addEventListener('click',function(){
						setBuyPeople(subordinate,subordinateNum);
						$(this).parent().parent().hide();
						$('.mdfd-content_huiyuan').find('li').first().find('i:eq(0)').hide();
						$('.mdfd-content_huiyuan').find('li').first().find('i:eq(1)').show();
						$('.mdfd-content_huiyuan').find('li').last().find('i:eq(1)').show();
						$('.mdfd-content_huiyuan').find('li').last().find('i:eq(0)').hide();
					},false);
				}); 
				
				// 未购会员级数选择
				$("#buyMemberSubordinateNo li").each(function(i,btn) {
					var subordinate = eval('subordinateBuyNo'+(i+1));
					var subordinateNum = '';
					switch (i){
						case 0:
							subordinateNum = '第一代未购';
							break;
						case 1:
							subordinateNum = '第二代未购';
							break;
						case 2:
							subordinateNum = '第三代未购';
							break;
						case 3:
							subordinateNum = '第四代未购';
							break;
						case 4:
							subordinateNum = '第五代未购';
							break;
					}
					
					btn.addEventListener('click',function(){
						setNoBuyPeople(subordinate,subordinateNum);
						$(this).parent().parent().hide();
						$('.mdfd-content_huiyuan').find('li').first().find('i:eq(0)').hide();
						$('.mdfd-content_huiyuan').find('li').first().find('i:eq(1)').show();
						$('.mdfd-content_huiyuan').find('li').last().find('i:eq(1)').show();
						$('.mdfd-content_huiyuan').find('li').last().find('i:eq(0)').hide();
					},false);
				}); 
				
			}
			
			// 已购买数据填充
			function setBuyPeople(peopleNumArr,subordinateNum){
				document.getElementById("yghy_num").innerHTML = subordinateNum +'会员总人数：<span style="color:#ffa954;">'+ peopleNumArr.length +'</span>人';
				var html = '';
				for(var i = 0;i < peopleNumArr.length;i ++){
					html += '<li class="mdfd-content_huiyuans_li">'+
							'	<div class="mdfd-content_huiyuans_li_img">'+
							'		<img src="'+ peopleNumArr[i].weixin_portrait +'" onerror="javascript:this.src=\'http://via.placeholder.com/60x60\'">'+
							'	</div>'+
							'	<span>用户：'+ peopleNumArr[i].weixin_nickname +'</span>'+
							'</li>';
				}
				document.getElementById("yghy_detail").innerHTML = html;
			}
			// 未购买数据填充
			function setNoBuyPeople(peopleNumArr,subordinateNum){
				document.getElementById("wghy_num").innerHTML = subordinateNum +'会员总人数：<span style="color:#ffa954;">'+ peopleNumArr.length +'</span>人';
				var html = '';
				for(var i = 0;i < peopleNumArr.length;i ++){
					html += '<li class="mdfd-content_huiyuans_li">'+
							'	<div class="mdfd-content_huiyuans_li_img">'+
							'		<img src="'+ peopleNumArr[i].weixin_portrait +'" onerror="javascript:this.src=\'http://via.placeholder.com/60x60\'">'+
							'	</div>'+
							'	<span>用户：'+ peopleNumArr[i].weixin_nickname +'</span>'+
							'</li>';
				}
				document.getElementById("wghy_detail").innerHTML = html;
			}
			
			
			function clickShowDiv(e, id) {
				$(".mdfd-content_huiyuans").each(function() {
					if($(this).attr("id") == id) {
					    if($(this).children(".mdfd-content_zonghuiyuan").css("display") == 'none') {
							$(this).show();
							$(this).children(".mdfd-content_zonghuiyuan").show();
							$(e).find("i:eq(1)").hide();
				            $(e).find("i:eq(0)").show();
						} else {
							$(this).children(".mdfd-content_zonghuiyuan").hide();
							$(e).find("i:eq(0)").hide();
				            $(e).find("i:eq(1)").show();
						};
					} else {
					   	$(this).hide();
						$(this).children(".mdfd-content_zonghuiyuan").hide();
						$(e).find("i:eq(0)").show();
				        $(e).find("i:eq(1)").hide();
					}
				});
			}
		</script>
	</body>

</html>