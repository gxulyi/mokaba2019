<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>


<%
  // 将请求、响应的编码均设置为UTF-8（防止中文乱码）
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
List<HashMap<String, Object>> listMap=null;
listMap=(List<HashMap<String, Object>>)request.getAttribute("listMap");
 %>

   
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
 <base href="<%=basePath%>">
    <title>添加商品页面</title>
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
    <script type="text/javascript">
	function callBack(data){
     if(data.state == 0){
		  alert(data.message);
	  }else if(data.state ==1){
		   alert(data.message);
		}else{
			alert("商品添加失败，数据请求异常，请联系管理员！");
		}
	      window.parent.location.href="<%=basePath%>admin/shops_index";
	 }
	  /*新增商品*/
	  function addstore(){
	      var store_picture=document.getElementById("sver_picture").value;
	      if(store_picture==null){
	      alert("请点击上传图片");
	      return;
	      }
          obj = document.getElementsByName("check_server");
    	  check_val ="";
  	      for(i in obj){
           if(obj[i].checked){
           		if(check_val==""){
           			check_val=obj[i].value;
           		}else{
           			check_val+=";"+obj[i].value;
           		}
           }
    	  }
    	 //debugger;
		  /*需要做判断的参数*/
		  var store_type = document.getElementById("store_type").value;//商品类型
		  var prime_price = document.getElementById("prime_price").value;//商品原价
          var store_price = document.getElementById("store_price").value;//商品实际销售价
	      var store_name = document.getElementById("store_name").value;//商品名称
	      var isPost = document.getElementById("is_post").value;//是否包邮
	      var net_weight = document.getElementById("net_weight").value;//商品净含量
	      var sales_num = document.getElementById("sales_num").value; //销售量
	      var stock_num = document.getElementById("stock_num").value;//库存量
	      var start_date = "2018/11/12 12:00"; //开始日期
	      var end_date = "2018/11/13 13:00";//结束日期
	      var full_money  = 0;//满减所需(使用券)商品总价
	      var give_money  = 0;//赠送金额
	      var required_integral = 0; //所需积分
	      var store_intro = UE.getEditor('editor').getContent();//商品介绍
	       /*
	       	验证数字的正则表达式集 
				验证数字：^[0-9]*$ 
				验证n位的数字：^\d{n}$ 
				验证至少n位数字：^\d{n,}$ 
				验证m-n位的数字：^\d{m,n}$ 
				验证零和非零开头的数字：^(0|[1-9][0-9]*)$ 
				验证有两位小数的正实数：^[0-9]+(.[0-9]{2})?$ 
				验证有1-3位小数的正实数：^[0-9]+(.[0-9]{1,3})?$ 
				验证非零的正整数：^\+?[1-9][0-9]*$ 
				验证非零的负整数：^\-[1-9][0-9]*$ 
				验证非负整数（正整数 + 0） ^\d+$ 
				验证非正整数（负整数 + 0） ^((-\d+)|(0+))$ 
				验证长度为3的字符：^.{3}$ 
				验证由26个英文字母组成的字符串：^[A-Za-z]+$ 
				验证由26个大写英文字母组成的字符串：^[A-Z]+$ 
				验证由26个小写英文字母组成的字符串：^[a-z]+$ 
				验证由数字和26个英文字母组成的字符串：^[A-Za-z0-9]+$ 
				验证由数字、26个英文字母或者下划线组成的字符串：^\w+$ 
				验证用户密码:^[a-zA-Z]\w{5,17}$ 正确格式为：以字母开头，长度在6-18之间，只能包含字符、数字和下划线。 
				验证是否含有 ^%&',;=?$\" 等字符：[^%&',;=?$\x22]+ 
				验证汉字：^[\u4e00-\u9fa5],{0,}$ 
				验证Email地址：/^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/
				验证InternetURL：^http://([\w-]+\.)+[\w-]+(/[\w-./?%&=]*)?$ ；^[a-zA-z]+://(w+(-w+)*)(.(w+(-w+)*))*(?S*)?$ 
				验证电话号码：^(\(\d{3,4}\)|\d{3,4}-)?\d{7,8}$：--正确格式为：XXXX-XXXXXXX，XXXX-XXXXXXXX，XXX-XXXXXXX，XXX-XXXXXXXX，XXXXXXX，XXXXXXXX。 
				验证身份证号（15位或18位数字）：^\d{15}|\d{}18$ 
				验证一年的12个月：^(0?[1-9]|1[0-2])$ 正确格式为：“01”-“09”和“1”“12” 
				验证一个月的31天：^((0?[1-9])|((1|2)[0-9])|30|31)$ 正确格式为：01、09和1、31。 
				整数：^-?\d+$ 
				非负浮点数（正浮点数 + 0）：^\d+(\.\d+)?$ 
				正浮点数 ^(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$ 
				非正浮点数（负浮点数 + 0） ^((-\d+(\.\d+)?)|(0+(\.0+)?))$ 
				负浮点数 ^(-(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*)))$ 
				浮点数 ^(-?\d+)(\.\d+)?$
	       */
	      var  reg =/^[0-9]+(.[0-9]{0,3})?$/;
	      /*根据商品类型不同，会出现对应类型值为空的情况**/
	       
	       if(store_type == ''|| store_type == undefined || store_type == null){
	        alert("请选择商品类型");
	        return;
	      }
	       if(store_name  == ''|| store_name == undefined || store_name == null){
	        alert("请输入商品名称");
	        return;
	      }	
	       if(prime_price ==  ''|| prime_price == undefined || prime_price == null  ){
	        alert("请输入商品原价");
	        return;
	      }else{
	      	if(!reg.test(prime_price)){
	          alert("请输入正确的商品原价");
	          return;
	        }
	      }
	      //alert(typeof(0));
	      if(store_price == ''|| store_price == undefined || store_price == null){
	        alert("请输入商品销售价");
	        return;
	      }else {
	      	if(!reg.test(store_price)){
	          alert("您输入商品销售价有误，请重新输入");
	          return;
	        }
	      }
	      
	       if(is_post == ''|| is_post == undefined || is_post == null){
	        alert("请选择商品是否包邮");
	        return;
	      }
	      
	      if(net_weight == ''|| net_weight == undefined || net_weight == null){
	        alert("请输入商品净含量");
	        return;
	      }else{
	      	if(!reg.test(net_weight)){
	          alert("您输入商品净含量有误，请重新输入");
	          return;
	        }
	      }
	      if(sales_num ==''|| sales_num == undefined || sales_num == null){
	        alert("请输入商品销售量");
	        return;
	      }else{
	      	if(!reg.test(sales_num)){
	          alert("您输入商品销售量有误，请重新输入");
	          return;
	        }	
	      }
	      if(stock_num ==''|| stock_num == undefined || stock_num == null){
	        alert("请输入商品库存量");
	        return;
	      }else{
	      	if(!reg.test(stock_num)){
	          alert("您输入商品库存量有误，请重新输入 ");
	          return;
	        }
	      }
	      if(store_type  == 2){
	      	 full_money  = document.getElementById("full_money").value;//满减所需(使用券)商品总价
	         give_money  = document.getElementById("give_money").value;//赠送金额
	      	 
	      	 if(full_money ==''|| full_money == undefined || full_money == null){
		        alert("请输入商品满减总价");
		        return;
		      }else{
		      	if(!reg.test(full_money)){
		          alert("您输入满减总价有误，请重新输入");
		          return;
		        }
		      }
	      	 if(give_money ==''|| give_money == undefined || give_money == null){
		        alert("请输入商品赠送金额");
		        return;
		      }else{
		      	if(!reg.test(give_money)){
		          alert("您输入商品赠送金额有误，请重新输入");
		          return;
		        }
		      }	
	       }else if(store_type == 3){
	          required_integral  = document.getElementById("required_integral").value; //所需积分
	          
	          if(required_integral ==''|| required_integral == undefined || required_integral == null){
		        alert("请输入所需积分");
		        return;
		      }else{
		      	if(!reg.test(required_integral)){
		          alert("您输入所需积分有误，请重新输入");
		          return;
		        }
		      }		
	      }else if(store_type == 4){
	          start_date  = document.getElementById("start_date").value; //所需积分
	          end_date  = document.getElementById("end_date").value; //所需积分
	          if(start_date ==''|| start_date == undefined || start_date == null){
		        alert("请输入开始日期");
		        return;
		      }	
		       if(end_date ==''|| end_date == undefined || end_date == null){
		        alert("请输入结束日期日期");
		        return;
		      }		
	      }
	      
	      if(store_intro  ==''|| store_intro == undefined || store_intro == null){
	        alert("请输入商品简介");
	        return;
	      }
	      /*将日期格式转成时间戳*/
	      var sdate = new Date(start_date+":00".split("T"));
	      var edate = new Date(end_date+":00".split("T"));
	      var startTime = sdate.getTime();
	      var endTime = edate.getTime();
	      /*拼接jsondata参数*/
	      var paramData;
	 	  var paramData={store_price:store_price,store_picture:store_picture,store_intro:store_intro,
	 	                 store_name:store_name,store_type:store_type,prime_price:prime_price,net_weight:net_weight,
	 	                 sales_num:sales_num,stock_num:stock_num,full_money:full_money,give_money:give_money,required_integral:required_integral,start_date:startTime,end_date:endTime,is_post:isPost};                
	  	  var object = JSON.stringify(paramData);
	  	  //alert(object);
	 	  ajaxPost("<%=basePath%>/admin_store/addStore",object,"json","json",callBack);
	  }
	/* $("#tutor_num").change(function(){
	alert($(this).children('option:selected').val());
	}); */
	/*选择商品类型*/
	function selectType(store_type) {
		if(store_type==1){
		  /*store_type==1 为原价商品，商品默认类型为原价商品*/
		  	document.getElementById("fulls_money").style.display="none";
		  	document.getElementById("gives_money").style.display="none";
		  	document.getElementById("requireds_integral").style.display="none";
		  	document.getElementById("start_dates").style.display="none";
		  	document.getElementById("end_dates").style.display="none";
		}else if(store_type == 2){
		/*store_type==2 为满送(使用券)商品*/
		    document.getElementById("requireds_integral").style.display="none";
		    document.getElementById("gives_money").style.display="";
		  	document.getElementById("fulls_money").style.display="";
		  	document.getElementById("start_dates").style.display="none";
		  	document.getElementById("end_dates").style.display="none";
		}else if(store_type == 3){
			/*store_type==3 为积分商品，只允许通过积分兑换*/
			document.getElementById("gives_money").style.display="none";
		  	document.getElementById("fulls_money").style.display="none";
		  	document.getElementById("requireds_integral").style.display="";
		  	document.getElementById("start_dates").style.display="none";
		  	document.getElementById("end_dates").style.display="none";
		  	/*store_type==4 为限时抢购*/
		}else if(store_type == 4){
			document.getElementById("fulls_money").style.display="none";
		  	document.getElementById("gives_money").style.display="none";
		  	document.getElementById("requireds_integral").style.display="none";
			document.getElementById("start_dates").style.display="";
		  	document.getElementById("end_dates").style.display="";
		
		}
		
    };
