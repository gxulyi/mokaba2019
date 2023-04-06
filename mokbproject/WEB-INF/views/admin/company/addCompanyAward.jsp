<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../template/admin-header.jsp"%><!-- htnl头部文件 -->

<!doctype html>
<html class="no-js">
<head>
<meta charset="utf-8">
<base href="<%=basePath%>">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
<script type="text/javascript" src="js/jquery-form.js"></script>
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript" src="js/medicinefood/uitl.js"></script>
<title>后台管理 添加商品</title>

<meta name="description" content="这是一个 index 页面">
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
<script type="text/javascript">
	function getAward_issue_cycle(select) {
		var index = select.selectedIndex;//获取select选中的索引
		var text = select.options[index].text; // 选中文本
		var value = select.options[index].value; // 选中值
		setAward_issue_data(value);
	}
	function setAward_issue_data(selectValue) {
		var award_issue_dataValue = "";
		var award_issue_data = document.getElementById("award_issue_data");
		switch (parseInt(selectValue)) {
		case 1://选择奖励方式为按每月特定日期发放奖励
			showHtmlAward_issue_data("award_issue_data");
			award_issue_data.options.length = 0;
			award_issue_data.options.add(new Option("请选择奖励发放日期", 0));
			for ( var i = 1; i <= 28; i++) {
				award_issue_data.options.add(new Option(i + "号", i));
			}
			award_issue_data.style.width = "200px";
			break;
		case 2://选择奖励方式为每年发放一次，选择月分与日期
			showHtmlAward_issue_data("award_issue_dataSelect");
			//var award_issue_dataMonth=document.getElementById("award_issue_dataMonth");
			//var index=award_issue_dataMonth.selectedIndex;//获取select选中的索引
			//var value = award_issue_dataMonth.options[index].value; // 选中值
			break;
		case 3://以添加时间每隔一段时间发放一次奖励，单位为天
			showHtmlAward_issue_data("award_issue_dataInput");
			var award_issue_dataInput = document
					.getElementById("award_issue_dataInput");
			award_issue_data.style.display = "none";
			award_issue_dataInput.style.display = "block";
			award_issue_dataInput.style.width = "15%";
			award_issue_dataInput.setAttribute("placeholder", "（天）");
			break;
		case 4://奖励方式为一天中的特定时间。（24小时制）
			showHtmlAward_issue_data("award_issue_data");
			award_issue_data.options.length = 0;
			award_issue_data.options.add(new Option("请选择奖励每天发放整点", 0));
			for ( var i = 1; i <= 24; i++) {
				award_issue_data.options.add(new Option("每天" + i + "点整", i));
			}
			award_issue_data.style.width = "220px";
			break;
		default:
			concealHtml();
			break;
		}

	}

	function getAward_issue_data1(select) {//得到选择的奖励时间
		var index = select.selectedIndex;//获取select选中的索引
		var text = select.options[index].text; // 选中文本
		var value = select.options[index].value; // 选中值
		setAward_issue_dataInput(value);
	}
	function getAward_issue_data2(select) {//得到选择的奖励时间
		var selectId = select.id;
		var month;//月数
		var day;//天数（日期）
		if (selectId.toString().trim() == 'award_issue_dataMonth') {//操作的select记录值为月。
			month = select.options[select.selectedIndex].value;
			var select1 = document.getElementById("award_issue_dataDay");
			day = select1.options[select1.selectedIndex].value;
			
			setAward_issue_dataDay(month);//将天数的select赋值
		} else {//操作的select记录值为天。
			day = select.options[select.selectedIndex].value;
			var select1 = document.getElementById("award_issue_dataMonth");
			month = select1.options[select1.selectedIndex].value;
		}
		setAward_issue_dataInput(month + "-" + day);//将提交到后台的奖励时间赋值

	}

	function setAward_issue_dataInput(value) {//将提交到后台的奖励时间赋值
		var award_issue_dataInput = document.getElementById("award_issue_dataInput");
		award_issue_dataInput.value = value;
	}

	function setAward_issue_dataDay(month) {//将天数的select赋值,传入月份,获取月份的日期天数
		var award_issue_dataDay = document
				.getElementById("award_issue_dataDay");
		var day;
		switch (parseInt(month)) {
		case 2:
			day = 28;
			break;
		case 4:
		    day = 30;
			break;
		case 6:
			day = 30;
			break;
		case 9:
			day = 30;
			break;
		case 11:
			day = 30;
			break;

		default:
			day = 31;
			break;
		}
		for ( var i = 1; i <= day; i++) {
			award_issue_dataDay.options.add(new Option(i + "日", i));
		}
		return day;
	}
