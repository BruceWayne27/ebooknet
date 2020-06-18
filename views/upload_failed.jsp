<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link type="text/css" rel="stylesheet"
          href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" />
    <title>EBook - 上传失败</title>
    <style>
        * {
            margin: 0 auto;
            -webkit-user-select: none;
        }
        body {
            height: 100vh;
            overflow: hidden;
            animation: bodycolor 16s infinite;
        }
        .container {
            position: absolute;
            width: 100%;
            height: 100%;
            overflow: hidden;
        }
        .spaceship {
            position: absolute;
            top: 30%;
            height: 250px;
            width: 300px;
            margin-left: -150px;
            animation: spaceshipleft 8s infinite;
        }
        .spaceship_top {
            margin: auto;
            position: absolute;
            bottom: 0;
            left: 0;
            top: 0;
            right: 0;
            top: -150px;
            height: 150px;
            width: 200px;
            background-color: #f6a7ba;
            border-radius: 8rem 8rem 0 0;
            box-shadow: inset 6px 2px 3px 0 #c2c2c2;
        }
        .spaceship_top::before {
            content: "";
            position: absolute;
            left: 150px;
            top: 32px;
            height: 8px;
            width: 10px;
            background-color: white;
            border-radius: 2rem;
            transform: rotate(42deg);
        }
        .spaceship_top::after {
            content: "";
            position: absolute;
            left: 130px;
            top: 20px;
            height: 10px;
            width: 20px;
            background-color: white;
            border-radius: 2rem;
            transform: rotate(32deg);
        }
        .spaceship_middle {
            margin: auto;
            position: absolute;
            bottom: 0;
            left: 0;
            top: 0;
            right: 0;
            width: 300px;
            height: 70px;
            overflow: hidden;
            border-radius: 5rem;
            box-shadow: inset 6px 2px 3px 0 #c2c2c2;
            z-index: 3;
            animation: colorswap_middle 16s infinite;
        }
        .spaceship_bottom {
            margin: auto;
            position: absolute;
            bottom: 0;
            left: 0;
            top: 0;
            right: 0;
            top: 75px;
            width: 165px;
            height: 30px;
            background-color: #9c0327;
            border-radius: 0 0 2rem 2rem;
            z-index: -1;
            box-shadow: inset 5px 2px 3px 0 #c2c2c2;
            z-index: 2;
        }
        .abduct_hole1 {
            position: absolute;
            left: 32px;
            border: 2px solid white;
            border-radius: 50%;
            background: rgba(0, 0, 0, 0);
            width: 100px;
            height: 100px;
            transform: rotateX(75deg);
            animation: abduct 8s infinite, abductcolor 16s infinite;
        }
        .abduct_hole2 {
            position: absolute;
            left: 32px;
            top: 20px;
            border: 2px solid white;
            border-radius: 50%;
            background: rgba(0, 0, 0, 0);
            width: 100px;
            height: 100px;
            transform: rotateX(75deg);
            animation: abductreverse 8s 0.1s infinite, abductcolor 16s infinite;
        }
        .abduct_hole3 {
            position: absolute;
            left: 32px;
            top: 35px;
            border: 2px solid white;
            border-radius: 50%;
            background: rgba(0, 0, 0, 0);
            width: 100px;
            height: 100px;
            transform: rotateX(75deg);
            animation: abduct 8s 0.2s infinite, abductcolor 16s infinite;
        }
        .abduct_hole4 {
            position: absolute;
            left: 30px;
            top: 50px;
            border: 2px solid white;
            border-radius: 50%;
            background: rgba(0, 0, 0, 0);
            width: 100px;
            height: 100px;
            transform: rotateX(75deg);
            animation: abductreverse 8s infinite, abductcolor 16s infinite;
        }
        .abduct_hole5 {
            position: absolute;
            left: 32px;
            top: 70px;
            border: 2px solid white;
            border-radius: 50%;
            background: rgba(0, 0, 0, 0);
            width: 100px;
            height: 100px;
            transform: rotateX(75deg);
            animation: abductreverse 8s infinite, abductcolor 16s infinite;
        }
        .spaceship_balls_1 {
            position: absolute;
            top: 10px;
            height: 50px;
            width: 50px;
            border-radius: 50%;
            animation: moveleft 3s linear infinite, colorswap 16s infinite;
            box-shadow: inset 6px 2px 3px 0 #c2c2c2;
        }
        .spaceship_balls_1::before {
            content: "";
            position: absolute;
            top: 0;
            left: 60px;
            background-color: inherit;
            width: 50px;
            height: 50px;
            border-radius: 50%;
            box-shadow: inset 6px 2px 3px 0 #c2c2c2;
        }
        .spaceship_balls_1::after {
            content: "";
            position: absolute;
            top: 0;
            left: 120px;
            background-color: inherit;
            width: 50px;
            height: 50px;
            border-radius: 50%;
            box-shadow: inset 6px 2px 3px 0 #c2c2c2;
        }
        .spaceship_balls_2 {
            position: absolute;
            top: 10px;
            height: 50px;
            width: 50px;
            left: 360px;
            border-radius: 50%;
            animation: moveleft 3s linear 0.64s infinite, colorswap 16s infinite;
            box-shadow: inset 6px 2px 3px 0 #c2c2c2;
        }
        .spaceship_balls_2::before {
            content: "";
            position: absolute;
            top: 0;
            left: 60px;
            background-color: inherit;
            width: 50px;
            height: 50px;
            border-radius: 50%;
            box-shadow: inset 6px 2px 3px 0 #c2c2c2;
        }
        .spaceship_balls_2::after {
            content: "";
            position: absolute;
            top: 0;
            left: 120px;
            background-color: inherit;
            width: 50px;
            height: 50px;
            border-radius: 50%;
            box-shadow: inset 6px 2px 3px 0 #c2c2c2;
        }
        .spaceship_balls_3 {
            position: absolute;
            top: 10px;
            height: 50px;
            width: 50px;
            left: 720px;
            border-radius: 50%;
            animation: moveleft 3s linear 1.28s infinite, colorswap 16s infinite;
            box-shadow: inset 6px 2px 3px 0 #c2c2c2;
        }
        .spaceship_balls_3::before {
            content: "";
            position: absolute;
            top: 0;
            left: 60px;
            background-color: inherit;
            width: 50px;
            height: 50px;
            border-radius: 50%;
            box-shadow: inset 6px 2px 3px 0 #c2c2c2;
        }
        .spaceship_balls_3::after {
            content: "";
            position: absolute;
            top: 0;
            left: 120px;
            background-color: inherit;
            width: 50px;
            height: 50px;
            border-radius: 50%;
            box-shadow: inset 6px 2px 3px 0 #c2c2c2;
        }
        .spaceship_balls_4 {
            position: absolute;
            top: 10px;
            height: 50px;
            width: 50px;
            left: 1080px;
            border-radius: 50%;
            animation: moveleft 3s linear 1.92s infinite, colorswap 16s infinite;
            box-shadow: inset 6px 2px 3px 0 #c2c2c2;
        }
        .spaceship_balls_4::before {
            content: "";
            position: absolute;
            top: 0;
            left: 60px;
            background-color: inherit;
            width: 50px;
            height: 50px;
            border-radius: 50%;
            box-shadow: inset 6px 2px 3px 0 #c2c2c2;
        }
        .spaceship_balls_4::after {
            content: "";
            position: absolute;
            top: 0;
            left: 120px;
            background-color: inherit;
            width: 50px;
            height: 50px;
            border-radius: 50%;
            box-shadow: inset 6px 2px 3px 0 #c2c2c2;
        }
        .spaceship_balls_5 {
            position: absolute;
            top: 10px;
            height: 50px;
            width: 50px;
            left: 1440px;
            border-radius: 50%;
            animation: moveleft 3s linear 2.56s infinite, colorswap 16s infinite;
            box-shadow: inset 6px 2px 3px 0 #c2c2c2;
        }
        .spaceship_balls_5::before {
            content: "";
            position: absolute;
            top: 0;
            left: 60px;
            background-color: inherit;
            width: 50px;
            height: 50px;
            border-radius: 50%;
            box-shadow: inset 6px 2px 3px 0 #c2c2c2;
        }
        .spaceship_balls_5::after {
            content: "";
            position: absolute;
            top: 0;
            left: 120px;
            background-color: inherit;
            width: 50px;
            height: 50px;
            border-radius: 50%;
            box-shadow: inset 6px 2px 3px 0 #c2c2c2;
        }
        .robot {
            text-align: center;
            width: 300px;
            position: absolute;
            left: 50%;
            margin-left: -150px;
            margin-top: -200px;
            transform: scale(0.25);
            z-index: 1;
            animation: robotup 16s infinite;
        }
        #half {
            text-align: center;
            width: 280px;
            height: 200px;
            background: #f16385;
            border: 10px solid #a62a48;
            border-top-left-radius: 300px;
            border-top-right-radius: 300px;
        }
        #brain {
            margin: 0 auto;
            margin-top: 20px;
            width: 160px;
            height: 60px;
            background: #f48aa3;
            border: 20px solid #d6365c;
            border-top-left-radius: 200px;
            border-top-right-radius: 200px;
        }
        #head {
            position: inherit;
            top: 140px;
            right: -10px;
            width: 320px;
            height: 100px;
            background: #162736;
        }
        #foot {
            position: inherit;
            top: 240px;
            left: 10px;
            width: 280px;
            height: 20px;
            background: #162736;
        }
        #le {
            margin-top: 20px;
            margin-right: 10px;
            display: inline-block;
            width: 33.33333333px;
            height: 33.33333333px;
            border: 10px solid #d6365c;
            border-radius: 50%;
            background: #f8b1c2;
        }
        #re {
            margin-left: 10px;
            display: inline-block;
            width: 33.33333333px;
            height: 33.33333333px;
            border: 10px solid #d6365c;
            border-radius: 50%;
            background: #f8b1c2;
        }
        #lc {
            margin-right: 10px;
            display: inline-block;
            width: 12.5px;
            height: 12.5px;
            border-radius: 50%;
            background: #ee3d67;
            box-shadow: 0 0 5px #ff0066;
            -webkit-box-shadow: 0 0 5px #ff0066;
            -moz-box-shadow: 0 0 5px #ff0066;
        }
        #rc {
            display: inline-block;
            width: 12.5px;
            height: 12.5px;
            border-radius: 50%;
            background: #ee3d67;
            box-shadow: 0 0 5px #ff0066;
            -webkit-box-shadow: 0 0 5px #ff0066;
            -moz-box-shadow: 0 0 5px #ff0066;
        }
        #mouth {
            z-index: 9999;
            position: inherit;
            margin-top: 10px;
            margin-left: 150px;
            height: 10px;
            width: 20px;
            border-radius: 0 0 90px 90px;
            -moz-border-radius: 0 0 90px 90px;
            -webkit-border-radius: 0 0 90px 90px;
            border-right: 5px solid #ee3d67;
            border-left: 5px solid #ee3d67;
            border-bottom: 5px solid #ee3d67;
        }
        #leg-1 {
            display: inline-block;
            position: relative;
            top: 60px;
            left: 10px;
            width: 100px;
            height: 20px;
            background: #162736;
            transform: rotate(60deg);
            -ms-transform: rotate(60deg);
            /* IE 9 */
            -webkit-transform: rotate(60deg);
            /* Safari and Chrome */
            border-top-right-radius: 20px;
            border-bottom-right-radius: 20px;
        }
        #leg-2 {
            display: inline-block;
            position: relative;
            top: 60px;
            left: 10px;
            width: 100px;
            height: 20px;
            background: #162736;
            transform: rotate(-60deg);
            -ms-transform: rotate(-60deg);
            /* IE 9 */
            -webkit-transform: rotate(-60deg);
            /* Safari and Chrome */
            border-top-left-radius: 20px;
            border-bottom-left-radius: 20px;
        }
        #star1 {
            margin: 50px 0;
            position: relative;
            left: -100px;
            top: -100px;
            display: block;
            color: #ffd94d;
            width: 0px;
            height: 0px;
            border-right: 100px solid transparent;
            border-bottom: 70px solid #ffd94d;
            border-left: 100px solid transparent;
            transform: rotate(35deg) scale(0.15);
            z-index: 5;
            animation: starpopup 16s infinite;
        }
        #star1:before {
            border-bottom: 80px solid #ffd94d;
            border-left: 30px solid transparent;
            border-right: 30px solid transparent;
            position: absolute;
            height: 0;
            width: 0;
            top: -45px;
            left: -50px;
            display: block;
            content: "";
            transform: rotate(-35deg);
        }
        #star1:after {
            position: absolute;
            display: block;
            color: #ffd94d;
            top: 3px;
            left: -105px;
            width: 0px;
            height: 0px;
            border-right: 100px solid transparent;
            border-bottom: 70px solid #ffd94d;
            border-left: 100px solid transparent;
            transform: rotate(-70deg);
            content: "";
        }
        #star2 {
            margin: 50px 0;
            position: relative;
            left: 210px;
            top: -220px;
            display: block;
            color: #ffd94d;
            width: 0px;
            height: 0px;
            border-right: 100px solid transparent;
            border-bottom: 70px solid #ffd94d;
            border-left: 100px solid transparent;
            transform: rotate(35deg) scale(0.15);
            z-index: 5;
            animation: starpopup 16s infinite;
        }
        #star2:before {
            border-bottom: 80px solid #ffd94d;
            border-left: 30px solid transparent;
            border-right: 30px solid transparent;
            position: absolute;
            height: 0;
            width: 0;
            top: -45px;
            left: -65px;
            display: block;
            content: "";
            transform: rotate(-35deg);
        }
        #star2:after {
            position: absolute;
            display: block;
            color: #ffd94d;
            top: 3px;
            left: -105px;
            width: 0px;
            height: 0px;
            border-right: 100px solid transparent;
            border-bottom: 70px solid #ffd94d;
            border-left: 100px solid transparent;
            transform: rotate(-70deg);
            content: "";
        }
        #star3 {
            margin: 50px 0;
            position: relative;
            left: 45px;
            top: -410px;
            display: block;
            color: #ffd94d;
            width: 0px;
            height: 0px;
            border-right: 100px solid transparent;
            border-bottom: 70px solid #ffd94d;
            border-left: 100px solid transparent;
            transform: rotate(35deg) scale(0.15);
            z-index: 5;
            animation: starpopup 16s infinite;
        }
        #star3:before {
            border-bottom: 80px solid #ffd94d;
            border-left: 30px solid transparent;
            border-right: 30px solid transparent;
            position: absolute;
            height: 0;
            width: 0;
            top: -45px;
            left: -65px;
            display: block;
            content: "";
            transform: rotate(-35deg);
        }
        #star3:after {
            position: absolute;
            display: block;
            color: #ffd94d;
            top: 3px;
            left: -105px;
            width: 0px;
            height: 0px;
            border-right: 100px solid transparent;
            border-bottom: 70px solid #ffd94d;
            border-left: 100px solid transparent;
            transform: rotate(-70deg);
            content: "";
        }
        @keyframes starpopup {
            0% {
                opacity: 0;
                transform: rotate(35deg) scale(0.1);
            }
            20% {
                opacity: 0;
                transform: rotate(235deg) scale(0.1);
            }
            21% {
                opacity: 1;
                transform: rotate(-135deg) scale(0.1);
            }
            28% {
                opacity: 0;
                transform: rotate(-635deg) scale(0.1);
            }
            55% {
                opacity: 0;
                transform: rotate(135deg) scale(0.1);
            }
            70% {
                opacity: 0;
                transform: rotate(935deg) scale(0.1);
            }
            71% {
                opacity: 1;
                transform: rotate(-135deg) scale(0.1);
            }
            78% {
                opacity: 0;
                transform: rotate(-635deg) scale(0.1);
            }
            100% {
                opacity: 0;
                transform: rotate(35deg) scale(0.1);
            }
        }
        @keyframes robotup {
            0% {
                top: 80%;
            }
            20% {
                top: 80%;
            }
            25% {
                top: 43%;
            }
            50% {
                top: 44%;
            }
            70% {
                top: 44%;
            }
            75% {
                top: 80%;
            }
            100% {
                top: 80%;
            }
        }
        @keyframes abduct {
            0% {
                opacity: 0;
            }
            42% {
                opacity: 0;
            }
            43% {
                opacity: 0.8;
                transform: rotateX(75deg) translateY(0px);
            }
            45% {
                transform: rotateX(75deg) translateY(200px) scale(0.8);
                opacity: 0.8;
            }
            47% {
                transform: rotateX(75deg) translateY(0px);
                opacity: 0.8;
            }
            48% {
                opacity: 0;
            }
            100% {
                opacity: 0;
            }
        }
        @keyframes abductreverse {
            0% {
                opacity: 0;
            }
            42% {
                opacity: 0;
            }
            43% {
                opacity: 0.8;
                transform: rotateX(75deg) translateY(0px);
            }
            45% {
                opacity: 0.8;
                transform: rotateX(75deg) translateY(-100px);
            }
            48% {
                opacity: 0.8;
                transform: rotateX(75deg) translateY(0px);
            }
            49% {
                opacity: 0;
            }
            100% {
                opacity: 0;
            }
        }
        @keyframes moveleft {
            0% {
                left: 350px;
            }
            100% {
                left: -500px;
            }
        }
        @keyframes spaceshipleft {
            0% {
                transform: rotate(-10deg);
                left: 200%;
            }
            15% {
                transform: rotate(-10deg);
            }
            30% {
                left: 45%;
                transform: rotate(10deg);
            }
            40% {
                left: 50%;
                transform: rotate(0deg) translateY(0px);
            }
            45% {
                left: 50%;
                transform: rotate(0deg) translateY(-10px);
            }
            50% {
                left: 50%;
                transform: rotate(0deg) translateY(0px);
            }
            60% {
                left: 55%;
                transform: rotate(-10deg);
            }
            61% {
                left: 55%;
            }
            100% {
                left: -100%;
            }
        }
        @keyframes bodycolor {
            0% {
                background-image: linear-gradient(to top, #ee3d67, #ef466e, #f04f75, #f1567b, #f25e82);
            }
            20% {
                background-image: linear-gradient(to top, #ee3d67, #ef466e, #f04f75, #f1567b, #f25e82);
            }
            21% {
                background-image: linear-gradient(to right top, #ffffff, #f7f2fa, #f4e4f1, #f3d5e4, #f4c6d2);
            }
            70% {
                background-image: linear-gradient(to right top, #ffffff, #f7f2fa, #f4e4f1, #f3d5e4, #f4c6d2);
            }
            71% {
                background-image: linear-gradient(to top, #ee3d67, #ef466e, #f04f75, #f1567b, #f25e82);
            }
            100% {
                background-image: linear-gradient(to top, #ee3d67, #ef466e, #f04f75, #f1567b, #f25e82);
            }
        }
        @keyframes abductcolor {
            0% {
                border: 2px solid white;
            }
            20% {
                border: 2px solid white;
            }
            21% {
                border: 2px solid #ee3d67;
            }
            70% {
                border: 2px solid #ee3d67;
            }
            71% {
                border: 2px solid white;
            }
            100% {
                border: 2px solid white;
            }
        }
        @keyframes colorswap {
            0% {
                background-color: #ee3d67;
            }
            20% {
                background-color: #ee3d67;
            }
            21% {
                background-color: #fff;
            }
            70% {
                background-color: #fff;
            }
            71% {
                background-color: #ee3d67;
            }
            100% {
                background-color: #ee3d67;
            }
        }
        @keyframes colorswap_middle {
            0% {
                background-color: #fff;
            }
            20% {
                background-color: #fff;
            }
            21% {
                background-color: #ee3d67;
            }
            70% {
                background-color: #ee3d67;
            }
            71% {
                background-color: #fff;
            }
            100% {
                background-color: #fff;
            }
        }

    </style>
</head>
<body>
<div class="container">
    <h1 class="text-success" style="margin: 30px 18px 10px;color: white" >上传失败，请检查文件是否空或超过最大文件限制(100MB)</h1>
    <div class="btn-group btn-group-lg">
        <button type="button" class="btn btn-link" onclick="window.location.href='index'">回到首页</button>
        <button type="button" class="btn btn-link" onclick="window.location.href='getUploadPage'">重新上传</button>
    </div>
</div>

<div class="container">
    <div class="spaceship">
        <div id="star1"></div>
        <div id="star2"></div>
        <div id="star3"></div>
        <div class="robot">
            <div id="half">
                <div id="brain"></div>
            </div>
            <div id="head">
                <span id="lc"></span><span id="le"></span><span id="re"></span>
                <div id="mouth"></div>
                <span id="rc"></span>
            </div>
            <div id="foot"></div>
            <div id="leg-1"></div>
            <div id="leg-2"></div>
        </div>
        <div class="spaceship_top"></div>
        <div class="spaceship_middle">
            <div class="spaceship_balls_1"></div>
            <div class="spaceship_balls_2"></div>
            <div class="spaceship_balls_3"></div>
            <div class="spaceship_balls_4"></div>
            <div class="spaceship_balls_5"></div>
        </div>
        <div class="spaceship_bottom">
            <div class="abduct_hole1"></div>
            <div class="abduct_hole2"></div>
            <div class="abduct_hole3"></div>
            <div class="abduct_hole4"></div>
            <div class="abduct_hole5"></div>
        </div>
    </div>
</div>
</body>


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
</html>
