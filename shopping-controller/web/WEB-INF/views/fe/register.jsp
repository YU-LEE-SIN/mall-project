<%--
  Created by IntelliJ IDEA.
  User: Yu
  Date: 2019/12/17
  Time: 23:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>会员注册</title>
    <link rel="stylesheet" href="/static/fe/css/bootstrap.min.css" type="text/css" />
    <script src="/static/fe/js/jquery.min.js" type="text/javascript"></script>
    <!-- 引入表单校验jquery插件 -->
    <script src="/static/fe/js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="/static/fe/js/bootstrap.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="/static/js/vue.js"></script>

    <style>
        body {
            margin-top: 20px;
            margin: 0 auto;
            width: 100%;
        }
        .carousel-inner .item img {
            width: 100%;
            height: 300px;
        }

        .clear{
            clear:both;
        }

        .top{
            width:1210px;
            margin:20px auto;
            overflow:hidden;
        }

        .top div{

        }

        .search{
            background-color: #FCFDEF;
            padding:10px 200px 10px 0px;
        }

        .content{
            width:1210px;
            margin:0 auto;
        }

        .news{
            border:1px solid #E7E7E7;
            height:auto;
            height:300px;
        }

        .mynav{
            width:1210px;
            margin:0 auto;
        }

        .myrow .col-md-10 div{
            border-bottom:1px solid #E7E7E7;
            border-left:1px solid #E7E7E7;
            padding:0px;
        }

        .row p{margin:0;}

        .myrow .yes-right-border{
            border-right:1px solid #E7E7E7;
        }
        .myrow .no-left-border{
            border-left:0px;
        }
    </style>
    <script>
        //自定义校验规则
        $.validator.addMethod(
            //规则的名称
            "checkUsername",
            //校验的函数
            function(value,element,params){

                //定义一个标志
                var flag = false;
                //value:输入的内容
                //element:被校验的元素对象
                //params：规则对应的参数值
                //目的：对输入的username进行ajax校验
                $.ajax({
                    "async":false,
                    "url":"/user/verify",
                    "data":{"username":value},
                    "type":"POST",
                    "dataType":"json",
                    "success":function(data){
                        flag = data.code;
                    }
                });
                //返回false代表该校验器不通过
                return !flag;
            }
        );
        $(function(){

            $("#myform").validate({

                rules:{
                    "username":{
                        "required":true,
                        "checkUsername":true
                    },
                    "password":{
                        "required":true,
                        "rangelength":[6,12]
                    },
                    "repassword":{
                        "required":true,
                        "rangelength":[6,12],
                        "equalTo":"#password"
                    }
                    // "email":{
                    //     "required":true,
                    //     "email":true
                    // },
                    // "sex":{
                    //     "required":true
                    // }
                },
                messages:{
                    "username":{
                        "required":"用户名不能为空",
                        "checkUsername":"用户名已存在"
                    },
                    "password":{
                        "required":"密码不能为空",
                        "rangelength":"密码长度6-12位"
                    },
                    "repassword":{
                        "required":"密码不能为空",
                        "rangelength":"密码长度6-12位",
                        "equalTo":"两次密码不一致"
                    }
                    // "email":{
                    //     "required":"邮箱不能为空",
                    //     "email":"邮箱格式不正确"
                    // }
                }
            });//validate end

        });
    </script>
</head>
<body>

<!-- 引入header.jsp -->
<jsp:include page="header.jsp"></jsp:include>

<div class="container"
     style="width: 100%; background: url('image/regist_bg.jpg');">
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8"
             style="background: #fff; padding: 40px 80px; margin: 30px; border: 7px solid #ccc;">
            <h4>会员注册 USER REGISTER</h4>
            <form id="myform" class="form-horizontal" action="/index/user/register" method="post" style="margin-top: 5px;">
                <div class="form-group">
                    <label for="username" class="col-sm-2 control-label">用户名</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="username" name="username"
                               placeholder="请输入用户名">
                    </div>
                </div>
                <div class="form-group">
                    <label for="password" class="col-sm-2 control-label">密码</label>
                    <div class="col-sm-6">
                        <input type="password" class="form-control" id="password" name="password"
                               placeholder="请输入密码">
                    </div>
                </div>
                <div class="form-group">
                    <label for="confirmpwd" class="col-sm-2 control-label">确认密码</label>
                    <div class="col-sm-6">
                        <input type="password" class="form-control" id="confirmpwd" name="repassword"
                               placeholder="请输入确认密码">
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
                    <div class="col-sm-6">
                        <input type="email" class="form-control" id="inputEmail3" name="email"
                               placeholder="Email">
                    </div>
                </div>
                <div class="form-group">
                    <label for="usercaption" class="col-sm-2 control-label">电话号码</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="usercaption" name="phone"
                               placeholder="请输入号码">
                    </div>
                </div>
                <div class="form-group opt">
                    <label  class="col-sm-2 control-label">性别</label>
                    <div class="col-sm-6">
                        <label class="radio-inline">
                            <input type="radio" name="sex" id="sex1" value="male" >男
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="sex" id="sex2" value="female">女
                        </label>
                        <label class="error" for="sex1" style="display:none ">您没有第三种选择</label>
                    </div>
                </div>
                <div class="form-group">
                    <label  class="col-sm-2 control-label">出生日期</label>
                    <div class="col-sm-6">
                        <input type="date" class="form-control" name="birthday">
                    </div>
                </div>

                <div class="form-group">
                    <label  class="col-sm-2 control-label">验证码</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" name="checkCode">

                    </div>
                    <div class="col-sm-2">
                        <img src="./image/captcha.jhtml" />
                    </div>

                </div>

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                         <button type="submit" class="btn btn-lg btn-primary btn-block" style="width: 100px;">注册</button>
                    </div>
                </div>
            </form>
        </div>

        <div class="col-md-2"></div>

    </div>
</div>

<!-- 引入footer.jsp -->
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>

