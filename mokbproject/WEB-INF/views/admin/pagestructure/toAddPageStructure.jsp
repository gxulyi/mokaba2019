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
  <title>后台管理 添加商品</title>
  <script type="text/javascript">
  function alter_page_tier(select){//改变记录页面层数的值
     var index=select.selectedIndex;//获取选中option的下标
     var option=select.options[index];//以下标获取到选中option
     var page_tier= option.getAttribute("page_tier");//获取自定义属性（记录为选中上级菜单的层数等级）；
     document.getElementById("page_tier").value=parseInt(page_tier)+1;//将页面层数赋值为上级菜单层数+1
  }
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
   
    <div class="am-g">

      <div class="am-u-sm-12 am-u-md-4 am-u-md-push-8">
       

        

      </div>

      <div class="am-u-sm-12 am-u-md-8 am-u-md-pull-4">
        <form class="am-form " method="post" action="admin_websiteInstall/addPageStructure">
        
         <div class="am-form-group">
            <label for="user-name" class="am-u-sm-2 am-form-label" style="text-align: right;">上级菜单：</label>
            <div class="am-u-sm-10">
              <select onchange="alter_page_tier(this)" name="page_superior_id" id="page_superior_id1" style="width: 200px">
                  <option value="0">选择菜单首页</option>
                  <c:forEach var="pageStructureEntity" items="${pageStructureEntityList }">
                  <option page_tier="${pageStructureEntity.page_tier}" value="${pageStructureEntity.pagestructure_id }">
                  ${pageStructureEntity.page_name }
                 </option>
               </c:forEach>
              
              </select>
              <input name="page_tier" id="page_tier" type="hidden" value="1">
            </div>
          </div>
          <div style="clear: both;"></div>
          <div class="am-form-group" style="margin-top:10px;">
            <label for="user-name" class="am-u-sm-2 am-form-label" style="text-align: right;">菜单名称：</label>
            <div class="am-u-sm-10">
              <input style="width: 200px" id="store_name" type="text" name="page_name" id="user-name" placeholder="菜单名称" value="">
            </div>
          </div>
          <div style="clear: both;"></div>
          <div class="am-form-group" style="margin-top:10px;">
            <label for="user-name" class="am-u-sm-2 am-form-label" style="text-align: right;">显示优先级：</label>
            <div class="am-u-sm-10">
              <input style="width: 200px" name ="page_priority" id="store_name" type="text" id="user-name" placeholder="" value="">
            </div>
          </div>
		   <div class="am-form-group">
            <!--  <label for="user-name"  class="am-u-sm-3 am-form-label">菜单链接url</label>
            <div class="am-u-sm-9">
              <select style="width: 220px" name="page_url">
              <option>选择菜单首页</option>
              <c:forEach var="privilegeEntity" items="${privilegeEntityList }">
             
               <option id="${privilegeEntity.privilege_id }">操作：${privilegeEntity.privilege_operate_name }
               &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                 url链接：${privilegeEntity.privilege_url }
                 </option>
               </c:forEach>
              </select>
            </div>
            &nbsp&nbsp&nbsp-->
           
          </div>
          <br><br>
          <div class="am-form-group">
             <div class="am-u-sm-9">
                <input style="margin-left:15%;" type="submit">
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
