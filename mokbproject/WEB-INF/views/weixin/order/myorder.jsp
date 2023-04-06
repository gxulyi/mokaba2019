<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <!DOCTYPE HTML>
<html>

	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8">
		<title>我的订单</title>
		<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">

		<!--标准mui.css-->
		<link rel="stylesheet" href="css/mui.min.css">
		<link rel="stylesheet" href="css/icons-extra.css" />
		<link rel="stylesheet" href="css/myorder.css" />
		<link rel="stylesheet" href="file/zdialog/css/reset.css" type="text/css"></link>
		<link rel="stylesheet" href="file/zdialog/css/zdialog.css" type="text/css"></link>
		<script type="text/javascript" src="js/jquery-1.7.1.js" ></script>
		<script type="text/javascript" src="js/ajax.js"></script>
		<script type="text/javascript" src="js/jquery.cookie.js"></script>
		<script type="text/javascript" src="file/zdialog/js/zdialog.js"></script>
	</head>
	<body>
		<header class="mui-bar mui-bar-nav" style="background: #04757d;">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
			<div class="menu-order-single" id="findOrder2" onclick="findOrder(2,this)">
				<span style="border-bottom:2px solid #fff;padding-bottom:3px;">待付款</span>
			</div>
			<div class="menu-order-single" id="findOrder3" onclick="findOrder(3,this)">
				<span style="">已付款</span>
			</div>
			<div class="menu-order-single" id="findOrder4" onclick="findOrder(5,this)">
				<span style="">待评价</span>
			</div>
			<div class="menu-order-single" id="findOrder5" onclick="findOrder(10,this)">
				<span style="">售后服务</span>
			</div>
		</header>
		<div class="mui-content">
			<div class="mdfd-content">
				<div id="findOrderOnelist" class="order-list">
					<!-- <div class="order-single">
						<div class="order-detail" onclick="">
							<div class="order-info">
								<div class="order-img"> <img src="http://via.placeholder.com/100X100 " onerror="javascript:this.src='http://via.placeholder.com/100X100 '"> </div>
								<div class="mui-media-body-wz">【日本·cosme用户评价满分全5星】cure水润去角质凝胶250g</div> 
								<div style="font-size: 12px;color: #666666;margin-top: 2px;">净含量：150g</div>
				                <div class="mui-ellipsis" style="float: left;line-height: 30px;width: 60%;">
									<label style="color: #c65280;font-size: 12px;">￥</label>
									<span style="color: #c65280 !important;font-size: 12px;">229</span>
									<del style="font-size: 12px;color: #999;"><label style="font-size: 12px;">￥</label>188</del>
				                </div>
				                <div class="mui-pull-right">
									<label>X2</label>
								</div>
							</div>
						</div>
						<div class="order-btn-list">
							<div class="order-btn-jiage">
								<span>实付：</span>
								<span>￥160</span>
							</div>
							<div class="order-btn-dindan">
								<span onclick="">取消</span> 
								<span onclick="">立即付款</span>
							</div>
						</div>
					</div>
					<div class="order-single">
						<div class="order-detail" onclick="">
							<div class="order-info">
								<div class="order-img"> <img src="http://via.placeholder.com/100X100 " onerror="javascript:this.src='http://via.placeholder.com/100X100 '"> </div>
								<div class="mui-media-body-wz">【日本·cosme用户评价满分全5星】cure水润去角质凝胶250g</div> 
								<div style="font-size: 12px;color: #666666;margin-top: 2px;">净含量：150g</div>
				                <div class="mui-ellipsis" style="float: left;line-height: 30px;width: 60%;">
									<label style="color: #c65280;font-size: 12px;">￥</label>
									<span style="color: #c65280 !important;font-size: 12px;">229</span>
									<del style="font-size: 12px;color: #999;"><label style="font-size: 12px;">￥</label>188</del>
				                </div>
				                <div class="mui-pull-right">
									<label>X2</label>
								</div>
							</div>
						</div>
						<div class="order-btn-list">
							<div class="order-btn-jiage">
								<span>实付：</span>
								<span>￥160</span>
							</div>
							<div class="order-btn-dindan">
								<span onclick="">取消</span> 
								<span onclick="">立即付款</span>
							</div>
						</div>
					</div> -->
				</div>
			</div>
		</div>
		<script type="text/javascript">
		     //获取url中的参数
        	function getUrlParam(name) {
            	var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
            	var r = window.location.search.substr(1).match(reg);  //匹配目标参数
            	if (r != null) return unescape(r[2]); return null; //返回参数值
        	}
        	
        	function onloadd(){
				var order_statusData={order_status:2};                               
	      		var object = JSON.stringify(order_statusData);
	      		ajaxPost("<%=basePath%>order_weixin/findOrder",object,"json","json",findOrder1);
			};
	
			window.onload=function(){
				onloadd();
			};
        	
        	function findOrder1(data){
	 				var listBasicsOrder=data.allData.orderlist;
		 			var findOrderOnelist='';
		 			for(var i=0;i<listBasicsOrder.length;i++){
		 			findOrderOnelist+=
		 			'<div class="order-single">'+
						'<div class="order-detail" onclick="">'+
							'<div class="order-info">'+
								'<div class="order-img"> <img src="file/store/img/'+listBasicsOrder[i].store_picture+'" onerror="javascript:this.src=\'http://via.placeholder.com/100X100 \'"> </div>'+
								'<div class="mui-media-body-wz">'+listBasicsOrder[i].store_name+'</div> '+
								'<div style="font-size: 12px;color: #666666;margin-top: 2px;">净含量：'+listBasicsOrder[i].net_weight+'g</div>'+
				                '<div class="mui-ellipsis" style="float: left;line-height: 30px;width: 60%;">'+
									'<label style="color: #c65280;font-size: 12px;">￥</label>'+
									'<span style="color: #c65280 !important;font-size: 12px;">'+listBasicsOrder[i].all_price+'</span>'+
									'<del style="font-size: 12px;color: #999;"><label style="font-size: 12px;">￥</label>'+listBasicsOrder[i].prime_price+'</del>'+
				                '</div>'+
				               /* ' <div class="mui-pull-right">'+
									'<label>X'+listBasicsOrder[i].store_amount+'</label>'+
								'</div>'+ */
							'</div>'+
						
						'<div class="order-btn-list">'+
							'<div class="order-btn-jiage">'+
								'<span>实付：</span>'+
								'<span>￥'+listBasicsOrder[i].all_price+'</span>'+
								
							'</div>';
							if(listBasicsOrder[i].order_status==2){
		  			 		findOrderOnelist += 
		  			 			'<div class="order-btn-dindan">'+
								'<span onclick="deleteOrder('+listBasicsOrder[i].order_id+')">取消订单</span> '+
								'<span onclick=javascript:{window.location="<%=basePath%>payController/toPay?orderNo='+listBasicsOrder[i].order_id+'">立即付款</span>'+
								'</div>';
				  		}else if(listBasicsOrder[i].order_status==3||listBasicsOrder[i].order_status==1||listBasicsOrder[i].order_status==4){
				  			if(listBasicsOrder[i].order_status==4){
				  			findOrderOnelist +=
				  				'<div class="order-btn-dindan">'+
				   	 			/* '<span  onclick=javascript:{window.location="order_weixin/toOrderSales?store_id='+listBasicsOrder[i].store_id+'&order_id='+listBasicsOrder[i].order_id+'"}>退货</span>'+ */
								'<span onclick="getgift('+listBasicsOrder[i].order_id+')">确认收货</span>'+
								'</div>';
				  			}
				   	 		
				  		}else if(listBasicsOrder[i].order_status==5){
				   	  		findOrderOnelist +='<div class="order-btn-dindan">'+
				   	  		/* '	<span  onclick=javascript:{window.location="order_weixin/toOrderSales?store_id='+listBasicsOrder[i].store_id+'&order_id='+listBasicsOrder[i].order_id+'"}>退货</span>'+ */
						 		 '<span  onclick=javascript:{window.location="wenxin_store/toAddEvaluate?store_id='+listBasicsOrder[i].store_id+'&order_id='+listBasicsOrder[i].order_id+'"}>评价</span>'+
						 		 '</div>';
				  		}else if(listBasicsOrder[i].order_status==7){
				  			findOrderOnelist +=
				  			'<div class="order-btn-dindan">'+
				  			'<span >退款处理中</span>'+
				  			'</div>';
				  		}else if(listBasicsOrder[i].order_status==8){
				  			findOrderOnelist +=
				  			'<div class="order-btn-dindan">'+
				  				'<span >订单已取消</span>'+
				  				'</div>';
				  		}else if(listBasicsOrder[i].order_status==9){
				  			findOrderOnelist +=
				  			'<div class="order-btn-dindan">'+
				  				'<span >已评价</span>'+
				  				'</div>';
				  		}else if(listBasicsOrder[i].order_status==10){
				  			findOrderOnelist +=
				  			'<div class="order-btn-dindan">'+
				  				'<span >退货处理中</span>'+
				  				'</div>';
				  		}else if(listBasicsOrder[i].order_status==11){
				  			findOrderOnelist +=
				  			'<div class="order-btn-dindan">'+
				  				'<span >订单已完成</span>'+
				  				'</div>';
				  		}else if(listBasicsOrder[i].order_status==12){
				  			findOrderOnelist +=
				  			'<div class="order-btn-dindan">'+
				  				'<span >已退款</span>'+
				  				'</div>';
				  		}else if(listBasicsOrder[i].order_status==13){
				  			findOrderOnelist +=
				  			'<div class="order-btn-dindan">'+
				  				'<span >拒绝退款</span>'+
				  				'</div>';
				  		}else if(listBasicsOrder[i].order_status==14){
				  			findOrderOnelist +=
				  			'<div class="order-btn-dindan">'+
				  				'<span >已退货</span>'+
				  				'</div>';
				  		}else if(listBasicsOrder[i].order_status==15){
				  			findOrderOnelist +=
				  			'<div class="order-btn-dindan">'+
				  				'<span >拒绝退货</span>'+
				  				'</div>';
				  		}
				findOrderOnelist +=	
					'</div>'+
					'</div>'+
					'</div>';
					
					
				}
	      				$("#findOrderOnelist").empty();
	      			//	$("#findOrderOnelist").append(findOrderOnelist);
	      				document.getElementById("findOrderOnelist").innerHTML=findOrderOnelist;
	      			}
		
	  		function findOrder(order_status,thiss){
	  			var css="border-bottom:2px solid #fff;padding-bottom:3px;";
	  			$(".menu-order-single").removeClass("menu-order-active");
	  			$(".menu-order-single").children("span").removeAttr("style");
	   			$(thiss).addClass("menu-order-active");
	   			//var ss=$(thiss).children("span");
	   			$(thiss).children("span").css("border-bottom","2px solid #fff","padding-bottom","3px");
	     		var order_statusData={order_status:order_status};                               
	      		var object = JSON.stringify(order_statusData);
	      		ajaxPost("<%=basePath%>order_weixin/findOrder",object,"json","json",findOrder1);
	  			}
	 
				var  order_status=parseInt(getUrlParam("order_status"));
	 			if(order_status==3){
	 				$("#findOrder3").trigger("click");
	 			}else if(order_status==4){
	 				$("#findOrder4").trigger("click");
	 			}else if(order_status==5){
	 				$("#findOrder5").trigger("click");
	 			}else{
	 				$("#quanbu").trigger("click");
	 			}

				//取消订单deleteOrder
		 		function deleteOrder(order_id) {
		  			$.DialogByZ.Confirm({Title: "", Content: "确定要取消吗？",FunL:confirmL,FunR:Immediate});
		     		function confirmL(){
		 				function deleteOrdeBack(data){
		  					if(data.state==0){
		 						$.DialogByZ.Alert({Title: "提示", Content: "取消订单成功",BtnL:"确定"});
		  						location.reload();
		  					}else{
	  							$.DialogByZ.Alert({Title: "提示", Content: "系统繁忙请稍后再试",BtnL:"确定"});
		  					}		 
		  				}
          				var order={order_id:order_id};                               
	      				var object = JSON.stringify(order);
	      				ajaxPost("<%=basePath%>order_weixin/deleteOrder",object,"json","json",deleteOrdeBack);
				   	}
   					function Immediate(){
						//取消按钮事件
						location.reload();
   					}
   					
        		}
		
				function getgift(order_id){
					var order_status=5;
					var paramData;
	 				var paramData={order_id:order_id,order_status:order_status};                               
	 				var object = JSON.stringify(paramData);
	 	    		ajaxPost("<%=basePath%>order_weixin/updateOrder",object,"json","json",findAllOrder);
				}
				function findAllOrder(vor){
					if(vor.state==0){
						alert("收货成功！");
						location.reload();
					}else{
						alert("确认收货失败！");
					}
				}
		</script>
		<script src="js/mui.min.js"></script>
		<script>
			mui.init({
				swipeBack:true //启用右滑关闭功能
			});
		</script>
	</body>

</html>