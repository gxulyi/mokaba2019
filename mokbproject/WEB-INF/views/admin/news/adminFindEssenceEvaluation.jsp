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
  <script type="text/javascript" src="js/medicinefood/uitl.js"></script>
  <title>后台管理 查询精华评论</title>
  <script type="text/javascript">
  	 
  	 function wait(){
  	 	alert("删除成功");
  	 	window.location="<%=basePath%>admin_store/toFindStore";
  	 }
  	 function deleteEvaluation(evaluation_id){
  	 	//alert(evaluation_id);
	    var paramData={evaluation_id:evaluation_id};                               
	    var object = JSON.stringify(paramData);
	    ajaxPost("<%=basePath%>admin_store/deleteEvaluation",object,"json","json",wait);
	    };
	 function showEvaluation(data){
	 	//alert(JSON.stringify(data.sed.listStoreEvaluation));
	 	var listEvaluation=data.sed.listStoreEvaluation;
	 	var htmlstr="";
	 	for(var i=0;i<listEvaluation.length;i++){
	 		 htmlstr+="<tr>"+
              "<td style='width:78% '>"+
              "<div>"+
              "<div >"+
              "<p style='font-size: 18px;line-height: 1.2; margin-bottom: 0px'>"+
              "<span>&nbsp&nbsp&nbsp&nbsp</span>"+
              ""+listEvaluation[i].evaluation_value+""+
              "</p>"+
               "<img style='width: 50px;height: 50px;' src='file/jointly/images/banner/banner1.png'>"+
               "<img style='width: 50px;height: 50px;' src='file/jointly/images/banner/banner2.png'>"+
               "<img  style='width: 50px;height: 50px;' src='file/jointly/images/banner/banner3.png'>"+
              "<div style='float: inherit;'>"+
                  "<span><a id='weixin_nickname'>"+listEvaluation[i].weixin_nickname+"</a ></span>&nbsp"+
                  "<span><a id='evaluation_date'>"+formatDateTimeStr(listEvaluation[i].evaluation_date)+"</a></span> &nbsp"+
                  "<span><a onclick='deleteEvaluation("+listEvaluation[i].evaluation_id+")'>删除</a></span>&nbsp"+
             "</div>"+
              "</div>"+
              "</div>"+
              "</td>"+
              "<td style='text-align:center;line-height:200%' >"+
               "商品名称：<span id='store_name'>"+listEvaluation[i].store_name+"</span>"+
              "</td>"+
            "</tr>";
	 	}
	 	 document.getElementById("textValue").innerHTML=htmlstr;
	 	
	 }
	 function onloadd(){
	 	var news_id=document.getElementById("news_id11").value;
	 	//alert(news_id);
	    var paramData;
	    var paramData={news_id:news_id};                               
	    var object = JSON.stringify(paramData);
	    ajaxPost("<%=basePath%>admin_store/findEvaluation",object,"json","json",showEvaluation);
	    };
	 window.onload=function(){
	  onloadd();
	 };
  </script>
  <meta name="description" content="这是一个 精华评论 页面">
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
  <!-- sidebar start -->
  <%@ include file="../template/admin-body-sidebar.jsp" %><!-- 侧边内容 -->
  <!-- sidebar end -->
  <!-- content start -->
  <div class="admin-content">
    <%@ include file="../template/admin-content-heder.jsp" %><!-- body 标题 -->
   <img style="width: 40px;height: 40px;cursor: pointer;position: absolute;top: 15px;right: 80px;"onclick="javascript:history.back(-1);" title="返回上一级" alt="" src="images/fhsyj.png">
    <div class="am-g">

     
	
		<input hidden="hidden" id="news_id11" name="store_id11" type="email" id="user-email" placeholder="商品价格" value="${news_id}">
	
     <div class="am-g">
      <div class="am-g">
      <div class="am-u-sm-12" style="padding:50px">
        <form class="am-form">
          <table class="am-table am-table-striped am-table-hover table-main">
            <!--  <thead>
              <tr>
                <th class="table-check"><input type="checkbox" /></th>
                <th class="table-id">商品编号</th>
                <th class="table-title">商品名称</th>
                <th class="table-type">微信昵称</th>
                <th class="table-author">评论时间</th>
                 <th class="table-author">商品图片</th>
                <th class="table-author">评论内容</th>
                <th class="table-date">上级</th>
                <th class="table-date">阅读量</th>
                <th class="table-set">操作</th>
              </tr>
          </thead>-->
          <tbody id="textValue">
          <!-- 
             <tr>
              <td style="width:78% ">
              <div>
              <div >
               
              <p style="font-size: 18px;line-height: 1.2; margin-bottom: 0px">
              <span>&nbsp&nbsp&nbsp&nbsp</span>
              sdfsfs-----------------------------------------------------
              </p>
               <img style="width: 50px;height: 50px;" src="file/jointly/images/banner/banner1.png">
               <img style="width: 50px;height: 50px;" src="file/jointly/images/banner/banner2.png">
                <img  style="width: 50px;height: 50px;" src="file/jointly/images/banner/banner3.png">
              
              <div style="float: inherit;">
                  <span><a id="weixin_nickname">评论人</a ></span>&nbsp
                  <span><a id="evaluation_date">评论时间</a></span> &nbsp
                  <span><a>删除</a></span>&nbsp
             </div>
              </div>
              </div>
              </td>
              <td style="text-align:center;line-height:200%" >
                                         商品名称：<span id="store_name">尊享包</span>
              </td>
            </tr>
             -->
          </tbody>
        </table>
           <div class="am-cf">
                                         共<span id="total_number"></span>条记录
              <div class="am-fr">
                <ul class="am-pagination">
                  <li class="am-disabled"><a href="#">«</a></li>
                  <li class="am-active"><a href="#">1</a></li>
                  <li><a href="#">2</a></li>
                  <li><a href="#">3</a></li>
                  <li><a href="#">4</a></li>
                  <li><a href="#">5</a></li>
                  <li><a href="#">»</a></li>
                </ul>
              </div>
            </div>
            <hr />
            <p>注：.....</p>
          </form>
        </div>

      </div>
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
