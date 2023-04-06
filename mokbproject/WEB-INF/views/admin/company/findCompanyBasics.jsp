<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ include file="../template/admin-header.jsp" %><!-- htnl头部文件 -->
<!doctype html>
<html>
<head>
<base href="<%=basePath%>">
<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
  <script type="text/javascript" src="js/jquery-form.js" ></script> 
  <script type="text/javascript" src="js/ajax.js"></script>
  <script type="text/javascript" src="js/medicinefood/uitl.js"></script>
  <meta charset="utf-8">
  <base href="<%=basePath%>">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>后台管理 公司审核</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="icon" type="image/png" href="css/template/images/favicon.png">
  <link rel="apple-touch-icon-precomposed" href="css/template/images/app-icon72x72@2x.png">
  <meta name="apple-mobile-web-app-title" content="Amaze UI" />
  <link rel="stylesheet" href="css/template/amazeui.min.css"/>
  <link rel="stylesheet" href="css/template/admin.css">
  <script type="text/javascript">
    function wait(vnl){
	     var htmlstr="";
	     var company_type="";
	     var status_state = "";
	     var object=vnl.object;
	     for(var i=0;i<object.length;i++){
	     var company_lv=object[i].company_lv;
	     switch(company_lv){
	     	case 1:
	     		company_type="总公司";
	     		break;
	     	case 2:
	     		company_type="省级代理商";
	     		break;
	     	case 3:
	     		company_type="地市级代理商";
	     		break;
	     	case 4:
	     		company_type="区县级代理商";
	     		break;
	     	default :
	     		company_type="未知代理商";
	     }
	     if(object[i].status_state==1){
	         status_state="待审核";
	     }else if(object[i].status_state==2){
	         status_state="已拒绝";
	     }else if(object[i].status_state==0){
	         status_state="已通过";
	     }
	     var add_date=parseInt(object[i].add_date)==0||object[i].add_date==null?'————':formatDateTimeStr(object[i].add_date);
	     var examine_date=parseInt(object[i].examine_date)==0||object[i].examine_date==null?'————':formatDateTimeStr(object[i].examine_date);
         var apply_date=parseInt(object[i].apply_date)==0||object[i].apply_date==null?'————':formatDateTimeStr(object[i].apply_date);
          htmlstr+="<tr>"+
                "<td>"+object[i].user_basics_id+"</td>"+
                "<td>"+object[i].company_name+"</td>"+
                "<td>"+object[i].company_telephone+"</td>"+
                "<td>"+company_type+"</td>"+
                "<td>"+formatDateTimeStr(object[i].add_date)+"</td>"+
                "<td>"+object[i].company_address+"</td>"+
               // "<td>"+object[i].company_account+"</td>"+
               // "<td>"+(object[i].company_money).toFixed(2)+"</td>"+
                "<td>"+status_state+"</td>"+
                /* "<td><a style='cursor:pointer' onclick='findNew("+object[i].user_basics_id+")'>"+object[i].user_basics_id+"</a></td>"+ */
                "<td>"+
                "<div class='am-btn-toolbar'>"+
                "<div class='am-btn-group am-btn-group-xs'>";
                if(object[i].status_state==1){
                  htmlstr+="<a onclick='updateState01("+object[i].company_id+")' class='am-btn am-btn-default am-btn-xs am-text-secondary'><span class='am-icon-pencil-square-o'></span> 同意</a>"+
                           "<a onclick='updateState02("+object[i].company_id+")' class='am-btn am-btn-default am-btn-xs am-text-danger'><span class='am-icon-trash-o'></span> 拒绝</a>";
                }
                "</div>"+  
                "</div>"+    
                "</td>"+    
                "</tr> "; 
  			}
  			document.getElementById("textValue").innerHTML=htmlstr;
  			document.getElementById("total_number").innerHTML=i;
  		
  	}
  	//查询全部
  	function onloadd(){
  	  var state=1;
	  var paramData;
	  var paramData={'state':state};                               
	  var object = JSON.stringify(paramData);
	  ajaxPost("<%=basePath%>admin_company/findAllCompanyBasics",object,"json","json",wait);
	  };
	  window.onload=function(){
	  onloadd();
	  };
	  //根据状态条件查询
	  function findState(){
	  	var selectObj = document.getElementById("select");
	  	var index=selectObj.selectedIndex;
	  	var selectedVal = selectObj.options[index].value;
	  	var paramData;
	    var paramData={'state':selectedVal};
	    var object = JSON.stringify(paramData);
	  ajaxPost("<%=basePath%>admin_company/findAllCompanyBasics",object,"json","json",wait);
	  }
	  //通过
	  function updateState01(company_id){
	  	var paramData;
	    var paramData={'company_id':company_id};
	    var object = JSON.stringify(paramData);
	    if(confirm("确认通过该申请吗？")){
	  	    ajaxPost("<%=basePath%>admin_company/updateCompanyBasicsAgree",object,"json","json",wait2);
	  }else{
	    return false;
	    }
	   
	  }
	  //拒绝
	  function updateState02(company_id){
	  	var paramData;
	    var paramData={'company_id':company_id};
	    var object = JSON.stringify(paramData);
	    if(confirm("是否拒绝？")){
	  	   ajaxPost("<%=basePath%>admin_company/updateCompanyBasicsRefuse",object,"json","json",wait2);
	    }else{
	    return false;
	    }
	  }
	  //修改提示框
	function wait2(data){
	  	window.location="<%=basePath%>admin_company/tofindCompanyBasics";
	};
