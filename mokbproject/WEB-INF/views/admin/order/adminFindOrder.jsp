<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="css/shop.css" type="text/css" rel="stylesheet" />
<link href="css/Sellerber.css" type="text/css"  rel="stylesheet" />
<link href="css/bkg_ui.css" type="text/css"  rel="stylesheet" />
<link href="font/css/font-awesome.min.css"  rel="stylesheet" type="text/css" />
<script src="js/jquery-1.9.1.min.js" type="text/javascript" ></script>
<script src="js/Sellerber.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery.cookie.js"></script>
<script src="js/shopFrame.js" type="text/javascript"></script>
<script src="js/jquery.dataTables.min.js"></script>
<script src="js/jquery.dataTables.bootstrap.js"></script>
<script type="text/javascript" src="js/ajax.js"></script>
<script src="js/layer/layer.js" type="text/javascript"></script>
<script src="js/laydate/laydate.js" type="text/javascript"></script>
<script type="text/javascript" src="js/medicinefood/uitl.js"></script>
<link rel="stylesheet" href="css/Shopping_Cart.css" />
<title>订单</title>

</head>
<body>
<input type='hidden' id="currentPage" value="1" />
<div class="margin order_style" id="page_style">
<div class="sum_style margin-bottom ">
 <ul class="clearfix">
  <li class="col-xs-3 "><div class="sum_zone Amount">交易总额<span><em>￥</em>0元</span></div></li>
  <li class="col-xs-3 "><div class="sum_yifu Amount">已付金额<span><em>￥</em>0元</span></div></li>
  <li class="col-xs-3 "><div class="sum_daifu Amount">待付金额<span><em>￥</em>0元</span></div></li>
  <li class="col-xs-3 "><div class="sum_tuikuan Amount">退款金额<span><em>￥</em>0元</span></div></li>
 </ul>
</div>
<div class="status_order margin-bottom">
  <a href="javascrpit:void" class="btn button_btn btn-info status_btn">所有订单(454)</a>
  <a href="javascrpit:void" class="btn button_btn btn-info status_btn">已完成(454)</a>
  <a href="javascrpit:void" class="btn button_btn btn-info status_btn">未完成(454)</a>
  <a href="javascrpit:void" class="btn button_btn btn-info status_btn">待发货(454)</a>
  <a href="javascrpit:void" class="btn button_btn btn-info status_btn">待付款(454)</a>
 </div>

<div class="List_display" style="">
  <table class="table table_list table_striped table-bordered" id="sample-table">
  <thead>
  <tr>
  <th width="30"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
   <th >订单编号</th>
   <th >订单状态</th>   
   <th >下单时间</th>
   <th >消费金额</th>
   <th >收款人</th>
   <th >联系电话</th>
   <th >收货地址</th>
   <th >发货时间</th>
   <th >备注</th>
   <th >操作</th>
   </tr>   
  </thead>
  <tbody>
   <tr>
   </tr>
  </tbody>
 </table>
