<%--
  Created by IntelliJ IDEA.
  User: Yu
  Date: 2019/12/5
  Time: 10:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/static/zui-ui/css/zui.min.css">

    <script src="/static/js/jquery-3.3.1.js"></script>
    <script src="/static/zui-ui/js/zui.min.js"></script>
    <link rel="stylesheet" href="/static/zui-ui/css/zui.min.css">
    <!-- jQuery (ZUI中的Javascript组件依赖于jQuery) -->
    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <!-- ZUI Javascript组件 -->
    <script src="/static/zui-ui/js/zui.min.js"></script>
    <title>后台登陆</title>
</head>
<body>
<script src="/static/zui-ui/js/zui.min.js"></script>
<div class="container">
        <div data-reactroot="" class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">请登录</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form" method="post" action="/admin/verifylogin">
                            <div class="form-group">
                                <input type="text" name="username" class="form-control" placeholder="User Name" name="username" autocomplete="off">
                            </div>
                            <div class="form-group"><input type="password" name="password"  class="form-control" placeholder="Password" name="password">
                            </div>
                            <button type="submit" class="btn btn-lg btn-primary btn-block">Login</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
</div>
<form>
<%--<script>
    $(function(){
        $('#log').click(function(){
                var objtes={username:$("#inputAccountExample1").val(),password:$("#inputPasswordExample1").val()};

                $.post("verifylogin",objtes,function(data){
                    if(data != "null"){
                        console.log(data.code);
                        console.log(data.username,data.password);
                        confirm('登陆成功')
                        //$("#modal1").hide();
                        window.location.href="/index";
                    }else{
                        confirm('登陆失败请重新输入正确的邮箱格式以及正确的密码')
                    }
                });
        });
    })
</script>--%>
</body>
</html>
