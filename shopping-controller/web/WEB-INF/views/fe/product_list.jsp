<%--
  Created by IntelliJ IDEA.
  User: Yu
  Date: 2019/12/19
  Time: 9:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<!DOCTYPE html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>商品首页</title>
    <!-- ZUI Javascript组件 -->
    <script src="/static/zui-ui/lib/jquery/jquery.js"></script>
    <link rel="stylesheet" href="/static/zui-ui/css/zui.min.css">

    <script src="/static/zui-ui/js/zui.min.js"></script>
    <script type="text/javascript" src="/static/js/vue.js"></script>
    <script type="text/javascript" src="/static/my-js/category.js"></script>
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

    .card>.caption {
        width: 290px;
    }
    .nav>li>a {
        position: relative;
        display: block;
        padding: 8px 15px;
        color: #337ab7;}
    .cards-borderless .card>img {
        width: 300px;
        height: 275px;
    }
</style>
</head>
<body>

<!-- 导航条 -->
<!-- 引入header.jsp -->
<jsp:include page="header.jsp"></jsp:include>


    <div id="appTwo">
        <input id="cid" value="${cid}" type="hidden">
    <div class="container-fluid">
        <div class="row clearfix">

            <!--品牌-->
            <div class="row" style="width: 1210px; margin: 0 auto;">
                <div class="col-md-12">
                    <ol class="breadcrumb">
                        <li><a href="#">品牌</a></li>
                    </ol>
                </div>
            </div>
            <!-- 商品 /static/images/asus.jpg-->
            <div class="col-md-12 column">
                <div class="cards cards-borderless">
                    <div class="col-md-4 col-sm-6 col-lg-3" v-for="(p,index) in product.list" style="padding:20px">
                        <a class="card" :href="'/index/productInfo?spuId='+p.id">
                            <img :src="'/static/images/'+p.image" alt="">
                            <div class="caption">{{p.title}}</div>
                            <div class="card-heading"><strong>{{p.title}}</strong></div>
                            <div class="card-content text-muted">{{p.subTitle}}</div>

                        </a>
                        <div class="card-actions" style="margin-top: -20px">
                        <button type="button" class="btn btn-danger">购买</button>
                        <button type="button" class="btn btn-danger" @click="cart(p)"><i class="icon icon-shopping-cart"></i>加入购物车
                        </button>
                        <div class="pull-right text-danger"><i class="icon-heart-empty"></i> 520 人喜欢</div>
                        </div>
                    </div>
                </div>
                <!-- 商品  end-->
                <hr>
                <!-- 分页  end-->
                <footer>
                    <ul class="pagination">
                        <li class="previous"><a href="#" @click="first()">首页</a></li>
                        <li><a href="#">⋯</a></li>
                        <li v-for="(nums,index) in product.navigatepageNums">
                            <a href="#" @click='page=nums'>{{nums}}</a>
                        </li>
                        <li><a href="#">⋯</a></li>
                        <li class="next"><a href="#" @click="last()">尾页</a></li>
                    </ul>
                </footer>
                <!-- 分页  end-->
            </div><!--col-md-12 column end-->
        </div>
    </div>
    </div>
<!-- 引入footer.jsp -->
<jsp:include page="footer.jsp"></jsp:include>
    <script>
        window.onload = function () {
            var two = new Vue({
                el: "#app",
                data: {
                    //定义变量接收数据
                    category: [],
                    id:'',
                    cid:'',
                    categoryName:'',
                },
                //初始化时加载
                mounted:function () {
                    $.post("/index/categoryList",{pageNum:1,pageSize:100},function (data) {
                        two.category = data.data;
                    },"json");
                },
            });
            //
            var vm = new Vue({
                el: "#appTwo",
                data: {
                    product: [],
                    page:1,
                    id: '',
                },
                methods: {
                    first: function(){
                        vm.page=1;
                    },
                    last: function () {
                        vm.page=vm.product.pages;
                    },
                    cart:function (p) {
                        const id = p.id;
                        console.log(id);
                        location.href='/index/productInfo?spuId='+id+'';
                    }
                },
                //初始化
                mounted: function () {
                    const cid = $(" #cid ").val();
                    $.post('/index/spuListByCid', {'pageNum': 1, 'cid': cid}, function (data) {
                        vm.product = data.data;
                    }, "json");
                },
                watch: {
                    page: function () {
                        $.post('/index/spuListByCid', {pageNum: vm.page, cid: 3}, function (data) {
                            vm.product = data.data;
                        }, "json");
                    }
                },

            });
        };
    </script>
</body>
</html>