</div>
<div class="box" style="width:100%;height: 600px;display:none;overflow: auto;">
	<!-- <div style="height: 50px;background: #FFFFFF;border-radius:5px;position: absolute;top: 10px;right:10px;">
		<img class="guanbie" src="images/gb.png" />
	</div> -->
	<!-- 内容 -->
	<div style="height:auto;margin-left:58px;">
		订单编号：<input id="orderids" value="" readonly="readonly"/>
		<div class="dingdan_div">
			<label>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</label>
			<span id="user_name"></span>
		</div>
		<div class="dingdan_div">
			<label>电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话：</label>
			<span id="tel_phone"></span>
		</div>
		<div class="dingdan_div">
			<label>收货地址：</label>
			<span  id="order_addr"></span>
		</div>
		<div class="dingdan_div">
			<label>快递公司：</label>
			<input id="courier_services_company" type="text" style="margin-bottom: 5px;" />
		</div>
		<div class="dingdan_div">
			<label>运&nbsp;&nbsp;单&nbsp;&nbsp;号：</label>
			<input id="waybill_number" type="text"  style="margin-bottom: 5px;" />
		</div>
		<div style="height: 40px;margin:20px auto;">
			<button style="width:60px;height:30px;background: #55cbd2;border-radius:5px;border:1px solid #55cbd2;color:#fff;margin-right:5px;" onclick="sendStore2()">确定</button>
			<button class="colses" style="width:60px;height:30px;background: #ddd;border-radius:5px;border:1px solid #ddd;margin-left:5px;">取消</button>
		</div>
	</div>
	<div id="stores">
	<!-- <div class="mui-input-row mui-checkbox mui-left">
		<a href="javascript:;"> <img class=" mui-pull-left" id="store_img" style="float:left" src="http://via.placeholder.com/100x100">
			<div class="mui-media-body" style="float:left"> 
				<span class="mui-ellipsis-2 name">商品名称</span>
				<p class="mui-ellipsis not-content">商品编号：<span>15422</span></p> 
				<p class="mui-ellipsis not-content">商品单价：<span>122</span></p> 
				<p class="mui-ellipsis not-content">商品数量：<span>12</span></p> 
			</div>
		</a> 
	</div>
	<div style="clear: both;"></div>
	<div class="mui-input-row mui-checkbox mui-left">
		<a href="javascript:;"> <img class=" mui-pull-left" style="float:left" src="http://via.placeholder.com/100x100">
			<div class="mui-media-body" style="float:left"> 
				<span class="mui-ellipsis-2 name">商品名称</span>
				<p class="mui-ellipsis not-content">商品编号：<span>15422</span></p> 
				<p class="mui-ellipsis not-content">商品单价：<span>122</span></p> 
				<p class="mui-ellipsis not-content">商品数量：<span>12</span></p> 
			</div>
		</a> 
	</div>
	<div style="clear: both;"></div>
	<div class="mui-input-row mui-checkbox mui-left">
		<a href="javascript:;"> <img class=" mui-pull-left" style="float:left" src="http://via.placeholder.com/100x100">
			<div class="mui-media-body" style="float:left"> 
				<span class="mui-ellipsis-2 name">商品名称</span>
				<p class="mui-ellipsis not-content">商品编号：<span>15422</span></p> 
				<p class="mui-ellipsis not-content">商品单价：<span>122</span></p> 
				<p class="mui-ellipsis not-content">商品数量：<span>12</span></p> 
			</div>
		</a> 
	</div>
	<div style="clear: both;"></div>
	<div class="mui-input-row mui-checkbox mui-left">
		<a href="javascript:;"> <img class=" mui-pull-left" style="float:left" src="http://via.placeholder.com/100x100">
			<div class="mui-media-body" style="float:left"> 
				<span class="mui-ellipsis-2 name">商品名称</span>
				<p class="mui-ellipsis not-content">商品编号：<span>15422</span></p> 
				<p class="mui-ellipsis not-content">商品单价：<span>122</span></p> 
				<p class="mui-ellipsis not-content">商品数量：<span>12</span></p> 
			</div>
		</a> 
	</div>
	<div style="clear: both;"></div> -->
	</div>
</div>
<div class="bgdiv" style="display:none;"></div>

</div>


</body>
</html>
<script>
/* $(function() {
		$(".guanbie, .colses").click(function() {
			$(".bgdiv,.box").show();
			$(document).unbind("scroll");
		});
	}); */

var dataSet=[];



