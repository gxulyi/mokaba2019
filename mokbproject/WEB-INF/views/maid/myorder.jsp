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
		<title>我的订单</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		
		<link href="css/mui.min.css" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="css/fonts/iconfont/iconfont.css"/>
		<link rel="stylesheet" type="text/css" href="css/public.css"/>
		<link rel="stylesheet" type="text/css" href="css/mainstyle.css"/>
		<link rel="stylesheet" type="text/css" href="css/myorder.css"/>
		<link rel="stylesheet" href="file/zdialog/css/reset.css" type="text/css"></link>
		<link rel="stylesheet" href="file/zdialog/css/zdialog.css" type="text/css"></link>
		
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
				<div class="menu-order">
					<div class="menu-order-single menu-order-active" id="quanbu" onclick="findOrder(0,this)">
						全部
					</div>
					<div class="menu-order-single" id="findOrder2" onclick="findOrder(2,this)">
						待付款
					</div>
					<div class="menu-order-single" id="findOrder3" onclick="findOrder(3,this)">
						待发货
					</div>
					<div class="menu-order-single" id="findOrder4" onclick="findOrder(4,this)">
						待收货
					</div>
					<div class="menu-order-single" id="findOrder5" onclick="findOrder(5,this)">
						待评价
					</div>
				</div>
				<div id="findOrderOnelist" class="order-list"></div>
			</div>
		</div>
		
		<script src="js/mui.min.js"></script>
		<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
		<script type="text/javascript" src="js/ajax.js"></script>
		<script type="text/javascript" src="js/jquery.cookie.js"></script>
		<script type="text/javascript" src="file/zdialog/js/zdialog.js"></script>
		<script type="text/javascript">
		     //获取url中的参数
        	function getUrlParam(name) {
            	var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
            	var r = window.location.search.substr(1).match(reg);  //匹配目标参数
            	if (r != null) return unescape(r[2]); return null; //返回参数值
        	}
		
	  		function findOrder(order_status,thiss){
	  			$(".menu-order-single").removeClass("menu-order-active");
	   			$(thiss).addClass("menu-order-active");
	  
	  			var kdjf=order_status;
	     		function findOrder1(data){
	 				var listBasicsOrder=data.allData.orderlist;
		 			var findOrderOnelist='';
		
					var zt='';
		  			for(var i=0;i<listBasicsOrder.length;i++){
		  				if(listBasicsOrder[i].order_status==2){//按理应该是2才对，数据库是1待确认
		  			 		zt = '	<span onclick="deleteOrder('+listBasicsOrder[i].order_id+')" class="order-btn">取消订单</span>'+
								 '	<span class="order-btn" onclick=javascript:{window.location="payController/toPay?orderNo='+listBasicsOrder[i].order_id+'"}>待付款</span>';
				  		}else if(listBasicsOrder[i].order_status==3||listBasicsOrder[i].order_status==1){
				   	 		//zt = '	<span class="order-btn" onclick=javascript:{window.location="order_weixin/toRefundOrder?order_id='+listBasicsOrder[i].order_id+'"}>退款</span>'+
					             '	<span class="order-btn">待发货</span>';
				  		}else if(listBasicsOrder[i].order_status==4){
				     		zt = '	<span class="order-btn">查看物流</span>'+
								 '	<span class="order-btn" onclick="getgift('+listBasicsOrder[i].order_id+')">确认收货</span>';
				  		}else if(listBasicsOrder[i].order_status==5){
				   	  		zt = '	<span class="order-btn" onclick=javascript:{window.location="order_weixin/toOrderSales?store_id='+listBasicsOrder[i].store_id+'&order_id='+listBasicsOrder[i].order_id+'"}>退货</span>'+
						 		 '	<span class="order-btn" onclick=javascript:{window.location="wenxin_store/toAddEvaluate?store_id='+listBasicsOrder[i].store_id+'&order_id='+listBasicsOrder[i].order_id+'"}>评价</span>';
				  		}else if(listBasicsOrder[i].order_status==6){
				   	  		//zt = '	<span class="order-btn">申请退款中</span>'+
						 		 '	<span class="order-btn">等待退款</span>';
				  		}else if(listBasicsOrder[i].order_status==7){
				   	  		zt = '	<span class="order-btn">退款处理中</span>';
				  		}else if(listBasicsOrder[i].order_status==8){
				   	  		zt = '	<span class="order-btn">退款成功</span>';
				  		}else if(listBasicsOrder[i].order_status==9){
				   	 		zt = '	<span class="order-btn" onclick=javascript:{window.location="order_weixin/toOrderSales?store_id='+listBasicsOrder[i].store_id+'&order_id='+listBasicsOrder[i].order_id+'"}>退货</span>'+
						 		 '	<span class="order-btn">已评价</span>';
				  		}else if(listBasicsOrder[i].order_status==10){
				   	  		zt = '	<span class="order-btn">退货申请中</span>';
				  		}else if(listBasicsOrder[i].order_status==11){
				   	  		zt = '	<span class="order-btn">订单已完成</span>';
				  		}else if(listBasicsOrder[i].order_status==12){
				   	  		zt = '	<span class="order-btn">退货处理中</span>';
				  		}
		  
		  				findOrderOnelist += '<div class="order-single">'+
							 				'	<div class="order-detail" onclick=javascript:{window.location="order_weixin/toOrderDetail?order_id=' + listBasicsOrder[i].order_id + '"}>'+
							 				'		<div class="order-info">'+
							 				'			<div class="order-img">'+
							 				'				<img src="file/store/img/'+listBasicsOrder[i].store_picture+'" onerror="javascript:this.src=\'http://via.placeholder.com/100X100 \'"/>'+
							 				'			</div>'+
							 				'			<div class="default-text-color store-title">'+listBasicsOrder[i].store_name+'</div>'+
							 				'			<lable style="display: block;font-size: 15px;text-align: right;">'+
							 				'				<span>X' + listBasicsOrder[i].store_amount + '</span>'+
							 				'			</lable>'+
							 				'			<lable style="display: block;font-size: 15px;text-align: right;">'+
							 				'				<span>应付余额：' + listBasicsOrder[i].all_price + '</span>'+
							 				'			</lable>'+
										 	'		</div>'+
										 	'	</div>'+
										 	'	<div class="order-btn-list">'+ zt + '</div>'+
							 				'</div>';
		  				}
	      				$("#findOrderOnelist").empty();
	      				$("#findOrderOnelist").append(findOrderOnelist);
	      			}
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
						alert("收获成功！");
						location.reload();
					}else{
						alert("确认收货失败！");
					}
				}
		</script>
	</body>

</html>
