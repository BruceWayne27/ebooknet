<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta><meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link type="text/css" rel="stylesheet"
          href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" />
    <link type="text/css" rel="stylesheet"
          href="${pageContext.request.contextPath }/resources/css/personInfo.css" />


    <title>EBook - 个人信息</title>

</head>
<body>

<%--导航栏（包括左侧图标、导航链接和右侧的按钮组）--%>
<div id="userHead" class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed"
                    data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index">
                <img src="${pageContext.request.contextPath}/resources/images/logo.png"></a>
        </div>
        <div id="navbar" class="navbar-collapse collapse clearfix">
            <ul class="nav navbar-nav">
                <li><a href="index">首页</a> </li>
                <li><a href="bookList?bookType=经典文学">经典文学</a> </li>
                <li><a href="bookList?bookType=通俗小说">通俗小说</a> </li>
                <li><a href="bookList?bookType=计算机类">计算机类</a> </li>
                <li><a href="bookList?bookType=杂志期刊">杂志期刊</a> </li>
            </ul>
            <%--登录后用用户头像替换登录按钮组--%><!--用户头像信息-->
            <div id="loginedInfo" class="pull-right">
                <img src="${pageContext.request.contextPath}/resources/images/exit.png" alt="exit">
                <button class="btn btn-link">
                    <span class="text-success">退出登陆</span>
                </button>
            </div>

        </div>
    </div>
</div>
<div id="personInfo" class="container">

    <div class="row">
        <div class="col-md-2 col-sm-8 col-xs-12 list-group text-center">
            <a data-index="#infoShow" class="personMenu list-group-item" href="#">个人信息</a>
            <a data-index="#infoModify" class="personMenu list-group-item" href="#">修改信息</a>
            <a data-index="#pwdModify" class="personMenu list-group-item" href="#">修改密码</a>
            <a data-index="#uploadHistory" class="list-group-item" href="#" id="getHistory">上传历史</a>
            <a data-index="#feedback" class="personMenu list-group-item" href="#">反馈建议</a>
        </div>

        <div class="col-md-10 col-sm-10 col-xs-12">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <span>个人信息</span>
                </div>
                <div class="panel-body">

                    <%@include file="subViews/infoShow.jsp"%>

                    <%@include file="subViews/infoModify.jsp"%>

                    <%@include file="subViews/pwdModify.jsp"%>

                    <%@include file="subViews/uploadHistory.jsp"%>

                    <%@include file="subViews/feedback.jsp"%>

                </div>
            </div>
        </div>
    </div>

</div>

<hr>

<footer>
    <p class="text-center">&copy; brucewayne</p>
</footer>

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.cookie.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/personInfo.js"></script>
<script>
    function checkInfo() {
        var $userName = $('#infoModify #name');
        if ($userName.val().length == 0) {
            $userName.focus();
            $userName.attr('placeholder',"昵称不能为空");
            return false;
        }
        return true;
    }
    function checkPwd() {
        var $old = $('#pwdModify #oldPwd');
        var $new = $('#pwdModify #newPwd');
        var $new2 = $('#pwdModify #newPwd2');
        if ($old.val().length == 0) {
            $old.focus();
            $old.attr('placeholder',"请输入原密码");
            return false;
        } else if ($new.val().length == 0) {
            $new.focus();
            $new.attr('placeholder',"新密码不能为空");
            return false;
        } else if ($new2.val() != $new.val()) {
            $new2.focus();
            $new2.val("").attr('placeholder',"两次密码不一致");
            return false;
        } else if ($.cookie("userPassword") != $old.val() ) {
            $old.focus();
            $old.val("").attr('placeholder',"密码错误，请重新输入");
            return false;
        } else {
            alert("修改成功，请重新登陆！");
            $.cookie("isLogined",false,{expires: -1 });
            $.cookie("userCode","",{expires: -1});
            $.cookie("userPassword","",{expires: -1});
            return true;
        }
    }
</script>

<style>
    body {
        background-color: #eee;
        overflow: hidden;
    }
    canvas {
        background-color: #eee;
        display: block;
        margin: 0 auto;
    }
    .draw{
        position:absolute;
        left:0px;
        top:0px;
        z-index:-1;
    }
</style>