</script>
<script type="text/javascript">
	function showHtmlAward_issue_data(htmlId) {//将选择奖励时间需要的html显示，传入的id为需要显示的部分，并将赋值的时间值清空
		document.getElementById("award_issue_data").style.display = "none";
		document.getElementById("award_issue_dataInput").style.display = "none";
		document.getElementById("award_issue_dataSelect").style.display = "none";
		document.getElementById("award_issue_dataInput").value="";
		document.getElementById(htmlId).style.display = "block";
	}
	function concealHtml() {
		document.getElementById("award_issue_data").style.display = "none";
		document.getElementById("award_issue_dataInput").style.display = "none";
		document.getElementById("award_issue_dataSelect").style.display = "none";
	}
</script>
<script type="text/javascript">
   function getAward_particular_grant_type(select){//获取奖励人群类型
       var index =select.selectedIndex;//获取选中的下标
       var text=select[index].text;
       var value=select[index].value;
      switch(parseInt(value)){
         case 1://奖励人群为会员等级类型区分
         
         
        break;
         default:
         
        break;
      
      }
    };
  


</script>



</head>
<%@ include file="../template/admin-body-header.jsp"%><!-- 内容头部 -->
<body>

	<%@ include file="../template/admin-body-sidebar.jsp"%><!-- 侧边内容 -->

	<!-- sidebar end -->
	<!-- content start -->
	<div class="admin-content">
		<%@ include file="../template/admin-content-heder.jsp"%><!-- body 标题 -->

		<div class="am-g">
			<div class="am-u-sm-12 am-u-md-4 am-u-md-push-8"></div>

			<div class="am-u-sm-12 am-u-md-8 am-u-md-pull-4">
				<form class="am-form " onsubmit="alert(1)" method="post"
					action="admin_company/addCompanyAward">


					<div class="am-form-group">
						<label for="user-name" class="am-u-sm-3 am-form-label">公司编号</label>
						<div class="am-u-sm-9">
							<input style="width: 140px" id="company_id" disabled="disabled"
								type="text" name="company_id" placeholder="输入用户的id"
								value="${company_id }"> <span id="userSpan" class=" "></span>
						</div>
					</div>
					&nbsp &nbsp
					<div class="am-form-group">
						<label for="user-name" class="am-u-sm-3 am-form-label">奖励项</label>
						<div class="am-u-sm-9">
							<select id="company_award_tyep" name="company_award_tyep"
								style="width: 130px">
								<option value="0">选择奖励项</option>
								<option value="1">奖金</option>
								<option value="2">旅游积分</option>
							</select>
						</div>
					</div>
					&nbsp &nbsp
					<div class="am-form-group">
						<label for="user-name" class="am-u-sm-3 am-form-label">奖励名</label>
						<div class="am-u-sm-9">
							<input style="width: 140px" id="award_name" type="text"
								name="award_name" placeholder="奖励名称" value="">
						</div>
					</div>
					&nbsp &nbsp
					<div class="am-form-group">
						<label for="user-name" class="am-u-sm-3 am-form-label">奖励发放周期</label>
						<div class="am-u-sm-9">
							<select onchange="getAward_issue_cycle(this)"
								style="width: 310px" id="award_issue_cycle"
								name="award_issue_cycle">
								<option value="0">请选择奖励发放周期</option>
								<option value="1">每月特定日期（每月发放一次）</option>
								<option value="2">每年特定日期（每年发放一次）</option>
								<option value="3">以添加日期计算（每隔一段时间发放一次）</option>
								<option value="4">每天特定整点（每天发放一次）</option>
							</select>
						</div>
					</div>
					&nbsp &nbsp
					<div class="am-form-group">
						<label for="user-name" class="am-u-sm-3 am-form-label">奖励发放时间</label>
						<div class="am-u-sm-9">
							<select onchange="getAward_issue_data1(this)"
								style="width: 310px;display: none" id="award_issue_data">
								<option value="0">请选择奖励发放周期</option>
							</select> <input type="text" style="display: none" name="award_issue_data"
								id="award_issue_dataInput" placeholder="" value="">
							<div id="award_issue_dataSelect" style="display: none">
								<div style="float:left;width: 30% ">
									<select onchange="getAward_issue_data2(this)"
										style="width: ;display: " id="award_issue_dataMonth">
										<option value="0">请选择月份</option>
										<option value="1">1月</option>
										<option value="2">2月</option>
										<option value="3">3月</option>
										<option value="4">4月</option>
										<option value="5">5月</option>
										<option value="6">6月</option>
										<option value="7">7月</option>
										<option value="8">8月</option>
										<option value="9">9月</option>
										<option value="10">10月</option>
										<option value="11">11月</option>
										<option value="12">12月</option>
									</select>
								</div>
								<div style="float:left;width: 6% ">&nbsp&nbsp-</div>
								<div style="float:left; width: 30%">
									<select onchange="getAward_issue_data2(this)"
										style="width: ;display: " id="award_issue_dataDay">
										<option value="0">请选择日期</option>
									</select>
								</div>

							</div>

						</div>



					</div>


					&nbsp &nbsp
					<div class="am-form-group">
						<label for="user-name" class="am-u-sm-3 am-form-label">奖励人群</label>
						<div class="am-u-sm-9">
							<select onchange="getAward_particular_grant_type(this)" style="width: 310px" id="award_particular_grant_type"
								name="award_particular_grant_type">
								<option value="0">选择奖励的人群</option>
								<option value="1">以会员等级区分</option>
							</select>
						</div>
					</div>
					&nbsp &nbsp
					<div class="am-form-group">
						<label for="user-name" class="am-u-sm-3 am-form-label">奖励目标id</label>
						<div class="am-u-sm-9">
							<select style="width: 310px" id="award_object_id"
								name="award_object_id">
								<option value="0">选择奖励的人群</option>
							</select>
						</div>
					</div>
					&nbsp &nbsp
					<div class="am-form-group">
						<label for="user-name" class="am-u-sm-3 am-form-label">增加条件</label>
						<div class="am-u-sm-9">
							<select style="width: 310px" id="company_award_add_condition"
								name="company_award_add_condition">
								<option value="0">选择增加触发奖励的规则</option>
								<option value="1">所属公司会员产生购买服务的消费</option>
							</select>
						</div>
					</div>
					&nbsp &nbsp
					<div class="am-form-group">
						<label for="user-name" class="am-u-sm-3 am-form-label">增加值计算方式</label>
						<div class="am-u-sm-9">
							<select id="company_award_add_count"
								name="company_award_add_count" style="width: 310px">
								<option value="0">选择增加值计算方式</option>
								<option value="1">商品价格百分比计算</option>
								<option value="2">设置固定值</option>
							</select>
						</div>
					</div>
					&nbsp &nbsp
					<div class="am-form-group">
						<label for="user-name" class="am-u-sm-3 am-form-label">增加值</label>
						<div class="am-u-sm-9">
							<input style="width: 80px" id="company_award_add_value"
								type="text" name="company_award_add_value" placeholder=""
								value="">
						</div>
					</div>
					&nbsp <br>
					<div class="am-form-group">
						<div class="am-u-sm-9">
							<input type="submit">
						</div>
					</div>

				</form>
			</div>
		</div>
		<%@ include file="../template/admin-footer.jsp"%><!-- 底部内容 -->
	</div>
	<!--[if (gte IE 9)|!(IE)]><!-->
	<!-- <script src="js/template/jquery.min.js"></script> -->
	<script src="js/template/amazeui.min.js"></script>
	<!--<![endif]-->
	<script src="js/template/app.js"></script>
	<script type="text/javascript">
		var width = document.documentElement.clientWidth || document.body.clientWidth;
		$(".admin-content").css("width",width-200);
	</script>
</body>
</html>
