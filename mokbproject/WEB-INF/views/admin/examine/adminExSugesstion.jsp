<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ include file="../template/admin-header.jsp" %><!-- htnl头部文件 -->
<!doctype html>
<html class="no-js">
<head>
  <meta charset="utf-8">
  <base href="<%=basePath%>">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>后台管理 意见审核</title>
  <meta name="description" content="这是一个 查询意见 页面">
  <meta name="keywords" content="index">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="icon" type="image/png" href="css/template/images/favicon.png">
  <link rel="apple-touch-icon-precomposed" href="css/template/images/app-icon72x72@2x.png">
  <meta name="apple-mobile-web-app-title" content="Amaze UI" />
  <link rel="stylesheet" href="css/template/amazeui.min.css"/>
  <link rel="stylesheet" href="css/template/admin.css">
  <script type="text/javascript" src="js/ajax.js"></script>
  <script type="text/javascript" src="js/paging.js"></script>
  <script type="text/javascript" src="js/medicinefood/uitl.js"></script>
  <script type="text/javascript">
	
	
	  function wait(voi){
	  debugger;
	  //alert(JSON.stringify(voi));
	//  var currentPage=vsi.map.currentPage;
	  //var totalNumber=vsi.map.totalNumber;
	 // alert(vsi.map.totalNumber);
	 // var totalPages=vsi.map.total_pages;
	  // alert(vsi.currentPage);	
	  var htmlstr="";
	     var SuggestionsOpinionData =voi.sop;
	     var suggestionsOpinion=SuggestionsOpinionData.suggestionsOpinion;
	     var suggestionsOpinionList=SuggestionsOpinionData.listSuggestionsOpinion;
	     
	     if(suggestionsOpinionList!=null||suggestionsOpinionList.size()!=0){
	     var sugOpinion=suggestionsOpinionList;
	     for(var i=0;i<sugOpinion.length;i++){
          htmlstr+="<tr>"+
                "<td><input type='checkbox' /></td>"+
                "<td>"+sugOpinion[i].opinion_id+"</td>"+
                "<td>"+sugOpinion[i].user_basics_id+"</td>"+
                "<td>"+sugOpinion[i].tel_phone+"</td>"+
               /*  "<td>"+sugOpinion[i].suggest_opinion+"</td>"+ */
                 "<td>"+sugOpinion[i].star_level+"</td>"+
                "<td>"+formatDateTimeStr(sugOpinion[i].add_date)+"</td>"+
                "<td>"+
                "<div class='am-btn-toolbar'>"+
                "<div class='am-btn-group am-btn-group-xs'>"+
                "<a onclick='examState("+sugOpinion[i].opinion_id+","+0+")' class='am-btn am-btn-default am-btn-xs am-text-secondary'><span class='am-icon-pencil-square-o'></span> 通过</a>"+
                "<a onclick='examState("+sugOpinion[i].opinion_id+","+2+")' class='am-btn am-btn-default am-btn-xs am-text-danger'><span class='am-icon-pencil-square-o'></span> 拒绝</a>"+
                "<a onclick='examState("+sugOpinion[i].opinion_id+","+3+")' class='am-btn am-btn-default am-btn-xs am-text-danger'><span class='am-icon-pencil-square-o'></span> 删除</a>"+
                
                "</div>"+  
                "</div>"+    
                "</td>"+    
                "</tr> ";  
		}
		document.getElementById("textValue").innerHTML=htmlstr;
	   // document.getElementById("total_number").innerHTML=totalNumber;
	   
	//	var html2=pagings(currentPage,totalPages);
		
      // document.getElementById("page_tatal").innerHTML=html2;
       //document.getElementById("page_index").value=currentPage;
       //document.getElementById("currentPage").value=currentPage;
	  }else{
	  alert("暂无商品信息");
	  }
	  }
	  
	  function onloadd(){
	 // alert(11);
	  var paramData;
	  var paramData={erter:"wertewr"};                               
	  var object = JSON.stringify(paramData);
	  ajaxPost("<%=basePath%>admin_examine/adminExamineBySugesstion",object,"json","json",wait);
	  };
	  window.onload=function(){
	   
	  onloadd();
	  };
	
	  //未通过审核 status_state=2
	  //通过审核    status_state=0
	  function examState(opinion_id,status_state){
	  //debugger;
	  //alert(store_id);
	  var paramData;
	  var paramData={opinion_id:opinion_id,status_state:status_state};                               
	  var object = JSON.stringify(paramData);
	  if(confirm("确认执行此操作吗？")){
	    ajaxPost("<%=basePath%>admin_examine/updateSugByStatus",object,"json","json",wait2);
	    return true;
	  }else{
	    return false;
	    }
	  
	  //location.reload() ;
	  }; 
	  function wait2(data){
	  	//alert(JSON.stringify(data.object.status_state));
	  	if(data.object.status_state == 0){
	  		alert("意见审核通过");
	  	}else if(data.object.status_state == 2){
	  		alert("意见审核拒绝");
	  	}else if(data.object.status_state == 3){
	     	alert("意见审核删除");
	  	}else{
	  	    alert("意见审核状态0:运行，1：待审核，2：拒绝，3：删除");
	  	}
	  	location.reload() ;
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
              <a href="admin_store/toAddStore"class="am-btn am-btn-default"><span class="am-icon-plus"></span>&nbsp;&nbsp;新增</a>
            </div> -->

            <!-- <div class="am-form-group am-margin-left am-fl">
              <select onchange="findStore01(this.value)">
                <option value="1">待审核</option>
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
                <th class="table-id">意见编号</th>
                <th class="table-title">用户编号</th>
                <th class="table-type">联系方式</th>
               <!--  <th class="table-author">意见内容</th> -->
                <th class="table-author">星级</th>
                <th class="table-date">添加时间</th>
                <th class="table-set">操作</th>
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
             <!--<div class="am-cf">
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
            </div>  -->
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