<canvas id="canvas" class="draw"></canvas>
<script>
    var canvas = document.getElementById("canvas");
    var ctx = canvas.getContext("2d");
    var cw = canvas.width = window.innerWidth,
        cx = cw / 2;
    var ch = canvas.height = window.innerHeight,
        cy = ch / 2;

    ctx.fillStyle = "#000";
    var linesNum = 16;
    var linesRy = [];
    var requestId = null;

    function Line(flag) {
        this.flag = flag;
        this.a = {};
        this.b = {};
        if (flag == "v") {
            this.a.y = 0;
            this.b.y = ch;
            this.a.x = randomIntFromInterval(0, ch);
            this.b.x = randomIntFromInterval(0, ch);
        } else if (flag == "h") {
            this.a.x = 0;
            this.b.x = cw;
            this.a.y = randomIntFromInterval(0, cw);
            this.b.y = randomIntFromInterval(0, cw);
        }
        this.va = randomIntFromInterval(25, 100) / 100;
        this.vb = randomIntFromInterval(25, 100) / 100;

        this.draw = function() {
            ctx.strokeStyle = "#ccc";
            ctx.beginPath();
            ctx.moveTo(this.a.x, this.a.y);
            ctx.lineTo(this.b.x, this.b.y);
            ctx.stroke();
        }

        this.update = function() {
            if (this.flag == "v") {
                this.a.x += this.va;
                this.b.x += this.vb;
            } else if (flag == "h") {
                this.a.y += this.va;
                this.b.y += this.vb;
            }

            this.edges();
        }

        this.edges = function() {
            if (this.flag == "v") {
                if (this.a.x < 0 || this.a.x > cw) {
                    this.va *= -1;
                }
                if (this.b.x < 0 || this.b.x > cw) {
                    this.vb *= -1;
                }
            } else if (flag == "h") {
                if (this.a.y < 0 || this.a.y > ch) {
                    this.va *= -1;
                }
                if (this.b.y < 0 || this.b.y > ch) {
                    this.vb *= -1;
                }
            }
        }

    }

    for (var i = 0; i < linesNum; i++) {
        var flag = i % 2 == 0 ? "h" : "v";
        var l = new Line(flag);
        linesRy.push(l);
    }

    function Draw() {
        requestId = window.requestAnimationFrame(Draw);
        ctx.clearRect(0, 0, cw, ch);

        for (var i = 0; i < linesRy.length; i++) {
            var l = linesRy[i];
            l.draw();
            l.update();
        }
        for (var i = 0; i < linesRy.length; i++) {
            var l = linesRy[i];
            for (var j = i + 1; j < linesRy.length; j++) {
                var l1 = linesRy[j]
                Intersect2lines(l, l1);
            }
        }
    }

    function Init() {
        linesRy.length = 0;
        for (var i = 0; i < linesNum; i++) {
            var flag = i % 2 == 0 ? "h" : "v";
            var l = new Line(flag);
            linesRy.push(l);
        }

        if (requestId) {
            window.cancelAnimationFrame(requestId);
            requestId = null;
        }

        cw = canvas.width = window.innerWidth,
            cx = cw / 2;
        ch = canvas.height = window.innerHeight,
            cy = ch / 2;

        Draw();
    };

    setTimeout(function() {
        Init();

        addEventListener('resize', Init, false);
    }, 15);

    function Intersect2lines(l1, l2) {
        var p1 = l1.a,
            p2 = l1.b,
            p3 = l2.a,
            p4 = l2.b;
        var denominator = (p4.y - p3.y) * (p2.x - p1.x) - (p4.x - p3.x) * (p2.y - p1.y);
        var ua = ((p4.x - p3.x) * (p1.y - p3.y) - (p4.y - p3.y) * (p1.x - p3.x)) / denominator;
        var ub = ((p2.x - p1.x) * (p1.y - p3.y) - (p2.y - p1.y) * (p1.x - p3.x)) / denominator;
        var x = p1.x + ua * (p2.x - p1.x);
        var y = p1.y + ua * (p2.y - p1.y);
        if (ua > 0 && ub > 0) {
            markPoint({
                x: x,
                y: y
            })
        }
    }

    function markPoint(p) {
        ctx.beginPath();
        ctx.arc(p.x, p.y, 2, 0, 2 * Math.PI);
        ctx.fill();
    }

    function randomIntFromInterval(mn, mx) {
        return ~~(Math.random() * (mx - mn + 1) + mn);
    }</script>

</body>
</html>