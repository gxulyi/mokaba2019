<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../template/admin-header.jsp"%><!-- htnl头部文件 -->
<!doctype html>
<html class="no-js">
<head>
<meta charset="utf-8">
<base href="<%=basePath%>">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>后台管理 领衔创办人</title>
<meta name="description" content="">
<meta name="keywords" content="index">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="icon" type="image/png" href="css/template/images/favicon.png">
<link rel="apple-touch-icon-precomposed"
	href="css/template/images/app-icon72x72@2x.png">
<meta name="apple-mobile-web-app-title" content="Amaze UI" />
<link rel="stylesheet" href="css/template/amazeui.min.css" />
<link rel="stylesheet" href="css/template/admin.css">
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript" src="js/paging.js"></script>
<script type="text/javascript" src="js/medicinefood/uitl.js"></script>
<script src="file/laydate/laydate.js"></script>
<script type="text/javascript">
	  function showGoldPool(data){
	  	 //alert(JSON.stringify(data.object));
	     var object=data.object;
	     if(object==null){
	     	alert("该月份无奖金池!");
	     	return;
	     }
	     debugger;
	     	var money=object.month_money_timely+object.low_month_money_timely;
	     	var indigoKabaCount="-";//青卡巴人数
	     	var indigoKaba=object.indigo_kaba;//个人青卡巴奖金
	     	var this_month_low_indigo=money*0.03;//本月结存
	     	var this_month_gold_indigo=0;//本月参与分红
	     	if(object.indigo_kaba_num!=null){
	     		indigoKabaCount=object.indigo_kaba_num;
	     		if(indigoKabaCount!=0){
	     			indigoKaba=indigoKaba/indigoKabaCount;
	     			this_month_low_indigo=money*0.7*0.03;
	     			this_month_gold_indigo=money*0.3*0.03;
	     		}else{
	     			indigoKaba=0;
	     		}
	     	}
	     	var blueVioletKabaCount="-";//蓝卡巴人数
	     	var blueVioletKaba=object.blue_violet_kaba;//个人蓝卡巴奖金
	     	var this_month_low_blue=money*0.03;//本月结存
	     	var this_month_gold_blue=0;//本月参与分红
	     	if(object.blue_violet_kaba_num!=null){
	     		blueVioletKabaCount=object.blue_violet_kaba_num;
	     		if(blueVioletKabaCount!=0){
	     			blueVioletKaba=blueVioletKaba/blueVioletKabaCount;
	     			this_month_low_blue=money*0.7*0.03;
	     			this_month_gold_blue=money*0.3*0.03;
	     		}else{
	     			blueVioletKaba=0;
	     		}
	     		
	     	}
	     	var purpleKabaCount="-";//紫卡巴人数
	     	var purpleKaba=object.purple_kaba;//个人紫卡巴奖金
	     	var this_month_low_purple=money*0.03;//本月结存
	     	var this_month_gold_purple=0;//本月参与分红
	     	if(object.purple_kaba_num!=null){
	     		purpleKabaCount=object.purple_kaba_num;
	     		if(purpleKabaCount!=0){
	     			purpleKaba=purpleKaba/purpleKabaCount;
	     			this_month_low_purple=money*0.7*0.03;
	     			this_month_gold_purple=money*0.3*0.03;
	     		}else{
	     			purpleKaba=0;
	     		}
	     	}
	     	var htmlstr="";
	     	indigoKaba=indigoKaba*0.3;
	     	 blueVioletKaba=blueVioletKaba*0.3;
	     	purpleKaba=purpleKaba*0.3;
          	htmlstr+="<tr>"+
                "<td>"+object.month_date+"</td>"+
                "<td>"+money+"</td>"+
                "<td>青卡巴奖金池</td>"+
                "<td>"+money*0.03+"</td>"+
                "<td>"+this_month_low_indigo+"</td>"+
                "<td>"+this_month_gold_indigo+"</td>"+
                "<td>"+object.indigo_kaba*0.3+"</td>"+
                "<td>"+indigoKabaCount+"</td>"+
                "<td><a style='cursor:pointer' >"+"￥"+indigoKaba.toFixed(2)+"</a></td>"+
                "<td>"+object.old_indigo_kaba+"</td>"+
                "<tr>"+
               
                 "<td>"+object.month_date+"</td>"+
                "<td>"+money+"</td>"+
                "<td>蓝卡巴奖金池</td>"+
                "<td>"+money*0.03+"</td>"+
                "<td>"+this_month_low_blue+"</td>"+
                "<td>"+this_month_gold_blue+"</td>"+
                "<td>"+object.blue_violet_kaba*0.3+"</td>"+
                "<td>"+blueVioletKabaCount+"</td>"+
                "<td><a style='cursor:pointer' >"+"￥"+blueVioletKaba.toFixed(2)+"</a></td>"+
                "<td>"+object.old_blue_violet_kaba+"</td>"+
                "</tr> "+
                
                "<tr>"+
                 "<td>"+object.month_date+"</td>"+
                "<td>"+money+"</td>"+
                "<td>紫卡巴奖金池</td>"+
                "<td>"+money*0.03+"</td>"+
                "<td>"+this_month_low_purple+"</td>"+
                "<td>"+this_month_gold_purple+"</td>"+
                "<td>"+object.purple_kaba*0.3+"</td>"+
                "<td>"+purpleKabaCount+"</td>"+
                "<td><a style='cursor:pointer' >"+"￥"+purpleKaba.toFixed(2)+"</a></td>"+
                "<td>"+object.old_purple_kaba+"</td>"+
                "</tr> ";  
	     
	  document.getElementById("textValue").innerHTML=htmlstr;
	  }
	  window.onload=function(){
	    var paramData;
	    var paramData={"1":"1"};  
	    var object = JSON.stringify(paramData);
	  	ajaxPost("<%=basePath%>sale_gold/adminFindGoldPool",object,"json","json",showGoldPool);
	  };
	
	function chooseMon(){
		var datetimepicker=document.getElementById("datetimepicker").value;
		//alert(datetimepicker);
		datetimepicker=datetimepicker.slice(0,7);
		//alert(datetimepicker);
		datetimepicker1=datetimepicker.slice(0,4);
		//alert(datetimepicker1);
		datetimepicker2=datetimepicker.substring(datetimepicker.length - 2, datetimepicker.length);
		//alert(datetimepicker2);
		datetimepicker=datetimepicker1+datetimepicker2;
		//alert(datetimepicker);
		var paramData;
	    var paramData={month_date:datetimepicker};  
	    var object = JSON.stringify(paramData);
	  	ajaxPost("<%=basePath%>sale_gold/adminFindGoldPool",object,"json","json",showGoldPool);
	}
