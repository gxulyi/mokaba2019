<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ include file="../template/admin-header.jsp" %><!-- htnl头部文件 -->
<!doctype html>
<html class="no-js">
<head>
  <meta charset="utf-8">
  <base href="<%=basePath%>">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>后台管理 商城</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="icon" type="image/png" href="css/template/images/favicon.png">
  <link rel="apple-touch-icon-precomposed" href="css/template/images/app-icon72x72@2x.png">
  <meta name="apple-mobile-web-app-title" content="Amaze UI" />
  <link rel="stylesheet" href="css/template/amazeui.min.css"/>
  <link rel="stylesheet" href="css/template/admin.css">
  <style>ul.am-pagination li a.active {background-color: #55cbd2;color: white;}</style>
  <script type="text/javascript" src="js/ajax.js"></script>
  <script type="text/javascript" src="js/paging.js"></script>
  <script type="text/javascript" src="js/medicinefood/uitl.js"></script>
  <style type="text/css">
  	.dingdan_div{
  		line-height: 25px;text-align: left;
  	}
  	.dingdan_div label{
  		color:#000;
  	}
  	.dingdan_div span{
  		color:#666;font-size: 14px;
  	}
  </style>
  <script type="text/javascript">
	  window.onload=function(){
	  	adminFindAllOrderBasics();
	  };
	  function findOrderId(store_id){
    	window.location="<%=basePath%>admin_order/tofindOrderId?store_id="+store_id; 
    }
	  // 获取所有订单
	  function adminFindAllOrderBasics(){  
	   var currentPage = document.getElementById("currentPage").value;       
	  	var paramData;
	  	var paramData={"1":"1"};                               
	  	var object = JSON.stringify(paramData);
	  	ajaxPost("<%=basePath%>admin_order/adminFindAllStoreBasics?currentPage="+currentPage,object,"json","json",showAllOrder);
	  };
	  
	  // 所有订单列表
	  function showAllOrder(data){
	   // alert(JSON.stringify(data.allData));
	    var currentPage=data.object.currentPage;
	  	var totalNumber=data.object.totalNumber;
	  	var totalPage=data.object.totalPage;
	  	
	  	var html="";
	  	var orderlist=data.allData.orderlist;
	  	if(orderlist!=null){
	  		for(i=0;i<orderlist.length;i++){
	  		    var htmlstr="";
	  	        var list=orderlist[i];
	  			htmlstr += "<tr>"+
	  					   "	<td><input type='checkbox' /></td>"+
	  					   "	<td>"+list.order_id+"</td>"+
	  					   "	<td><a href='javascript:void(0);' onclick='findOrderId("+list.store_id+")'>"+list.store_name+"</a></td>"+
	  			           "	<td>"+OrderStatus(list.order_status)+"</td>"+
	  					   "	<td>"+formatDateTimeStr(list.order_add_date,1)+"</td>"+
	  			           "	<td>"+list.user_basics_id+"</td>"+
	  			           "	<td>"+list.user_name+"</td>"+
	  					   "	<td>"+list.store_amount+"</td>"+
	  					   "	<td>"+list.all_price+"</td>"+
	  					   "	<td>"+
	  					   "		<div class='am-btn-toolbar'>"+
	  					   "			<div class='am-btn-group am-btn-group-xs'>";
	  			if(list.order_status==3){
	  				//htmlstr += 	"			<a onclick='sendStore("+JSON.stringify(list)+")'class='am-btn am-btn-default am-btn-xs am-text-secondary'>发货</a>";
	  			}else if(list.order_status==7){
	  				htmlstr +=  "			<a onclick='toExamine("+list.order_id+")'class='am-btn am-btn-default am-btn-xs am-text-secondary'>同意退款</a> <a onclick='toExamine("+list.order_id+")'class='am-btn am-btn-default am-btn-xs am-text-secondary'>拒绝退款</a>";
	  			}else if(list.order_status==10){
	  				htmlstr += "			<a onclick='toExamine("+list.order_id+")'class='am-btn am-btn-default am-btn-xs am-text-secondary'>同意退货 </a> <a onclick='toExamine("+list.order_id+")'class='am-btn am-btn-default am-btn-xs am-text-secondary'>拒绝退货</a>";
	  			}else if(list.order_status==1){
	  				htmlstr += 	"			<a onclick='getMoney("+list.order_id+")'class='am-btn am-btn-default am-btn-xs am-text-secondary'>收款</a>";
	  			}
	  					   "			</div>"+
	  					   "		</div>"+
	  					   "	</td>"+
	  					   "</tr>";
	  			html += htmlstr;
	  		}
	  	}
	  	
	  	document.getElementById("textValue").innerHTML=html;
	  	document.getElementById("total_number").innerHTML=totalNumber;
   
	    var html2=pagings(currentPage,totalPage);
        document.getElementById("page_total").innerHTML=html2;
        document.getElementById("page_index").value=currentPage;
        document.getElementById("currentPage").value=currentPage;
        
        var contain=$(".am-fr");
	  	var ul= contain.children("ul");
	  	var li = ul.children("li");
	  	var a = li.children("a");
	  	var at = $("#active_"+currentPage);
	  	a.siblings(a).removeClass("active");
	  	at.addClass("active");
	 };
	 //查询某页数据
	function findPage(currentPage,totalPage){
	  //alert(currentPage);
	   var status=document.getElementById("statusNum").value;
	   if(currentPage<1){
       	 	currentPage=1;
       }
       if(currentPage>totalPage){
      	 currentPage=totalPage;
       }
	   var paramData;
	   var paramData={"1":"1",order_status:status};                                
	   var object = JSON.stringify(paramData);
	    if(status ==null){
	    	ajaxPost("<%=basePath%>admin_order/adminFindAllStoreBasics?currentPage="+currentPage,object,"json","json",showAllOrder);
	    }else if(status!=null){
	    	if(status!=0){
	    	// 单个查询获取数据
	    	ajaxPost("<%=basePath%>admin_order/adminFindOrderStatus?currentPage="+currentPage,object,"json","json",showAllOrder3);
	  	}else{
	  		// 获取全部订单数据
	  		ajaxPost("<%=basePath%>admin_order/adminFindOrderStatus?currentPage="+currentPage,object,"json","json",showAllOrder);
	  	}
	    } 
	};
	 
	 
	 //输入页码查询某页数据	
	function findPages(currentPage,totalPage){
	   var inputPage = document.getElementById("page_index").value;
	   var status=document.getElementById("statusNum").value;
       if(inputPage<1){
      	 	inputPage=1;
       }
       if(inputPage>totalPage){
      	 inputPage=totalPage;
       }
	   var paramData;
	   var paramData={"1":"1",order_status:status};                               
	   var object = JSON.stringify(paramData);
	   if(status ==null){
	    	ajaxPost("<%=basePath%>admin_order/adminFindAllStoreBasics?currentPage="+inputPage,object,"json","json",showAllOrder);
	    }else if(status!=null){
	    	if(status!=0){
	    	// 单个查询获取数据
	    	ajaxPost("<%=basePath%>admin_order/adminFindOrderStatus?currentPage="+inputPage,object,"json","json",showAllOrder3);
	  	}else{
	  		// 获取全部订单数据
	  		ajaxPost("<%=basePath%>admin_order/adminFindOrderStatus?currentPage="+inputPage,object,"json","json",showAllOrder);
	  	}
	    } 
	};
	 
	 
	 //确认收款消息框
	 function getMoney(order_id){
		var r=confirm("是否已确认收款?");
		if (r==true){
  			alert("收款已确认!");
  			var paramData;
	    	var paramData={order_id:order_id};                               
	    	var object = JSON.stringify(paramData);
	    	ajaxPost("<%=basePath%>admin_order/getMoney",object,"json","json",statusFind);
  		}else{
  			alert("收款确认失败!");
  		}
	}
	 // 标记订单状态
	 function OrderStatus(order_status){
	 	switch (order_status){
			case 2:
				status ="待付款";
				break;
			case 1:
				status ="待收款";
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
	 }
	 
	 // 待发货订单、取消订单、申请退货订单数据处理
	 function showAllOrder3(data){
	    var currentPage=data.object.currentPage;
	  	var totalNumber=data.object.totalNumber;
	  	var totalPage=data.object.totalPage;
	  	
	  	var html="";
	  	var orderlist=data.allData.orderlist;
	  	var order_status;
	  	if(orderlist!=""){
	  		order_status=orderlist[0].order_status;
	  	}
	  	if(orderlist!=null){
	  		for(i=0;i<orderlist.length;i++){
	  		    var htmlstr="";
	  	        var list=orderlist[i];
	  			htmlstr += "<tr>"+
	  					   "	<td><input type='checkbox' /></td>"+
	  					   "	<td>"+list.order_id+"</td>"+
	  					   "	<td><a onclick ='alert(\'工程师开发中...\')' href='javascript:void(0);'>"+list.store_name+"</a></td>"+
	  					   "	<td>"+list.order_status+"</td>"+
	  			           "	<td>"+formatDateTimeStr(list.order_add_date,1)+"</td>"+
	  					   "	<td>"+list.user_basics_id+"</td>"+
	  					   "	<td>"+list.user_name+"</td>"+
	  					   "	<td>"+list.store_amount+"</td>"+
	  					   "	<td>"+list.all_price+"</td>"+
	  					   "	<td>"+
	  					   "		<div class='am-btn-toolbar'>"+
	  					   "			<div class='am-btn-group am-btn-group-xs'>";
	  			if(order_status==3){
	  				//htmlstr += 	"			<a onclick='sendStore("+JSON.stringify(list)+")'class='am-btn am-btn-default am-btn-xs am-text-secondary'>发货</a>";
	  			}else if(order_status==7){
	  				htmlstr +=  "			<a onclick='toExamine("+list.order_id+")'class='am-btn am-btn-default am-btn-xs am-text-secondary'>同意退款</a>"+
	  							" 			<a onclick='toExamine("+list.order_id+")'class='am-btn am-btn-default am-btn-xs am-text-secondary'>拒绝退款</a>";
	  			}else if(order_status==10){
	  				htmlstr +=  "			<a onclick='toExamine("+list.order_id+")'class='am-btn am-btn-default am-btn-xs am-text-secondary'>同意退货 </a>"+
	  							"			<a onclick='toExamine("+list.order_id+")'class='am-btn am-btn-default am-btn-xs am-text-secondary'>拒绝退货</a>";
	  			}else if(order_status==1){
	  				htmlstr += 	"			<a onclick='getMoney("+list.order_id+")'class='am-btn am-btn-default am-btn-xs am-text-secondary'>收款</a>";
	  			}
	  					  "				</div>"+
	  					  "			</div>"+
	  					  "		</td>"+
	  					  "</tr>";
	  			html+=htmlstr;
	  		}
	  	}
	  	document.getElementById("textValue").innerHTML=html;
	  	document.getElementById("total_number").innerHTML=totalNumber;
   
	    var html2=pagings(currentPage,totalPage);
        document.getElementById("page_total").innerHTML=html2;
        document.getElementById("page_index").value=currentPage;
        document.getElementById("currentPage").value=currentPage;
	  };
	  
	  
	  
	  
	  function skip(order_id){
	 	alert("工程师开发中...");
	 	return;
	  }
	  
	  //根据状态查询订单
	  function statusFind(){
	  	var status=document.getElementById("statusNum").value;
	  	var currentPage = document.getElementById("currentPage").value;    
	  	var paramData;
	    var paramData={order_status:status};                               
	    var object = JSON.stringify(paramData);
	    if(status!=0){
	    	// 单个查询获取数据
	    	ajaxPost("<%=basePath%>admin_order/adminFindOrderStatus?currentPage="+currentPage,object,"json","json",showAllOrder3);
	  	}else{
	  		// 获取全部订单数据
	  		ajaxPost("<%=basePath%>admin_order/adminFindOrderStatus?currentPage="+currentPage,object,"json","json",showAllOrder);
	  	}
	    
	  }
	  
	  // 发货操作
	  function toReStore(order_id){
	  	var parame="?order_id="+order_id;
	 	window.location="<%=basePath%>admin_order/toReStore"+parame;
	  }
	  
	  function toExamine(order_id){
	  	alert("工程师开发中...");
	  	return;
	  	var parame="?order_id="+order_id;
	 	window.location="<%=basePath%>admin_order/toReOrder"+parame;
	  }
    </script>
</head>
<%@ include file="../template/admin-body-header.jsp" %><!-- 内容头部 -->
<body>
<input type='hidden' id="currentPage" value="1" />
<div class="am-cf admin-main">
  <!-- sidebar start -->
  <%@ include file="../template/admin-body-sidebar.jsp" %><!-- 侧边内容 -->
  <!-- sidebar end -->
  <!-- content start -->
  <div class="admin-content">
    <%@ include file="../template/admin-content-heder.jsp" %><!-- body 标题 -->
    <div class="am-g">
      <div class="am-u-md-6 am-cf">
        <div class="am-fl am-cf">
          <div class="am-btn-toolbar am-fl">
            <!-- 
            <div class="am-btn-group am-btn-group-xs">
              <a href="#"><button type="button" class="am-btn am-btn-default"><span class="am-icon-plus"></span> 新增</button></a>
            </div> 
            -->
            <div class="am-form-group am-margin-left am-fl">
              <select id="statusNum">
                <option value="0">所有类别</option>
                <option value="2">待付款</option>
                <option value="1">待收款</option>
               <!-- <option value="3">待发货</option> --> 
                <option value="4">已发货</option>
                <option value="5">已收货</option>
                <option value="6">退款申请</option>
                <option value="7">退款审核中</option>
                <option value="8">已的取消订单</option>
                <option value="9">已评价</option>
                <option value="10">申请退货</option>
                <option value="11">交易完成</option>
                <option value="12">申请审核中</option>
              </select>
            </div>
            <div class="am-btn-group am-btn-group-xs">
              <a class="am-btn am-btn-group-stacked am-btn-default" onclick="statusFind()">查询</a>
            </div>
            
          </div>
        </div>
      </div>
      <div class="am-u-md-3 am-cf">
        <div class="am-fr">
          <!-- 
          <div class="am-input-group am-input-group-sm">
            <input type="text" class="am-form-field">
                <span class="am-input-group-btn">
                  <button class="am-btn am-btn-default" type="button">搜索</button>
                </span>
          </div>
           -->
        </div>
      </div>
    </div>
    <div class="am-g">
      <div class="am-u-sm-12">
        <form class="am-form">
          <table id="yhk" class="am-table am-table-striped am-table-hover table-main">
            <thead>
              <tr>
                <th class="table-check"><input type="checkbox" /></th>
                <th class="table-id">编号</th>
                <th class="table-title">商品名称</th>
                <th class="table-type">订单状态</th>
                <th class="table-type">下单时间</th>
                <th class="table-author">购买人ID</th>
                <th class="table-author">收货人姓名</th>
                <th class="table-author">购买数量</th>
                <th class="table-date">总价</th>
                <th class="table-set">操作</th>
              </tr>
          </thead>
          <tbody id="textValue"></tbody>
        </table>
          <!-- 页面分页 开始 -->
				<div class="am-cf" style="height: 50px;line-height: 50px;">
					<div style="float: left;">
						共<span id="total_number"></span>条记录
					</div>
					<div class="am-fr" id="page_total">
						<ul class="am-pagination">
							
						</ul>
					</div>
				</div>
						<!-- 页面分页 结束 -->
          </form>
        </div>

    </div>
     
  </div>
  <%@ include file="../template/admin-footer.jsp" %><!-- 底部内容 -->
</div>
 <div class="box" style="width:500px;height: 400px;">
	<div style="height: 50px;background: #FFFFFF;border-radius:5px;">
		<img class="guanbie" src="images/gb.png" />
	</div>
	<!-- 内容 -->
	<div style="width: 60%;height: 280px;margin:0 auto;overflow-y:auto;">
		<input id="orderids" value="" type="hidden"/>
		<div class="dingdan_div">
			<label>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</label>
			<span id="user_name"></span>
		</div>
		<div  class="dingdan_div">
			<label>商&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;品：</label>
			<span id="store_name"></span>
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
			<input id="courier_services_company" type="text" style="width:70%;margin-bottom: 5px;" />
		</div>
		<div class="dingdan_div">
			<label>运&nbsp;&nbsp;单&nbsp;&nbsp;号：</label>
			<input id="waybill_number" type="text"  style="width:70%;margin-bottom: 5px;" />
		</div>
	</div>
	<div style="height: 40px;margin-top:20px;">
		<button style="width:60px;height:30px;background: #55cbd2;border-radius:5px;border:1px solid #55cbd2;color:#fff;margin-right:5px;" onclick="sendStore2()">确定</button>
		<button class="colses" style="width:60px;height:30px;background: #ddd;border-radius:5px;border:1px solid #ddd;margin-left:5px;">取消</button>
	</div>
</div>
<div class="bgdiv"></div>
<!--[if (gte IE 9)|!(IE)]><!-->
<script src="js/template/jquery.min.js"></script>
<script src="js/template/amazeui.min.js"></script>
<!--<![endif]-->
<script src="js/template/app.js"></script>
<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
<script type="text/javascript">
	var width = document.documentElement.clientWidth || document.body.clientWidth;
	$(".admin-content").css("width",width-200);
	
	$(function() {
		$(".guanbie, .colses").click(function() {
			$(".bgdiv,.box").hide();
			$(document).unbind("scroll");
		});
	});
	function sendStore(list){
		$(".bgdiv,.box").fadeIn();
		var tops = $(document).scrollTop();//当页面滚动时，把当前距离赋值给页面，这样保持页面滚动条不动
		$(document).bind("scroll",function (){$(document).scrollTop(tops); });
		document.getElementById("user_name").innerHTML=list.user_name;
		document.getElementById("store_name").innerHTML=list.store_name;
		document.getElementById("tel_phone").innerHTML=list.tel_phone;
		document.getElementById("order_addr").innerHTML=list.order_addr;
		document.getElementById("orderids").value=list.order_id;
	};
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
			$(".bgdiv,.box").hide();
			var paramData;
	    	var paramData={order_status:3};                               
	    	var object = JSON.stringify(paramData);
	    	ajaxPost("<%=basePath%>admin_order/adminFindOrderStatus?currrentPage="+currrentPage,object,"json","json",showAllOrder3);
		}else{
			alert("发货失败!");
			$(".bgdiv,.box").hide();
			var paramData;
	    	var paramData={order_status:3};                               
	    	var object = JSON.stringify(paramData);
	    	ajaxPost("<%=basePath%>admin_order/adminFindOrderStatus?currrentPage="+currrentPage,object,"json","json",showAllOrder3);
		}
	};
</script>
</body>
</html>