</script>

</head>
<%@ include file="../template/admin-body-header.jsp" %><!-- 内容头部 -->
<body>


<div class="am-cf admin-main">
  <!-- sidebar start -->
  <%@ include file="../template/admin-body-sidebar.jsp" %><!-- 侧边内容 -->
  <!-- sidebar end -->
  <!-- content start -->
  <div class="admin-content">
    <%@ include file="../template/admin-content-heder.jsp" %><!-- body 标题 -->
    <div class="am-g">
      <div class="am-u-md-2 am-cf">
      	<div class="am-fl">
          <div class="am-form-group am-margin-left am-fl">
				<select id="select" onchange="findState()" >
					<option value="1">待审核</option>
					<option value="0">已通过</option>
					<option value="2">已拒绝</option>
				</select>
			</div> 
        </div>
      </div>
    </div>
    <div class="am-g">
      <div class="am-u-sm-12">
        <form class="am-form">
          <table id="yhk" class="am-table am-table-striped am-table-hover table-main">
            <thead>
              <tr>
                <th class="table-i">经理编号</th>
                <th class="table-name">公司名称</th>
				<th class="table-title">公司电话</th>
				<th class="table-type">公司类型</th>
				<th class="table-type">添加时间</th>
				<th class="table-type">公司所在地</th>
				<!-- 
				<th class="table-author">公司账户</th>
				<th class="table-author">公司账户余额(元)</th>
				 -->
				<th class="table-type">公司状态</th>
				<th class="table-author">操作</th>
              </tr>
          </thead>
          <tbody id="textValue"></tbody>
        </table>
           <div class="am-cf">
                            共<span id="total_number"></span>条记录
              <div class="am-fr">
                <ul class="am-pagination">
                  <li class="am-disabled"><a href="javascript:void(0);">«</a></li>
                  <li class="am-active"><a href="javascript:void(0);">1</a></li>
                  <li><a href="javascript:void(0);">2</a></li>
                  <li><a href="javascript:void(0);">3</a></li>
                  <li><a href="javascript:void(0);">4</a></li>
                  <li><a href="javascript:void(0);">5</a></li>
                  <li><a href="javascript:void(0);">»</a></li>
                </ul>
              </div>
            </div>
            <hr />
          </form>
        </div>
      </div>
  </div>
  <%@ include file="../template/admin-footer.jsp" %><!-- 底部内容 -->
</div>

<script src="js/template/amazeui.min.js"></script>
<script type="text/javascript">
	var width = document.documentElement.clientWidth || document.body.clientWidth;
	$(".admin-content").css("width",width-200);
</script>
</body>
</html>
