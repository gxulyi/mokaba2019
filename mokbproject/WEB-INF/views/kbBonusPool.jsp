<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id="dateValue" class="java.util.Date" />
<!DOCTYPE HTML>
<html>
	<head>
		<base href="<%=basePath%>">
		<meta charset="UTF-8">
		<title>卡巴奖金池</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">

		<link href="css/mui.min.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="css/fonts/iconfont/iconfont.css">
		<link rel="stylesheet" type="text/css" href="css/public.css">
		<link rel="stylesheet" type="text/css" href="css/mainstyle.css">
		<link rel="stylesheet" type="text/css" href="css/bonus.css">
		<link rel="stylesheet" type="text/css" href="js/pop/custom-pop.css">
		<link rel="stylesheet" type="text/css" href="js/tplugins/mui.picker.min.css" />
		<script src="js/pop/custom-pop.js"></script>
		<script type="text/javascript" src="js/jquery-1.7.1.js"></script>

	</head>

	<body>
		<div class="mui-content">
			<!--搜索框-->
			<div class="search">
				<div class="search-left mui-action-back">
					<i class="iconfont icon-left"></i>
				</div>
			</div>

			<div class="mdfd-content">
				<div id="">
					<div class="jjc_time">
						<span id="getNowDate"></span>
						<button id='demo' data-options='{"type":"month","beginYear":1970,"endYear":2099}' class="btn mui-btn mui-btn-block" value="请选择日期"></button>
<!--  						<input id="result" placeholder="请选择日期" data-options='{"type":"month"}' class="btn mui-btn mui-btn-block" type="button">
 --> 					<div id='result' class="ui-alert"></div>	
					</div>
					<div class="jjc_div">
						<ul class="jjc_title1">
							<li class="jjc_title_nr_tit1">青卡巴当月<br>个人可获分红</li>
							<li class="jjc_title_nr_tit1" style="border-left: 1px solid #fff;">蓝卡巴当月<br>个人可获分红</li>
							<li class="jjc_title_nr_tit1" style="border-left: 1px solid #fff;">紫卡巴当月<br>个人可获分红</li>
						</ul>
						<table class="jjc_tab1">
							<tbody>
								<tr>	
									<td id="indigoBonusPerson"></td>	
									<td id="blueBonusPerson"></td>	
									<td id="purpleBonusPerson"></td>	
								</tr>
							</tbody>
						</table>
					</div>
					<div class="fgborder1"></div>
				</div>	
				<br />
				<!-- 奖金池 -->
				<div id="dataGrid">
<!-- 					<div class="jjc_time"> -->
<!-- 						<input id="datetimepicker" placeholder="请选择日期" type="button"> -->
<!-- 					</div> -->
					<div class="jjc_div">
						<ul class="jjc_title">
							<li class="jjc_title_nr_tit">类别</li>