</script>
<body>
<div class="margin">
<label style="margin-left: 10px;">商品类型：</label>
<select id="store_type" name="store_type" style="margin-left: 5px;" onchange="selectType(this.value)">
	<option value="">请选择商品类型</option>
	<option value="1">原价商品</option>
	<option value="2">满送(使用券)商品</option>
	<option value="3">积分商品</option>
	<option value="4">限时抢购</option>
</select>
<form  id="formid">
<div class="add_style">
 <ul>
<!--   <li class="clearfix" id="tutor_name" style="display:none"><label class="label_name col-xs-1"><i>  </i>导师姓名：&nbsp;&nbsp;</label><div  class="Add_content col-xs-11"><input id="tutor_name1" name="title" type="text" data-title=""  class=""/><input id="tutor_name2" name="title" type="text" data-title=""  class=""/></div></li>
 -->  
  <li class="clearfix"><label class="label_name col-xs-1"><i>*</i>商品名称：&nbsp;&nbsp;</label><div  class="Add_content col-xs-11"><input id="store_name" name="title" type="text" data-title="商品名称"  class="col-xs-6"/></div></li>
  <li class="clearfix"><label class="label_name col-xs-1"><i>*</i>商品原价：&nbsp;&nbsp;</label><div  class="Add_content col-xs-11"><input id="prime_price" name="prime_price" type="text"  data-author="商品原价"  class="col-xs-6"/></div></li>
  <li class="clearfix"><label class="label_name col-xs-1"><i>*</i>销售价：&nbsp;&nbsp;</label><div  class="Add_content col-xs-11"><input id="store_price" name="store_price" type="text"  data-author="商品销售价"  class="col-xs-6"/></div></li>
  <li class="clearfix"><label class="label_name col-xs-1"><i>*</i>净含量：&nbsp;&nbsp;</label><div  class="Add_content col-xs-11"><input id="net_weight" name="net" type="text"  data-author="净含量"  class="col-xs-6"/></div></li>
  <li class="clearfix"><label class="label_name col-xs-1"><i>*</i>销售量：&nbsp;&nbsp;</label><div  class="Add_content col-xs-11"><input id="sales_num" name="sales" type="text"  data-author="销售量"  class="col-xs-6"/></div></li>
  <li class="clearfix"><label class="label_name col-xs-1"><i>*</i>库存量：&nbsp;&nbsp;</label><div  class="Add_content col-xs-11"><input id="stock_num" name="stock" type="text"  data-author="库存量"  class="col-xs-6"/></div></li>
  <li class="clearfix"><label class="label_name col-xs-1"><i>*</i>是否包邮：&nbsp;&nbsp;</label>
	 <div  class="Add_content col-xs-11">
	    <select name="is_post" id="is_post" class="text_add" style="width:180px" class="col-xs-6">
         <option value="">请选择商品是否包邮</option>
         <option value="1">不包邮</option>
         <option value="0">包邮</option>
       </select>
	 </div>
  </li>
  <li class="clearfix" id="fulls_money"><label class="label_name col-xs-1"><i>*</i>满减价：&nbsp;&nbsp;</label><div  class="Add_content col-xs-11"><input id="full_money" name="full_money" type="text"  data-author="满减价"  class="col-xs-6"/></div></li>
  <li class="clearfix" id="gives_money"><label class="label_name col-xs-1"><i>*</i>赠送金额：&nbsp;&nbsp;</label><div  class="Add_content col-xs-11"><input id="give_money" name="full_money" type="text"  data-author="赠送金额"  class="col-xs-6"/></div></li>
  <li class="clearfix" id="requireds_integral"><label class="label_name col-xs-1"><i>*</i>所需积分：&nbsp;&nbsp;</label><div  class="Add_content col-xs-11"><input id="required_integral" name="required_integral" type="text"  data-author="所需积分"  class="col-xs-6"/></div></li>
  <li class="clearfix" id="start_dates"><label class="label_name col-xs-1"><i>*</i>开始时间：&nbsp;&nbsp;</label><div  class="Add_content col-xs-11"><input id="start_date" name="start_date" type="datetime-local"  data-author="开始时间"  class="col-xs-6"/></div></li>
  <li class="clearfix" id="end_dates"><label class="label_name col-xs-1"><i>*</i>结束时间：&nbsp;&nbsp;</label><div  class="Add_content col-xs-11"><input id="end_date" name="end_date" type="datetime-local"  data-author="结束时间"  class="col-xs-6"/></div></li>
  
  
