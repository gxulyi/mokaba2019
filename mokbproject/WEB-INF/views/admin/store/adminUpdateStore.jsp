<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
   
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
 <base href="<%=basePath%>">
    <title>修改商品页面</title>
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
<script type="text/javascript"></script>
<body>
<div class="margin">
	<!-- <label style="margin-left: 10px;">导师数量：</label>
      <select id="store_type" name="store_type" style="margin-left: 5px;" onchange="selectType(this.value)">
		<option value="">请选择商品类型</option>
		<option value="1">原价商品</option>
		<option value="2">满送(使用券)商品</option>
		<option value="3">积分商品</option>
		<option value="4">非卖品</option>
	  </select> -->
<form  id="formid">
<div class="add_style">
 <input hidden="hidden" id="store_id11" name="store_id11" type="email" id="user-email" placeholder="商品编号" value="${store_id}">
 <ul>
  <!-- <li class="clearfix" id="tutor_name" style="display:none"><label class="label_name col-xs-1"><i>  </i>导师姓名：&nbsp;&nbsp;</label><div  class="Add_content col-xs-11"><input id="tutor_name1" name="title" type="text" data-title=""  class=""/><input id="tutor_name2" name="title" type="text" data-title=""  class=""/></div></li>
  <li class="clearfix"><label class="label_name col-xs-1"><i>*</i>商品名称：&nbsp;&nbsp;</label><div  class="Add_content col-xs-11"><input id="store_name" name="title" type="text" data-title="商品名称"  class="col-xs-6"/></div></li>
  <li class="clearfix"><label class="label_name col-xs-1"><i>*</i>商品价格：&nbsp;&nbsp;</label><div  class="Add_content col-xs-11"><input id="store_price" name="author" type="text"  data-author="商品价格"  class="col-xs-6"/></div></li>
  <li class="clearfix"><label class="label_name col-xs-1"><i>*</i>课程课时：&nbsp;&nbsp;</label><div  class="Add_content col-xs-11"><input id="class_hour" name="author" type="text"  data-author="课时"  class="col-xs-6"/></div></li> -->
  
  <li class="clearfix"><label class="label_name col-xs-1"><i>*</i>商品名称：&nbsp;&nbsp;</label><div  class="Add_content col-xs-11"><input id="store_name" name="title" type="text" data-title="商品名称"  class="col-xs-6"/></div></li>
  <li class="clearfix"><label class="label_name col-xs-1"><i>*</i>商品原价：&nbsp;&nbsp;</label><div  class="Add_content col-xs-11"><input id="prime_price" name="prime_price" type="text"  data-author="商品原价"  class="col-xs-6"/></div></li>
  <li class="clearfix"><label class="label_name col-xs-1"><i>*</i>销售价：&nbsp;&nbsp;</label><div  class="Add_content col-xs-11"><input id="store_price" name="store_price" type="text"  data-author="商品销售价"  class="col-xs-6"/></div></li>
  <li class="clearfix"><label class="label_name col-xs-1"><i>*</i>净含量：&nbsp;&nbsp;</label><div  class="Add_content col-xs-11"><input id="net_weight" name="net" type="text"  data-author="净含量"  class="col-xs-6"/></div></li>
  <li class="clearfix" id="fulls_money"><label class="label_name col-xs-1"><i>*</i>满减价：&nbsp;&nbsp;</label><div  class="Add_content col-xs-11"><input id="full_money" name="full_money" type="text"  data-author="满减价"  class="col-xs-6"/></div></li>
  <li class="clearfix" id="gives_money"><label class="label_name col-xs-1"><i>*</i>赠送金额：&nbsp;&nbsp;</label><div  class="Add_content col-xs-11"><input id="give_money" name="full_money" type="text"  data-author="赠送金额"  class="col-xs-6"/></div></li>
  <li class="clearfix" id="requireds_integral"><label class="label_name col-xs-1"><i>*</i>所需积分：&nbsp;&nbsp;</label><div  class="Add_content col-xs-11"><input id="required_integral" name="required_integral" type="text"  data-author="所需积分"  class="col-xs-6"/></div></li>	
   <li class="clearfix" id="start_dates"><label class="label_name col-xs-1"><i>*</i>开始时间：&nbsp;&nbsp;</label><div  class="Add_content col-xs-11"><input id="start_date" name="start_date" type="text"  data-author="开始时间"  class="col-xs-6"/></div></li>
  <li class="clearfix" id="end_dates"><label class="label_name col-xs-1"><i>*</i>结束时间：&nbsp;&nbsp;</label><div  class="Add_content col-xs-11"><input id="end_date" name="end_date" type="text"  data-author="结束时间"  class="col-xs-6" /></div></li>  
   

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
                <div id="storePic">
                </div>
                    <div id="dndArea" class="placeholder">
                    <img alt="" id="pictu2" src="">
                        <div id="filePicker"></div>
                         <input id="pictu" value="">
                        <p>或将照片拖到这里，只需要一张</p>
                        
                    </div>
                </div>
                <input id=store_picture value="" type="hidden">
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
     <div class="Add_content col-xs-11"><script id="editor"   type="text/plain" style="width:100%;height:500px;" ></script></div>
     </li>  

     
 </ul>

