<%--
  Created by IntelliJ IDEA.
  User: Yu
  Date: 2019/12/17
  Time: 9:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>商城首页</title>
    <!-- ZUI Javascript组件 -->
    <script src="/static/zui-ui/lib/jquery/jquery.js"></script>
    <link rel="stylesheet" href="/static/zui-ui/css/zui.min.css">
    <script src="/static/zui-ui/js/zui.min.js"></script>
    <script type="text/javascript" src="/static/js/vue.js"></script>
    <script type="text/javascript" src="/static/my-js/category.js"></script>
</head>
<body>

<!-- 导航条 -->
<!-- 引入header.jsp -->
<jsp:include page="header.jsp"></jsp:include>

<div id="box">
    <div class="container-fluid">
        <div class="row clearfix">
            <!--左边div-->
            <div class="col-md-4 column">
                <h4>品牌</h4>
                <ol>
                    <li class="list-group-item">
                        华为
                    </li>
                    <li class="list-group-item">
                        小米
                    </li>
                    <li class="list-group-item">
                        OPPO
                    </li>
                    <li class="list-group-item">
                        微软(Microsoft)
                    </li>
                </ol>
            </div>
            <!--滚动图-->
            <div class="col-md-8 column">
                <div id="myNiceCarousel" class="carousel slide" data-ride="carousel" data-interval="2000">
                    <!-- 圆点指示器 -->
                    <ol class="carousel-indicators">
                        <li data-target="#myNiceCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#myNiceCarousel" data-slide-to="1"></li>
                        <li data-target="#myNiceCarousel" data-slide-to="2"></li>
                    </ol>

                    <!-- 轮播项目 -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <img alt="First slide" src="/static/images/p30-1.jpg">
                            <div class="carousel-caption">

                            </div>
                        </div>
                        <div class="item">
                            <img alt="Second slide" src="/static/images/p30-1.jpg">
                            <div class="carousel-caption">

                            </div>
                        </div>
                        <div class="item">
                            <img alt="Third slide" src="http://zui.sexy/docs/img/slide3.jpg">
                            <div class="carousel-caption">

                            </div>
                        </div>
                    </div>

                    <!-- 项目切换按钮 -->
                    <a class="left carousel-control" href="#myNiceCarousel" data-slide="prev">
                        <span class="icon icon-chevron-left"></span>
                    </a>
                    <a class="right carousel-control" href="#myNiceCarousel" data-slide="next">
                        <span class="icon icon-chevron-right"></span>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
    <!-- 引入footer.jsp -->
    <jsp:include page="footer.jsp"></jsp:include>
</body>
<script>
</script>
</html>
