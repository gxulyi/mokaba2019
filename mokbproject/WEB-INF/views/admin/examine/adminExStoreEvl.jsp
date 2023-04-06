<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ include file="../template/admin-header.jsp" %><!-- htnl头部文件 -->
<!doctype html>
<html class="no-js">
<head>
  <meta charset="utf-8">
  <base href="<%=basePath%>">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>后台管理 商城</title>
  <meta name="description" content="这是一个 查询商品 页面">
  <meta name="keywords" content="index">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="icon" type="image/png" href="css/template/images/favicon.png">
  <link rel="apple-touch-icon-precomposed" href="css/template/images/app-icon72x72@2x.png">
  <meta name="apple-mobile-web-app-title" content="Amaze UI" />
  <link rel="stylesheet" href="css/template/amazeui.min.css"/>
  <link rel="stylesheet" href="css/template/admin.css">
  <script type="text/javascript" src="js/medicinefood/uitl.js"></script>
  <script type="text/javascript" src="js/ajax.js"></script>
  <script type="text/javascript" src="js/paging.js"></script>
  <script type="text/javascript">
  //同意通过status_state=0 //不同意通过status_state=2
	function exsevl(evaluation_id,status_state){
		var paramData;
	    var paramData={status_state:status_state,evaluation_id:evaluation_id};                               
	    var object = JSON.stringify(paramData);
	    
	     if(confirm("确认执行这个操作吗？")){
	       ajaxPost("<%=basePath%>admin_examine/adminExsevl",object,"json","json",aggreeSuccess);
	  }else{
	    return false;
	    }
	}
	
	function aggreeSuccess(vsi){
		if(vsi.state==0){
			alert("成功！");
		}else  {
			alert("失败！");
		}
	   location.reload() ;
	}
	//展示需要审核的商品
	function showEvaluation(data){
	 	//alert(JSON.stringify(data.sed.listStoreEvaluation));
	 	var listEvaluation=data.sed.listStoreEvaluation;
	 	if(listEvaluation.length==0){
	 		return;
	 	}
	 	var htmlstr="";
	 	for(var i=0;i<listEvaluation.length;i++){
	 		 htmlstr+="<tr>"+
                "<td><input type='checkbox' /></td>"+
                "<td>"+listEvaluation[i].evaluation_id+"</td>"+
                "<td>"+listEvaluation[i].store_name+"</td>"+
                "<td>"+listEvaluation[i].weixin_nickname+"</td>"+
                "<td>"+formatDateTimeStr(listEvaluation[i].evaluation_date)+"</td>"+
                /* "<td>"+listEvaluation[i].evaluation_value+"</td>"+ */
                "<td>"+listEvaluation[i].user_basics_id+"</td>"+
                "<td>"+
                "<div class='am-btn-toolbar'>"+
                "<div class='am-btn-group am-btn-group-xs'>"+
                "<a onclick='exsevl("+listEvaluation[i].evaluation_id+","+0+")' class='am-btn am-btn-default am-btn-xs am-text-secondary'><span class='am-icon-pencil-square-o'></span> 同意通过</a>"+
                "<a onclick='exsevl("+listEvaluation[i].evaluation_id+","+2+")' class='am-btn am-btn-default am-btn-xs am-text-danger'><span class='am-icon-trash-o'></span> 不同意通过</a>"+
                "</div>"+  
                "</div>"+    
                "</td>"+    
                "</tr> ";
	 	}
	 	 document.getElementById("textValue").innerHTML=htmlstr;
	 	
	 }
	function onloadd(){
	 	//alert(store_id);
	    var paramData;
	    var paramData={status_state:1};                               
	    var object = JSON.stringify(paramData);
	    ajaxPost("<%=basePath%>admin_store/findEvaluation",object,"json","json",showEvaluation);
	    };
	 window.onload=function(){
	  onloadd();
	 };
    </script>
</head>
<body>
<input type='hidden' id="currentPage" value=""/>

<%@ include file="../template/admin-body-header.jsp" %><!-- 内容头部 -->

