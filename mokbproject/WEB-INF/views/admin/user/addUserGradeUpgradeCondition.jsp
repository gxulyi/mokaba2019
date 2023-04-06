<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ include file="../template/admin-header.jsp" %><!-- htnl头部文件 -->

<!doctype html>
<html class="no-js">
<head>
  <meta charset="utf-8">
  <base href="<%=basePath%>">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <script type="text/javascript" src="js/jquery-1.7.1.js"></script>
  <script type="text/javascript" src="js/jquery-form.js" ></script> 
  <script type="text/javascript" src="js/ajax.js"></script>
  <title></title>
  <script type="text/javascript">
  function conditionTypeChange(select){
   var index=select.selectedIndex;//选中索引
   var value=select[index].value;//选中的value
   switch (parseInt(value)) {
case 1://用户成就
    showHtml("conditionOptiondDiv","conditionValueDiv","","");
	var conditionOptiondDivValue=[
    {"user_achievementName":"用户直推人数","user_achievementOption":"direct_team_num"},
    {"user_achievementName":"晋级积分","user_achievementOption":"records_integral"},
    {"user_achievementName":"历史奖金","user_achievementOption":"records_bonus"},
    {"user_achievementName":"直接推荐团队消费","user_achievementOption":"direct_team_consume"}
    ]; 
	setConditionSelect1(conditionOptiondDivValue);//设置条件项html
	
	break;
case 2://自定义成就
    showHtml("","","","");
	alert("开发中");
	break;
case 3://会员购买
	showHtml("conditionValueDiv","conditionCorrelationIdDiv","","");
	document.getElementById('conditionValue').setAttribute("placeholder","购买数量");
	document.getElementById('conditionValue').style.width="30%";
	//document.getElementById('conditionCorrelationIdText').innerHTML="购买商品";
	var jsonData=JSON.stringify({"Correlation":value});
	//会员购买 异步查询关联的条件
	ajaxPost("<%=basePath%>admin_user/findUpgradeConditionCorrelation", jsonData, "json","json", setConditionCorrelationIdBuyStore);
	break;
case 4://用户团队
    showHtml("","","","");
	alert("开发中");
	break;

default:
    
	break;
}
  
  }
  
  function setHtmlText(selectValue){
  
  
  };
 
  function setConditionSelect1(jsonData){//设置条件项html
  conditionOptiondSelect=document.getElementById("conditionOptiond");
  conditionOptiondSelect.options[0]=new Option("请选择条件项","0");
  jsonData.forEach(
  function (value,index,array){
  conditionOptiondSelect.options[index+1]=new Option(value.user_achievementName,value.user_achievementOption);
  }
  );
  
  
  }
  function setConditionSelect2(){//设置条件值html
  conditionOptiondSelect=document.getElementById("conditionOptiond");
  var index=conditionOptiondSelect.selectedIndex;
  var selectValue=conditionOptiondSelect[index].value;
  if(selectValue=="0"||selectValue==0){
  document.getElementById('conditionValue').setAttribute("placeholder","");
  }
  if(selectValue=="direct_team_num"){//直推人数
  document.getElementById('conditionValue').setAttribute("placeholder","直推人数");
  document.getElementById('conditionValue').style.width="30%";
  blockHtml(["conditionCorrelationIdDiv","conditionSupplementDiv"]);
  var conditionSupplementDivValue=[
	{"conditionSupplementName":"用户会员等级","conditionSupplementValue":"userGrade"},
	{"conditionSupplementName":"用户直推人数","conditionSupplementValue":"directTeam"}
	];
  setConditionSelect3(conditionSupplementDivValue);
  }else if(selectValue=="records_integral"){//晋升积分
  noneHtml(["conditionCorrelationIdDiv","conditionSupplementDiv"]);
  setConditionSelect3("");
  setConditionSelect4("");
  document.getElementById('conditionValue').setAttribute("placeholder","晋升积分");
  document.getElementById('conditionValue').style.width="30%";
  }else if(selectValue=="records_bonus"){//历史奖金
  document.getElementById('conditionValue').setAttribute("placeholder","历史奖金");
  document.getElementById('conditionValue').style.width="30%";
  }else if(selectValue=="direct_team_consume"){//直推消费
  document.getElementById('conditionValue').setAttribute("placeholder","直推消费");
  document.getElementById('conditionValue').style.width="30%";
  };
  //
  }
  function setConditionSelect3(jsonData){//设置条件补充html
  var conditionSupplementSelect=document.getElementById("conditionSupplement");
  conditionSupplementSelect.options[0]=new Option("可选择条件补充","0");
  if(jsonData==null||jsonData==""){
  conditionSupplementSelect.options.length=0;
  return;
  }
  jsonData.forEach(function(value,index,array){
  conditionSupplementSelect.options[index+1]=new Option(value.conditionSupplementName,value.conditionSupplementValue);
  });
  }
   function setConditionSelect4(selectIndex){//设置条件关联html
   var conditionSupplementSelect=document.getElementById("conditionSupplement");
   if(selectIndex==null||selectIndex==""){
   document.getElementById("conditionCorrelationId").options.length=0;
   return;
   }
   //var selectIndex=conditionSupplementSelect.selectedIndex;
   var selectValue=conditionSupplementSelect[selectIndex].value;
   if(selectValue=="userGrade"){
   //异步请求获取信息，设置条件关联
   ajaxPost("<%=basePath%>admin_user/findAllUserGrade", "", "json","json", setConditionCorrelationIdUserGrade);
   }else{
   alert("暂未开放");
   return;
   }
   
   }
  function setConditionCorrelationIdBuyStore(jsonData){//设置会员购买的条件关联
  var conditionSelect=document.getElementById("conditionCorrelationId");//获取关联条件框
	 var object=jsonData.object;
     object.forEach(function(value,index,array){
      conditionSelect.options[0]=new Option("请选择购买商品","0");
       var store_type=value.value==1?"定制":"商城";//商品类型
       var store_price=value.store_price;//商品价格
       var store_name=value.store_name;//商品名字
       var selectText="("+store_type+")"+store_name+"—— ￥"+store_price;
       conditionSelect.options[index+1]=new Option(selectText,value.store_id);
     });
   }
  function setConditionCorrelationIdUserGrade(jsonData){//设置会员等级的条件关联选择框
  var conditionSelect=document.getElementById("conditionCorrelationId");//获取关联条件框
  conditionSelect.options[0]=new Option("选择会员等级","");
  var object=jsonData.object;
  if(object==null||object.length<1){
  return;
  }
  object.forEach(function(value,index,array){
  conditionSelect.options[index+1]=new Option(value.grade_name+'('+value.grade_nickname+')',value.user_grade_id);
  
  
  });
  
  }
  function showHtml(htmlId1,htmlId2,htmlId3,htmlId4){
  document.getElementById('conditionOptiondDiv').style.display="none";
  document.getElementById('conditionOptiond').length=0;
  //
  document.getElementById('conditionValueDiv').style.display="none";
  document.getElementById('conditionValue').setAttribute("placeholder","");;
  //
  document.getElementById('conditionSupplementDiv').style.display="none";
  document.getElementById('conditionSupplement').length=0;
  //
  document.getElementById('conditionCorrelationIdDiv').style.display="none";
  document.getElementById('conditionCorrelationId').length=0;
  
  if(htmlId1!=null&&htmlId1!=""){
  document.getElementById(htmlId1).style.display="";
  };
  if(htmlId2!=null&&htmlId2!=""){
  document.getElementById(htmlId2).style.display="";
  };
  if(htmlId3!=null&&htmlId3!=""){
  document.getElementById(htmlId3).style.display="";
  };
  if(htmlId4!=null&&htmlId4!=""){
  document.getElementById(htmlId4).style.display="";
  };
  }
  function noneHtml(obj){
  obj.forEach(function(value,index,array){
  var obj1= document.getElementById(value);
  obj1.style.display="none";
  });
  }
  function blockHtml(obj){
   obj.forEach(function(value,index,array){
  var obj1= document.getElementById(value);
  obj1.style.display="";
  });
  }
  </script>
  <script type="text/javascript">
  function verify(){
  if(document.getElementById("conditionSupplement").selectedIndex==0||document.getElementById("conditionSupplement").selectedIndex=='0'){
  document.getElementById("conditionSupplement").options.length=0
  }
  
  return true;
  
  }
  </script>
  <script type="text/javascript">
  
    
  </script>
  <meta name="description" content="这是一个 index 页面">
  <meta name="keywords" content="index">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="icon" type="image/png" href="css/template/images/favicon.png">
  <link rel="apple-touch-icon-precomposed" href="css/template/images/app-icon72x72@2x.png">
  <meta name="apple-mobile-web-app-title" content="Amaze UI" />
  <link rel="stylesheet" href="css/template/amazeui.min.css"/>
  <link rel="stylesheet" href="css/template/admin.css">
