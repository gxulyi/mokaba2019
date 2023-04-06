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
		<title>意见反馈</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		
		<link href="css/mui.min.css" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="css/fonts/iconfont/iconfont.css"/>
		<link rel="stylesheet" type="text/css" href="css/public.css"/>
		<link rel="stylesheet" type="text/css" href="css/mainstyle.css"/>
		<link rel="stylesheet" type="text/css" href="css/suggest.css"/>
	</head>

	<body>
		<div class="mui-content">
			<!--搜索框-->
			<div class="search border-blue">
				<div class="search-left mui-action-back">
					<i class="iconfont icon-left"></i>
				</div>
			</div>
			
			<div class="mdfd-content">
				<div style="padding: 10px;">
					<span>问题和意见</span>
					<textarea id="suggest" style="width:100%;height:150px;margin-top:10px;" placeholder="请详细描述您的问题和意见..."></textarea>
					<div class="contact">
						<span style="width: 25%;float: left;">联系方式</span>
						<span style="width: 75%;float: left;">
							<input type="number" id="tel"  placeholder="请填写方便联系"/>
						</span>
					</div>
					<!--评分-->
					<div class="mui-content-padded" style="padding-left: 10px;">
						<div class="mui-inline">评分</div>
						<div class="icons mui-inline" style="margin-left: 6px;">
							<i data-index="1" class="mui-icon mui-icon-star shade"></i>
							<i data-index="2" class="mui-icon mui-icon-star shade"></i>
							<i data-index="3" class="mui-icon mui-icon-star shade"></i>
							<i data-index="4" class="mui-icon mui-icon-star shade"></i>
							<i data-index="5" class="mui-icon mui-icon-star shade"></i>
						</div>
					</div><br />
					
					<div class="address-sublimte">
						<input type="button" style="border:none; color:#fff;" value="确定"/>
					</div>
					
				</div>
				
			</div>
			
		</div>
		<script src="js/mui.min.js"></script>
		<script type="text/javascript" src="js/ajax.js"></script>
		<script type="text/javascript">
			(function($,doc){
				$.init();
				var starIndex=0;
				// 评分
				$('.icons').on('tap','i',function(){
				  	var index = parseInt(this.getAttribute("data-index"));
				  	var parent = this.parentNode;
				  	var children = parent.children;
				  	if(this.classList.contains("mui-icon-star")){
				  		for(var i=0;i<index;i++){
			  				children[i].classList.remove('mui-icon-star');
			  				children[i].classList.add('mui-icon-star-filled');
				  		}
				  	}else{
				  		for (var i = index; i < 5; i++) {
				  			children[i].classList.add('mui-icon-star');
				  			children[i].classList.remove('mui-icon-star-filled');
				  		}
				  	}
				  	starIndex = index;
			  	});
			  	
			  	// 提交按钮点击事件
			  	$('.address-sublimte').on('tap','input[type=button]',function(){
			  		var suggest_opinion = doc.getElementById('suggest').value;
			  		var tel_phone = doc.getElementById('tel').value;
			  		var star_level = starIndex;
					
					if(suggest_opinion == null||suggest_opinion==''){
			  			mui.alert("请填写您的宝贵意见！");
			  			return;
			  		}else{
			  			if(checkMobile(tel_phone)){
			  				var paramData;
			 			 	var paramData={tel_phone:tel_phone,suggest_opinion:suggest_opinion,star_level:star_level};                               
			 			 	var object = JSON.stringify(paramData);
			  				ajaxPost("<%=basePath%>sugopinion/addSugOpinion",object,"json","json",refresh);
			  			}else{
			  				return;
			  			}
			  		}
			  		
			  	});
			})(mui,document);
			
			function refresh(voi){
				if(voi.state==0){
					alert("提交成功！");
					window.location.reload();
				}
			}
			
			// 手机号码正则表达式
			function checkMobile(str) {
            	var myreg=/^[1][3,4,5,7,8][0-9]{9}$/;
            	if(str==null ||str == ''){
	  				mui.alert("电话号码为空！");
	  				return;
			  	}
            	if (!myreg.test(str)) {
            		mui.alert("您的手机号码不正确！请重试...");
                	return false;
            	} else {
                	return true;
            	}
        	}
			
		</script>
	</body>

</html>