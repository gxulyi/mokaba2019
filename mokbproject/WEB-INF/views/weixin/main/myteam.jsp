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
		<title>我的茶友</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
		<link rel="stylesheet" href="css/mui.min.css">
		<link rel="stylesheet" type="text/css" href="css/fonts/iconfont/iconfont.css" />
<!-- 		<link rel="stylesheet" type="text/css" href="css/public.css" /> -->
		<link rel="stylesheet" type="text/css" href="css/mainstyle.css" />
		<link rel="stylesheet" type="text/css" href="css/myteam.css" />
		
	</head>

	<body  style="background: #fff">
		<header class="mui-bar mui-bar-nav">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
		</header>
		<div class="mui-content">
			<div class="mdfd-content">
				<div class="bonus-show default-text-color">
					<span style="color:#ffa954;font-size: 60px;" id="amount"></span><br />
					<span style="color:#fff;font-size: 18px;">茶友总人数</span>
				</div>
				<ul class="mdfd-content_huiyuan">
					<li class="huiyuan_li" style="border-right: 1px solid #ccc;width: 49%;color:#5db8e1" onclick="clickShowDiv(this,'yghy_div');">
						<span>直接茶友<label id="buyAmount1"></label>人</span>
					</li>
					<li class="huiyuan_li" onclick="clickShowDiv(this,'wghy_div');">
						<span>间接茶友<label id="buyAmount2"></label>人</span>
					</li>
				</ul>

				<div class="mdfd-content_huiyuans" id="yghy_div">
					<ul id="yghy_div_ul" style="list-style: none;margin:10px 0px;padding:0;">
					</ul>
				</div>
				<div class="mdfd-content_huiyuans" id="wghy_div" style="display: none;">
					<ul id="wghy_div_ul" style="list-style: none;margin:10px 0px;padding:0;">
					</ul>
				</div>
			</div>

		</div>
		<script src="js/mui.min.js"></script>
		<script type="text/javascript" src="js/ajax.js"></script>
		<!-- <script type="text/javascript" src="js/medicinefood/team.js"></script> -->
		<script type="text/javascript">
			window.onload = function() {
				// 获取会员总人数
				ajaxPost("<%=basePath%>user_weixin/findUserSubordinateInculdeOrderBasics", "", "json", "json", showMyteamNum);
			};

			function showMyteamNum(data) {
				var amount; //总人数
				var object =data.object;//后台数据库返回数据
				var subordinate1=object[1];//一级下属
				var subordinate2=object[2];//二级下属
				
				
				amount = subordinate1.length + subordinate2.length; //得到总人数
				
				// 总人数、已购总人数、未购总人数数据填充
				document.getElementById("amount").innerHTML = amount;//填充总人数
				document.getElementById("buyAmount1").innerHTML = subordinate1.length;//填充第一代
				document.getElementById("buyAmount2").innerHTML = subordinate2.length;//填充第二代
				
				// 数据填充
				setBuyPeople(subordinate1,"yghy_div_ul");//第一代
				setBuyPeople(subordinate2,"wghy_div_ul");//第二代
			}
			
			// 第一  二代填充会员头像昵称
			function setBuyPeople(peopleNumArr,subordinateNum){
				var html = '';
				for(var i = 0;i < peopleNumArr.length;i ++){
					html += '<li class="mdfd-content_huiyuans_li">'+
							'	<div class="mdfd-content_huiyuans_li_img">'+
							'		<img src="'+ peopleNumArr[i].weixin_portrait +'" onerror="javascript:this.src=\'http://via.placeholder.com/60x60\'">'+
							'	</div>'+
							'	<span>用户：'+ peopleNumArr[i].weixin_nickname +'</span>'+
							'</li>';
				}
				document.getElementById(subordinateNum).innerHTML = html;
			}
			
			
			function clickShowDiv(e, id) {
				//菜单切换
				$(".mdfd-content_huiyuans").each(function(){
					if($(this).attr("id")==id){
						$(this).show();
					}else{
						$(this).hide();
					}
				});
				$(e).css({
					"color":"#5db8e1"
					});
				$(e).siblings().each(function(){
					if($(this).attr("class")=="huiyuan_li"){
						$(this).css({
						"color":"#333"
					});
					}
				});
			}
		</script>
	</body>

</html>