<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta><meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link type="text/css" rel="stylesheet"
          href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" />

    <title>EBook-后台登陆</title>


    <style>
        * {
            padding:0;
            margin:0;
        }
        canvas {
            display:block;
        }
        .draw{
            position:absolute;
            left:0px;
            top:0px;
            z-index:-1
        }
    </style>

</head>
<body>


<div class="container" style="margin-top: 100px;">

    <div class="col-md-6 col-md-offset-3">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="text-center">EBook</h3>
            </div>
            <div class="panel-body">
                <p class="text-center text-danger">${error}</p>
                <form id="loginForm" class="form-horizontal" role="form" action="backlogin" method="post">
                    <div class="form-group col-md-12 col-xs-12 col-sm-12">
                        <label class="control-label col-xs-2 col-xs-offset-2">账号</label>
                        <div class="col-xs-6">
                            <input name="username" type="text" class="form-control">
                        </div>
                    </div>
                    <div class="form-group col-xs-12 col-sm-12">
                        <label class="control-label col-xs-2 col-xs-offset-2">密码</label>
                        <div class="col-xs-6">
                            <input type="password" class="form-control" name="password">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-2 col-xs-offset-4">
                            <button type="submit" class="btn btn-success">登录</button>
                        </div>
                        <div class="col-xs-2 col-sm-6">
                            <button type="button" class="btn btn-info">重置</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="draw">
    <canvas  id="c"></canvas>
</div>

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

