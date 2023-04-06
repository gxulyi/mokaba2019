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
		<title>新增银行卡信息</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		
		<link href="css/mui.min.css" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="css/fonts/iconfont/iconfont.css"/>
		<link rel="stylesheet" type="text/css" href="css/public.css"/>
		<link rel="stylesheet" type="text/css" href="css/mainstyle.css"/>
		<style type="text/css">
			/*自定义TableView*/
			.mui-table-view{background-color: #fff !important;border: none;padding: 0 5px;margin-bottom: 10px;}
			/*自定义tableview样式*/
			.mui-content > .mui-table-view:first-child {margin-top: 0px !important;}
			/*自定义cell样式*/
			.custom-table-view-cell{border-bottom: 1px solid #f0f0f0;position: relative;color: #46385A;}
			.custom-table-view-cell:last-child{border-bottom: none;}
			.custom-table-view-cell > a:not(.mui-btn) {position: relative;display: block;overflow: hidden;margin: -11px -15px;padding: inherit;white-space: nowrap;text-overflow: ellipsis;color: #46385A;}
			/*修改tableview背景色*/
			.mui-table-view::before{background-color: #f0f0f0 !important;}
			.mui-table-view::after{background-color: #f0f0f0 !important;}
			.mui-input-row label,.mui-input-row input[type=text],.mui-input-row section[name=sex],.mui-input-row input[type=number]{font-size: 14px;color:#333;}
			.mui-input-row label span{color: red;}
			.mui-input-row select {font-size: 14px;height: 37px; padding: 0;color: #666;}
			/*身份证信息提交按钮*/
			.submit-idcard-box{position: relative;clear: all;overflow: hidden;text-align: center;line-height: 1.8;margin-top: 20px;}
			.submit-idcard-box input[type=button]{background-color:#62bca3;color: white;border: none;border-radius: 5px;}
		</style>
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
				<ul class="mui-table-view">
		            <li class="custom-table-view-cell" >
		                <div class="mui-input-row"  id="user_basics_id">
						    <label><span>*</span>持&nbsp;&nbsp;卡&nbsp;&nbsp;人: </label>
						    <input id="real_name" type="text" placeholder="" disabled="disabled" value="">
						</div>
		            </li>
		            
		            <li class="custom-table-view-cell">
		                <div class="mui-input-row">
						    <label><span>*</span>银&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;行:</label>
						   	<select id="bank" name="blank">
						   		<option>选择银行</option>
						   		<option value="工商银行">工商银行</option>
						   		<option value="建设银行">建设银行</option>
						   		<option value="农业银行">农业银行</option>
						   		<option value="邮政银行">邮政银行</option>
						   	</select>
						</div>
		            </li>
		            
		            <li class="custom-table-view-cell">
		                <div class="mui-input-row">
						    <label><span>*</span>卡&nbsp;&nbsp;类&nbsp;&nbsp;别:</label>
						   	<select id="bank_cardtype" name="blank-cardtype">
						   		<option>选择卡类别</option>
						   		<option value="0">储蓄卡</option>
						   		<option value="1">信用卡</option>
						   	</select>
						</div>
		            </li>
		            
		            <li class="custom-table-view-cell">
		                <div class="mui-input-row">
						    <label><span>*</span>卡&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号: </label>
						    <input id="card-num" type="number" placeholder="银行卡号">
						</div>
		            </li>
		            
		            <li class="custom-table-view-cell">
		                <div class="mui-input-row">
						    <label><span>*</span>预留电话: </label>
						    <input id="reserved_tel" type="number" placeholder="银行卡预留号码">
						</div>
		            </li>
		            
		        </ul>
				<div class="submit-idcard-box">
					<input type="button" onclick="submitIDCardInfo()" value="提交">
				</div>
			</div>
			
		</div>
		 <script type="text/javascript" src="js/ajax.js"></script>
		<script src="js/mui.min.js"></script>
		<script type="text/javascript">
			// 提交身份信息
			function submitIDCardInfo(){
				var realName = document.getElementById('real_name').value;	// 真实姓名
				if(!realName){
					mui.alert("您的姓名为空，请填写...");
					return;
				}
				var bank_id = document.getElementById('bank');
				var bank = getSelectedIndex(bank_id); // 选择银行
				if (bank=='选择银行') {
					mui.alert('请选择银行...');
					return;
				}
				var bankCardtype_id = document.getElementById('bank_cardtype');
				var bankCardtype = getSelectedIndex(bankCardtype_id); // 选择银行卡类别
				if (bankCardtype=='选择卡类别') {
					mui.alert('请选择银行卡类别...');
					return;
				}
				
				var cardNum = document.getElementById('card-num').value;	// 银行卡号
				if(!cardNum){
					mui.alert("您的银行卡号为空，请填写...");
					return;
				}
				
				if (!luhnCheck(cardNum)) {
					mui.alert('您输入的银行卡号不正确，请重新输入...');
					return;
				}
				
				var reservedTel = document.getElementById('reserved_tel').value;	// 预留手机号码
				if(!reservedTel){
					mui.alert("您的预留手机号码为空，请填写...");
					return;
				}
				if (!is_tellPhone(reservedTel)) {
					mui.alert("您的预留手机号码不正确，请重新填写...");
					return;
				}
				//从页面获取持卡人信息
				//debugger;
				var paramData;
				 var user_basics_id = document.getElementById("user_basics_id").value;
				// alert(user_basics_id);
				//从页面获取银行信息
				var affiliated_bank = document.getElementById("bank").value;
				//从页面获取卡类别信息
				var card_type = document.getElementById("bank_cardtype").value;
				//从页面获取卡号信息
				var bank_card = document.getElementById("card-num").value;
				//从页面获取预留电话信息
				var tel=document.getElementById("reserved_tel").value; 
				var paramData={user_basics_id:user_basics_id,bank_card:bank_card,affiliated_bank:affiliated_bank,tel:tel,card_type:card_type};                               
	  	        var object = JSON.stringify(paramData);
				if(confirm("确认提交操作吗？")){
				    ajaxPost("<%=basePath%>weixin_bank/addBank",object,"json","json",addBank);
				 }else{
				    return false;
				    }
			}
			function  addBank(data){
			   if(data.state==0){
			    alert("添加银行卡信息成功!");
			    window.history.back(-1);
			   }else{
			    alert("添加银行卡信息失败!");
			   }
   
           }
           /*ajax数据加载方法*/		
		    function onloadd(){
			  var paramData;
			  var paramData={currentPage:1};                               
			  var object = JSON.stringify(paramData);
			  ajaxPost("<%=basePath%>user_weixin/findUserInformOne",object,"json","json",findBankDetailInfo);
			  };
		   
		    window.onload=function(){
			  	onloadd();
			  };
			  /*获取用户信息实名,用户id*/
			  function findBankDetailInfo(uie){
			  	document.getElementById("real_name").value = uie.object.information_compellation;
			   	document.getElementById("user_basics_id").value = uie.object.user_basics_id;
			  }
			  
			/**
			 * 获取select选中项
			 * @param {Object} objSelected select对象
			 */
			function getSelectedIndex(objSelected){
	        	var selectedSex = objSelected.options[objSelected.selectedIndex].value;
	        	return selectedSex;
	        }
			
			/**
			 * 判断是否是手机号码
			 * @param {Object} tellphone 手机号码
			 */
			function is_tellPhone(tellphone){
				var myreg=/^[1][3,4,5,7,8][0-9]{9}$/;
            	if (!myreg.test(tellphone)) {
                	return false;
            	} else {
                	return true;
            	}
			}
			
			/**
			 * 银行卡号码检测
			 * @param {Object} cardNum 银行卡号
			 */
			function luhnCheck(cardNum) {
			    var lastNum = cardNum.substr(cardNum.length - 1, 1); //取出最后一位（与luhn进行比较）
			    var first15Num = cardNum.substr(0, cardNum.length - 1); //前15或18位
			    var newArr = new Array();
			    for (var i = first15Num.length - 1; i > -1; i--) { //前15或18位倒序存进数组
			        newArr.push(first15Num.substr(i, 1));
			    }
			    var arrJiShu = new Array(); //奇数位*2的积 <9
			    var arrJiShu2 = new Array(); //奇数位*2的积 >9
			    var arrOuShu = new Array(); //偶数位数组
			    for (var j = 0; j < newArr.length; j++) {
			        if ((j + 1) % 2 == 1) { //奇数位
			            if (parseInt(newArr[j]) * 2 < 9) arrJiShu.push(parseInt(newArr[j]) * 2);
			            else arrJiShu2.push(parseInt(newArr[j]) * 2);
			        } else //偶数位
			        arrOuShu.push(newArr[j]);
			    }
			
			    var jishu_child1 = new Array(); //奇数位*2 >9 的分割之后的数组个位数
			    var jishu_child2 = new Array(); //奇数位*2 >9 的分割之后的数组十位数
			    for (var h = 0; h < arrJiShu2.length; h++) {
			        jishu_child1.push(parseInt(arrJiShu2[h]) % 10);
			        jishu_child2.push(parseInt(arrJiShu2[h]) / 10);
			    }
			
			    var sumJiShu = 0; //奇数位*2 < 9 的数组之和
			    var sumOuShu = 0; //偶数位数组之和
			    var sumJiShuChild1 = 0; //奇数位*2 >9 的分割之后的数组个位数之和
			    var sumJiShuChild2 = 0; //奇数位*2 >9 的分割之后的数组十位数之和
			    var sumTotal = 0;
			    for (var m = 0; m < arrJiShu.length; m++) {
			        sumJiShu = sumJiShu + parseInt(arrJiShu[m]);
			    }
			
			    for (var n = 0; n < arrOuShu.length; n++) {
			        sumOuShu = sumOuShu + parseInt(arrOuShu[n]);
			    }
			
			    for (var p = 0; p < jishu_child1.length; p++) {
			        sumJiShuChild1 = sumJiShuChild1 + parseInt(jishu_child1[p]);
			        sumJiShuChild2 = sumJiShuChild2 + parseInt(jishu_child2[p]);
			    }
			    //计算总和
			    sumTotal = parseInt(sumJiShu) + parseInt(sumOuShu) + parseInt(sumJiShuChild1) + parseInt(sumJiShuChild2);
			
			    //计算luhn值
			    var k = parseInt(sumTotal) % 10 == 0 ? 10 : parseInt(sumTotal) % 10;
			    var luhn = 10 - k;
			
			    if (lastNum == luhn) {
			    	// 银行卡正确
			        return true;
			    } else {
			    	// 银行卡错误
			        return false;
			    }
			}
		</script>
	</body>

</html>