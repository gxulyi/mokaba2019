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
		<title>我的银行卡</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		
		<link href="css/mui.min.css" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="css/fonts/iconfont/iconfont.css" />
		<link rel="stylesheet" type="text/css" href="css/public.css" />
		<link rel="stylesheet" type="text/css" href="css/mainstyle.css" />
		<style type="text/css">
			/*自定义TableView*/
			.mui-table-view{background-color: none !important;border: none;padding: 0 5px;margin-bottom: 10px;}
			/*自定义tableview样式*/
			.mui-content > .mui-table-view:first-child {margin-top: 0px !important;}
			/*自定义cell样式*/
			.custom-table-view-cell{border-bottom: 1px solid none;padding: 11px 15px;position: relative;color: #46385A;}
			.custom-table-view-cell:last-child{border-bottom: none;}
			.custom-table-view-cell > a:not(.mui-btn) {position: relative;display: block;overflow: hidden;margin: -11px -15px;padding: inherit;white-space: nowrap;text-overflow: ellipsis;color: #46385A;}
			/*修改tableview背景色*/
			.mui-table-view::before{background-color: none !important;}
			.mui-table-view::after{background-color: none !important;}
			.mui-table-view:after {position: absolute;right: 0;bottom: 0;left: 0;height: 1px;content: '';-webkit-transform: scaleY(.5);transform: scaleY(.5);background-color: transparent !important;}
			.add-bankcard{position: relative;clear: all;overflow: hidden;text-align: center;background-color: #929292;padding: 10px;border-radius: 10px;color: #FFF;}
			.bank-list-box{position: relative;clear: all;overflow: hidden;text-align: center;padding: 10px;border-radius: 10px;}
			.bank-bg{background-color: #DE445A;}
			.bank-list-info{position: relative;left: 50px;float: left;text-align: left;}
			.bank-list-info h4,.bank-list-info h5{color: #fff;}
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
				
				<ul class="mui-table-view" id="textValue">
				
					<li class="custom-table-view-cell">
		                <div class="mui-input-row">
						    <div onclick="identifyPersonal();" class="add-bankcard">
						    	+ 添加银行卡
						    </div>
						</div>
		            </li>
				</ul>
				
			</div>
			
		</div>
		<script src="js/mui.min.js"></script>
		<script type="text/javascript" src="js/ajax.js"></script>
		<script type="text/javascript">
			
			/*ajax数据加载方法*/		
		    function onloadd(){
			 	var paramData;
			  	var paramData={currentPage:1};                               
			  	var object = JSON.stringify(paramData);
			  	ajaxPost("<%=basePath%>weixin_bank/findAllBank",object,"json","json",findAllBankInfo);
			};
   
    		window.onload=function(){
	  			onloadd();
	  		};
	  		
	  		/*查询所有的银行卡信息*/
			function findAllBankInfo(vbl){
		 		var htmlstr="";
		     	var bankEntityList=vbl.bankEntityData.bankEntityList;
		     	var cardType = "";
	     		if(bankEntityList!=null){
	     			var bel=bankEntityList;
	     			for(var i=0;i<bel.length;i++){
	      				//card_type:卡种(0:储蓄卡，1：信用卡)
	     				if(bel[i].card_type =='0'){
		    				cardType= "储蓄卡";
		  				}else if(bel[i].card_type =='1'){
		  	 				cardType = "信用卡";
		  				}
		  				
           				htmlstr +=  "<li class='custom-table-view-cell'>"+
	           					    "	<div class='mui-input-row'>"+
						  			"		<div class='bank-list-box bank-bg'>"+  
						    		"			<div class='bank-list-info'>"+	
						    		"				<h4>"+bel[i].affiliated_bank+"</h4>"+		
						    		"				<h5>"+cardType+"</h5>"	+	
						    		"				<h5>"+formatBankNumber(bel[i].bank_card)+"</h5>"+	
						   			"			</div>"+
						    		"		</div>"+
									"	</div>"+
		            				"</li>";
					}
					// 追加元素
		 			document.getElementById('textValue').insertAdjacentHTML('afterbegin',htmlstr);
	  			}else{
	  				alert("暂无银行卡信息");
	  			};
   			};
   			
   			function formatBankNumber(bankNumber){
		    	return bankNumber.substr(0,3)+"********"+bankNumber.substr(-4);
		  	}
		  	/*添加银行卡验证*/
		  	function  identifyPersonal(){
 	  		  	var paramData;
		  		var paramData={currentPage:1};                               
		  		var object = JSON.stringify(paramData);
		  		ajaxPost("<%=basePath%>user_weixin/findUserInformOne",object,"json","json",findBankDetailInfo);
		  	  }
			 /*获取用户信息实名,用户id*/
			  function findBankDetailInfo(data){
			   	if(data.object.information_compellation ==""){
			   	 if(confirm("是否立即实名认证？")){
				    window.location.href='<%=basePath%>maid/personAddIdentityCard';
				 }else{
				    return false;
				 }
			   	}else if(data.object.information_compellation !=""){
			   		window.location.href='<%=basePath%>maid/personAddBankCard';
			   	}
			  }
		</script>
	</body>

</html>