</div>
</form>
 <div class="Button_operation btn_width">
    <button class="btn button_btn bg-deep-blue"  style="margin-left: 30%;" type="button" onclick="updateStore()">确认修改</button>
   
 </div>
</div>

	<script type="text/javascript" src="js/jquery.cookie.js"></script>
 	<script type="text/javascript" src="js/ajax.js"></script>
  	<script type="text/javascript">
  	 function wait(data){
  	   // alert(JSON.stringify(data));
  	    if(data.state==0){
  	      alert("修改成功");
  	    }else{
  	     alert("修改失败");
  	    }
	  	<%--window.location="<%=basePath%>admin_store/toFindStore"; --%> 
 	 	window.history.back(-1);
  	 }
  	 function updateStore(){
  	 	var store_id=document.getElementById("store_id11").value;
  	 	var store_name=document.getElementById("store_name").value;
  	 	var store_price=document.getElementById("store_price").value;
  	 	var store_intro=UE.getEditor('editor').getContent();
  	 	var store_picture=document.getElementById("store_picture").value;
  	 	var prime_price = document.getElementById("prime_price").value;
	 	var net_weight = document.getElementById("net_weight").value;
	 	var full_money = document.getElementById("full_money").value;
	 	var give_money = document.getElementById("give_money").value;
	 	var required_integral = document.getElementById("required_integral").value;
	 	var start_date = document.getElementById("start_date").value;
	 	var end_date = document.getElementById("end_date").value;
	 	//document.getElementById("pictu").value = store_picture;
	 	//document.getElementById("pictu2").src = "<%=basePath%>file/store/img/"+store_picture;
	 	/*将日期格式转成时间戳*/
	 	 debugger;
	 	//alert(store_picture);
	 	if(store_picture == '' || store_picture  ==  undefined ||store_picture == null){
	 		store_picture  = document.getElementById("pictu").value;
	 	}
	 	if(start_date =='' ||start_date ==undefined || start_date == null){
	 		start_date  = new Date().getTime();
	 	}
        var sdate = new Date(start_date);
        var edate = new Date(end_date);
        var startTime = sdate.getTime();
        var endTime = edate.getTime();
        
	    var paramData={store_id:store_id,store_name:store_name,store_price:store_price,
	                   store_intro:store_intro,store_picture:store_picture,prime_price:prime_price,
	                   net_weight:net_weight,full_money:full_money,give_money:give_money,required_integral:required_integral,start_date:startTime,end_date:endTime};                               
	    var object = JSON.stringify(paramData);
	    //alert(object);
		 if(confirm("确认执行这个操作吗？")){
		      ajaxPost("<%=basePath%>admin_store/updateStore",object,"json","json",wait);
		  }else{
		    return false;
		    };
	   
	    };
	 /*时间戳转成日期格式*/
	 function timestampToTime(timestamp) {
        var date = new Date(timestamp);//时间戳为10位需*1000，时间戳为13位的话不需乘1000
        var Y = date.getFullYear() + '-';
        var M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1)  : date.getMonth()+1) + '-';
        var D = (date.getDate() < 10 ? '0'+date.getDate() : date.getDate())+' ';
        var h = (date.getHours() < 10 ? '0'+date.getHours()  : date.getHours())+':';
        var m = (date.getMinutes() < 10 ? '0'+date.getMinutes() : date.getMinutes()) + ':';
        var s = (date.getSeconds() < 10 ? '0'+date.getSeconds() : date.getSeconds());
        return Y+M+D+h+m+s;
    }  
	    
	    /**加载该商品的信息*/
	 function showOneStore(data){
	    var storeBasics = data.sbd.storeBasics;
	    var store_type = data.sbd.storeBasics.store_type;
	 	var store_name = data.sbd.storeBasics.store_name;
	 	var store_price = data.sbd.storeBasics.store_price;
	 	var store_intro = data.sbd.storeBasics.store_intro;
	 	var store_picture = data.sbd.storeBasics.store_picture;
	 	var prime_price = data.sbd.storeBasics.prime_price;
	 	var net_weight = data.sbd.storeBasics.net_weight;
	 	var full_money = data.sbd.storeBasics.full_money;
	 	var give_money = data.sbd.storeBasics.give_money;
	 	var required_integral = data.sbd.storeBasics.required_integral;
	 	var start_date = data.sbd.storeBasics.start_date;
	 	var end_date = data.sbd.storeBasics.end_date;
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
		}else if(store_type == 3){
			/*store_type==4 为限时抢购，*/
			document.getElementById("gives_money").style.display="none";
		  	document.getElementById("fulls_money").style.display="none";
		  	document.getElementById("requireds_integral").style.display="none";
		  	document.getElementById("start_dates").style.display="";
		  	document.getElementById("end_dates").style.display="";
		}
		document.getElementById("store_name").value = store_name;
	 	document.getElementById("prime_price").value = prime_price
	 	document.getElementById("store_price").value = store_price;
	 	document.getElementById("net_weight").value = net_weight;
	 	document.getElementById("full_money").value = full_money;
	 	document.getElementById("give_money").value = give_money
	 	document.getElementById("required_integral").value = required_integral;
	 	document.getElementById("start_date").value = timestampToTime(start_date);
	 	document.getElementById("end_date").value = timestampToTime(end_date);
	 	
	 	document.getElementById("pictu").value = store_picture;
	 	document.getElementById("pictu2").src = "<%=basePath%>file/store/img/"+store_picture;
	 	//UE.getEditor('editor').setContent(store_intro);
	 	/*给ue编辑器赋后端传过来的值*/
	 	var ue = UE.getEditor('editor');//初始化对象  
	 	ue.setContent(store_intro);
	    /* $(document).ready(function(){  
	        var ue = UE.getEditor('editor');  
	        var proinfo=$("#divdata").text();  
	          
	        ue.ready(function() {//编辑器初始化完成再赋值  
	            ue.setContent(proinfo);  //赋值给UEditor  
	        });  
	          
	    });  */ 
	 	
	 	
	 }
	 function onloadd(){
	 	//alert("${store_id}");
	    /*图片拼接编辑*/
	 	 var str ="";
		  var pictures=document.getElementById("pictu").value;
		  pictures=pictures.split(";");
		  for(var i=0;i<pictures.length;i++){
		  var pic=pictures[i];
		  	str+=
		  	"<img alt=''  src='<%=basePath%>file/store/img/"+pic+"'>";
		  }
		  document.getElementById("storePic").innerHTML=str;
	    
	 	var store_id=document.getElementById("store_id11").value;
	 	//alert(store_id);
	    var paramData;
	    var paramData={store_id:store_id};                               
	    var object = JSON.stringify(paramData);
	    ajaxPost("<%=basePath%>admin_store/findStore",object,"json","json",showOneStore);
	 };
	 window.onload=function(){
	  onloadd();
	 };
	
	
	
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
                                alert('您取消了更新！');
                                break;

                            case 'Download.Failed':
                                alert('安装失败');
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
     var store_picture=document.getElementById("store_picture").value;
     if(store_picture==""){
     	document.getElementById("store_picture").value=imageName;
     }else{
     	store_picture+=";"+imageName;
     	document.getElementById("store_picture").value=store_picture;
     	};
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

	//实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('editor');


    function isFocus(e){
        alert(UE.getEditor('editor').isFocus());
        UE.dom.domUtils.preventDefault(e);
    }
    function setblur(e){
        UE.getEditor('editor').blur();
        UE.dom.domUtils.preventDefault(e);
    }
    function insertHtml() {
        var value = prompt('插入html代码', '');
        UE.getEditor('editor').execCommand('insertHtml', value);
    }
    function createEditor() {
        enableBtn();
        UE.getEditor('editor');
    }
    function getAllHtml() {
        alert(UE.getEditor('editor').getAllHtml());
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
        alert(arr.join('\n'));
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
        alert(txt);
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