$(document).ready(function(){  
// 获取所有订单
var currentPage = document.getElementById("currentPage").value;       
var paramData;
var paramData={"1":"1"};                               
var object = JSON.stringify(paramData);
ajaxPost("<%=basePath%>admin_order/adminFindAllStoreBasics?currentPage="+currentPage,object,"json","json",showAllOrder);
}); 
// 所有订单列表
function showAllOrder(data){

var currentPage=data.object.currentPage;
var totalNumber=data.object.totalNumber;
var totalPage=data.object.totalPage;
	  	
var html="";
var orderlist=data.allData.orderlist;
if(orderlist!=null){
for(i=0;i<orderlist.length;i++){
	var list=orderlist[i];
	var send_date=list.send_date;
	if(send_date!=null){
	send_date=formatDateTimeStr(list.send_date,1);
	}else{
	send_date="---";
	}
	if(list.order_status==3){
		var user_name=list.user_name;
		var tel_phone=list.tel_phone;
		var order_addr=list.order_addr;
		var order_id=list.order_id;
		dataSet.push(['<label><input type="checkbox" class="ace"><span class="lbl"></span></label>',
		list.order_id,OrderStatus(list.order_status),
		formatDateTimeStr(list.order_add_date,1),
		list.all_price,list.user_name,list.tel_phone,
		list.order_addr,
		send_date,'',
		'<a href="javascript:void()" onclick="findOrderOne('+JSON.stringify(list[i])+')" class="btn bg-deep-blue operation_btn">查看</a>'+
		'<a href="javascript:void()" onclick="sendStore(\''+list.user_name+'\',\''+list.tel_phone+'\',\''+list.order_addr+'\',\''+list.order_id+'\')" class="btn bg-deep-blue operation_btn">发货</a>'
		]);
	}else{
		dataSet.push(['<label><input type="checkbox" class="ace"><span class="lbl"></span></label>',
		list.order_id,OrderStatus(list.order_status),
		formatDateTimeStr(list.order_add_date,1),
		list.all_price,list.user_name,list.tel_phone,
		list.order_addr,send_date,'',
		'<a href="javascript:void()" onclick="findOrderOne("+list+")" class="btn bg-deep-blue operation_btn">查看</a>']);
	}



	  		}
	  	}
	  	 
	
	
	  	//document.getElementById("textValue").innerHTML=html;
	  	//document.getElementById("total_number").innerHTML=totalNumber;
   
	    //var html2=pagings(currentPage,totalPage);
        //document.getElementById("page_total").innerHTML=html2;
        //document.getElementById("page_index").value=currentPage;
        
  // document.getElementById("currentPage").value=currentPage;
  page();
};


