<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta><meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link type="text/css" rel="stylesheet"
          href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" />
    <link type="text/css" rel="stylesheet"
          href="${pageContext.request.contextPath }/resources/css/bootstrap-datetimepicker.min.css" />
    <link type="text/css" rel="stylesheet"
          href="${pageContext.request.contextPath }/resources/css/userManage.css" />

    <title>EBook - 用户管理</title>
    <style>
        .draw{
            position:absolute;
            left:0px;
            top:0px;
            z-index:-1
        }
    </style>
</head>
<body>
<div class="draw">
    <canvas  id="c"></canvas>
</div>
<nav id="nav" class="navbar navbar-default" role="navigation">
    <div class="container container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#"><span class="h3 text-success">EBook</span></a>
        </div>
        <div class="nav">
            <ul class="nav navbar-nav h4">
                <li><a href="bookManage">书籍管理</a></li>
                <li class="active"><a href="userManage">用户管理</a></li>
                <li><a href="feedbackManage">反馈处理</a></li>
            </ul>
            <div id="user" class="pull-right">
                <h4 class="text-primary">欢迎进入EBook后台管理系统！&nbsp;
                    <span class="glyphicon glyphicon-user">admin</span></h4>
            </div>
        </div>
    </div>
</nav>
<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading">
            <span>用户管理列表</span>
        </div>
        <div class="panel-body">
            <div class="col-md-3 col-sm-3 col-xs-12">
                <p class="text-info">本周注册人数：<i class="badge">${weekUser}</i> </p>
                <p class="text-primary">本月注册人数：<i class="badge">${monthUser}</i> </p>
                <p class="text-success">所有用户人数：<i class="badge">${totalUser}</i> </p>
            </div>
            <div class="col-md-9 col-sm-9 col-xs-12">
                <div class="row">
                    <div class="col-md-2">
                    </div>
                    <div class="col-md-4 col-sm-4 col-xs-10 pull-right">
                        <form class="input-group" action="searchUser" method="get">
                            <input name="user" type="text" class="form-control" placeholder="Search">
                            <span class="input-group-addon">
                                <button type="submit">
                                    <span class="glyphicon glyphicon-search"></span>
                                </button>
                            </span>
                        </form>
                    </div>
                </div>
                <div class="row">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>用户名</th>
                            <th>账号</th>
                            <th>E-mail</th>
                            <th>贡献值</th>
                            <th>注册时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${userList}" var="user">
                            <tr>
                                <td class="id">${user.id}</td>
                                <td class="userName">${user.userName}</td>
                                <td>${user.userCode}</td>
                                <td>${user.email}</td>
                                <td>${user.contribution}</td>
                                <td><fmt:formatDate value="${user.creationDate}" pattern="yyyy-MM-dd"/></td>
                                <td><button class="btn btn-xs btn-danger">删除</button></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

</div>
<div class="modal fade" id="deleteUser" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
                <h4>&nbsp;&nbsp;你确定要删除该用户&nbsp;&nbsp;<span id="userName" class="text-primary"></span>？ </h4>
            </div>
            <div class="modal-footer">
                <button class="btn btn-danger" type="button" data-dismiss="modal">确定</button>
                <button class="btn btn-info" type="button" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/userManage.js"></script>
<script>
    ;(function() {
        'use strict';

        var c = document.getElementById('c');
        var ctx = c.getContext('2d');
        var w = c.width = window.innerWidth;
        var h = c.height = window.innerHeight;
        var cx = w / 2;
        var cy = h / 2;
        var P = function(x, y) {
            this.x = x;
            this.y = y;
            this.vx = 0;
            this.vy = 0;
            this.r = 1 + Math.random() * 10;
            this.sa = Math.random() * Math.PI * 2;
            this.ea = Math.random() * Math.PI * 2;
            this.rt = Math.random() * Math.PI * 2;
            this.vrt = 0;
            this.h = 0;
        };
        P.prototype = {
            constructor: P,
            update: function() {
                this.vx += Math.random() * 0.1 - 0.05;
                this.vy += Math.random() * 0.1 - 0.05;
                this.vrt += Math.random() * 0.02 - 0.01;
                this.x += this.vx;
                this.y += this.vy;
                this.rt += this.vrt;

                var dx = cx - this.x;
                var dy = cy - this.y;
                var d = Math.sqrt(dx * dx + dy * dy);

                this.h = dx / d * 360;

                if (this.x < 0) {
                    this.x = 0;
                    this.vx *= -1;
                }
                if (this.x > w) {
                    this.x = w;
                    this.vx *= -1;
                }
                if (this.y < 0) {
                    this.y = 0;
                    this.vy *= -1;
                }
                if (this.y > h) {
                    this.y = h;
                    this.vy *= -1;
                }
            },
            render: function(ctx) {
                ctx.save();
                ctx.strokeStyle = 'black';
                ctx.fillStyle = 'hsla(' + this.h + ', 100%, 50%, 0.5)';
                ctx.translate(this.x, this.y);
                ctx.rotate(this.rt);
                ctx.beginPath();
                ctx.arc(0, 0, this.r, this.sa, this.ea);
                ctx.fill();
                ctx.stroke();
                ctx.restore();
            }
        };

        var ps = [];
        var p;
        var ctr = 200;

        for (var i = 0; i < ctr; i++) {
            p = new P(Math.random() * w, Math.random() * h);
            ps.push(p);
        }

        requestAnimationFrame(function loop() {
            requestAnimationFrame(loop);
            ctx.clearRect(0, 0, w, h);
            for (var i = 0; i < ctr; i++) {
                p = ps[i];
                p.update();
                p.render(ctx);
            }
            for (var i = 0; i < ctr; i++) {
                var p1 = ps[i];
                for (var j = i + 1; j < ctr; j++) {
                    var p2 = ps[j];
                    var dx = p1.x - p2.x;
                    var dy = p1.y - p2.y;
                    var d = Math.sqrt(dx * dx + dy * dy);
                    if (d < 50) {
                        ctx.strokeStyle = 'rgba(0, 0, 0, 0.5)';
                        ctx.beginPath();
                        ctx.moveTo(p1.x, p1.y);
                        ctx.lineTo(p2.x, p2.y);
                        ctx.stroke();
                    }
                }
            }
        });

    })();
</script>
</body>

</html>


