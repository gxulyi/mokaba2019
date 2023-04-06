<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<header class="am-topbar admin-header" style="background: #55cbd2;color:#fff;height:50px;">
 <script src="js/template/jquery.min.js"></script>
  <script type="text/javascript">
	$(function(){
	    //程序一加载,判断是否有系统未读消息.
	    requestAjax();
	    
	    var handler = function(){
	    requestAjax();
	    };
	    //每个3秒执行一次定时任务,判断当前是否有未读消息
	    setInterval(handler,600000);    
	    });
	   //程序一加载,判断是否有系统未读消息.
	   function requestAjax(){
	    var param={1:1};
	    $.ajax({
	    url:"admin_expertConsult/findAllExpertConsult",
	    type:"post",
	    dataType:"json",
	    contentType :"application/json",
	    data: JSON.stringify(param),
	    success:function(data){
	   // alert(JSON.stringify(data.expertConsultEntityData.expertConsultEntityList.length));
	    //是否有未读消息
	     var messageSize = data.expertConsultEntityData.expertConsultEntityList.length;
	     if(messageSize>0){
	 //有未读消息,则显示如下图标
	    // $("#notice").removeClass().addClass("am-badge am-badge-warning");
	     document.getElementById("notice").innerHTML=messageSize;
	     }else{
	 //没有未读消息,则显示这个图标
	     $("#notice").removeClass();
	     }
	    }
	    });
	  }
  </script>
   <div class="am-topbar-brand">
    <strong>卡巴部落后台管理系统</strong> <small><%-- ${htmlEntity.title1} --%></small>
  </div>
  <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only" data-am-collapse="{target: '#topbar-collapse'}"><span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span></button>
  <div class="am-collapse am-topbar-collapse" id="topbar-collapse">
    <ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list">
       <li>
         <a href="admin_expertConsult/toAdminFindExpertConsult">
           <span class="am-icon-envelope-o"></span> 新消息 
           <span class="am-badge am-badge-warning" id="notice"></span>
         </a>
       </li> 
       
       <li class="am-dropdown" data-am-dropdown>
         <a class="am-dropdown-toggle" data-am-dropdown-toggle href="javascript:;">
            <span class="am-icon-users"></span>${privilegeHint } --------------管理员 <span class="am-icon-caret-down"></span>
         </a>
         <ul class="am-dropdown-content">
           <li><a href="javascript:void(0);"><span class="am-icon-user"></span> 资料</a></li>
           <li><a href="javascript:void(0);"><span class="am-icon-cog"></span> 设置</a></li>
           <li><a href="admin/logOff"><span class="am-icon-power-off"></span> 退出</a></li>
         </ul>
       </li>
       <!-- 
       <li>
         <a href="javascript:;" id="admin-fullscreen">
         <span class="am-icon-arrows-alt"></span> 
         <span class="admin-fullText">开启全屏</span>
         </a>
       </li>
       -->
    </ul>
  </div>
</header>