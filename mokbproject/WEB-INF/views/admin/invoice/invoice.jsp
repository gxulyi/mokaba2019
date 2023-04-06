<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../template/admin-header.jsp"%><!-- htnl头部文件 -->
<!doctype html>
<html class="no-js">
<head>
<meta charset="utf-8">
<base href="<%=basePath%>">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>后台管理 体现打款</title>
<meta name="description" content="这是一个 查询商品 页面">
<meta name="keywords" content="index">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="icon" type="image/png" href="css/template/images/favicon.png">
<link rel="apple-touch-icon-precomposed" href="css/template/images/app-icon72x72@2x.png">
<meta name="apple-mobile-web-app-title" content="Amaze UI" />
<link rel="stylesheet" href="css/template/amazeui.min.css" />
<link rel="stylesheet" href="css/template/admin.css">
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript" src="js/paging.js"></script>
<script type="text/javascript" src="js/medicinefood/uitl-string.js"></script>
<script type="text/javascript" src="js/medicinefood/uitl.js"></script>
<script src="file/laydate/laydate.js"></script>
<script type="text/javascript">
      function findInvoicing(select){
        selectedIndex=select.selectedIndex;
        invoice_status=select[selectedIndex].value;
		object=JSON.stringify({"invoice_status":invoice_status});
		ajaxPost("<%=basePath%>admin/findInvoiceToStatus", object, "json", "json", setInvoiceValue);
		}
		
		function setInvoiceValue(jsonData){
		Object=jsonData.object;
		var htmlStr="";
		for(var i=0;i<Object.length;i++){
		var invoice_type;//发票类型
		switch (parseInt(Object[i].invoice_type)) {
		case 1:
			invoice_type="个人";
			break;

		case 2:
		    invoice_type="公司";
			break;
		}
		var invoice_status;//索取信息的状态，1显示中。2 已寄出。3删除
		switch (parseInt(Object[i].invoice_status)) {
		case 1:
			invoice_status="显示中";
			break;

		case 2:
		    invoice_status="已寄出";
			break;
		}
		htmlStr+="<tr><td>"+Object[i].invoice_id+"</td>"+
		"<td>"+invoice_type+"</td>"+
		"<td>"+Object[i].invoice_num+"</td>"+
		"<td>"+Object[i].invoice_name+"</td>"+
		"<td>"+Object[i].invoice_address+"</td>"+
		"<td>"+Object[i].invoice_mobile+"</td>"+
		"<td>"+Object[i].invoice_openbank+"</td>"+
		"<td>"+Object[i].invoice_banknum+"</td>"+
		"<td>"+Object[i].user_basics_id+"</td>"+
		"<td>"+invoice_status+"</td>"+
		"<td><button>发票已寄出</button></td>"+
		"</tr>";
		
		};
		var textValueTbody=document.getElementById("textValue");
		textValueTbody.innerHTML=htmlStr;
		}
		
       window.onload=function(){
		findInvoicing(document.getElementById("invoice_status"));
		};
	 
	 
	 
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
				<div class="am-u-md-12 am-cf">
					<div class="am-fl am-cf">
						<div id="test" class="am-btn-toolbar am-fl">
							<input id="datetimepicker"style="border:1px solid #55cbd2"type="text" placeholder="请选择日期">
							<button id="btn" style="background:#55cbd2;border:none;color: #fff;border-radius:3px;padding:5px 10px;" onclick="dateTime1()" type="button">搜索</button>
							至
							<input id="datekey" type="text"style="border:1px solid #55cbd2" class="demo-input" placeholder="请选择日期">
							<button id="btn" style="background:#55cbd2;border:none;color: #fff;border-radius:3px;padding:5px 10px;" onclick="dateTime()" type="button">日期组合</button>
						    &nbsp;&nbsp;
							<input  id="userIdInput"style="border:1px solid #55cbd2" placeholder="请输入用户编号"> 
					        <button style="background:#55cbd2;border:none;color: #fff;border-radius:3px;padding:5px 10px;" type="button" onclick="findUser_basics_id()">搜索</button>
					        <select id="invoice_status"style="border:1px solid #55cbd2" onchange="findInvoicing(this)">
							  <option value="1">显示中</option>
							  <option value="2">已寄出</option>
							</select>	
					</div>
					</div>
				  </div>
				<div class="am-u-md-3 am-cf">
					<div class="am-fr">
					</div>
				</div>
			</div>
			<div class="am-g" style="margin-top:10px;">
					<div class="am-u-sm-12">
						<form class="am-form">
							<table id="yhk" class="am-table am-table-striped am-table-hover table-main">
								<thead>
									<tr>
									    <th class="table-check"><input type="checkbox" /></th>
										<th class="table-i">发票类型</th>
										<th class="table-title">税号</th>
										<th class="table-type">接收方名称</th>
										<th class="table-type">接收地址</th>
										<th class="table-author">接收方手机号</th>
										<th class="table-author">开户行</th>
										<th class="table-author">银行卡号</th>
										<th class="table-author">提交索取信息的用户</th>
										<th class="table-author">状态</th>
										<th class="table-author">操作</th>
									</tr>
								</thead>
								<tbody id="textValue">

								</tbody>
							</table>
							<!-- 页面分页 开始 -->
							<div class="am-cf">
				                                        共<span id="total_number"></span>条记录
				              <div class="am-fr">
				                <ul class="am-pagination">
				                  <li class="am-disabled"><a href="#">«</a></li>
				                  <li class="am-active"><a href="#">1</a></li>
				                  <li><a href="#">2</a></li>
				                  <li><a href="#">3</a></li>
				                  <li><a href="#">4</a></li>
				                  <li><a href="#">5</a></li>
				                  <li><a href="#">»</a></li>
				                </ul>
				              </div>
				            </div>
							<!-- 页面分页 结束 -->
						</form>
						<!-- </li>
						</ul> -->
					</div>
				</div>
				<!-- <hr />
				</form> -->
			</div>
			<%@ include file="../template/admin-footer.jsp"%><!-- 底部内容 -->
	</div>
<!-- 
	</div>
	</div> -->

	
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
