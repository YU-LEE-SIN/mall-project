<%--
  Created by IntelliJ IDEA.
  User: Yu
  Date: 2019/12/17
  Time: 11:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="/static/fe/js/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/static/js/vue.js"></script>
<link rel="stylesheet" href="/static/fe/css/bootstrap.min.css" type="text/css">
<script src="/static/fe/js/bootstrap.min.js" type="text/javascript"></script>
<!DOCTYPE html>
<!-- 登录 注册 购物车... -->
<div id="app">
    <div class="container-fluid">
        <div class="col-md-4">
            <img src="img/logo2.png" />
        </div>
        <div class="col-md-5">
            <img src="img/header.png" />
        </div>
        <div class="col-md-3" style="padding-top:20px">
            <ol class="list-inline">
                <c:if test="${empty uname}">
                    <li><a href="/index/login">登录</a></li>
                    <li><a href="/index/register">注册</a></li>
                </c:if>
                <c:if test="${!empty uname}">
                    <li style="color:#313e8b">欢迎您，${uname.username}</li>
                    <li><a href="/index/exit">退出</a> </li>
                </c:if>
                <li><a href="/index/toCart">购物车</a></li>
                <li><a href="/myOrders">我的订单</a></li>
            </ol>
        </div>
    </div>
    <!-- 导航条 -->
    <div class="container-fluid">
        <nav class="nav-default" style="background-color: #efe7eb;">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="/index/first">首页</a>
                </div>

                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav" id="categoryUl">
                        <li v-for="(page,index) in category.list">
                            <a v-bind:href="'/index/productList?cid='+page.id">{{page.categoryName}}</a>
                        </li>
                    </ul>
                    <form class="navbar-form navbar-right" role="search">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Search">
                        </div>
                        <button type="submit" class="btn btn-default">Submit</button>
                    </form>
                </div>

            </div>
        </nav>
    </div>
</div>
<script type="text/javascript" src="/static/my-js/category.js"></script>