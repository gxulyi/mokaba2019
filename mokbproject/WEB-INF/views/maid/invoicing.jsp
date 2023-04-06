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
		<title>新增收取发票信息</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<link href="css/mui.min.css" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="css/fonts/iconfont/iconfont.css" />
		<link rel="stylesheet" type="text/css" href="css/public.css" />
		<link rel="stylesheet" type="text/css" href="css/mainstyle.css" />
		<link rel="stylesheet" type="text/css" href="css/radioAndCheckbox.css" />
		<link rel="stylesheet" type="text/css" href="css/invoicing.css" />
		
	</head>

	<body>
		<div class="mui-content">
			<!--搜索框-->
			<div class="search border-red">
				<div class="search-left mui-action-back">
					<i class="iconfont icon-left"></i>
				</div>
			</div>

			<div class="mdfd-content">
				<ul class="mui-table-view" style="margin-bottom: 0 !important;">
					<li class="custom-table-view-cell" style="border-bottom: none;">
						<div class="mui-input-row">
							<label>名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称：</label>
							<input id="invoice_name" type="text" value="" style="width:45%;float: left;">
							<select id="invoiceType" onchange="invoiceTypeAlter(this)">
								<option>-请选择-</option>
								<option value='1'>个人</option>
								<option value='2'>单位</option>
							</select>
						</div>
					</li>
				</ul>
				<div style="height: 5px;background: #f5f5f5;"></div>
				<ul class="mui-table-view">
					<li class="custom-table-view-cell">
						<div class="mui-input-row" id="invoiceNum">
							<label>税&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号： </label>
							<input id="invoice_num" type="text" value="">
						</div>
					</li>
					<li class="custom-table-view-cell">
						<div class="mui-input-row">
							<label>地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址：</label>
							<input id="invoice_address" type="text" value="">
						</div>
					</li>
					<li class="custom-table-view-cell">
						<div class="mui-input-row">
							<label>电话号码：</label>
							<input id="invoice_mobile" type="text" value="">
						</div>
					</li>
					<li class="custom-table-view-cell">
						<div class="mui-input-row">
							<label>开户银行：</label>
							<input id="invoice_openbank" type="text" value="">
						</div>
					</li>
					<li class="custom-table-view-cell">
						<div class="mui-input-row">
							<label>银行账号：</label>
							<input id="invoice_banknum" type="text" value="">
						</div>
					</li>

				</ul>
				<p>建议全部填写，以便开具增值税专用发票</p>
				<div class="submit-personinfo-box">
					<input type="button" onclick="addInvoicing()" value="保存">
				</div>
			</div>

		</div>
		<script src="js/mui.min.js"></script>
		<script type="text/javascript" src="js/ajax.js"></script>
		<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
		<script type="text/javascript">
			function invoiceTypeAlter(selcet) { //发票类型发生改变
				selcetedIndex = selcet.selectedIndex;
				selcetedValue = selcet[selcetedIndex].value;
				/*当选择发票类型为个人的时候，没有税号这一选项*/
				if(selcetedValue == 1) {
					document.getElementById("invoiceNum").style.display = "none"; //div隐藏
				} else if(selcetedValue == 2) {
					document.getElementById("invoiceNum").style.display = ""; //div显示
				}
				switch(parseInt(selcetedIndex)) {
					case 1: //个人
						document.getElementById("invoice_name").value = "";
						document.getElementById("invoice_name").placeholder = "请填写收票人姓名";
						document.getElementById("invoice_num").placeholder = "选填";
						document.getElementById("invoice_address").placeholder = "必填";
						document.getElementById("invoice_mobile").placeholder = "必填";
						document.getElementById("invoice_openbank").placeholder = "选填";
						document.getElementById("invoice_banknum").placeholder = "选填";
						break;
					case 2: //公司
						document.getElementById("invoice_name").value = "";
						document.getElementById("invoice_name").placeholder = "请填写公司/企业名称";
						document.getElementById("invoice_num").placeholder = "必填";
						document.getElementById("invoice_address").placeholder = "必填";
						document.getElementById("invoice_mobile").placeholder = "必填";
						document.getElementById("invoice_openbank").placeholder = "必填";
						document.getElementById("invoice_banknum").placeholder = "必填";
						break;
				}
			}

			function addInvoicing() { //添加用户索取发票的信息
				selcet = document.getElementById("invoiceType");
				selcetedIndex = selcet.selectedIndex;
				if(!checkout(selcetedIndex)) {
					return;
				}
				var invoice_type = selcetedIndex; //发票类型
				var invoice_name = document.getElementById("invoice_name").value; //名称
				var invoice_num = document.getElementById("invoice_num").value; //税号
				var invoice_address = document.getElementById("invoice_address").value; //地址
				var invoice_mobile = document.getElementById("invoice_mobile").value; //电话
				var invoice_openbank = document.getElementById("invoice_openbank").value; //开户行
				var invoice_banknum = document.getElementById("invoice_banknum").value; //银行卡号 
				/*校验发票类型*/
				if(invoice_type == "" || invoice_type == null) {
					alert("请选择发票类型");
					return;
				} else {
					invoice_type = selcetedIndex;
				}
				/*校验名称*/
				if(invoice_name == null || invoice_name.length == 0) {
					alert("请输入名称");
					return;
				} else {
					invoice_name = document.getElementById("invoice_name").value;
				}
				/*判断发票是个人还是公司所有*/
				if(invoice_type == 2) {
					/*校验税号*/
					if((invoice_num == null || invoice_num.length == 0)) {
						alert("请输入税号");
						return;
					} else {
						var reg = /^[a-zA-Z0-9]{15,20}$/;
						if(!reg.test(invoice_num)) {
							alert("税号有误，请输入15-20位数字或字母,且字母区分大小写!");
							return;
						}
						invoice_num = document.getElementById("invoice_num").value;
					}
				}
				/*校验地址*/
				if(invoice_address == null || invoice_address.length == 0) {
					alert("请输入地址");
					return;
				} else {
					invoice_address = document.getElementById("invoice_address").value;
				}
				/*校验电话*/
				if(invoice_mobile == null || invoice_mobile.length == 0) {
					alert("请输入电话");
					return;
				} else {
					var reg = /^[1][3,4,5,7,8][0-9]{9}$/;
					if(!(reg.test(invoice_mobile))) {
						alert("手机号码有误，请重填");
						return false;
					}
					invoice_mobile = document.getElementById("invoice_mobile").value;
				}
				/*校验开户行*/
				if(document.getElementById("invoiceType").value == 2) {
					if(invoice_openbank == null || invoice_openbank.length == 0) {
						alert("请输入开户行");
						return;
					} else {
						invoice_openbank = document.getElementById("invoice_openbank").value;
					}
				}

				/*校验银行卡号*/
				if(document.getElementById("invoiceType").value == 2) {
					if(invoice_banknum == null || invoice_banknum.length == 0) {
						alert("请输入银行卡号");
						return;
					} else {
						var reg = /^([1-9]{1})(\d{14}|\d{18})$/;
						if(!reg.test(invoice_banknum)) {
							alert("银行卡号有误，请输入15-19位数字!");
							return;
						}
						invoice_banknum = document.getElementById("invoice_banknum").value;
					}
				}

				object = JSON.stringify({
					"invoice_name": invoice_name,
					"invoice_num": invoice_num,
					"invoice_address": invoice_address,
					"invoice_mobile": invoice_mobile,
					"invoice_openbank": invoice_openbank,
					"invoice_banknum": invoice_banknum,
					"invoice_type": invoice_type
				});
				ajaxPost("<%=basePath%>maid/addInvoice", object, "json", "json", function(jsonData) {
					alert(jsonData.message);
					window.location = 'maid/invoicingInfo';
				});

			};

			function checkout(invoiceType) { //验证用户输入保存的发票信息
				return true;
			};
		</script>
	</body>

</html>