<div class="am-cf admin-main">
  <!-- sidebar start -->
   <%@ include file="../template/admin-body-sidebar.jsp" %><!-- 侧边内容 -->
  <!-- sidebar end -->
  <!-- content start -->
  <div class="admin-content">
    <%@ include file="../template/admin-content-heder.jsp" %><!-- body 标题 -->
    <div class="am-g">
      <div class="am-u-md-6 am-cf">
        <div class="am-fl am-cf">
          <div class="am-btn-toolbar am-fl">
            <!-- <div class="am-btn-group am-btn-group-xs">
              <a href="admin_store/toAddStore" class="am-btn am-btn-default"><span class="am-icon-plus"></span>&nbsp;&nbsp;新增</a>
            </div> -->

            <!-- <div class="am-form-group am-margin-left am-fl">
              <select onchange="findStore01(this.value)">
                <option value="">所有类别</option>
                <option value="0">服务类</option>
                <option value="1">定制</option>
              </select>
            </div> -->
          </div>
        </div>
      </div>
      <div class="am-u-md-3 am-cf">
			<div class="am-fr">
				<div class="am-input-group am-input-group-sm" style="position: relative;">
					<input type="text" class="am-form-field" style="border:1px solid #333;border-radius:5px 0 0 5px;">
					 <span class="am-input-group-btn"> 
					 	<a class="am-btn" style="width:40px;height: 37px;border:1px solid #333;border-radius:0 5px 5px 0;" type="button">
							<img style="width:25px;height:25px;cursor: pointer;position: absolute;top:5px;right:5px;z-index: 100;" alt="" src="images/sousuo1.png">
						</a>
					</span>
				</div>
			</div>
		</div>
      <!-- <div class="am-u-md-3 am-cf">
        <div class="am-fr">
          <div class="am-input-group am-input-group-sm">
            <input type="text" class="am-form-field">
                <span class="am-input-group-btn">
                  <button class="am-btn am-btn-default" type="button">搜索</button>
                </span>
          </div>
        </div>
      </div> -->
    </div>
    
      <div class="am-g" style="margin-top:10px;">
      <div class="am-u-sm-12">
        <form class="am-form">
          <table id="yhk" class="am-table am-table-striped am-table-hover table-main">
            <thead>
              <tr>
                <th class="table-check"><input type="checkbox" /></th>
                <th class="evaluation_id">评论编号</th>
                <th class="store_name">商品名称</th>
                <th class="weixin_nickname">微信昵称</th>
                <th class="evaluation_date">评论时间</th>
                <!-- <th class="evaluation_value">评论内容</th> -->
                <th class="user_basics_id">评论人编号</th>
                <th class="status_state">状态</th>
              </tr>
          </thead>
          <tbody id="textValue">
           
          </tbody>
        </table>
        	<!-- 页面分页 开始 -->
						<!-- <div class="am-cf">
							共<span id="total_number"></span>条记录
							<div class="am-fr" id="page_tatal">
								<ul class="am-pagination">
									
								</ul>
							</div>
						</div> -->
		   <!-- 页面分页 结束 -->
           <!-- <div class="am-cf">
                                         共<span id="total_number"></span>条记录
              <div class="am-fr" id="page_tatal">
              
                <ul class="am-pagination">
                
                  <li class="am-disabled"><a href="#">«</a></li>
                  <li><a href="#"  type="hidden">... ...</a></li>
                  <li><a href="#">1</a></li>
                  <li><a href="#">2</a></li>
                  <li><a href="#">3</a></li>
                  <li><a href="#">... ...</a></li>
                  <li><a href="#">»</a></li>
                  <li style="margin:-1.5rem 0;">
                   
                  <form>
                 
                  <a style="width:55%;float:left;float:bottom;border:none;">第<input style="width:50%;line-height:1"/>页  共<span id="total_pages">50</span>页</a>
                  <a style="width:40%;float:left;border:none;"><button style="line-height:1" onclick="alert(1)">确定</button></a>
                  
                  </form>
                  </li>
                </ul> 
              </div>
            </div>-->
            <hr/>
          </form>
        </div>

      </div>
     
  </div>
  <%@ include file="../template/admin-footer.jsp" %><!-- 底部内容 -->
</div>


<!--[if (gte IE 9)|!(IE)]><!-->
<script src="js/template/jquery.min.js"></script>
<script src="js/template/amazeui.min.js"></script>
<!--<![endif]-->
<script src="js/template/app.js"></script>
<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
<script type="text/javascript">
	var width = document.documentElement.clientWidth || document.body.clientWidth;
	$(".admin-content").css("width",width-200);
</script>
</body>
</html>