</head>
<%@ include file="../template/admin-body-header.jsp" %><!-- 内容头部 -->
<body>
     
    <%@ include file="../template/admin-body-sidebar.jsp" %><!-- 侧边内容 -->
  
  <!-- sidebar end -->
  <!-- content start -->
  <div class="admin-content">
     <%@ include file="../template/admin-content-heder.jsp" %><!-- body 标题 -->
   <img style="width: 40px;height: 40px;cursor: pointer;position: absolute;top: 15px;right: 80px;"onclick="javascript:history.back(-1);" title="返回上一级" alt="" src="images/fhsyj.png">
    <div class="am-g">

      <div class="am-u-sm-12 am-u-md-4 am-u-md-push-8">
       

        

      </div>

      <div class="am-u-sm-12 am-u-md-8 am-u-md-pull-4">
        <form onsubmit="return verify()" id="submitForm" class="am-form " method="post" action="admin_user/addUserGradeUpgradeCondition">
          <input id="userGradeId"type="hidden" name="userGradeId" value="${user_grade_id }">
          <input id="gradeName"type="hidden" name="gradeName" value="${grade_name }">
          <div class="am-form-group" id="conditionTypeDiv">
            <label for="user-name" class="am-u-sm-3 am-form-label" style="text-align: right;">条件类型：</label>
            <div class="am-u-sm-9">
             <select onchange="conditionTypeChange(this)" id="conditionType" name="conditionType" style="width:30%;">
              <option value="0">请选择条件类型</option>
              <option value="1">用户成就</option>
              <option value="2">自定义成就</option>
              <option value="3">会员购买</option>
              <option value="4">用户团队</option>
             </select>
            </div>
          </div>
          &nbsp
           <div id="conditionOptiondDiv" class="am-form-group" style="display: none">
            <label for="user-name" class="am-u-sm-3 am-form-label" style="text-align: right;">条件项：</label>
            <div class="am-u-sm-9">
              <select onchange="setConditionSelect2()" id="conditionOptiond" name="conditionOptiond" style="width:30%;">
              	<option></option>
             </select>
            </div>
          </div>
          
          &nbsp
           <div id="conditionValueDiv" class="am-form-group" style="display: none">
            <label for="user-name" class="am-u-sm-3 am-form-label" style="text-align: right;" id="conditionValueText">条件值：</label>
            <div class="am-u-sm-9">
              <input style="width:30%;" id="conditionValue" type="text" name="conditionValue" placeholder="输入条件值" value="">
            </div>
          </div>
          &nbsp
           <div id="conditionSupplementDiv" class="am-form-group" style="display: none">
            <label for="user-name" class="am-u-sm-3 am-form-label" style="text-align: right;">条件补充：</label>
            <div  class="am-u-sm-9">
              <select onchange="setConditionSelect4(this.selectedIndex)" id="conditionSupplement" name="conditionSupplement" style="width:30%;">
              <option ></option>
             </select>
            </div>
          </div>
           &nbsp&nbsp&nbsp
          
          <div id="conditionCorrelationIdDiv" class="am-form-group" style="display: none">
            <label for="user-name" class="am-u-sm-3 am-form-label" id="conditionCorrelationIdText" style="text-align: right;">条件关联：</label>
            <div class="am-u-sm-9">
              <select id="conditionCorrelationId" name="conditionCorrelationId"style="width:30%;">
              <option>注册会员</option>
             </select>
            </div>
          </div>
           &nbsp&nbsp&nbsp
           <div id="conditionDescribeDiv" class="am-form-group" style="">
            <label for="user-name" class="am-u-sm-3 am-form-label" style="text-align: right;" id="conditionDescribeText">条件描述：</label>
            <div class="am-u-sm-9">
              <textarea rows="" style="width:40%;height: 100px;" cols="" name="conditionDescribe" id="conditionDescribe"></textarea>
            </div>
          </div>
          <br /><br /><br /><br />
          <div class="am-form-group" style="margin-top:20px;">
             <div class="am-u-sm-9">
                  <input style="margin-left:30%;background:#55cbd2;border:none;color: #fff;border-radius:3px;padding:5px 10px;" id="submitbutton" type="submit" value="提交" />
             </div>
          </div>    
        
        </form>
      </div>
    </div>
  </div>
 
 
		
	
		


<%@ include file="../template/admin-footer.jsp" %><!-- 底部内容 -->
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
