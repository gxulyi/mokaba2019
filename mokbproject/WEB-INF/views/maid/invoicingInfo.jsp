<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>

	<head>
		<base href="<%=basePath%>">
		<meta charset="UTF-8">
		<title>发票信息</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />

		<link href="css/mui.min.css" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="css/fonts/iconfont/iconfont.css" />
		<link rel="stylesheet" type="text/css" href="css/public.css" />
		<link rel="stylesheet" type="text/css" href="css/mainstyle.css" />
		<link rel="stylesheet" href="file/zdialog/css/reset.css" type="text/css"></link>
		<link rel="stylesheet" href="file/zdialog/css/zdialog.css" type="text/css"></link>
		<link rel="stylesheet" type="text/css" href="css/invoicingInfo.css" />
		
	</head>

	<body>
		<div class="mui-content">
			<!--搜索框-->
			<div class="search">
				<div class="search-left" onclick="toBack() ">
					<i class="iconfont icon-left"></i>
				</div>
			</div>
			
			<div class="mdfd-content">
			 	<div id="invoicingList"></div>
				<div style="background: #f0f0f0;height: 5px;margin-top:15px;"></div>
				<div class="address">
					<div onclick="javascript:{window.location='maid/toInvoicing';};"><span>新增发票信息</span> </div>
				</div>
			</div>

		</div>
		<script src="js/mui.min.js"></script>
		<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
		<script type="text/javascript" src="js/ajax.js"></script>
		<script type="text/javascript" src="js/jquery.cookie.js"></script>
		<script type="text/javascript" src="file/zdialog/js/zdialog.js"></script>
		<script type="text/javascript">
			window.onload = function(){
				getInvoicingList();
			};
			
			function toBack() {
				window.location = "<%=basePath%>HomeController/maid";
			}
			
			// 获取发票列表数据
			function getInvoicingList(){   
		      	var paramData={};                               
		      	var object = JSON.stringify(paramData);
		      	ajaxPost("<%=basePath%>maid/findInvoiceToUid",object,"json","json",callbankInvoicingList);
			}
			
			// 发票列表数据处理
			function callbankInvoicingList(data){
				console.log(JSON.stringify(data));
				if(data.state == 0){
					var invoicingListData = data.object;
					if(invoicingListData.length!=0){
						var html = '';
						for(var i = 0; i < invoicingListData.length; i ++){
							html += '<div class="address-list" invoice_id="'+ invoicingListData[i].invoice_id +'">'+
									'	<div class="address-box">'+
									'		<div class="address-info">';
									if(invoicingListData[i].invoice_type==1){
										html += '<span>类型：</span><span>个人</span>';
									}else if(invoicingListData[i].invoice_type==2){
										html += '<p class="default-text"><span>类型：</span><span>单位</span></p>'+
												'<p class="default-suihao"><span>税号：</span><span>'+ invoicingListData[i].invoice_num +'</span></p>';
									}
							html +=	'		</div>'+
									'		<div class="address-mcdz">'+
									'			<p class="default-text-color">'+
									'				<span>名称：</span><span>'+ invoicingListData[i].invoice_name +'</span>'+
									'			</p>'+
									'			<p class="default-text-color">'+
									'				<span>地址：</span><span>'+ invoicingListData[i].invoice_address +'</span>'+
									'			</p>'+
									'		</div>'+
									'		<div class="address-btn">'+
									'			<div class="address-default" onclick="getInvoicing(this)"><span>索取发票</span></div>'+
									'			<a class="address-delet" onclick="deletInvoicingInfo(this)"><i class="iconfont icon-shanchuguanbicha shade"></i>&nbsp;&nbsp;<span>删除</span></a>'+
									'		</div>'+
									'	</div>'+
									'</div>';
						}
						document.getElementById('invoicingList').innerHTML = html;
					}else{
						mui.toast('暂无数据...');
					}
					
				}else{
					mui.toast('数据异常,请稍后重试...');
					return;
				}
			}
			
			// 索取发票按钮
			function getInvoicing(ele){
				var paramData={invoice_id:ele.parentElement.parentElement.parentElement.getAttribute('invoice_id')};                               
		      	var object = JSON.stringify(paramData);
		      	ajaxPost("<%=basePath%>maid/addInvoiceGain",object,"json","json",callbankGetInvoicing);
			}
			
			// 索取发票返回数据处理
			function callbankGetInvoicing(data){
				if(data.state == 0){
					mui.alert(data.message);
				}else{
					mui.toast('数据异常,请稍后重试...');
					return;
				}
			}
			
			// 删除发票信息按钮
			function deletInvoicingInfo(ele){
				var btnArray = ['取消', '确定'];
				mui.confirm('确定删除么？', '', btnArray, function(e) {
					if (e.index == 1) {
						var paramData={invoice_id:ele.parentElement.parentElement.parentElement.getAttribute('invoice_id')};                               
				      	var object = JSON.stringify(paramData);
				      	ajaxPost("<%=basePath%>maid/delInvoiceToInvoice_id",object,"json","json",callbankDeletInvoicing);
				      	ele.parentElement.parentElement.parentElement.remove();
					} else {
						mui.toast('您点击了取消操作');
					}
				});
			}
			
			// 删除发票信息返回数据处理
			function callbankDeletInvoicing(data){
				if(data.state == 0){
					mui.alert(data.message);
				}else{
					mui.toast('数据异常,请稍后重试...');
					return;
				}
			}
		</script>
	</body>

</html>