<!-- 							<li class="jjc_title_nr_tit" style="border-left: 1px solid #fff;line-height: 16px;">上月结存<br>奖池金</li>
 -->							<li class="jjc_title_nr_tit" style="border-left: 1px solid #fff;line-height: 16px;">当月分红<br>奖池金</li>
							<li class="jjc_title_nr_tit" style="border-left: 1px solid #fff;">分红人数</li>
						</ul>
						<table  id="bonusPoolTable" class="jjc_tab" ></table>
					</div>
					
					<div class="fgborder"></div>
					<p class="pfotter" >细则<span style="color:#ffa954;" onclick="bonusDetailDescription();" >《卡巴奖金池细则》</span></p>
			</div>
			</div>
		</div>
		<script src="js/mui.min.js"></script>
		<script src="js/ajax.js"></script>
		<script src="js/medicinefood/uitl.js"></script>
		<script src="js/tplugins/mui.picker.min.js"></script>
	
	<script type="text/javascript">
	    /*  function tst(){
	      alert(34234);
	     } */
	     /*触发弹框，卡巴奖金池细则*/
	    function bonusDetailDescription() {
				var paramData = {
					protocol_id:2
				};
				var object = JSON.stringify(paramData);
				ajaxPost("<%=basePath%>weixin_protocol/findProtocolById", object, "json", "json", pertocolData);
			}

		// 卡巴奖金池细则 返回数据
		function pertocolData(data) {
				var popInfoData = data.protocolEntityData.protocolEntity;
				var popInfo = {
					title: popInfoData.protocol_title,
					content: popInfoData.protocol_content
				};
				popShowAndHidden(popInfo);
			}
		/*数据加载*/
		window.onload = function() {
			// 首次加载奖金池数据
			loadBonusPool();
			/*首次加载的日期默认为当前月份*/
			$('#demo').text(getNowFormatDate('YYYYMM'));
			//document.getElementById("demo").value =getNowFormatDate('YYYYMM');
		};
		// YYYYMM   YYYYMMDD HHmmss
		function getNowFormatDate(format) {
			var currentdate; // 时间字符串
			var date = new Date();
			var year = date.getFullYear(); // 获取当前年份
			var month = date.getMonth() + 1; // 获取当前月份
			month >= 10 ? month = month : month = '0' + month;
			var day = date.getDate(); //获取当前日(1-31)
			day >= 10 ? day = day : day = '0' + day;
			var hours = date.getHours(); //获取当前小时数(0-23)
			hours >= 10 ? hours = hours : hours = '0' + hours;
			var minutes = date.getMinutes(); //获取当前分钟数(0-59)
			minutes >= 10 ? minutes = minutes : minutes = '0' + minutes;
			
			if(format == 'YYYYMM'){
				currentdate = year + month;
			}else if(format == 'YYYYMMDD HHmmss'){
				currentdate = year + '年' + month + '月' + day + '日 ' + hours + ':' + minutes;
			};
			return currentdate;
		}
		// 加载奖金池数据
		function loadBonusPool(){
			document.getElementById('getNowDate').innerText = getNowFormatDate('YYYYMMDD HHmmss');
			var time = getNowFormatDate('YYYYMM');
			var paramData = {
				month_date: time
			};
			var object = JSON.stringify(paramData);
			ajaxPost("<%=basePath%>weixin_company/findCompanyMonthByMonth", object, "json", "json", bonusPool);
		}
		
		/*获取各个奖金池数据*/
			function bonusPool(data) {
			    /*奖金池分类*/
			    var type1 = "青卡巴<br>奖金池";
				var type2 = "蓝卡巴<br>奖金池";
				var type3 = "紫卡巴<br>奖金池";
			    /*获取当前日期YYYYMM*/
			    var time = getNowFormatDate('YYYYMM');
				var htmlStr = ""; //加载的html文本
				   if(data.object.comMonthSales!=null){
				   /*当月分红数并保留两位小数*/
					var currentMonthCount1 = (data.object.comMonthSales.indigo_kaba*0.3).toFixed(2) ;
				    var currentMonthCount2 = (data.object.comMonthSales.blue_violet_kaba*0.3).toFixed(2);
					var currentMonthCount3 = (data.object.comMonthSales.purple_kaba*0.3).toFixed(2);
					/*当月各个奖金池可获取分红的人数*/
					var getIndigoPerson = data.object.comMonthSales.indigoKabaCount;
					var getBluePerson   = data.object.comMonthSales.blueVioletKabaCount;
					var getPurplePerson = data.object.comMonthSales.purpleKabaCount;
					/*获取各个卡巴当月个人可获得分红奖励,并判断各个奖金池的分红人数是否为零*/
					if(getIndigoPerson >0){
					    document.getElementById('indigoBonusPerson').innerHTML = (currentMonthCount1/getIndigoPerson).toFixed(2);
					 }else{
					 	document.getElementById('indigoBonusPerson').innerHTML = (0).toFixed(2);
					 }
					 
					if(getBluePerson >0){
					    document.getElementById('blueBonusPerson').innerHTML = (currentMonthCount2/getBluePerson).toFixed(2);
					 }else{
					 	document.getElementById('blueBonusPerson').innerHTML = (0).toFixed(2);
					 }
					 
					if(getPurplePerson >0){
					    document.getElementById('purpleBonusPerson').innerHTML = (currentMonthCount3/getPurplePerson).toFixed(2);
					 }else{
					 	document.getElementById('purpleBonusPerson').innerHTML = (0).toFixed(2);
					 }
				     /*判断当前日期是否为当前月*/
					   	if(data.object.comMonthSales.month_date == time){
								htmlStr = "<tr>"  +
										  "	<td>" + type1 + "</td>" +
/* 										  "	<td>" +data.object.comMonthSales.old_indigo_kaba.toFixed(2) +"</td>" +
 */										  "	<td>" + currentMonthCount1 + "</td>" +
										  "	<td>" + getIndigoPerson+"人" + "</td>" +
										  "</tr>" +
										  "<tr>"  +
										  "	<td>" + type2 + "</td>" +
/* 										  "	<td>" +data.object.comMonthSales.old_blue_violet_kaba.toFixed(2)+"</td>" +
 */										  "	<td>" + currentMonthCount2 + "</td>" +
										  "	<td>" + getBluePerson +"人"+ "</td>" +
										  "</tr>" +
										  "<tr>"  +
										  "	<td>" + type3 + "</td>" +
/* 										  "	<td>" +data.object.comMonthSales.old_purple_kaba.toFixed(2)+"</td>" +
 */										  "	<td>" + currentMonthCount3 + "</td>" +
										  "	<td>" +getPurplePerson  +"人"+ "</td>" +
										  "</tr>";
					   		
					   		}else{
					   			htmlStr = "<tr>"  +
										  "	<td>" + type1 + "</td>" +
/* 										  "	<td>" +data.object.comMonthSales.old_indigo_kaba.toFixed(2) +"</td>" +
 */										  "	<td>" + currentMonthCount1 + "</td>" +
										  "	<td>" + '-' + "</td>" +
										  "</tr>" +
										  "<tr>"  +
										  "	<td>" + type2 + "</td>" +
/* 										  "	<td>" +data.object.comMonthSales.old_blue_violet_kaba.toFixed(2) +"</td>" +
 */										  "	<td>" + currentMonthCount2 + "</td>" +
										  "	<td>" + '-' + "</td>" +
										  "</tr>" +
										  "<tr>"  +
										  "	<td>" + type3 + "</td>" +
/* 										  "	<td>" +data.object.comMonthSales.old_purple_kaba.toFixed(2)+"</td>" +
 */										  "	<td>" + currentMonthCount3+ "</td>" +
										  "	<td>" + '-' + "</td>" +
										  "</tr>";	
					   			}
				   }else{
			   	    document.getElementById('indigoBonusPerson').innerHTML = '-';
				    document.getElementById('blueBonusPerson').innerHTML = '-';
				    document.getElementById('purpleBonusPerson').innerHTML = '-';
		   	        htmlStr = "<tr>"  +
								  "	<td>" + type1 + "</td>" +
/* 								  "	<td>" +'-'+ "</td>" +
 */								  "	<td>" + '-'+ "</td>" +
								  "	<td>" + '-' + "</td>" +
								  "</tr>" +
								  "<tr>"  +
								  "	<td>" + type2 + "</td>" +
/* 								  "	<td>" +'-' + "</td>" +
 */								  "	<td>" + '-' + "</td>" +
								  "	<td>" + '-' + "</td>" +
								  "</tr>" +
								  "<tr>"  +
								  "	<td>" + type3 + "</td>" +
/* 								  "	<td>" +'-'+ "</td>" +
 */								  "	<td>" + '-' + "</td>" +
								  "	<td>" + '-' + "</td>" +
								  "</tr>";	
					   }
				    document.getElementById("bonusPoolTable").innerHTML = htmlStr; //写入HTML
			}

			/*加载奖金明细页面*/
			/*获取时间控件*/
			
			//日期选择
			// YYYYMM   YYYYMMDD HHmmss
			function getNowFormatDate(format) {
				var currentdate; // 时间字符串
				var date = new Date();
				var year = date.getFullYear(); // 获取当前年份
				var month = date.getMonth() + 1; // 获取当前月份
				month >= 10 ? month = month : month = '0' + month;
				var day = date.getDate(); //获取当前日(1-31)
				day >= 10 ? day = day : day = '0' + day;
				var hours = date.getHours(); //获取当前小时数(0-23)
				hours >= 10 ? hours = hours : hours = '0' + hours;
				var minutes = date.getMinutes(); //获取当前分钟数(0-59)
				minutes >= 10 ? minutes = minutes : minutes = '0' + minutes;
				
				if(format == 'YYYYMM'){
					currentdate = year + month;
				}else if(format == 'YYYYMMDD HHmmss'){
					currentdate = year + '年' + month + '月' + day + '日 ' + hours + ':' + minutes;
				};
				return currentdate;
			}
			/*获取滚动条选中的日期*/
			(function($) {
				$.init();
				//var result = $('#result')[0];
				var demo  =$('#demo')[0];
				var btns = $('.btn');
				btns.each(function(i, btn) {
					btn.addEventListener('tap', function() {
						var optionsJson = this.getAttribute('data-options') || '{}';
						var options = JSON.parse(optionsJson);
						var id = this.getAttribute('id');
						/*
						 * 首次显示时实例化组件
						 * 示例为了简洁，将 options 放在了按钮的 dom 上
						 * 也可以直接通过代码声明 optinos 用于实例化 DtPicker
						 */
						var picker = new $.DtPicker(options); 
						//var format DTPicker.CustomFormat="yyyyMM"
						picker.show(function(rs) {
							/*
							 * rs.value 拼合后的 value
							 * rs.text 拼合后的 text
							 * rs.y 年，可以通过 rs.y.vaue 和 rs.y.text 获取值和文本
							 * rs.m 月，用法同年
							 * rs.d 日，用法同年
							 * rs.h 时，用法同年
							 * rs.i 分（minutes 的第二个字母），用法同年
							 */
							demo.innerText = rs.y.value+rs.m.value ;
							/*通过选择日期查询各个年月的奖金池分配情况*/
							var date = rs.y.value+rs.m.value;
							var paramData = {
								month_date: date
							};
							var object = JSON.stringify(paramData);
							ajaxPost("<%=basePath%>weixin_company/findCompanyMonthByMonth", object, "json", "json", bonusPool);
									/* 
							 * 返回 false 可以阻止选择框的关闭
							 * return false;
							 
							 */
							/*  
							 * 释放组件资源，释放后将将不能再操作组件
							 * 通常情况下，不需要示放组件，new DtPicker(options) 后，可以一直使用。
							 * 当前示例，因为内容较多，如不进行资原释放，在某些设备上会较慢。
							 * 所以每次用完便立即调用 dispose 进行释放，下次用时再创建新实例。
							 */
							picker.dispose();
						});
					}, false);
				});
			})(mui);
	</script>
</body>
</html>