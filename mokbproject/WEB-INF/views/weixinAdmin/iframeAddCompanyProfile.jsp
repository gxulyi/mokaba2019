<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../admin/template/admin-header.jsp" %><!-- htnl头部文件 -->
<%@ include file="../admin/template/admin-body-header.jsp" %><!-- 内容头部 -->

<div class="am-cf admin-main">
  <!-- sidebar start -->
  <%@ include file="../admin/template/admin-body-sidebar.jsp" %><!-- 侧边内容 -->
    <!-- sidebar end -->
  <!-- content start -->
  <div class="admin-content">
    <%@ include file="../admin/template/admin-content-heder.jsp" %><!-- body 标题 -->
   <div >
  <img style="width: 40px;height: 40px;cursor: pointer;position: absolute;top: 15px;right: 80px;"onclick="javascript:history.back(-1);" title="返回上一级" alt="" src="images/fhsyj.png">
   <iframe id="iframe" style="border:0; width:100%;background-color:#FFF;"name="iframe" frameborder="0" src="weixinAdminController/AddCompanyProfile">  </iframe>
				 
   </div>
  
  </div>
     
</div>
<%@ include file="../admin/template/admin-footer.jsp" %><!-- 底部内容 -->


<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/polyfill/rem.min.js"></script>
<script src="assets/js/polyfill/respond.min.js"></script>
<script src="assets/js/amazeui.legacy.js"></script>
<![endif]-->

<!--[if (gte IE 9)|!(IE)]><!-->
<script src="js/template/jquery.min.js"></script>
<script src="js/template/amazeui.min.js"></script>
<!--<![endif]-->
<script src="js/template/app.js"></script>
<script type="text/javascript">
	var width = document.documentElement.clientWidth || document.body.clientWidth;
	$(".admin-content").css("width",width-200);
	var height = document.documentElement.clientHeight || document.body.clientHeight;
	$("#iframe").css("height",height-160);
</script>
</body>
</html>