<!--   <li class="clearfix"><label class="label_name col-xs-1"><i>*</i>课程课时：&nbsp;&nbsp;</label><div  class="Add_content col-xs-11"><input id="class_hour" name="author" type="text"  data-author="课时"  class="col-xs-6"/></div></li>
 -->
          <li class="clearfix"><label class="label_name col-xs-1">
          <i>*</i>图片链接：&nbsp;&nbsp;</label>
          <style>
          #container{
          margin-left: 80px;
          }
          .add_style .label_name{width: 100px;}
          </style>
           <div id="wrapper" >
        <div id="container">
            <!--头部，相册选择和格式选择-->
            <div id="uploader">
                <div class="queueList">
                    <div id="dndArea" class="placeholder">
                        <div id="filePicker"></div>
                        <p>或将照片拖到这里，只需要一张</p>
                    </div>
                </div>
                <input id="sver_picture" value="" type="hidden">
                <div class="statusBar" style="display:none;">
                    <div class="progress">
                        <span class="text">0%</span>
                        <span class="percentage"></span>
                    </div><div class="info"></div>
                    <div class="btns">
                        <div id="filePicker2"></div><div class="uploadBtn">开始上传</div>
                    </div>
                </div>
            </div>
        </div>
 </li>
     <li class="clearfix"><label class="label_name col-xs-1"><i>*</i>商品介绍：&nbsp;&nbsp;</label>
     <div class="Add_content col-xs-11"><script id="editor" type="text/plain" style="width:100%;height:500px;"></script></div>
     </li>  
 </ul>
