<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link type="text/css" rel="stylesheet"
          href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" />
    <title>EBook - 上传成功</title>
</head>
<body>
<%------------------%>
<style>
    /* Variables */
    /* Reset */
    *, *::after, *::before {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    /* Generic */
    body {
        width: 100%;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        background-color: #fffdff;
    }

    .main {
        width: 800px;
        height: 600px;
        position: relative;
    }
    @media (max-width: 768px) {
        .main {
            transform: scale(0.7);
        }
    }
    @media (max-width: 640px) {
        .main {
            transform: scale(0.5);
        }
    }

    .house {
        width: 400px;
        height: 300px;
        display: flex;
        justify-content: center;
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translateX(-50%) translateY(-13%);
        position: relative;
        perspective: 200px;
    }

    .floor {
        display: flex;
        justify-content: center;
        position: absolute;
        bottom: 0;
        width: 95%;
        height: 30px;
        border: 4px solid #314b70;
        border-top-left-radius: 4px;
        border-top-right-radius: 4px;
        background-color: #e1f6fd;
        box-shadow: inset 4px 4px 0 #fffdff;
    }
    .floor::before, .floor::after {
        content: '';
        position: absolute;
        bottom: 0;
        width: 32%;
        height: 60%;
        border-left: 4px solid #314b70;
        border-right: 4px solid #314b70;
        border-top: 4px solid #314b70;
        border-top-left-radius: 4px;
        border-top-right-radius: 4px;
        background-image: linear-gradient(to bottom, #e0f5fc 50%, #aac4d0 50%);
        box-shadow: 4px 0 0 #aac4d0;
    }
    .floor::after {
        top: 0;
        width: 25%;
        height: 40%;
        border-top-left-radius: 0;
        border-top-right-radius: 0;
        border-top: none;
    }

    .wall {
        display: flex;
        justify-content: space-between;
        align-items: flex-end;
        position: absolute;
        bottom: 30px;
        width: 91%;
        height: 175px;
        background: #c3e0e7;
        border-left: 4px solid #314b70;
        border-right: 4px solid #314b70;
        overflow: hidden;
    }

    .window {
        position: relative;
        width: 34%;
        height: 125px;
        border-top: 4px solid #314b70;
        border-right: 4px solid #314b70;
        border-bottom: none;
        border-left: none;
        border-top-right-radius: 8px;
        background: #aac4d0;
        box-shadow: inset 0 4px 2px #e0f5fc;
    }
    .window::before {
        content: '';
        position: absolute;
        width: 94%;
        height: 88%;
        top: 6%;
        left: 0;
        border-top-right-radius: 4px;
        border-bottom-right-radius: 4px;
        border-top: 4px solid #314b70;
        border-right: 4px solid #314b70;
        border-bottom: 4px solid #314b70;
        border-left: none;
        background-image: linear-gradient(to top, #f3f6fa 47%, #9ab2d3 47%, #9ab2d3 50%, #f3f6fa 50%);
    }
    .window::after {
        content: '';
        position: absolute;
        height: 40px;
        width: 30px;
        top: 19%;
        left: 20%;
        background-color: #f9aabe;
        border: 4px solid #9ab2d3;
    }
    .window:nth-of-type(3) {
        transform: rotateZ(180deg);
        border-top: none;
        border-right: 4px solid #314b70;
        border-bottom: 4px solid #314b70;
        border-left: none;
        border-bottom-right-radius: 8px;
        border-top-right-radius: 0;
        box-shadow: inset 0 -4px 2px #e0f5fc;
    }
    .window:nth-of-type(3)::after {
        content: none;
    }

    .door {
        display: flex;
        flex-direction: column;
        justify-content: space-evenly;
        align-items: flex-start;
        width: 20%;
        height: 130px;
        padding-left: 8px;
        border: 4px solid #314b70;
        border-bottom: none;
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
        background-color: #ffc26b;
        box-shadow: inset 3px 3px #ffe0ad, inset -10px -8px #ffad61, 4px 0 #aac4d0;
    }
    .door__square {
        width: 85%;
        height: 47px;
        border-radius: 4px;
        border: 4px solid #314b70;
        box-shadow: inset 3px 3px #ffe0ad;
    }
    .door__line {
        width: 25%;
        height: 4px;
        background: #314b70;
        border-radius: 4px;
    }

    .top {
        position: absolute;
        width: 82%;
        height: 30px;
        border: 4px solid #314b70;
        border-top-left-radius: 4px;
        border-top-right-radius: 4px;
        background-color: #aac4d0;
        box-shadow: inset 4px 4px 0 #e1f6fd;
    }

    .circle {
        content: '';
        position: absolute;
        top: -10%;
        display: flex;
        justify-content: center;
        align-items: center;
        width: 115px;
        height: 115px;
        border: 4px solid #314b70;
        border-radius: 50%;
        background-color: #e0f5fc;
        box-shadow: inset 4px 4px 0 #fffdff, inset 4px -4px 0 #fffdff, inset -4px 4px 0 #fffdff, inset -4px -4px 0 #fffdff;
    }
    .circle::before, .circle::after {
        content: '';
        position: absolute;
        top: 35%;
        width: 70%;
        height: 4px;
        background-color: #314b70;
    }
    .circle::after {
        width: 35%;
        top: 20%;
    }

    .plastic {
        position: absolute;
        z-index: 100;
        top: 30%;
        width: 100%;
        height: 30px;
        overflow: hidden;
    }
    .plastic__g {
        display: flex;
        justify-content: center;
        width: 100%;
        overflow: hidden;
        transform: translateY(-22px);
    }
    .plastic__item {
        border-radius: 50%;
        width: 43px;
        height: 43px;
        border: 3px solid #314b70;
        box-shadow: 0 4px 0px #aac4d0;
        margin-bottom: 4px;
    }
    .plastic__item:nth-child(odd) {
        background: #0792d9;
        box-shadow: 0 4px 0px #aac4d0, inset 4px 4px 0 #66c8fa;
    }
    .plastic__item:nth-child(even) {
        background: #fffdff;
    }
    .plastic__item:nth-of-type(1), .plastic__item:nth-last-of-type(1) {
        box-shadow: none;
        box-shadow: inset 4px 4px 0 #66c8fa;
        width: 45px;
        height: 45px;
    }
    .plastic__item:nth-of-type(5) {
        width: 45px;
        height: 45px;
    }

    .line {
        display: flex;
        position: absolute;
        top: 15px;
        width: 90%;
        height: 85px;
        transform-style: preserve-3d;
        transform: rotateX(25deg);
        border-left: 4px solid #314b70;
        border-right: 4px solid #314b70;
        border-bottom: 4px solid #314b70;
        background-color: #e1f6fd;
        border-radius: 4px;
    }
    .line__item {
        height: 100%;
        flex-grow: 1;
        border-right: 4px solid #314b70;
    }
    .line__item:nth-child(odd) {
        background: #00affa;
        box-shadow: inset 4px 4px 0 #66c8fa;
    }
    .line__item:nth-child(even) {
        background: #fffdff;
    }
    .line__item:nth-last-of-type(1) {
        border-right: none;
    }
    .line__item:nth-child(4), .line__item:nth-child(5), .line__item:nth-child(6) {
        border-top: 6px solid #314b70;
    }

    .tree {
        display: flex;
        justify-content: center;
        position: absolute;
        left: 10%;
        bottom: 19%;
        width: 100px;
        height: 165px;
        border-radius: 50px;
        border: 4px solid #314b70;
        background-color: #00d398;
        box-shadow: inset 4px 0 0px #77e4c6, inset -4px 0 0px #00a073;
        transform-origin: 0% 100%;
        animation: tree 1s linear alternate infinite;
    }
    .tree__item {
        position: absolute;
        bottom: -80px;
        width: 4px;
        height: 140px;
        background: #314b70;
    }
    .tree__item:nth-of-type(2) {
        bottom: 80px;
        height: 40px;
        box-shadow: 0 0 0 8px #77e4c6;
        border-radius: 20px;
    }
    .tree__item:nth-of-type(2):before {
        content: '';
        position: absolute;
        bottom: -45px;
        left: -30px;
        width: 20px;
        height: 35px;
        border-radius: 15px;
        background-color: #77e4c6;
    }
    .tree__item:nth-of-type(3) {
        bottom: 20px;
        left: 36%;
        width: 4px;
        height: 30px;
        background-color: #314b70;
        transform: rotateZ(-45deg);
    }

    .dot {
        position: absolute;
        bottom: 38px;
        width: 100%;
        height: 4px;
        background-image: linear-gradient(to right, #314b70 10%, transparent 10%, transparent 11%, #314b70 11%, #314b70 85%, transparent 85%, transparent 86%, #314b70 86%);
    }

    .bush__item {
        position: absolute;
        left: 18%;
        bottom: 40px;
        width: 80px;
        height: 60px;
        border: 1px solid red;
        border-top-left-radius: 50px;
        border-top-right-radius: 100px;
        border: 4px solid #314b70;
        border-bottom: none;
        background-color: #00d398;
        box-shadow: inset 4px 0 0px #77e4c6, inset -4px 0 0px #00a073;
        transform-origin: bottom center;
        animation: bush 2s alternate infinite;
    }
    .bush__item:nth-of-type(2) {
        left: 13%;
        width: 50px;
        height: 40px;
        border-top-left-radius: 50px;
        border-top-right-radius: 10px;
        animation: tree 2s alternate reverse infinite .5s;
    }
    .bush__item::before {
        content: '';
        position: absolute;
        width: 20px;
        height: 20px;
        background: #77e4c6;
        border-radius: 50%;
        top: 10px;
        left: 10px;
    }

    .cloud {
        position: absolute;
        top: 200px;
        left: 60px;
        display: flex;
        justify-content: center;
        width: 85px;
        height: 20px;
        border-bottom: 4px solid #e1e8f2;
        animation: cloud 4s infinite alternate;
    }
    .cloud:nth-of-type(2) {
        left: 50%;
        top: 150px;
        animation: cloud 4s infinite reverse alternate .5s;
    }
    .cloud:nth-of-type(3) {
        left: 80%;
        top: 250px;
        animation: cloud 4s ease infinite alternate .75s;
    }
    .cloud__item {
        position: relative;
        border-radius: 50%;
        border-top: 20px solid #e1e8f2;
        border-left: 20px solid #e1e8f2;
        border-bottom: 20px solid transparent;
        border-right: 20px solid transparent;
        transform: rotateZ(45deg);
    }
    .cloud__item:nth-of-type(2) {
        margin-left: -7px;
        margin-top: 5px;
        border-top: 15px solid #e1e8f2;
        border-left: 15px solid #e1e8f2;
        border-bottom: 15px solid transparent;
        border-right: 15px solid transparent;
    }

    .bird {
        position: absolute;
        bottom: 40%;
        right: 10%;
        width: 20px;
        height: 20px;
        border-top: 4px solid #becde2;
        border-left: 4px solid #becde2;
        transform: rotateZ(-135deg);
        z-index: -1;
        animation: bird 1s ease alternate infinite;
    }
    .bird:nth-of-type(2) {
        right: 20%;
        bottom: 30%;
        width: 15px;
        height: 15px;
    }

    /**/
    @keyframes bird {
        0% {
            transform: scaleY(0.7) rotateZ(-135deg) translateX(0) translateY(0) skew(-10deg, -10deg);
        }
        100% {
            transform: scaleY(1) rotateZ(-135deg) translateX(50%) translateY(50%) skew(-10deg, -10deg);
        }
    }
    @keyframes tree {
        0% {
            transform: scaleY(1);
        }
        100% {
            transform: scaleY(0.975);
        }
    }
    @keyframes bush {
        0% {
            transform: skewX(-2deg);
        }
        100% {
            transform: skewX(5deg);
        }
    }
    @keyframes cloud {
        0% {
            transform: translateX(-10%);
        }
        100% {
            transform: translateX(20%);
        }
    }

</style>
<%------------------%>
<div class="container">
    <h1 class="text-success" style="margin: 30px 18px 10px">上传成功，感谢您的上传！
        <span class="small" style="margin-left: 10px"><i class="glyphicon glyphicon-thumbs-up"></i>奖励2点贡献值</span></h1>
    <div class="btn-group btn-group-lg">
        <button type="button" class="btn btn-link" onclick="window.location.href='getUploadPage'">继续上传</button>
        <button type="button" class="btn btn-link" onclick="window.location.href='bookDetail?bookID=${bookID}'">查看书籍</button>
        <button type="button" class="btn btn-link" onclick="window.location.href='index'">回到首页</button>
    </div>



    <div class="main">
        <div class="house">
            <div class="floor"></div>
            <div class="wall">
                <div class="window"></div>
                <div class="door">
                    <div class="door__square"></div>
                    <div class="door__line"></div>
                    <div class="door__square"></div>
                </div>
                <div class="window"></div>
            </div>
            <div class="top"></div>
            <div class="circle"></div>
            <div class="plastic">
                <div class="plastic__g">
                    <div class="plastic__item"></div>
                    <div class="plastic__item"></div>
                    <div class="plastic__item"></div>
                    <div class="plastic__item"></div>
                    <div class="plastic__item"></div>
                    <div class="plastic__item"></div>
                    <div class="plastic__item"></div>
                    <div class="plastic__item"></div>
                    <div class="plastic__item"></div>
                </div>
            </div>
            <div class="line">
                <div class="line__item"></div>
                <div class="line__item"></div>
                <div class="line__item"></div>
                <div class="line__item"></div>
                <div class="line__item"></div>
                <div class="line__item"></div>
                <div class="line__item"></div>
                <div class="line__item"></div>
                <div class="line__item"></div>
            </div>
        </div>
        <div class="clouds">
            <div class="cloud">
                <div class="cloud__item"></div>
                <div class="cloud__item"></div>
            </div>
            <div class="cloud">
                <div class="cloud__item"></div>
                <div class="cloud__item"></div>
            </div>
            <div class="cloud">
                <div class="cloud__item"></div>
                <div class="cloud__item"></div>
            </div>
            <div class="bird"></div>
        </div>
        <div class="birds">
            <div class="bird"></div>
            <div class="bird"></div>
        </div>
        <div class="tree">
            <div class="tree__item"> </div>
            <div class="tree__item"> </div>
            <div class="tree__item"> </div>
        </div>
        <div class="bush">
            <div class="bush__item"></div>
            <div class="bush__item"></div>
        </div>
        <div class="dot"></div>
    </div>
</div>









<%--<style>--%>
<%--    body {--%>
<%--        background-color: #eee;--%>
<%--        overflow: hidden;--%>
<%--    }--%>
<%--    canvas {--%>
<%--        background-color: #eee;--%>
<%--        display: block;--%>
<%--        margin: 0 auto;--%>
<%--    }--%>
<%--    .draw{--%>
<%--        position:absolute;--%>
<%--        left:0px;--%>
<%--        top:0px;--%>
<%--        z-index:-1;--%>
<%--    }--%>
<%--</style>--%>

<%--<canvas id="canvas" class="draw"></canvas>--%>
<%--<script>--%>
<%--    var canvas = document.getElementById("canvas");--%>
<%--    var ctx = canvas.getContext("2d");--%>
<%--    var cw = canvas.width = window.innerWidth,--%>
<%--        cx = cw / 2;--%>
<%--    var ch = canvas.height = window.innerHeight,--%>
<%--        cy = ch / 2;--%>

<%--    ctx.fillStyle = "#000";--%>
<%--    var linesNum = 16;--%>
<%--    var linesRy = [];--%>
<%--    var requestId = null;--%>

<%--    function Line(flag) {--%>
<%--        this.flag = flag;--%>
<%--        this.a = {};--%>
<%--        this.b = {};--%>
<%--        if (flag == "v") {--%>
<%--            this.a.y = 0;--%>
<%--            this.b.y = ch;--%>
<%--            this.a.x = randomIntFromInterval(0, ch);--%>
<%--            this.b.x = randomIntFromInterval(0, ch);--%>
<%--        } else if (flag == "h") {--%>
<%--            this.a.x = 0;--%>
<%--            this.b.x = cw;--%>
<%--            this.a.y = randomIntFromInterval(0, cw);--%>
<%--            this.b.y = randomIntFromInterval(0, cw);--%>
<%--        }--%>
<%--        this.va = randomIntFromInterval(25, 100) / 100;--%>
<%--        this.vb = randomIntFromInterval(25, 100) / 100;--%>

<%--        this.draw = function() {--%>
<%--            ctx.strokeStyle = "#ccc";--%>
<%--            ctx.beginPath();--%>
<%--            ctx.moveTo(this.a.x, this.a.y);--%>
<%--            ctx.lineTo(this.b.x, this.b.y);--%>
<%--            ctx.stroke();--%>
<%--        }--%>

<%--        this.update = function() {--%>
<%--            if (this.flag == "v") {--%>
<%--                this.a.x += this.va;--%>
<%--                this.b.x += this.vb;--%>
<%--            } else if (flag == "h") {--%>
<%--                this.a.y += this.va;--%>
<%--                this.b.y += this.vb;--%>
<%--            }--%>

<%--            this.edges();--%>
<%--        }--%>

<%--        this.edges = function() {--%>
<%--            if (this.flag == "v") {--%>
<%--                if (this.a.x < 0 || this.a.x > cw) {--%>
<%--                    this.va *= -1;--%>
<%--                }--%>
<%--                if (this.b.x < 0 || this.b.x > cw) {--%>
<%--                    this.vb *= -1;--%>
<%--                }--%>
<%--            } else if (flag == "h") {--%>
<%--                if (this.a.y < 0 || this.a.y > ch) {--%>
<%--                    this.va *= -1;--%>
<%--                }--%>
<%--                if (this.b.y < 0 || this.b.y > ch) {--%>
<%--                    this.vb *= -1;--%>
<%--                }--%>
<%--            }--%>
<%--        }--%>

<%--    }--%>

<%--    for (var i = 0; i < linesNum; i++) {--%>
<%--        var flag = i % 2 == 0 ? "h" : "v";--%>
<%--        var l = new Line(flag);--%>
<%--        linesRy.push(l);--%>
<%--    }--%>

<%--    function Draw() {--%>
<%--        requestId = window.requestAnimationFrame(Draw);--%>
<%--        ctx.clearRect(0, 0, cw, ch);--%>

<%--        for (var i = 0; i < linesRy.length; i++) {--%>
<%--            var l = linesRy[i];--%>
<%--            l.draw();--%>
<%--            l.update();--%>
<%--        }--%>
<%--        for (var i = 0; i < linesRy.length; i++) {--%>
<%--            var l = linesRy[i];--%>
<%--            for (var j = i + 1; j < linesRy.length; j++) {--%>
<%--                var l1 = linesRy[j]--%>
<%--                Intersect2lines(l, l1);--%>
<%--            }--%>
<%--        }--%>
<%--    }--%>

<%--    function Init() {--%>
<%--        linesRy.length = 0;--%>
<%--        for (var i = 0; i < linesNum; i++) {--%>
<%--            var flag = i % 2 == 0 ? "h" : "v";--%>
<%--            var l = new Line(flag);--%>
<%--            linesRy.push(l);--%>
<%--        }--%>

<%--        if (requestId) {--%>
<%--            window.cancelAnimationFrame(requestId);--%>
<%--            requestId = null;--%>
<%--        }--%>

<%--        cw = canvas.width = window.innerWidth,--%>
<%--            cx = cw / 2;--%>
<%--        ch = canvas.height = window.innerHeight,--%>
<%--            cy = ch / 2;--%>

<%--        Draw();--%>
<%--    };--%>

<%--    setTimeout(function() {--%>
<%--        Init();--%>

<%--        addEventListener('resize', Init, false);--%>
<%--    }, 15);--%>

<%--    function Intersect2lines(l1, l2) {--%>
<%--        var p1 = l1.a,--%>
<%--            p2 = l1.b,--%>
<%--            p3 = l2.a,--%>
<%--            p4 = l2.b;--%>
<%--        var denominator = (p4.y - p3.y) * (p2.x - p1.x) - (p4.x - p3.x) * (p2.y - p1.y);--%>
<%--        var ua = ((p4.x - p3.x) * (p1.y - p3.y) - (p4.y - p3.y) * (p1.x - p3.x)) / denominator;--%>
<%--        var ub = ((p2.x - p1.x) * (p1.y - p3.y) - (p2.y - p1.y) * (p1.x - p3.x)) / denominator;--%>
<%--        var x = p1.x + ua * (p2.x - p1.x);--%>
<%--        var y = p1.y + ua * (p2.y - p1.y);--%>
<%--        if (ua > 0 && ub > 0) {--%>
<%--            markPoint({--%>
<%--                x: x,--%>
<%--                y: y--%>
<%--            })--%>
<%--        }--%>
<%--    }--%>

<%--    function markPoint(p) {--%>
<%--        ctx.beginPath();--%>
<%--        ctx.arc(p.x, p.y, 2, 0, 2 * Math.PI);--%>
<%--        ctx.fill();--%>
<%--    }--%>

<%--    function randomIntFromInterval(mn, mx) {--%>
<%--        return ~~(Math.random() * (mx - mn + 1) + mn);--%>
<%--    }</script>--%>
</body>
</html>
