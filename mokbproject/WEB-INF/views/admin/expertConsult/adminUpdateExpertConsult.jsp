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
    <title>更新页面</title>
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
  <li class="clearfix"><label class="label_name col-xs-1"><i>*</i>用户ID：&nbsp;&nbsp;</label><div class="Add_content col-xs-10"><input id="user_basics_id"   data-protocol_title="用户ID"  name="user_basics_id" type="text" disabled="disabled"  value="${expertConsultEntity.user_basics_id}"  class="col-xs-4"/></div></li>
  <li class="clearfix"><label class="label_name col-xs-1"><i>*</i>专家ID：&nbsp;&nbsp;</label><div class="Add_content col-xs-10"><input id="expert_id" data-protocol_type="专家ID"  name="expert_id" type="text" disabled="disabled"  value="${expertConsultEntity.expert_id}"  class="col-xs-4"/></div></li>
  <li class="clearfix"><label class="label_name col-xs-1"><i>*</i>用户提问日期：&nbsp;&nbsp;</label><div class="Add_content col-xs-10"><input id="addDate" data-status_state="添加日期"  name="add_date" type="text" disabled="disabled"   value=""  class="col-xs-4"/></div></li>
  <li class="clearfix"><label class="label_name col-xs-1"><i>*</i>用户提交问题：&nbsp;&nbsp;</label><div class="Add_content col-xs-10"><input id="user_message" data-protocol_type="轮播图状态"  name="user_message" type="text" disabled="disabled"  value="${expertConsultEntity.user_message}"  class="col-xs-4"/></div></li>
  <li class="clearfix"><label class="label_name col-xs-1"><i>*</i>专家回复：&nbsp;&nbsp;</label>
     <div class="Add_content col-xs-11"><script id="editor" type="text/plain" style="width:100%;height:500px;"></script></div>
     </li>
 </ul>

</div>
</form>
 <div class="Button_operation btn_width">
    <button class="btn button_btn bg-deep-blue"  style="margin-left: 30%;" type="button" onclick="updateExpertConsult()">保存并提交</button>
   
 </div>