</div>
</form>
 <div class="Button_operation btn_width">
    <button class="btn button_btn bg-deep-blue"  style="margin-left: 30%;" type="button" onclick="addstore()">保存并提交</button>
 </div>
</div>
  <script type="text/javascript">
	(function( $ ){
    // 当domReady的时候开始初始化
    $(function() {
        var $wrap = $('#uploader'),

            // 图片容器
            $queue = $( '<ul class="filelist"></ul>' )
                .appendTo( $wrap.find( '.queueList' ) ),

            // 状态栏，包括进度和控制按钮
            $statusBar = $wrap.find( '.statusBar' ),

            // 文件总体选择信息。
            $info = $statusBar.find( '.info' ),

            // 上传按钮
            $upload = $wrap.find( '.uploadBtn' ),

            // 没选择文件之前的内容。
            $placeHolder = $wrap.find( '.placeholder' ),

            $progress = $statusBar.find( '.progress' ).hide(),

            // 添加的文件数量
            fileCount = 0,

            // 添加的文件总大小
            fileSize = 0,

            // 优化retina, 在retina下这个值是2
            ratio = window.devicePixelRatio || 1,

            // 缩略图大小
            thumbnailWidth = 110 * ratio,
            thumbnailHeight = 110 * ratio,

            // 可能有pedding, ready, uploading, confirm, done.
            state = 'pedding',

            // 所有文件的进度信息，key为file id
            percentages = {},
            // 判断浏览器是否支持图片的base64
            isSupportBase64 = ( function() {
                var data = new Image();
                var support = true;
                data.onload = data.onerror = function() {
                    if( this.width != 1 || this.height != 1 ) {
                        support = false;
                    }
                }
                data.src = "data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///ywAAAAAAQABAAACAUwAOw==";
                return support;
            } )(),

            // 检测是否已经安装flash，检测flash的版本
            flashVersion = ( function() {
                var version;

                try {
                    version = navigator.plugins[ 'Shockwave Flash' ];
                    version = version.description;
                } catch ( ex ) {
                    try {
                        version = new ActiveXObject('ShockwaveFlash.ShockwaveFlash')
                                .GetVariable('$version');
                    } catch ( ex2 ) {
                        version = '0.0';
                    }
                }
                version = version.match( /\d+/g );
                return parseFloat( version[ 0 ] + '.' + version[ 1 ], 10 );
            } )(),

            supportTransition = (function(){
                var s = document.createElement('p').style,
                    r = 'transition' in s ||
                            'WebkitTransition' in s ||
                            'MozTransition' in s ||
                            'msTransition' in s ||
                            'OTransition' in s;
                s = null;
                return r;
            })(),

            // WebUploader实例
            uploader;

        if ( !WebUploader.Uploader.support('flash') && WebUploader.browser.ie ) {

            // flash 安装了但是版本过低。
            if (flashVersion) {
                (function(container) {
                    window['expressinstallcallback'] = function( state ) {
                        switch(state) {
                            case 'Download.Cancelled':
                                alert('您取消了更新！')
                                break;

                            case 'Download.Failed':
                                alert('安装失败')
                                break;

                            default:
                                alert('安装已成功，请刷新！');
                                break;
                        }
                        delete window['expressinstallcallback'];
                    };

                    var swf = './expressInstall.swf';
                    // insert flash object
                    var html = '<object type="application/' +
                            'x-shockwave-flash" data="' +  swf + '" ';

                    if (WebUploader.browser.ie) {
                        html += 'classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" ';
                    }

                    html += 'width="100%" height="100%" style="outline:0">'  +
                        '<param name="movie" value="' + swf + '" />' +
                        '<param name="wmode" value="transparent" />' +
                        '<param name="allowscriptaccess" value="always" />' +
                    '</object>';

                    container.html(html);

                })($wrap);

            // 压根就没有安转。
            } else {
                $wrap.html('<a href="http://www.adobe.com/go/getflashplayer" target="_blank" border="0"><img alt="get flash player" src="http://www.adobe.com/macromedia/style_guide/images/160x41_Get_Flash_Player.jpg" /></a>');
            }

            return;
        } else if (!WebUploader.Uploader.support()) {
            alert( 'Web Uploader 不支持您的浏览器！');
            return;
        }

        // 实例化
        uploader = WebUploader.create({
            pick: {
                id: '#filePicker',
                label: '点击选择文件'
            },
            formData: {
                uid: 123
            },
            dnd: '#dndArea',
            paste: '#uploader',
            swf: '../../dist/Uploader.swf',
            chunked: true,
            chunkSize: 512 * 1024,
            server: 'UEditorTemplateController/fildSver',
            method:'POST',
            // runtimeOrder: 'flash',

            // accept: {
            //     title: 'Images',
            //     extensions: 'gif,jpg,jpeg,bmp,png',
            //     mimeTypes: 'image/*'
            // },

            // 禁掉全局的拖拽功能。这样不会出现图片拖进页面的时候，把图片打开。
            disableGlobalDnd: true,
            fileNumLimit: 300,
            fileSizeLimit: 2000 * 1024 * 1024,    // 200 M
            fileSingleSizeLimit: 500 * 1024 * 1024    // 50 M
        });

		
		    // 文件上传成功，给item添加成功class, 用样式标记上传成功。
     uploader.on( 'uploadSuccess', function( file,response ) { 
       var domain ="http://"+window.location.host+"/medicinefood";
     var path=domain+ response.path;
     var imageName=response.imageName;
     var sver_picture=document.getElementById("sver_picture").value;
     if(sver_picture==""){
     	document.getElementById("sver_picture").value=imageName;
     }else{
     	sver_picture+=";"+imageName;
     	document.getElementById("sver_picture").value=sver_picture;
     }
    });
		
		
		
		
        // 拖拽时不接受 js, txt 文件。
        uploader.on( 'dndAccept', function( items ) {
            var denied = false,
                len = items.length,
                i = 0,
                // 修改js类型
                unAllowed = 'text/plain;application/javascript ';

            for ( ; i < len; i++ ) {
                // 如果在列表里面
                if ( ~unAllowed.indexOf( items[ i ].type ) ) {
                    denied = true;
                    break;
                }
            }

            return !denied;
        });

        // uploader.on('filesQueued', function() {
        //     uploader.sort(function( a, b ) {
        //         if ( a.name < b.name )
        //           return -1;
        //         if ( a.name > b.name )
        //           return 1;
        //         return 0;
        //     });
        // });

        // 添加“添加文件”的按钮，
        uploader.addButton({
            id: '#filePicker2',
            label: '继续添加'
        });
        // 添加“添加下一个”模型的按钮，
        /*uploader.addButton({
            id: '#addModel',
            label: '添加下一个'
        });*/
        uploader.on('ready', function() {
            window.uploader = uploader;
        });

        // 当有文件添加进来时执行，负责view的创建
        function addFile( file ) {
            var $li = $( '<li id="' + file.id + '">' +
                    '<p class="title">' + file.name + '</p>' +
                    '<p class="imgWrap"></p>'+
                    '<p class="progress"><span></span></p>' +
                    '</li>' ),

                $btns = $('<div class="file-panel">' +
                    '<span class="cancel">删除</span>' +
                    '<span class="rotateRight">向右旋转</span>' +
                    '<span class="rotateLeft">向左旋转</span></div>').appendTo( $li ),
                $prgress = $li.find('p.progress span'),
                $wrap = $li.find( 'p.imgWrap' ),
                $info = $('<p class="error"></p>'),

                showError = function( code ) {
                    switch( code ) {
                        case 'exceed_size':
                            text = '文件大小超出';
                            break;

                        case 'interrupt':
                            text = '上传暂停';
                            break;

                        default:
                            text = '上传失败，请重试';
                            break;
                    }

                    $info.text( text ).appendTo( $li );
                };

            if ( file.getStatus() === 'invalid' ) {
                showError( file.statusText );
            } else {
                // @todo lazyload
                $wrap.text( '预览中' );
                uploader.makeThumb( file, function( error, src ) {
                    var img;

                    if ( error ) {
                        $wrap.text( '不能预览' );
                        return;
                    }

                    if( isSupportBase64 ) {
                        img = $('<img src="'+src+'">');
                        $wrap.empty().append( img );
                    } else {
                        $.ajax('../../server/preview.php', {
                            method: 'POST',
                            data: src,
                            dataType:'json'
                        }).done(function( response ) {
                            if (response.result) {
                                img = $('<img src="'+response.result+'">');
                                $wrap.empty().append( img );
                            } else {
                                $wrap.text("预览出错");
                            }
                        });
                    }
                }, thumbnailWidth, thumbnailHeight );

                percentages[ file.id ] = [ file.size, 0 ];
                file.rotation = 0;
            }

            file.on('statuschange', function( cur, prev ) {
                if ( prev === 'progress' ) {
                    $prgress.hide().width(0);
                } else if ( prev === 'queued' ) {
                    $li.off( 'mouseenter mouseleave' );
                    $btns.remove();
                }

                // 成功
                if ( cur === 'error' || cur === 'invalid' ) {
                    console.log( file.statusText );
                    showError( file.statusText );
                    percentages[ file.id ][ 1 ] = 1;
                } else if ( cur === 'interrupt' ) {
                    showError( 'interrupt' );
                } else if ( cur === 'queued' ) {
                    percentages[ file.id ][ 1 ] = 0;
                } else if ( cur === 'progress' ) {
                    $info.remove();
                    $prgress.css('display', 'block');
                } else if ( cur === 'complete' ) {
                    $li.append( '<span class="success"></span>' );
                }

                $li.removeClass( 'state-' + prev ).addClass( 'state-' + cur );
            });

            $li.on( 'mouseenter', function() {
                $btns.stop().animate({height: 30});
            });

            $li.on( 'mouseleave', function() {
                $btns.stop().animate({height: 0});
            });

            $btns.on( 'click', 'span', function() {
                var index = $(this).index(),
                    deg;

                switch ( index ) {
                    case 0:
                        uploader.removeFile( file );
                        return;

                    case 1:
                        file.rotation += 90;
                        break;

                    case 2:
                        file.rotation -= 90;
                        break;
                }

                if ( supportTransition ) {
                    deg = 'rotate(' + file.rotation + 'deg)';
                    $wrap.css({
                        '-webkit-transform': deg,
                        '-mos-transform': deg,
                        '-o-transform': deg,
                        'transform': deg
                    });
                } else {
                    $wrap.css( 'filter', 'progid:DXImageTransform.Microsoft.BasicImage(rotation='+ (~~((file.rotation/90)%4 + 4)%4) +')');
                    // use jquery animate to rotation
                    // $({
                    //     rotation: rotation
                    // }).animate({
                    //     rotation: file.rotation
                    // }, {
                    //     easing: 'linear',
                    //     step: function( now ) {
                    //         now = now * Math.PI / 180;

                    //         var cos = Math.cos( now ),
                    //             sin = Math.sin( now );

                    //         $wrap.css( 'filter', "progid:DXImageTransform.Microsoft.Matrix(M11=" + cos + ",M12=" + (-sin) + ",M21=" + sin + ",M22=" + cos + ",SizingMethod='auto expand')");
                    //     }
                    // });
                }


            });

            $li.appendTo( $queue );
        }

        // 负责view的销毁
        function removeFile( file ) {
            var $li = $('#'+file.id);

            delete percentages[ file.id ];
            updateTotalProgress();
            $li.off().find('.file-panel').off().end().remove();
        }

        function updateTotalProgress() {
            var loaded = 0,
                total = 0,
                spans = $progress.children(),
                percent;

            $.each( percentages, function( k, v ) {
                total += v[ 0 ];
                loaded += v[ 0 ] * v[ 1 ];
            } );

            percent = total ? loaded / total : 0;


            spans.eq( 0 ).text( Math.round( percent * 100 ) + '%' );
            spans.eq( 1 ).css( 'width', Math.round( percent * 100 ) + '%' );
            updateStatus();
        }

        function updateStatus() {
            var text = '', stats;

            if ( state === 'ready' ) {
                text = '选中' + fileCount + '张图片，共' +
                        WebUploader.formatSize( fileSize ) + '。';
            } else if ( state === 'confirm' ) {
                stats = uploader.getStats();
                if ( stats.uploadFailNum ) {
                    text = '已成功上传' + stats.successNum+ '文件，'+
                        stats.uploadFailNum + '文件上传失败，<a class="retry" href="#">重新上传</a>失败或<a class="ignore" href="#">忽略</a>'
                }

            } else {
                stats = uploader.getStats();
                text = '共' + fileCount + '个（' +
                        WebUploader.formatSize( fileSize )  +
                        '），已上传' + stats.successNum + '个';

                if ( stats.uploadFailNum ) {
                    text += '，失败' + stats.uploadFailNum + '个';
                }
            }

            $info.html( text );
        }

        function setState( val ) {
            var file, stats;

            if ( val === state ) {
                return;
            }

            $upload.removeClass( 'state-' + state );
            $upload.addClass( 'state-' + val );
            state = val;

            switch ( state ) {
                case 'pedding':
                    $placeHolder.removeClass( 'element-invisible' );
                    $queue.hide();
                    $statusBar.addClass( 'element-invisible' );
                    uploader.refresh();
                    break;

                case 'ready':
                    $placeHolder.addClass( 'element-invisible' );
                    $( '#filePicker2' ).removeClass( 'element-invisible');
                    $queue.show();
                    $statusBar.removeClass('element-invisible');
                    uploader.refresh();
                    break;

                case 'uploading':
                    $( '#filePicker2' ).addClass( 'element-invisible' );
                    $progress.show();
                    $upload.text( '暂停上传' );
                    break;

                case 'paused':
                    $progress.show();
                    $upload.text( '继续上传' );
                    break;

                case 'confirm':
                    $progress.hide();
                    $( '#filePicker2' ).removeClass( 'element-invisible' );
                    $upload.text( '开始上传' );
                    /*$('#filePicker2 + .uploadBtn').click(function () {
                        window.location.reload();
                    });*/
                    stats = uploader.getStats();
                    if ( stats.successNum && !stats.uploadFailNum ) {
                        setState( 'finish' );
                        return;
                    }
                    break;
                case 'finish':
                    stats = uploader.getStats();
                    if ( stats.successNum ) {
                      //  document.getElementById("shareUrl").style.visibility = 'visible';
                     //   createQrcode();
                    } else {
                        // 没有成功的图片，重设
                        state = 'done';
                        location.reload();
                    }
                    break;
            }

            updateStatus();
        }

        uploader.onUploadProgress = function( file, percentage ) {
            var $li = $('#'+file.id),
                $percent = $li.find('.progress span');

            $percent.css( 'width', percentage * 100 + '%' );
            percentages[ file.id ][ 1 ] = percentage;
            updateTotalProgress();
        };

        uploader.onFileQueued = function( file ) {
            fileCount++;
            fileSize += file.size;

            if ( fileCount === 1 ) {
                $placeHolder.addClass( 'element-invisible' );
                $statusBar.show();
            }

            addFile( file );
            setState( 'ready' );
            updateTotalProgress();
        };

        uploader.onFileDequeued = function( file ) {
            fileCount--;
            fileSize -= file.size;

            if ( !fileCount ) {
                setState( 'pedding' );
            }

            removeFile( file );
            updateTotalProgress();

        };

        uploader.on( 'all', function( type ) {
            var stats;
            switch( type ) {
                case 'uploadFinished':
                    setState( 'confirm' );
                    break;

                case 'startUpload':
                    setState( 'uploading' );
                    break;

                case 'stopUpload':
                    setState( 'paused' );
                    break;

            }
        });

        uploader.onError = function( code ) {
            alert( 'Eroor: ' + code );
        };

        $upload.on('click', function() {
            if ( $(this).hasClass( 'disabled' ) ) {
                return false;
            }

            if ( state === 'ready' ) {
                uploader.upload();
            } else if ( state === 'paused' ) {
                uploader.upload();
            } else if ( state === 'uploading' ) {
                uploader.stop();
            }
        });

        $info.on( 'click', '.retry', function() {
            uploader.retry();
        } );

        $info.on( 'click', '.ignore', function() {
            alert( 'todo' );
        } );

        $upload.addClass( 'state-' + state );
        updateTotalProgress();
    });

})( jQuery );
    </script>
		
		<script type="text/javascript" src="js/jquery.cookie.js"></script>
		  <script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript">


//阻止刷新
$("body").bind("keydown", function(event) {
	if (event.keyCode == 116) {
		event.preventDefault(); //阻止默认刷新
		location = location;
	}
});
      
      
      
      
      
      
  
        
                           
  






    


</script>



<script type="text/javascript">

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