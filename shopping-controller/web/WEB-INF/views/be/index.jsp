<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- jQuery (ZUI中的Javascript组件依赖于jQuery) -->
    <%--<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>--%>
    <script src="/static/js/jquery-3.3.1.js"></script>
    <!-- ZUI Javascript组件 -->
    <script src="/static/zui-ui/js/zui.js"></script>
    <link rel="stylesheet" href="/static/zui-ui/css/zui.min.css">
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <nav class="navbar navbar-default" role="navigation">
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <div class="dropdown">
                        <button class="btn" type="button" data-toggle="dropdown">${uname.username}<span class="caret"></span></button>
                        <ul class="dropdown-menu">
                            <li><a href="/admin/login">登陆</a></li>
                            <li><a href="/admin/exit">退出登陆</a> </li>
                        </ul>
                    </div>
                </div>
            </nav>

            <h2 class="text-center">
                后台主页
            </h2>
        </div>
    </div>


    <div class="row clearfix">
        <div class="col-md-3 column">
            <nav class="menu" data-ride="menu" style="width: 200px">
                <ul id="treeMenu" class="tree tree-menu" data-ride="tree">
                    <li><a href="/admin/index"><i class="icon icon-home"></i>首页</a></li>
                    <li><a href="/admin/brand"><i class="icon icon-th-list"></i>品牌管理</a></li>
                    <li><a href="/admin/category"><i class="icon icon-th-large"></i>分类管理</a></li>
                    <li><a href="/admin/product"><i class="icon icon-gift"></i>商品列表</a></li>
                    <li><a href="/admin/sku"><i class="icon icon-gift"></i>SKU规格参数</a></li>
                    <li><a href="/admin/attribute"><i class="icon icon-gift"></i>SKU规格</a></li>
                    <li><a href="#"><i class="icon icon-shopping-cart"></i>订单管理</a></li>
                </ul>
            </nav>
        </div>
        <div class="col-md-9 column">
            <%--  放数据   --%>
        </div>
    </div>
</div>

<script>
    // 手动通过点击模拟高亮菜单项
    $('#treeMenu').on('click', 'a', function() {
        $('#treeMenu li.active').removeClass('active');
        $(this).closest('li').addClass('active');
    });
</script>
</body>
</html>
