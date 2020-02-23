<%--
  Created by IntelliJ IDEA.
  User: Yu
  Date: 2019/12/17
  Time: 23:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>会员登录</title>
    <link rel="stylesheet" href="/static/fe/css/bootstrap.min.css" type="text/css" />
    <script src="/static/fe/js/jquery.min.js" type="text/javascript"></script>
    <script src="/static/fe/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- 引入自定义css文件 style.css -->
    <style>
        body {
            margin-top: 20px;
            margin: 0 auto;
        }
        .carousel-inner .item img {
            width: 100%;
            height: 300px;
        }
        font {
            color: #666;
            font-size: 22px;
            font-weight: normal;
            padding-right: 17px;
        }
    </style>
</head>
<body>

<!-- 引入header.jsp -->
<jsp:include page="header.jsp"></jsp:include>


<div class="container"
     style="width: 100%; height: 460px; background: #ede9ea  url('images/loginbg.jpg') no-repeat;">
    <div class="row">
        <div class="col-md-7">
            <!--<img src="./image/login.jpg" width="500" height="330" alt="会员登录" title="会员登录">-->
        </div>

        <div class="col-md-5">
            <div
                    style="width: 440px; border: 1px solid #E7E7E7; padding: 20px 0 20px 30px; border-radius: 5px; margin-top: 60px; background: #fff;">
                <h5>会员登录USER LOGIN</h5>
                <div>&nbsp;</div>
                <h5>${requestScope.loginError}</h5>
                <form class="form-horizontal" action="/index/user/login">
                    <div class="form-group">
                        <label for="username" class="col-sm-2 control-label">用户名</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="username" name="username"
                                   placeholder="请输入用户名">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-6">
                            <input type="password" class="form-control" id="inputPassword2" name="password"
                                   placeholder="请输入密码">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">验证码</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="inputPassword3" name="code"
                                   placeholder="请输入验证码">
                        </div>
                        <div class="col-sm-3">
                            <img  class="js-checkcode" src="/index/imgCode" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <div class="checkbox">
                                <label> <input type="checkbox" name="autoLogin"> 自动登录
                                </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label>
                                <input type="checkbox"> 记住用户名
                            </label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <%--<input type="submit" width="100" value="登录" name="submit"
                                   style="background: url('./images/login.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0); height: 35px; width: 100px; color: white;">--%>
                                <button type="submit" class="btn btn-lg btn-primary btn-block" style="width: 100px;">Login</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- 引入footer.jsp -->
<jsp:include page="footer.jsp"></jsp:include>

<script>
    $('.js-checkcode').on('click', function () {
        $(this).attr('src', '/index/imgCode?t=' + Math.random());
    })
</script>
</body>
</html>
