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
<!-- <script type="text/javascript" src="file/uploadDemo/js/webuploader.js"></script></head> -->
<body>
<div class="margin">
<form  id="formid">
<div class="add_style">
 <ul>
  <li class="clearfix"><label class="label_name col-xs-1"><i>*</i>奖项名：&nbsp;&nbsp;</label><div class="Add_content col-xs-11"><input style="width:180px" name="award_name" type="text" data-title="奖项名"  id="award_name" class="col-xs-6"/></div></li>
  <li class="clearfix"><label class="label_name col-xs-1"><i>*</i>奖品数值：&nbsp;&nbsp;</label><div class="Add_content col-xs-11"><input style="width:180px" name="author" type="text"  data-author="奖品数值" id="award_num"   class="col-xs-6"/></div></li>
  <li class="clearfix"><label class="label_name col-xs-1"><i>*</i>奖品数量：&nbsp;&nbsp;</label><div class="Add_content col-xs-11"><input style="width:180px" name="author" type="text"  data-author="奖品数量" id="count"   class="col-xs-6"/></div></li>
  <li class="clearfix"><label class="label_name col-xs-1">
       <i>*</i>奖项类型：&nbsp;&nbsp;</label>
    <div class="Add_content col-xs-11">
      <select name="" id="award_type" class="text_add" style="width:180px" class="col-xs-6">
         <option value="0">积分类型</option>
         <option value="1">代金券类型</option>
         <option value="2">实物类型</option>
      </select>
   </div>
  </li>
 
  <!-- <li class="clearfix"><label class="label_name col-xs-1"><i>*</i>添加人ID：&nbsp;&nbsp;</label><div class="Add_content col-xs-11"><input name="author" type="text"  data-author="添加人ID"  class="col-xs-6"/></div></li> -->
    <li class="clearfix"><label class="label_name col-xs-1"><i>*</i>奖项概率：&nbsp;&nbsp;</label><div class="Add_content col-xs-11"><input style="width:180px" name="author" type="text"  data-author="奖项概率" id="probability"   class="col-xs-6"/></div></li>
  
  <li class="clearfix"><label class="label_name col-xs-1"><i>*</i>所属类型：&nbsp;&nbsp;</label>
    <div class="Add_content col-xs-11" id="radioId">
       <input type="radio" value="0" name="store" onclick="function_choose(0)">积分</input>  
       <input  type="radio" value="1"  name="store" onclick="function_choose(1)">代金券</input>
       <input  type="radio" value="2"  name="store" onclick="function_choose(2)">实物</input>  
     </div></li>
     
   <li class="clearfix"><label class="label_name col-xs-1"><i>*</i>类型名称：&nbsp;&nbsp;</label>
       <div class="am-btn-group am-btn-group-xs">
       </div>
            <div class="am-form-group am-margin-left am-fl" >
              <select id="tb_id" onchange="showStore(this.value)" style="width:180px;">
                <option value="">请选择类型名称</option>
              </select>
            </div>
    </li>
    <li class="clearfix"><label class="label_name col-xs-1"><i>*</i>所属类型表名：&nbsp;&nbsp;</label><div class="Add_content col-xs-11"><input style="width:180px" name="author" type="text"  data-author="所属类型表名" id="tb_name"   class="col-xs-6"/></div></li>
    
 </ul>
</div>
</form>
 <div class="Button_operation btn_width">
    <button class="btn button_btn bg-deep-blue"  style="margin-left: 30%;" type="button" onclick="addAward()">保存并提交</button>
   
 </div>
</div>

  <script type="text/javascript" src="js/jquery.cookie.js"></script>
  <script type="text/javascript" src="js/ajax.js"></script>
  <script type="text/javascript">
   
	 /*单选框触发事件方法*/ 
	function function_choose(value){
		 var paramData;
		 var paramData={currentPage:1};                               
		 var object = JSON.stringify(paramData);
		 debugger;
		 if(value==0){
		     ajaxPost("<%=basePath%>admin_integr/findIntegralByState",object,"json","json",showStore); 
		 }else if(value==1){
		    ajaxPost("<%=basePath%>admin_voucher/findVoucherByState",object,"json","json",showStore);
		 }else if(value==2){
		    ajaxPost("<%=basePath%>admin_store/findStoreByState",object,"json","json",showStore); 
		 } 
	}
	/*回调函数获取数据*/
	function showStore(vsi){
	   // alert(JSON.stringify(vsi));
	    // alert(JSON.stringify(22));
	    var htmlstr2="";
	    if(vsi.type==0){
     	  var integralList=vsi.object;
	      if(integralList!=null){
	      var nd=integralList;
	      for(var i=0;i<nd.length;i++){
           htmlstr2+="<option name='sowing'  value="+nd[i].integral_account_id+">"+nd[i].account_option_name+"</option>";
		  }
		  document.getElementById("tb_id").innerHTML=htmlstr2;
			  }else{
			  	alert("暂无服务内容信息");
			  }
	    }else if(vsi.type==1){
	     //alert(JSON.stringify(vsi.object));
	      var voucherList=vsi.object;
	      if(voucherList!=null){
	      var sbl=voucherList;
	      for(var i=0;i<sbl.length;i++){
           htmlstr2+="<option  name='sowing' value="+sbl[i].voucher_id+">"+sbl[i].full_money+"</option>";
		  }
		  document.getElementById("tb_id").innerHTML=htmlstr2;
			  }else{
			  	alert("暂无服务内容信息");
			  }
	    }else if(vsi.type==2){
     	  var storeList=vsi.object;
	      if(storeList!=null){
	      var sbl=storeList;
	      for(var i=0;i<sbl.length;i++){
           htmlstr2+="<option  name='sowing' value="+sbl[i].store_id+">"+sbl[i].store_name+"</option>";
		  }
		  document.getElementById("tb_id").innerHTML=htmlstr2;
		   }else{
			  	alert("暂无服务内容信息");
			  }
	    }
	    
    }
    /*提交奖项信息新增操作*/
    function addAward(){
    	  debugger;
    	  /*获取请求参数*/
	      var award_name=document.getElementById("award_name").value;//奖项名
	      var award_type=document.getElementById("award_type").value;//奖项类型
	      var tb_id =$.trim($("#tb_id").val());//所属类型id
	      //var sowing_type= $("input[name='store']:checked").val();//获取单选框的值
	      var probability = document.getElementById("probability").value;//概率数值
	      var award_num = document.getElementById("award_num").value;//奖品数值
	      var count = document.getElementById("count").value;//奖品数量
	      var tb_name = document.getElementById("tb_name").value;//所属类型表名
	      var paramData;
	 	  var paramData={tb_id:tb_id,award_name:award_name,award_type:award_type,count:count,probability:probability,award_num :award_num,tb_name:tb_name };                               
	  	  var object = JSON.stringify(paramData);
	  	  //alert(object);
	 	  if(confirm("确认执行这个操作吗？")){
	        ajaxPost("<%=basePath%>admin_obtainAward/addAward",object,"json","json",function(data){
		        	if(data.state==0){
					  alert(data.message);
					  window.history.back(-1);
					 }
					 else if(data.state==1){
					  alert(data.message);
					 }
				});
	  }else{
	    return false;
	    }
    }
	</script>
</body>
</html>