</div>
  <script type="text/javascript" src="js/medicinefood/uitl.js"></script>
  <script type="text/javascript" src="js/jquery.cookie.js"></script>
  <script type="text/javascript" src="js/ajax.js"></script>
  <script type="text/javascript">
	 
	 function onloadd(){
	 alert('${expertConsultEntity.expert_message}');
	 	/*获取用户提交日期*/
	 	 document.getElementById("addDate").value=formatDateTimeStr('${expertConsultEntity.add_date}'/1);
	 	 /*获取专家回复的信息*/
	 	  var ue=  UE.getEditor("editor");
	 	  ue.addListener("ready", function () {  
           ue.setContent('${expertConsultEntity.expert_message}');  
          });
		};
		
	    window.onload=function(){
		  	onloadd();
	  };
	

    /*执行提交专家咨询信息修改操作*/
    function updateExpertConsult(){
    	  debugger;
    	  /*获取请求参数*/
    	  var consult_id = '${expertConsultEntity.consult_id}';
	      var expert_message=UE.getEditor('editor').getContent();
	      var  expert_reply_state =0;
	      var paramData;
	 	  var paramData={consult_id:consult_id,expert_message:expert_message,expert_reply_state:expert_reply_state};                               
	  	  var object = JSON.stringify(paramData);
	  	  //alert(object);
	 	  if(confirm("确认执行这个操作吗？")){
	        ajaxPost("<%=basePath%>/admin_expertConsult/updateExpertConsult",object,"json","json",wait);
	      }else{
	        return false;
	        }
    
         }
   function wait(data){
   	 if(data.state==0){
	   alert(data.message);
	   window.history.back(-1);
	  }else if(data.state==1){
	    alert(data.message);
	 }
    }
 //获取url中的参数
        function getUrlParam(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
            var r = window.location.search.substr(1).match(reg);  //匹配目标参数
            if (r != null) return unescape(r[2]); return null; //返回参数值
        }
		
 function getMyDate(str){  
            var oDate = new Date(str),  
            oYear = oDate.getFullYear(),  
            oMonth = oDate.getMonth()+1,  
            oDay = oDate.getDate(),  
            oHour = oDate.getHours(),  
            oMin = oDate.getMinutes(),  
            oSen = oDate.getSeconds(),  
            oTime = oYear +'-'+ getzf(oMonth) +'-'+ getzf(oDay) ;//最后拼接时间  
            return oTime;  
        }; 
        //补0操作
      function getzf(num){  
          if(parseInt(num) < 10){  
              num = '0'+num;  
          }  
          return num;  
      }
      
      
      
      
      


 //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('editor');


    function isFocus(e){
        alert(UE.getEditor('editor').isFocus());
        UE.dom.domUtils.preventDefault(e)
    }
    function setblur(e){
        UE.getEditor('editor').blur();
        UE.dom.domUtils.preventDefault(e)
    }
    function insertHtml() {
        var value = prompt('插入html代码', '');
        UE.getEditor('editor').execCommand('insertHtml', value)
    }
    function createEditor() {
        enableBtn();
        UE.getEditor('editor');
    }
    function getAllHtml() {
        alert(UE.getEditor('editor').getAllHtml())
    }
    function getContent() {
    var jsonData = $("formid").serializeArray();
        var arr = [];
        arr.push("使用editor.getContent()方法可以获得编辑器的内容");
        arr.push("内容为：");
        arr.push(UE.getEditor('editor').getContent());
        alert(arr.join("\n"));
    }
    function getPlainTxt() {
        var arr = [];
        arr.push("使用editor.getPlainTxt()方法可以获得编辑器的带格式的纯文本内容");
        arr.push("内容为：");
        arr.push(UE.getEditor('editor').getPlainTxt());
        alert(arr.join('\n'))
    }
    function setContent(isAppendTo) {
        var arr = [];
        arr.push("使用editor.setContent('欢迎使用ueditor')方法可以设置编辑器的内容");
        UE.getEditor('editor').setContent('欢迎使用ueditor', isAppendTo);
        alert(arr.join("\n"));
    }
    function setDisabled() {
        UE.getEditor('editor').setDisabled('fullscreen');
        disableBtn("enable");
    }

    function setEnabled() {
        UE.getEditor('editor').setEnabled();
        enableBtn();
    }

    function getText() {
        //当你点击按钮时编辑区域已经失去了焦点，如果直接用getText将不会得到内容，所以要在选回来，然后取得内容
        var range = UE.getEditor('editor').selection.getRange();
        range.select();
        var txt = UE.getEditor('editor').selection.getText();
        alert(txt)
    }

    function getContentTxt() {
        var arr = [];
        arr.push("使用editor.getContentTxt()方法可以获得编辑器的纯文本内容");
        arr.push("编辑器的纯文本内容为：");
        arr.push(UE.getEditor('editor').getContentTxt());
        alert(arr.join("\n"));
    }
    function hasContent() {
        var arr = [];
        arr.push("使用editor.hasContents()方法判断编辑器里是否有内容");
        arr.push("判断结果为：");
        arr.push(UE.getEditor('editor').hasContents());
        alert(arr.join("\n"));
    }
    function setFocus() {
        UE.getEditor('editor').focus();
    }
    function deleteEditor() {
        disableBtn();
        UE.getEditor('editor').destroy();
    }
    function disableBtn(str) {
        var div = document.getElementById('btns');
        var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            if (btn.id == str) {
                UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
            } else {
                btn.setAttribute("disabled", "true");
            }
        }
    }
    function enableBtn() {
        var div = document.getElementById('btns');
        var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
        }
    }

    function getLocalData () {
        alert(UE.getEditor('editor').execCommand( "getlocaldata" ));
    }

    function clearLocalData () {
        UE.getEditor('editor').execCommand( "clearlocaldata" );
        alert("已清空草稿箱")
    }
    </script>
</body>
</html>