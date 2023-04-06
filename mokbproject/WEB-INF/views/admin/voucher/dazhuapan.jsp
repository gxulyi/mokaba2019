<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta name="author" content="熊仔其人">
    <title>转盘抽奖效果</title>
    <!-- 这里是css部分 -->
    <style>
        #bg {
            width: 650px;
            height: 600px;
            margin: 0 auto;
            background: url(images/dzp/turntable-bg.jpg) no-repeat;
            position: relative;
        }

        img[src^="pointer"] {
            position: absolute;
            z-index: 10;
            top: 155px;
            left: 247px;
        }

        img[src^="turntable"] {
            position: absolute;
            z-index: 5;
            top: 60px;
            left: 116px;
            transition: all 4s;
        }
    </style>
</head>
<body>
    <!-- 这里是HTML结构部分 --> 
    <div id="bg"><img name="img" src="<%=basePath%>images/dzp/pointer.png" alt="pointer"><img src="<%=basePath%>images/dzp/turntable.jpg" alt="turntable"></div>  
    <!-- 这里是js部分 -->
    <script>
        var oPointer = document.getElementsByTagName("img")[0];
        var oTurntable = document.getElementsByTagName("img")[1];
        var cat = 51.4; //总共7个扇形区域，每个区域约51.4度
        var num = 0; //转圈结束后停留的度数
        var offOn = true; //是否正在抽奖
        oPointer.onclick = function () {
            if (offOn) {
                oTurntable.style.transform = "rotate(0deg)";
                offOn = !offOn;
                ratating();
            }
        }
        //旋转
        function ratating() {
        debugger;
            var timer = null;
            var rdm = 0; //随机度数
            clearInterval(timer);
            timer = setInterval(function () {
                if (Math.floor(rdm / 360) < 3) { rdm = Math.floor(Math.random() * 3600); }
                else {
                    oTurntable.style.transform = "rotate(" + rdm + "deg)";
                    clearInterval(timer);
                    setTimeout(function () {
                        offOn = !offOn;
                        num = rdm % 360;
                        if (num <= cat * 1) { alert("4999元"); console.log("rdm=" + rdm + "，num=" + num + "，" + "4999元"); }
                        else if (num <= cat * 2) { alert("50元"); console.log("rdm=" + rdm + "，num=" + num + "，" + "50元"); }
                        else if (num <= cat * 3) { alert("10元"); console.log("rdm=" + rdm + "，num=" + num + "，" + "10元"); }
                        else if (num <= cat * 4) { alert("5元"); console.log("rdm=" + rdm + "，num=" + num + "，" + "5元"); }
                        else if (num <= cat * 5) { alert("免息服务"); console.log("rdm=" + rdm + "，num=" + num + "，" + "免息服务"); }
                        else if (num <= cat * 6) { alert("提交白金"); console.log("rdm=" + rdm + "，num=" + num + "，" + "提交白金"); }
                        else if (num <= cat * 7) { alert("未中奖"); console.log("rdm=" + rdm + "，num=" + num + "，" + "未中奖"); }
                    }, 4000);
                }
            }, 30);
        }
    </script>
</body>
</html>