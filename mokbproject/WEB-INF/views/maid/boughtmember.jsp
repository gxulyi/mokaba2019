<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page  import="com.medicinefood.entity.core.TeamEntity" %>
<%
TeamEntity teamEntityBuy=(TeamEntity)request.getAttribute("teamEntityBuy");
%>
<!DOCTYPE HTML>
<html>

	<head>
		<base href="<%=basePath%>">
		<meta charset="UTF-8">
		<title>已购会员</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />

		<link href="css/mui.min.css" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="css/fonts/iconfont/iconfont.css" />
		<link rel="stylesheet" type="text/css" href="css/public.css" />
		<link rel="stylesheet" type="text/css" href="css/mainstyle.css" />
		<link rel="stylesheet" type="text/css" href="css/myteam.css" />
	</head>
	<script type="text/javascript" src="js/ajax.js"></script>
	<script type="text/javascript" src="js/medicinefood/team.js"></script>
	<script type="text/javascript">
		window.onload = function() {
			ajaxPost("<%=basePath%>user_weixin/findUserSubordinateInculdeOrderBasics5", "", "json", "json", showMyteamNum);
		};

		function showMyteamNum(data) {
			var object = data.object; //后台数据库返回数据
			var subordinate1 = object[1]; //一级下属
			var subordinateBuy1; //一级已购买下属
			var subordinate2 = object[2]; //二级下属
			var subordinateBuy2; //二级已购买下属
			var subordinate3 = object[3]; //三级下属
			var subordinateBuy3; //三级已购买下属
			var subordinate4 = object[4]; //四级下属
			var subordinateBuy4; //四级已购买下属
			var subordinate5 = object[5]; //五级下属
			var subordinateBuy5; //五级已购买下属
			var amount; //总人数
			var buyAmount; //已购买人数
			subordinateBuy1 = getBuySubordinate(subordinate1, 11); //得到一级以购买下属
			subordinateBuy2 = getBuySubordinate(subordinate2, 11); //得到二级以购买下属
			subordinateBuy3 = getBuySubordinate(subordinate3, 11); //得到三级以购买下属
			subordinateBuy4 = getBuySubordinate(subordinate4, 11); //得到四级以购买下属
			subordinateBuy5 = getBuySubordinate(subordinate5, 11); //得到五级以购买下属
			amount = subordinate1.length + subordinate2.length + subordinate3.length; //得到总人数
			buyAmount = subordinateBuy1.length + subordinateBuy2.length + subordinateBuy3.length; //得到总人数
			setHtml(subordinateBuy1, subordinateBuy2, subordinateBuy3, subordinateBuy4, subordinateBuy5);
		}

		function setHtml(subordinateBuy1, subordinateBuy2, subordinateBuy3, subordinateBuy4, subordinateBuy5) {
			document.getElementById("subordinateBuy_1").innerHTML = subordinateBuy1.length;
			document.getElementById("subordinateBuy_2").innerHTML = subordinateBuy2.length;
			document.getElementById("subordinateBuy_3").innerHTML = subordinateBuy3.length;
			document.getElementById("subordinateBuy_4").innerHTML = subordinateBuy4.length;
			document.getElementById("subordinateBuy_5").innerHTML = subordinateBuy5.length;
		}
	</script>

	<body>
		<div class="mui-content">
			<!--搜索框-->
			<div class="search border-red">
				<div class="search-left mui-action-back">
					<i class="iconfont icon-left"></i>
				</div>
				<div class="search-center">
					<h4>已购会员</h4>
				</div>
			</div>

			<div class="mdfd-content">
				<div class="teamnumber mui-navigate-right">
					<span>第一代会员</span>
					<span id="subordinateBuy_1">0</span>
				</div>
				<div class="mui-navigate-right teamnumber">
					<span>第二代会员</span>
					<span id="subordinateBuy_2">0</span>
				</div>
				<div class="mui-navigate-right teamnumber">
					<span>第三代会员</span>
					<span id="subordinateBuy_3">0</span>
				</div>
				<div class="mui-navigate-right teamnumber">
					<span>第四代会员</span>
					<span id="subordinateBuy_4">0</span>
				</div>
				<div class="mui-navigate-right teamnumber">
					<span>第五代会员</span>
					<span id="subordinateBuy_5">0</span>
				</div>
			</div>

		</div>
		<script src="js/mui.min.js"></script>
		<script src="js/wx_common.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			(function($, doc) {
				$.init();

				var personnumbers = $('.teamnumber');
				personnumbers.each(function(i, btn) {
					btn.addEventListener('tap', function() {

						var page = './maid/member_detail?member=';
						var member;
						switch(i) {
							case 0:
								member = '第一代已购会员';
								break;
							case 1:
								member = '第二代已购会员';
								break;
							case 2:
								member = '第三代已购会员';
								break;
							case 3:
								member = '第四代已购会员';
								break;
							case 4:
								member = '第五代已购会员';
								break;
						}
						var page_url = page + member;
						window.location.href = page_url;
					}, false);
				});
			})(mui, document);
		</script>
	</body>

</html>