function page() {



 var oTable1 = $('#sample-table').dataTable( {
				"data": dataSet,
				"width":"100%",	
				"bLengthChange":false,
				"iDisplayLength": 5,
				//"columns" : _tableCols,
				"sPaginationType" : "full_numbers", //详细分页组，可以支持直接跳转到某页
				"bInfo" : true, //是否显示页脚信息，DataTables插件左下角显示记录数 
				"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		        "bStateSave": true,//状态保存
				"searching": true,
		        "aoColumnDefs": [{"orderable":false,"aTargets":[0,2,3,5,6,7,8]
				}]
		
			   });
$('table th input:checkbox').on('click' , function(){
					var that = this;
					$(this).closest('table').find('tr > td:first-child input:checkbox')
					.each(function(){
						this.checked = that.checked;
						$(this).closest('tr').toggleClass('selected');
					});
						
				});

				
			
				
			};
 // 标记订单状态
	 function OrderStatus(order_status){
	 	switch (order_status){
			case 2:
				status ="待付款";
				break;
			case 1:
				status ="待收款";
				break;
			case 3:
				status ="待发货";
				break;
			case 4:
				status ="已发货";
				break;
			case 5:
				status ="已收货";
				break;
			case 6:
				status ="取消订单审核中";
				break;
			case 7:
				status ="退款中";
				break;
			case 8:
				status ="订单已取消";
				break;
			case 9:
				status ="已评价";
				break;
			case 10:
				status ="申请退货";
				break;
			case 11:
				status ="完成订单";
				break;
			case 12:
				status ="同意退款";
				break;
			case 13:
				status ="拒绝退款";
				break;
			case 14:
				status ="同意退货";
				break;
			case 15:
				status ="拒绝退货";
				break;
		}
		return status;
};
/*******滚动条*******/
$("body").niceScroll({  
	cursorcolor:"#888888",  
	cursoropacitymax:1,  
	touchbehavior:false,  
	cursorwidth:"5px",  
	cursorborder:"0",  
	cursorborderradius:"5px"  
});
	/*时间*/
	laydate({
    elem: '#start',
    event: 'focus' 
});
function findOrderOne(list){
	alert(list);
}
function sendStore(user_name,tel_phone,order_addr,order_id){
		$(".bgdiv,.box").show();
		//$("#List_display").hide();
		document.getElementById("sample-table").style.display="none";//隐藏
			//$(document).unbind("scroll");
		//$(".bgdiv,.box").fadeIn();
		var tops = $(document).scrollTop();//当页面滚动时，把当前距离赋值给页面，这样保持页面滚动条不动
		$(document).bind("scroll",function (){$(document).scrollTop(tops); });
		document.getElementById("user_name").innerHTML=user_name;
		document.getElementById("tel_phone").innerHTML=tel_phone;
		document.getElementById("order_addr").innerHTML=order_addr;
		document.getElementById("orderids").value=order_id;
		var paramData={order_id:order_id};                               
	  	var object = JSON.stringify(paramData);
	  	ajaxPost("<%=basePath%>admin_order/findOrderStore",object,"json","json",showStore);
	};
	function showStore(data){
		var object=data.object;
		var htmlStr="";
		for(var i=0;i<object.length;i++){
			htmlStr+="<div style='clear: both;'></div>"+
			"<div class='mui-input-row mui-checkbox mui-left'>"+
				"<a href='javascript:;'> <img class=' mui-pull-left' style='float:left' src='<%=basePath%>file/store/img/"+object[i].store_picture+"'>"+
					"<div class='mui-media-body' style='float:left'> "+
						"<span class='mui-ellipsis-2 name'>"+object[i].store_name+"</span>"+
						"<p class='mui-ellipsis not-content'>商品编号：<span>"+object[i].store_id+"</span></p> "+
						"<p class='mui-ellipsis not-content'>商品单价：<span>"+object[i].store_price+"</span></p> "+
						"<p class='mui-ellipsis not-content'>商品数量：<span>"+object[i].store_num+"</span></p> "+
					"</div>"+
				"</a> "+
			"</div>";
		}
		htmlStr+="<div style='clear: both;'></div>";
		document.getElementById("stores").innerHTML=htmlStr;
	}
	function sendStore2(){
		var waybill_number=document.getElementById("waybill_number").value;
		if(waybill_number==""||waybill_number==null){
			alert("请输入运单号!");
			return;
		}
		var courier_services_company=document.getElementById("courier_services_company").value;
		if(courier_services_company==null||courier_services_company==""){
			alert("请输入快递公司!");
			return;
		}
		var order_id=document.getElementById("orderids").value;
	  	var paramData;
	    var paramData={order_id:order_id,courier_services_company:courier_services_company,waybill_number:waybill_number};                               
	    var object = JSON.stringify(paramData);
	    ajaxPost("<%=basePath%>admin_order/sendStore",object,"json","json",ifsuccess);
	 };
	 function ifsuccess(data){
	    var currentPage = document.getElementById("currentPage").value;
		if(data.state==0){
			alert("发货成功!");
			var paramData;
	    	var paramData={order_status:3};                               
	    	var object = JSON.stringify(paramData);
	    	ajaxPost("<%=basePath%>admin_order/adminFindOrderStatus?currentPage="+currentPage,object,"json","json",showAllOrder);
		}else{
			alert("发货失败!");
			var paramData;
	    	var paramData={order_status:3};                               
	    	var object = JSON.stringify(paramData);
	    	ajaxPost("<%=basePath%>admin_order/adminFindOrderStatus?currentPage="+currentPage,object,"json","json",showAllOrder);
		}
	};
</script>
