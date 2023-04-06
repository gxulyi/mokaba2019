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
	  <li class="clearfix"><label class="label_name col-xs-2"><i>*</i>区域：&nbsp;&nbsp;</label>
	  <div class="Add_content col-xs-10" id="area">
	  	 <select style="width:150px;text-align: center;" id="province" name="province"></select>
         <select style="width:150px;text-align: center;" id="city" name="city"></select>
	  </div></li>
	  <li class="clearfix"><label class="label_name col-xs-2"><i>*</i>银行名称：&nbsp;&nbsp;</label>
		  <div class="Add_content col-xs-10">
		  	<input name="bank_name" type="text"  style="width:300px;" data-author="银行名称" id="bank_name"   class="col-xs-6"/>
		  </div>
	  </li>
	  <li class="clearfix"><label class="label_name col-xs-2">
	       <i>*</i>类型：&nbsp;&nbsp;</label>
	    <div class="Add_content col-xs-10">
	      <select name="" id="selectidd" class="text_add" style="width:300px" class="col-xs-6">
	         <option value="1">储蓄卡</option>
	         <option value="2">信用卡</option>
	      </select>
	   </div>
	  </li>
	  <li class="clearfix"><label class="label_name col-xs-2"><i>*</i>限额：&nbsp;&nbsp;</label>
		  <div class="Add_content col-xs-10">
		  	<input style="width:300px" name="limit_money" type="text"  data-limit_money="限额" id="limit_money"   class="col-xs-6"/>
		  </div>
	  </li>
	 
	  <!-- <li class="clearfix"><label class="label_name col-xs-1"><i>*</i>添加人ID：&nbsp;&nbsp;</label><div class="Add_content col-xs-11"><input name="author" type="text"  data-author="添加人ID"  class="col-xs-6"/></div></li> -->
	   
	     <!--  <li class="clearfix"><label class="label_name col-xs-1"><i>*</i>状态：&nbsp;&nbsp;</label><div class="Add_content col-xs-11"><input name="remarks" data-remarks="轮播图状态" type="text" class="col-xs-6"/></div></li> -->
	     <!--  <li class="clearfix"><label class="label_name col-xs-1"><i></i>添加日期：&nbsp;&nbsp;</label><div class="Add_content col-xs-11"><input name="audio_url"  data-audio_url="添加日期"  type="text" class="col-xs-6"/></div></li> -->
	          
	    <!--  <li class="clearfix"><label class="label_name col-xs-1"><i>*</i>内容介绍：&nbsp;&nbsp;</label>
	     <div class="Add_content col-xs-11"><script id="editor" type="text/plain" style="width:100%;height:500px;"></script></div>
	     </li> -->  
	
	     
	 </ul>
	
	</div>
	</form>
	 <div class="Button_operation btn_width">
	    <button class="btn button_btn bg-deep-blue"   type="button" onclick="addBankManage()">保存并提交</button>
	   
	 </div>
	</div>
	  <script type="text/javascript" src="js/province/areaData.js"></script>
      <script type="text/javascript" src="js/province/provinceCity.js"></script>
	  <script type="text/javascript" src="js/jquery.cookie.js"></script>
	  <script type="text/javascript" src="js/ajax.js"></script>
	  <script type="text/javascript">
	    /*获取全国所有的地区**/
	    $('#area').citySelect(areaData);
		 function onloadd(){
			  
			}
			
		    window.onload=function(){
			    //debugger;
			  	onloadd();
		  	
		  };
		
		function GetSelectVal(obj){
		    debugger;
			var index = obj.selectedIndex; // 选中索引
			//alert(obj.options[index].value);
			var value = obj.options[index].text; // 选中值
			return value;
			}
	    /*执行提交银行信息新增操作*/
	    function addBankManage(){
	    	  debugger;
	    	  /*获取请求参数*/
	    	   var area =null;
	    	   var province = GetSelectVal(document.getElementById("province"));
	    	   var city =GetSelectVal(document.getElementById("city"));
	    	  if(province=="全国"||province=="北京"||province=="上海"||province=="重庆"||province=="天津"){
	    	  	area =province;
	    	  }else if(province!="全国"||province!="北京"||province!="上海"||province!="重庆"||province!="天津"){
	    	  	area=province+city;
	    	  }
	    	  
	    	 
		      var bank_type=document.getElementById("selectidd").value;
		      var bank_name=document.getElementById("bank_name").value;
		      var limit_money=document.getElementById("limit_money").value;
		      
		       /*校验表单数据*/
		      if(bank_type ==null ||bank_type==""){
		        alert("请输入银行卡种类型");
		        return;
		      }
		      if(bank_name ==null ||bank_name==""){
		        alert("请输入银行名称");
		        return;
		      }
		       if(limit_money ==null ||limit_money==""){
		        alert("请填写限额按照(每笔/每日/每月)格式填写");
		        return;
		      }
		       
		      var paramData;
		 	  var paramData={area:area,bank_type:bank_type,bank_name:bank_name,limit_money:limit_money};                               
		  	  var object = JSON.stringify(paramData);
		  	  //alert(object);
		 	  if(confirm("确认执行这个操作吗？")){
		        ajaxPost("<%=basePath%>/admin_bankManage/addBankManage",object,"json","json",callBack);
		  }else{
		    return false;
		    }
	    
	    }
	   function callBack(data){
	   	if(data.state==0){
		  alert(data.message);
		  window.history.back(-1);
		 }
		 else if(data.state==1){
		  alert(data.message);
		 }
	    }
	   
	    </script>
	</body>
</html>