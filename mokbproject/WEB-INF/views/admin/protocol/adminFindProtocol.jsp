<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ include file="../template/admin-header.jsp" %><!-- htnl头部文件 -->
<!doctype html>
<html class="no-js">
<head>
  <meta charset="utf-8">
  <base href="<%=basePath%>">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>后台管理 服务</title>
  <meta name="description" content="这是一个 查询服务方式 页面">
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
	  function wait(vpi){
	  debugger;
	  var htmlstr="";
	     debugger;
	 	 var htmlstr="";
	 	 var htmlstr2="<option value='0'>所有方式</option>";
	     var listProtocolEntity=vpi.protocolEntityData.listProtocolEntity;
	     if(listProtocolEntity!=null){
	     var lpt=listProtocolEntity;
	     var  statusState = null;
	     for(var i=0;i<lpt.length;i++){
	     /*审核状态*/
	      if(lpt[i].status_state==0){
	         statusState  ="通过";
	      
	      }else if(lpt[i].status_state==1){
	         statusState  ="待审核";
	      }else if(lpt[i].status_state==2){
	         statusState  ="不通过";
	      }else if(lpt[i].status_state==3){
	         statusState  ="删除";
	      }else{
	       statusState ="异常";
	      }
	     
          htmlstr+="<tr>"+
                "<td><input type='checkbox' /></td>"+
                "<td>"+lpt[i].protocol_type+"</td>"+
                "<td>"+lpt[i].protocol_title+"</td>"+
                "<td>"+statusState+"</td>"+
                "<td>"+
                "<div class='am-btn-toolbar'>"+
                "<div class='am-btn-group am-btn-group-xs'>"+
                "<a onclick='findProtocol("+lpt[i].protocol_id+")' class='am-btn am-btn-default am-btn-xs am-text-secondary'><span class='am-icon-pencil-square-o'></span>查看</a>"+
                "<a onclick='updateProtocol("+lpt[i].protocol_id+")' class='am-btn am-btn-default am-btn-xs am-text-secondary'><span class='am-icon-pencil-square-o'></span> 编辑</a>"+
                "<a onclick='deleteProtocol("+lpt[i].protocol_id+")' class='am-btn am-btn-default am-btn-xs am-text-danger'><span class='am-icon-trash-o'></span> 删除</a>"+
                "</div>"+  
                "</div>"+    
                "</td>"+    
                "</tr> "; 
                
		}
		document.getElementById("textValue").innerHTML=htmlstr;
	  }else{
	  alert("暂无服务方式信息");
	  }
	  }
	  
	  function onloadd(){
	  //alert(11);
	  var paramData;
	  var paramData={currentPage:1};                               
	  var object = JSON.stringify(paramData);
	  ajaxPost("<%=basePath%>admin_protocol/findAllProtocol",object,"json","json",wait);
	  };
	  
	  window.onload=function(){
	  	onloadd();
	  };
	  //查询单个协议
	  function findProtocol(protocol_id){
	  var parame="?protocol_id="+protocol_id;
	  //alert(parame);
	  window.location="<%=basePath%>admin_protocol/toAdminFindByIdProtocol"+parame;
	  };
	  
	  
	  //修改协议
	  function updateProtocol(protocol_id){
	  var parame="?protocol_id="+protocol_id;
	  //alert(parame);
	  window.location="<%=basePath%>admin_protocol/toAdminUpdateProtocol"+parame;
	  };
	  
	  //删除协议
	  function deleteProtocol(protocol_id){
	  debugger;
	  var paramData;
	  var paramData={protocol_id:protocol_id};                               
	  var object = JSON.stringify(paramData);
	  if(confirm("确认提交操作吗？")){
	   ajaxPost("<%=basePath%>admin_protocol/deleteProtocol",object,"json","json",wait2);
	  }else{
	    return false;
	    }
	  };
	  function wait2(data){
	  if(data.state==0){
	   alert("删除成功");
	   window.location.reload();
	  }else{
	   alert("删除失败");
	  }
	  	
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
            <div class="am-btn-group am-btn-group-xs">
              <a href="admin_protocol/toAdminAddProtocol" class="am-btn am-btn-default"><span class="am-icon-plus"></span>&nbsp;&nbsp;新增</a>
            </div>
			
           <!--  <div class="am-form-group am-margin-left am-fl" >
              <select id="psType"  onchange="findSomeType(this.value)">
                <option value="">请选择服务类型</option>
              </select>
            </div> -->
            
           
            <!-- <div class="am-form-group am-margin-left am-fl" >
              <select id="psMode" onchange="findSomeMode(this.value)">
                <option value="">请选择服务类型</option>
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
                <th class="protocol_type">协议类型</th>
                <th class="protocol_titile">协议标题</th>
                <th class="status_state">协议状态</th>
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
            </div> -->
            <hr/>
          </form>
        </div>
      </div>
    </div>
  </div>


<%@ include file="../template/admin-footer.jsp" %><!-- 底部内容 -->
<!--[if (gte IE 9)|!(IE)]><!-->
<script src="js/template/jquery.min.js"></script>
<script src="js/template/amazeui.min.js"></script>
<!--<![endif]-->
<script src="js/template/app.js"></script>
<script type="text/javascript">
	var width = document.documentElement.clientWidth || document.body.clientWidth;
	$(".admin-content").css("width",width-200);
</script>
</body>
</html>