</script>
<script type="text/javascript">
	//选择日期
	laydate.render({
	  elem:'#datetimepicker'
	});  
</script>
</head>
<body>
	<input type='hidden' id="currentPage" value="" />
	<%@ include file="../template/admin-body-header.jsp"%><!-- 内容头部 -->
	<div class="am-cf admin-main">
		<!-- sidebar start -->
		<%@ include file="../template/admin-body-sidebar.jsp"%><!-- 侧边内容 -->
		<!-- sidebar end -->
		<!-- content start -->
		<div class="admin-content">
			<%@ include file="../template/admin-content-heder.jsp"%><!-- body 标题 -->
			<div class="am-g">
				<div class="am-u-md-6 am-cf">
					<input id="datetimepicker" style="border:1px solid #55cbd2" type="text" placeholder="请选择销售日期">
					<button id="btn" style="background:#55cbd2;border:none;color: #fff;border-radius:3px;padding:5px 10px;" onclick="chooseMon()" type="button">搜索</button>
				</div>
				<div style="clear: both;"></div>
			<div class="am-g" style="margin-top:10px;">
					<div class="am-u-sm-12">
						<form class="am-form">
							<table id="yhk" class="am-table am-table-striped am-table-hover table-main">
								<thead id="tableExcel">
									<tr>
										<th class="table-">销售月份</th>
										<th class="table-">月份总销售金额</th>
										<th class="table-title">奖金池类型</th>
										<th class="table-">本月计提奖池金3%</th>
										<th class="table-">本月结存</th>
										<th class="table-">本月参与分红</th>
										<th class="table-type">奖金池金额</th>
										<th class="table-author">分红人数</th>
										<th class="table-author">奖金池单个人分红</th>
										<th class="table-type">奖金池上月结余</th>
									</tr>
								</thead>
								<tbody id="textValue">

								</tbody>
							</table>
						</form>
						<!-- </li>
						</ul> -->
					</div>
				</div>
				<!-- <hr />
				</form> -->
		</div>
	</div>
	<%@ include file="../template/admin-footer.jsp"%><!-- 底部内容 -->
	</div>
	<!-- </div> -->

	
	<!--[if (gte IE 9)|!(IE)]><!-->
	<script src="js/template/jquery.min.js"></script>
	<script src="js/template/amazeui.min.js"></script>
	<!--<![endif]-->
	<script src="js/template/app.js"></script>
	<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
	<script type="text/javascript">
		var width = document.documentElement.clientWidth || document.body.clientWidth;
		$(".admin-content").css("width",width-200);
	</script>
</body>
</html>
