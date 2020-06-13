<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%--导航栏（包括左侧图标、导航链接和右侧的按钮组）--%>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.1.1.min.js"></script>
<style>
    body {
        background: radial-gradient(200% 100% at bottom center, #f7f7b6, #e96f92, #75517d, #1b2947);
        background: radial-gradient(220% 105% at top center, #1b2947 10%, #75517d 40%, #e96f92 65%, #f7f7b6);
        background-attachment: fixed;
        overflow: hidden;
    }

    @keyframes rotate {
        0% {
            transform: perspective(400px) rotateZ(20deg) rotateX(-40deg) rotateY(0);
        }
        100% {
            transform: perspective(400px) rotateZ(20deg) rotateX(-40deg) rotateY(-360deg);
        }
    }
    .stars {
        transform: perspective(500px);
        transform-style: preserve-3d;
        position: absolute;
        bottom: 0;
        perspective-origin: 50% 100%;
        left: 50%;
        animation: rotate 90s infinite linear;
    }

    .star {
        width: 2px;
        height: 2px;
        background: #F7F7B6;
        position: absolute;
        top: 0;
        left: 0;
        transform-origin: 0 0 -300px;
        transform: translate3d(0, 0, -300px);
        backface-visibility: hidden;
    }
</style>
<div class="stars"></div>

<script>
    $(document).ready(function(){
        var stars=800;
        var $stars=$(".stars");
        var r=800;
        for(var i=0;i<stars;i++){
            var $star=$("<div/>").addClass("star");
            $stars.append($star);
        }
        $(".star").each(function(){
            var cur=$(this);
            var s=0.2+(Math.random()*1);
            var curR=r+(Math.random()*300);
            cur.css({
                transformOrigin:"0 0 "+curR+"px",
                transform:" translate3d(0,0,-"+curR+"px) rotateY("+(Math.random()*360)+"deg) rotateX("+(Math.random()*-50)+"deg) scale("+s+","+s+")"

            })
        })
    })
</script>
<div style="text-align:center;margin:10px 0; font:normal 14px/24px 'MicroSoft YaHei';color:#ffffff">

</div>


<div id="loginHead">

    <div  class="navbar navbar-default navbar-fixed-top">
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
                <%--在页面头部右侧显示登录和注册按钮--%>
                <%--登录注册按钮组，用于触发登录或注册模态框--%>
                <div id="loginGroup" class="btn-group pull-right btn-group-sm">
                    <button type="button" class="btn btn-default" data-toggle="modal" data-target="#loginModal">登录</button>
                    <button type="button" class="btn btn-default" data-toggle="modal" data-target="#regModal">注册</button>
                </div>

            </div>
        </div>
    </div>

    <%--登录模态框--%>
    <div id="loginModal" class="modal fade" data-backdrop="static">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <div class="container">
                        <span class="h3">登录</span>
                        <!--触发注册模态框-->
                        <button type="button" class="btn btn-link" data-toggle="modal"
                                data-target="#regModal" data-dismiss="modal">还没账号？</button>
                    </div>
                </div>
                <div class="modal-body">
                    <form id="loginForm" class="form-horizontal" role="form" method="post" action="login" >
                        <div class="form-group">
                            <label for="userCode" class="control-label col-md-2">用户名</label>
                            <div class="col-md-5">
                                <input type="text" class="form-control" id="userCode"  name="userCode"
                                       placeholder="请输入用户名">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="userPassword" class="control-label col-md-2">密码</label>
                            <div class="col-md-5">
                                <input type="password" class="form-control" id="userPassword" name="userPassword"
                                       placeholder="请输入密码">
                            </div>
                        </div>
                        <div class="checkbox col-md-6 col-md-offset-2">
                            <label><input type="checkbox">记住密码</label>
                            <a href="#" class="btn btn-link">找回密码</a>
                        </div>
                        <div class="form-group">
                            <div class="col-md-4 col-md-offset-2">
                                <button id="loginSubmit" type="button" class="btn btn-success">登录</button>
                                <button type="button" class="btn btn-info" data-dismiss="modal">取消</button>
                            </div>
                            <div id="errorTxt" class="col-md-3 text-danger hide">*用户名或密码错误</div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <%--注册模态框--%>
    <div id="regModal" class="modal fade" data-backdrop="static">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <div class="container">
                        <span class="h3">注册</span>
                        <!--触发登录模态框-->
                        <button type="button" class="btn btn-link" data-toggle="modal"
                                data-target="#loginModal" data-dismiss="modal">已有账号？</button>
                    </div>
                </div>
                <div class="modal-body">
                    <form id="regForm" class="form-horizontal" role="form">
                        <div class="form-group">
                            <label for="uCode" class="control-label col-md-2">用户名</label>
                            <div class="col-md-5">
                                <input type="text" class="form-control" id="uCode" name="uCode"
                                       placeholder="请输入用户名">
                            </div>
                            <span id="uCodeTip" style="padding-top: 7px"></span>
                        </div>
                        <div class="form-group">
                            <label for="uName" class="control-label col-md-2">昵称</label>
                            <div class="col-md-5">
                                <input type="text" class="form-control" id="uName" name="uName"
                                       placeholder="请输入昵称（可修改）">
                            </div>
                            <span id="uNameTip" style="padding-top: 7px"></span>
                        </div>
                        <div class="form-group">
                            <label for="uPwd" class="control-label col-md-2">密码</label>
                            <div class="col-md-5">
                                <input type="password" class="form-control" id="uPwd" name="uPwd"
                                       placeholder="请输入密码">
                            </div>
                            <span id="uPwdTip" style="padding-top: 7px"></span>
                        </div>
                        <div class="form-group">
                            <label for="uPwd2" class="control-label col-md-2">重复密码</label>
                            <div id="input" class="col-md-5">
                                <input type="password" class="form-control" id="uPwd2" name="uPwd2"
                                       placeholder="请再次输入密码">
                            </div>
                            <span id="uPwd2Tip" style="padding-top: 7px"></span>
                        </div>
                        <div class="form-group">
                            <label for="uEmail" class="control-label col-md-2">邮箱</label>
                            <div class="col-md-5">
                                <input type="text" class="form-control" id="uEmail" name="uEmail"
                                       placeholder="请输入邮箱(选填)">
                            </div>
                        </div>
                        <br>
                        <div class="form-group">
                            <div class="col-md-6 col-md-offset-2">
                                <button id="regSubmit" type="button" class="btn btn-success">注册</button>
                                <button id="regQuit" type="button" class="btn btn-info" data-dismiss="modal">取消</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>




