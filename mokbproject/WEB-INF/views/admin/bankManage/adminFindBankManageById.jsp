<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <base href="<%=basePath%>">
    <title>添加页面</title>
    <meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" />
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <script type="text/javascript" src="file/weixin_xiti/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="file/utf8-jsp/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="file/utf8-jsp/ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="file/utf8-jsp/lang/zh-cn/zh-cn.js"></script>



 <link href="file/weixin_xiti/css/shop.css" type="text/css" rel="stylesheet" />
<link href="file/weixin_xiti/css/Sellerber.css" type="text/css"  rel="stylesheet" />
<link href="file/weixin_xiti/css/bkg_ui.css" type="text/css"  rel="stylesheet" />
<link href="file/weixin_xiti/font/css/font-awesome.min.css"  rel="stylesheet" type="text/css" />








<link rel="stylesheet" href="file/uploadDemo/css/style.css" type="text/css"></link>
<link rel="stylesheet" href="file/uploadDemo/css/webuploader.css" type="text/css"></link>


<script type="text/javascript" src="file/uploadDemo/js/webuploader.js"></script></head>
<body>
<div class="margin">
<form  id="formid">
<div class="add_style">
 <ul>
  <li class="clearfix"><label class="label_name col-xs-2"><i>*</i>区域：&nbsp;&nbsp;</label><div class="Add_content col-xs-10"><input id="area"   data-area="区域"  name="area" type="text" disabled="disabled"  value="${bankManageEntity.area}"  class="col-xs-4"/></div></li>
  <li class="clearfix"><label class="label_name col-xs-2"><i>*</i>银行名称：&nbsp;&nbsp;</label><div class="Add_content col-xs-10"><input id="bank_name" data-bank_name="银行名称"  name="bank_name" type="text" disabled="disabled"  value="${bankManageEntity.bank_name}"  class="col-xs-4"/></div></li>
  <li class="clearfix"><label class="label_name col-xs-2"><i>*</i>银行卡种类型：&nbsp;&nbsp;</label><div class="Add_content col-xs-10"><input id="bank_type" data-bank_type="银行卡种类型"  name="bank_type" type="text" disabled="disabled"   value=""  class="col-xs-4"/></div></li>
  <li class="clearfix"><label class="label_name col-xs-2"><i>*</i>限额：&nbsp;&nbsp;</label><div class="Add_content col-xs-10"><input id="limit_money"   data-limit_money="限额"  name="limit_money" type="text" disabled="disabled"  value="${bankManageEntity.limit_money}"  class="col-xs-4"/></div></li>
  <li class="clearfix"><label class="label_name col-xs-2"><i>*</i>审核状态：&nbsp;&nbsp;</label><div class="Add_content col-xs-10"><input id="statusState" data-protocol_type="审核状态"  name="status_state" type="text" disabled="disabled"  value=""  class="col-xs-4"/></div></li>
  <li class="clearfix"><label class="label_name col-xs-2"><i>*</i>添加日期：&nbsp;&nbsp;</label><div class="Add_content col-xs-10"><input id="addDate" data-status_state="添加日期"  name="add_date" type="text" disabled="disabled"   value=""  class="col-xs-4"/></div></li>
   <li class="clearfix"><label class="label_name col-xs-2"><i>*</i>审核日期：&nbsp;&nbsp;</label><div class="Add_content col-xs-10"><input id="examineDate" data-status_state="审核日期"  name="examine_date" type="text" disabled="disabled"   value=""  class="col-xs-4"/></div></li> 
    

     
 </ul>

</div>
</form>
 <div class="Button_operation btn_width">
    <button class="btn button_btn bg-deep-blue"  type="button" onclick="window.history.back(-1)">返回</button>
   
 </div>
</div>
  <script type="text/javascript" src="js/medicinefood/uitl.js"></script>
  <script type="text/javascript" src="js/jquery.cookie.js"></script>
  <script type="text/javascript" src="js/ajax.js"></script>
  <script type="text/javascript">
    
	 function onloadd(){
	   /*银行卡种类型*/
	   var bankType = null;
	   var bankType1 ='${bankManageEntity.bank_type}';
	   if(bankType1 ==1){
	    bankType ="储蓄卡";
	   }else if(bankType1 ==2){
	     bankType ="信用卡";
	   }
	  document.getElementById("bank_type").value=bankType;
	   /*审核状态*/
	   var statusState = null;
	   var statusState1 ='${bankManageEntity.status_state}';
	   if(statusState1 ==0){
	    statusState ="通过";
	   }
	  document.getElementById("statusState").value=statusState;
	  /*添加日期**/
	  //alert(JSON.stringify(formatDateTimeStr('${sEntity.add_date}'/1000)));
	  document.getElementById("addDate").value=formatDateTimeStr('${sEntity.add_date}'/1);
	  document.getElementById("examineDate").value=formatDateTimeStr('${sEntity.add_date}'/1);
		}
		
	    window.onload=function(){
		    debugger;
		  	onloadd();
    };
    </script>
</body>
</html>