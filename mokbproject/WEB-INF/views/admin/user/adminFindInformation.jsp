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
  <meta charset="utf-8">
  <base href="<%=basePath%>">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>后台管理 会员信息</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="icon" type="image/png" href="css/template/images/favicon.png">
  <link rel="apple-touch-icon-precomposed" href="css/template/images/app-icon72x72@2x.png">
  <meta name="apple-mobile-web-app-title" content="Amaze UI" />
  <link rel="stylesheet" href="css/template/amazeui.min.css"/>
  <link rel="stylesheet" href="css/template/admin.css">
  <script type="text/javascript" src="js/medicinefood/uitl.js"></script>
  <script type="text/javascript">
    function findInformOne(user_basics_id){
    	window.location="<%=basePath%>admin_user/toFindInformationOne?user_basics_id="+user_basics_id;
    }
    
	function showInformation(data){
		var object=data.object;
  		var htmlstr="";
  		var sex="";
  		var age="";
  		var card="";
  		var name="";
  		var tel="";
  		if(object!=null){
  			for(var i=0;i<object.length;i++){
  			if(object[i].information_sex==0){
  			    sex="女";
  			}else if(object[i].information_sex==1){
  				sex="男";
  			}else{
  				sex="未知";
  			}
  			if(object[i].information_age==""||object[i].information_age==null){
  				age="未知";
  			}else{
  				age=object[i].information_age;
  			}
  			if(object[i].information_card==""||object[i].information_card==null){
  				card="未知";
  			}else{
  				card=object[i].information_card;
  			}
  			if(object[i].information_compellation==""||object[i].information_compellation==null){
  				name="未知";
  			}else{
  				name=object[i].information_compellation;
  			}
  			if(object[i].information_phone==""||object[i].information_phone==null){
  				tel="未知";
  			}else{
  				tel=object[i].information_phone;
  			}
  			htmlstr+="<tr>"+
              "<td><input type='checkbox' /></td>"+
              "<td>"+object[i].user_basics_id+"</td>"+
              "<td>"+tel+"</td>"+
              "<td><a style='cursor:pointer' onclick='findInformOne("+object[i].user_basics_id+")'>"+name+"</a></td>"+
              "<td>"+card+"</td>"+
              "<td>"+sex+"</td>"+
              "<td>"+age+"</td>"+
              /* "<td>"+
                "<div class='am-btn-toolbar'>"+
                  "<div class='am-btn-group am-btn-group-xs'>"+
                  "</div>"+
                "</div>"+
              "</td>"+ */
            "</tr>";
            
  			}
  			document.getElementById("textValue").innerHTML=htmlstr;
  			document.getElementById("total_number").innerHTML=i;
  		}else{
  			alert("用户信息");
  		}
  	}
  	function onloadd(){
	  var paramData;
	  var paramData={"1":"1"};                               
	  var object = JSON.stringify(paramData);
	  ajaxPost("<%=basePath%>admin_user/findUserInformation",object,"json","json",showInformation);
	  };
	  window.onload=function(){
	  onloadd();
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
      <div class="am-u-md-6 am-cf">
        <div class="am-fl am-cf">
          <div class="am-btn-toolbar am-fl">
            

            
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
                <th class="user_basics_id">用户编号</th>
                <th class="information_phone">手机号</th>
                <th class="information_compellation">姓名</th>
                <th class="information_card">身份证号</th>
                <th class="information_sex">性别</th>
                <th class="information_age">年龄</th>
              </tr>
          </thead>
          <tbody id="textValue"></tbody>
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
<%@ include file="../template/admin-footer.jsp" %><!-- 底部内容 -->
<script src="js/template/amazeui.min.js"></script>
<script type="text/javascript">
	var width = document.documentElement.clientWidth || document.body.clientWidth;
	$(".admin-content").css("width",width-200);
</script>
</body>
</html>
