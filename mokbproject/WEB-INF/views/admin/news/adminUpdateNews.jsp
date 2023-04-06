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
    <title>修改首页功能页面</title>
    <meta charset="utf-8">
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
<body>
<div class="margin">
<form id="formId1" name="formId1" method="post" action="" enctype="multipart/form-data">
	<div class="add_style">
		<div name="audio_url" id="views10"  class="clearfix" >
			 <label class="label_name"><i></i>音频文件：</label>
			 <div name="audio_url" class="Add_content">
			 	<input id="file" name="file" data-audio_url="音频文件"  type="file" value="" />
			 </div>
			 <input style="padding:5px 10px;background:#55cbd2;border:none;border-radius:3px;color:#fff;cursor: pointer;" type="button" onclick="login()" value="开始上传" />
		 </div>
    </div>
</form>
<script type="text/javascript">
        function login() {
         	var file=document.getElementById("file").value;
         	if(file==null||file==""){
         		alert("请上传文件!");
         		return;
         	}
      		var form = new FormData(document.getElementById("formId1"));
            $.ajax({
            //几个参数需要注意一下
            //contentType:'multipart/form-data',
            contentType: false,
            processData: false,
                type: "POST",//方法类型
                cache: false,
                dataType: "json",//预期服务器返回的数据类型
                url: "/medicinefood/file/mp3Upload" ,//url
                data: form,
                success: function (result) {
                    if (result.state == 0) {
                        alert("上传成功!");
                       var news_mp3=result.message;
                       document.getElementById("mp32").value=news_mp3;
                    };
                },
                error : function() {
                    alert("异常！");
                }
            });
        }
    </script>
<form  id="formid">
<div class="add_style">
 <ul>
  <li class="clearfix"><label class="label_name col-xs-1"><i>*</i>标题：&nbsp;&nbsp;</label><div class="Add_content col-xs-11"><input id="title2" style="width:300px" name="title" type="text" data-title="标题"  class="col-xs-6"/></div></li>
       <li class="clearfix"><label class="label_name col-xs-1">
       <i>*</i>发布类型：&nbsp;&nbsp;</label><div class="Add_content col-xs-11">
      <select name="" id="selectidd" onchange="addViews()" class="text_add" style="width:300px" class="col-xs-6">
        <option value="1">知识</option>
        <option value="2">动态</option>
        <option value="3">基金</option>
        <option value="4">视频</option>
        <option value="5">基金视频</option>
       </select>
      <input id="news_picture" value="" type="hidden">
      <!--  -->
       </div></li>
       <li name="audio_url"  id="mp31" style="display:none" class="clearfix"><label class="label_name col-xs-1"><i></i>音乐链接：&nbsp;&nbsp;</label><div name="audio_url" class="Add_content col-xs-11"><input id="mp32" name="audio_url"  data-audio_url="音乐链接"  type="text" class="col-xs-6" value="" readonly="readonly"></input></div></li>
       <li name="audio_url" id="views1" style="display:none" class="clearfix"><label class="label_name col-xs-1"><i></i>视频链接：&nbsp;&nbsp;</label><div name="audio_url" class="Add_content col-xs-11"><input id="views2" name="audio_url"  data-audio_url="视频链接"  type="text" class="col-xs-6" value=""></input></div></li>
       <li name="audio_url" id="views4" style="display:none" class="clearfix"><label class="label_name col-xs-1"><i></i>所用金额：&nbsp;&nbsp;</label><div name="audio_url" class="Add_content col-xs-11"><input id="views5" name="audio_url"  data-audio_url="所用金额"  type="text" class="col-xs-6" value="请保留两位小数"></input></div></li>
          <li class="clearfix"><label class="label_name col-xs-1">
          <img alt="" id="pictures_url1" src="" style="width: 100px; hight: 50px;">
          <i>*</i>图片链接：&nbsp;&nbsp;</label>
          <input style="display:none" name="pictures_url"  id="pictures_url" data-pictures_url="图片" value="">
          <input style="display:none" name="audio_url"  id="newsid" value="${news_id}">
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
     <li class="clearfix"><label class="label_name col-xs-1"><i>*</i>内容介绍：&nbsp;&nbsp;</label>
     <div class="Add_content col-xs-11"><script id="editor" type="text/plain" style="width:100%;height:500px;"></script></div>
     </li>  

     
 </ul>

