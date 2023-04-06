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
		<title>旅游积分</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		
		<link href="css/mui.min.css" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="css/fonts/iconfont/iconfont.css"/>
		<link rel="stylesheet" type="text/css" href="css/public.css"/>
		<link rel="stylesheet" type="text/css" href="css/mainstyle.css"/>
	</head>
	
	<style type="text/css">
		/*旅游积分-积分显示*/
		.tourismscore{background: url(file/jointly/images/icon/666867818258836251.png) no-repeat;background-size:100% 100%;height: 150px;text-align: center;padding:35px 0;line-height: 40px;}
		.tourismscore .iconfont{font-size: 22px;}
		
		/*旅游积分-奖励积分明细*/
		.tourism-detail-box{padding: 5px;padding-bottom: 10px;}
		.tourism-detail-box h4{line-height: 40px;padding-left: 10px;}
		.tourism-detail-box h4 label{background-image: url(file/jointly/images/icon/icon-tourism.png);width: 40px;height: 40px;background-size: 100%;background-repeat: no-repeat 100%;display: block;float: left;}
		.tourism-detail-single{width:90%;margin:0 auto;border-bottom:1px solid #f0f0f0;padding:10px 0 0 0; line-height: 30px;}
		.tourism-detail-single h5{font-size: 14px;color:#333;float: left;}
		.default-text-color a{font-size: 12px;color:#62bca3;}
		
		/*提交数据*/
		.tourismsocre-btn-box{margin-top: 50px;text-align: center;margin-bottom: 50px;}
		input[type=button]{background: linear-gradient(to bottom, #FEADBA, #BF9ADD);color: white;border: none;}
	
		/*旅游积分-说明*/
		.shelter_layer{position: fixed;left: 0;top: 0;bottom: 0;background: black;z-index: 98;width: 100%;opacity: 0.7;}
		.memberdescription{position: fixed;clear:all;left: 10%;top: 20%;width: 80%;z-index: 99;background: #3f2a57;border-radius: 10px;padding: 10px;}
		.memberdescription h4{color: #fff;text-align: center;}
		.memberdescription p{color: #fff;}
		.memberdescription-btn{position: relative;top:10px;text-align: center;padding: 10px;}
		.memberdescription-btn button{color: #fff;border: none;font-size: 18px;padding: 5px 20px;background-color:#9191cc;}
		
	</style>
	<script type="text/javascript" src="js/ajax.js"></script>
	<script type="text/javascript" src="js/medicinefood/uitl.js"></script>
   <script type="text/javascript">
   window.onload=function(){
    //var jsonData={"boss_user_basics_id":boss_user_basics_id};//ajax传入的参数 json对象
    //jsonData=JSON.stringify(jsonData);//将json对象转成json格式的字符串。 发送原生ajax请求只能支持json字符串。
    ajaxPost("<%=basePath%>maid/findIntegralTravel","","json","json",setIntegralTravel);//异步获取当前用户旅游积分，并将span标签赋值
    ajaxPost("<%=basePath%>maid/findIntegralTravelAccount","","json","json",setIntegralAccount);//异步获取当前用户旅游积分流水，并显示在当前页面
   };
   </script>
   <script type="text/javascript">
   function setIntegralTravel(jsonData){//将旅游积分span标签赋值
   var object=jsonData.object;
   var integralSpan=document.getElementById("integralValue");
   integralSpan.innerHTML=object.integral_travel;
   };
   
   
   function setIntegralAccount(jsonData){
   var object=jsonData.object;
   var newDate = new Date();
   //console.log(formatDateTimeStr(object[0].account_add_date,2));
   var integralAccount=document.getElementById("integralAccount");
   var html="";
    var integral_account_type;//流水触发原因
   object.forEach(//遍历object
   function (val,index,arr){
   switch (parseInt(val.integral_account_type)) {
case 1://类型1为购买商品
	integral_account_type="&nbsp&nbsp<a href>订单号 :"+val.integral_trigger+"</a>";
	break;

default:
	break;
}
   var integral_account_num;//更改的值（流水值）
  
   //integral_account_num=parseInt(val.integral_account_num)>0?
   //'&nbsp;'+val.integral_account_num:va l.integral_account_num;//如果流水值为正数则加上+号
   var h5="";
   if(parseInt(val.integral_account_num)>=1){
     h5='<h5 style="color:#62bca3;font-size: 16px;">'+val.integral_account_num+'</h5>';
   };
       html+='<div class="tourism-detail-single">'+
          '<h5 class="default-text-color">'+val.integral_account_explain+'</h5>'+
          h5+
          '<div style="clear: both;">'+
          '</div>'+
          '<p class="default-text-color">'+
             '<span style="font-size: 12px;color:#666;">'+formatDateTimeStr(val.account_add_date)+'</span>'+
             '<span class="float-r">'+integral_account_type+'</span>'+
          '</p>'+
        '</div>';
     
   }
   );
  integralAccount.innerHTML=html;
   }
   </script>
	<body>
		<div class="mui-content">
			<!--搜索框-->
			<div class="search">
				<div class="search-left mui-action-back">
					<i class="iconfont icon-left"></i>
				</div>
			</div>
			
			<div class="mdfd-content default-text-color">
				<!--积分显示-->
				<div class="position-relative">
					<div class="tourismscore">
						<span style="color:#ffa954;font-size: 60px;" id="integralValue"></span><br />
						<span style="color:#fff;font-size: 18px;">当前积分</span>
					</div>
				</div>
				<div style="height: 65px;" id="integr">
					<div style="width: 150px;height: 40px;border:1px solid #62bca3;border-radius:5px;margin: 20px auto;text-align: center;line-height: 40px;color:#62bca3;font-size: 18px;">
			                         积分兑换
			        </div>
				</div>
				<div style="height: 5px;background: #f0f0f0;"></div>
				<!--奖励积分明细-->
				<div class="tourism-detail-box">
					<div class="tourism-detail-single">
						<span style="font-size: 16px;color:#333;font-weight: none;">明细</span>
					</div>
					<div id="integralAccount">
					
					
					  <!--  <div class="tourism-detail-single">
						<h5 class="default-text-color">分享</h5>
						<p class="default-text-color">
							<span>2017-1-15</span>
							<span class="float-r">+1</span>
						</p>
					  </div>-->
					  
					  
					</div>
					
					
				</div>
				
				<!--提交按钮-->
<!-- 				<div class="tourismsocre-btn-box"> -->
<!-- 					<input type="button" style="border:none;" value="积分兑换"/> -->
<!-- 				</div> -->
				
			</div>
			
		</div>
		<script src="js/mui.min.js"></script>
		<script type="text/javascript">
			(function($,doc){
				$.init();
				
				// 旅游积分兑换按钮点击事件
				$('#integr').on('tap','div',function(){
					var page = 'maid/tourismexchange';
					window.location.href = page;
				});
				
				$('.tourismscore').on('tap','.icon-tishishuoming',function(){
					MemberExplain();
				});
				
			})(mui,document);
			
			/**
			 * 旅游积分介绍
			 * @param {Object} explain 介绍内容
			 */
			function MemberExplain(explain){
				
				// 创建遮挡层
				var shelter_layer = document.createElement('div');
				shelter_layer.className = 'shelter_layer';
				shelter_layer.id = 'shelter_layer';
				document.body.appendChild(shelter_layer);
				
				// 创建说明框
				var descriptionwindow = document.createElement('div');
				descriptionwindow.className = 'memberdescription';
				descriptionwindow.id = 'descriptionwindow';
				document.body.appendChild(descriptionwindow);
				
				// 创建说明标题
				var title = document.createElement('h4');
				title.innerText = '旅游积分';
				document.getElementById('descriptionwindow').appendChild(title);
				
				// 创建说明内容
				var content = document.createElement('p');
				var html  = '<p>' +
							'<div>i、在下属三代会员范围内，直接推荐或间接推荐1名注册会员，即可获得旅游积分，旅游积分根据服务包价值按100:1比例换算，即100元兑换1旅游积分；</div>'+
							'<div>ii、集团公司每年不定期组织2-3次国内外旅游活动，每次活动根据时间、地点等设定所需积分，“卡巴星”未来社区的注册会员及注册会员聘阶以上会员均可于线上自由申请参加，报名成功后扣除当次所需积分；</div>'+
							'<div>iii、旅游积分永不清零。</div>'+
							'</p>';
					content.innerHTML = html;
				document.getElementById('descriptionwindow').appendChild(content);
				
				// 关闭按钮
				var button_close = document.createElement('div');
				button_close.className = 'memberdescription-btn';
				button_close.innerHTML = '<button>确定</button>';
				button_close.addEventListener('tap',function(){
					// 移除遮挡层和说明div
					document.getElementById('shelter_layer').remove();
					document.getElementById('descriptionwindow').remove();
				},false);
				document.getElementById('descriptionwindow').appendChild(button_close);
			}
		</script>
	</body>

</html>