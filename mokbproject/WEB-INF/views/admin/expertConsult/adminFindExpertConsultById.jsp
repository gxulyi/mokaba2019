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
    <title>查看页面</title>
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
  <ul>
  <li class="clearfix"><label class="label_name col-xs-2"><i>*</i>用户ID：&nbsp;&nbsp;</label><div class="Add_content col-xs-10"><input id="grade_describe"   data-protocol_title="用户ID"  name="user_basics_id" type="text" disabled="disabled"  value="${expertConsultEntity.user_basics_id}"  class="col-xs-4"/></div></li>
  <li class="clearfix"><label class="label_name col-xs-2"><i>*</i>专家ID：&nbsp;&nbsp;</label><div class="Add_content col-xs-10"><input id="expert_id" data-protocol_type="专家ID"  name="expert_id" type="text" disabled="disabled"  value="${expertConsultEntity.expert_id}"  class="col-xs-4"/></div></li>
  <li class="clearfix"><label class="label_name col-xs-2"><i>*</i>审核状态：&nbsp;&nbsp;</label><div class="Add_content col-xs-10"><input id="statusState" data-status_state="审核状态"  name="status_state" type="text" disabled="disabled"   value=""  class="col-xs-4"/></div></li>
  <li class="clearfix"><label class="label_name col-xs-2"><i>*</i>用户提交问题内容：&nbsp;&nbsp;</label><div class="Add_content col-xs-10"><input id="user_message" data-protocol_type="轮播图状态"  name="user_message" type="text" disabled="disabled"  value="${expertConsultEntity.user_message}"  class="col-xs-4"/></div></li>
  <li class="clearfix"><label class="label_name col-xs-2"><i>*</i>用户提问日期：&nbsp;&nbsp;</label><div class="Add_content col-xs-10"><input id="addDate" data-status_state="添加日期"  name="add_date" type="text" disabled="disabled"   value=""  class="col-xs-4"/></div></li>
 </ul> 

     
 </ul>

</div>
</form>
 <div class="Button_operation btn_width">
    <button class="btn button_btn bg-deep-blue"  style="margin-left:5%;" type="button" onclick="window.history.back(-1)">返回</button>
   
 </div>
</div>
  <script type="text/javascript" src="js/medicinefood/uitl.js"></script>
  <script type="text/javascript" src="js/jquery.cookie.js"></script>
  <script type="text/javascript" src="js/ajax.js"></script>
  <script type="text/javascript">
    
	 function onloadd(){
	  /*轮播图审核状态*/
	   var statusState = null;
	   var statusState1 ='${expertConsultEntity.status_state}';
	   if(statusState1 ==1){
	    statusState ="未审核";
	   }
	  document.getElementById("statusState").value=statusState;
	  /*添加日期**/
	  //alert(JSON.stringify(formatDateTimeStr('${sEntity.add_date}'/1000)));
	  document.getElementById("addDate").value=formatDateTimeStr('${expertConsultEntity.add_date}'/1);
	}
	/*数据加载*/	
    window.onload=function(){
		    debugger;
		  	onloadd();
    };
    </script>
</body>
</html>