</div>
</form>
 <div class="Button_operation btn_width">
    <button class="btn button_btn bg-deep-blue"  style="margin-left: 30%;" type="button" onclick="tijiao()">保存并提交</button>
   
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
                };
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
            server: 'UEditorTemplateController/newsFildUpload',
            method:'POST',
            // 禁掉全局的拖拽功能。这样不会出现图片拖进页面的时候，把图片打开。
            disableGlobalDnd: true,
            fileNumLimit: 300,
            fileSizeLimit: 2000 * 1024 * 1024,    // 200 M
            fileSingleSizeLimit: 500 * 1024 * 1024*10    // 50 M
        });

		
		    // 文件上传成功，给item添加成功class, 用样式标记上传成功。
     uploader.on( 'uploadSuccess', function( file,response ) { 
       var domain ="http://"+window.location.host+"/medicinefood";
     var path=domain+ response.path;
     var imageName=response.imageName;
     var news_picture=document.getElementById("news_picture").value;
     if(news_picture==""){
     	document.getElementById("news_picture").value=imageName;
     }else{
     	news_picture+=";"+imageName;
     	document.getElementById("news_picture").value=news_picture;
     }
     $("#pictures_url").val(path);
        $( '#'+file.id ).addClass('upload-state-success').find(".state").text("已上传");    //这段代码根据需要选择是否写，也就是这句话可有可无
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

        // 添加“添加文件”的按钮，
        uploader.addButton({
            id: '#filePicker2',
            label: '继续添加'
        });
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
                        stats.uploadFailNum + '文件上传失败，<a class="retry" href="#">重新上传</a>失败或<a class="ignore" href="#">忽略</a>';
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


     //获取url中的参数
        function getUrlParam(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
            var r = window.location.search.substr(1).match(reg);  //匹配目标参数
            if (r != null) return unescape(r[2]); return null; //返回参数值
        }
		
 function getMyDate(str){  
            var oDate = new Date(str),  
            oYear = oDate.getFullYear(),  
            oMonth = oDate.getMonth()+1,  
            oDay = oDate.getDate(),  
            oHour = oDate.getHours(),  
            oMin = oDate.getMinutes(),  
            oSen = oDate.getSeconds(),  
            oTime = oYear +'-'+ getzf(oMonth) +'-'+ getzf(oDay) ;//最后拼接时间  
            return oTime;  
        }; 
        //补0操作
      function getzf(num){  
          if(parseInt(num) < 10){  
              num = '0'+num;  
          }  
          return num;  
      }
      
      
function addViews(){
	var news_type=$('#selectidd option:selected') .val();
	if(news_type==4||news_type==5){
		document.getElementById("views1").style.display="block";
	}else{
		document.getElementById("views1").style.display="none";
	}
	if(news_type==5){
		document.getElementById("views4").style.display="block";
	}else{
		document.getElementById("views4").style.display="none";
	}
	
}
      
      
function tijiao(){

var dataArry=$("input").serializeArray();
var jsondata={};
var n=0;
 $.each(dataArry,function(i,v){
 if(v.value==""&&v.name!="audio_url") {
 alert("必须填写："+$("input[name='"+v.name+"']").attr("data-"+v.name)+"这一项");
 n=1;
 return false;
 }
       jsondata[v.name] = v.value;
   }) ;
  
 
   
   if(n==1||UE.getEditor('editor').getContent()=="") return false;
    jsondata["content"]=UE.getEditor('editor').getContent();
    //获取选择类型
     var news_type= $("#selectidd").find("option:selected").val();
     var news_picture=document.getElementById("news_picture").value;
     var fund_money1=document.getElementById("views5").value;
     var news_mp3=document.getElementById("mp32").value;
     if(news_type==5){
     	if(fund_money1==null||fund_money1==""){
     		alert("请输入消费金额!");
     		return;
     	}
		var fund_money=parseFloat(fund_money1);
		if(isNaN(fund_money)){
			alert("请输入数字");
			return;
		}
     }
     
	
     var views=document.getElementById("views2").value;
     if(views!=null&&views!=""){
     	news_picture=news_picture+";"+views;
     }else{
     	
     }
     jsondata["news_picture"]=news_picture;
     jsondata["news_type"]=news_type;
     jsondata["fund_money"]=fund_money;
     jsondata["news_mp3"]=news_mp3;
    var object = JSON.stringify(jsondata);
  ajaxPost("<%=basePath%>admin_news/addNews",object,"json","json",AddConten);

   function  AddConten(data){
   
   if(data.state==0){
     alert("提交成功");
     var news_type=$('#selectidd option:selected') .val();
     news_type = parseInt(news_type);
     switch(news_type){
     	case 1:
     		window.history.back(-1);
     		break;
     	case 2:
     		window.history.back(-1);
     		break;
     	case 3:
     		window.history.back(-1);
     		break;
     	case 4:
     		window.history.back(-1);;
     		break;
     	default:
     		window.history.back(-1);
     		break;
     }
   }
   
   }

}
      
      
      
  	function onloadd(){
  	  var news_id=document.getElementById("newsid").value;
	  var paramData;
	  var paramData={news_id:news_id};                               
	  var object = JSON.stringify(paramData);
	  ajaxPost("<%=basePath%>admin_news/findNewsOne",object,"json","json",showNewsOne);
	};
	window.onload=function(){
	  onloadd();
	};
  function showNewsOne(data){
  	var news=data.newsDate.news;
  	var news_title=news.news_title;
  	var news_type=news.news_type;//类型
  	var news_mp3=news.news_mp3;//音乐链接
  	var detail_content=news.detail_content;
  	var news_pictures=news.news_picture;
  	var news_picturearr=news_pictures.split(";");
    var all_options = document.getElementById("selectidd").options;
    
    if(news_type==4||news_type==5){
		document.getElementById("views1").style.display="block";
	}else{
		document.getElementById("views1").style.display="none";
	}
	if(news_type==5){
		document.getElementById("views4").style.display="block";
	}else{
		document.getElementById("views4").style.display="none";
	}
    
    for (i=0; i<all_options.length; i++){
      if (all_options[i].value == news_type)  // 根据option标签的ID来进行判断  测试的代码这里是两个等号
      {
         all_options[i].selected = true;
      }
    }
    if(news_mp3!=null){
    	document.getElementById("mp31").style.display="block";
    	document.getElementById("mp32").value=news_mp3;
    }
    if(news_type==4){
    	var views2=news_picturearr[1];
    	document.getElementById("views2").value=views2;//视频链接
    }
    var pictures_ur=news_picturearr[0];
    var url="<%=basePath%>file/news/img/"+pictures_ur;
    document.getElementById("pictures_url1").src=url;
    document.getElementById("pictures_url").value=news_picturearr[0];//图片链接
    document.getElementById("title2").value=news_title;//标题
    UE.getEditor('editor').setContent(detail_content);
    
  }
      
      
  
        
                           
  






    


</script>



<script type="text/javascript">

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
        alert("已清空草稿箱");
    }
</script>
</body>
</html>