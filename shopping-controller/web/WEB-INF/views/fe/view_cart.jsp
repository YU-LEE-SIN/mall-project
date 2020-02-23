<%--
  Created by IntelliJ IDEA.
  User: Yu
  Date: 2019/12/22
  Time: 22:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>购物车</title>
    <script src="/static/zui-ui/lib/jquery/jquery.js"></script>
    <link rel="stylesheet" href="/static/zui-ui/css/zui.min.css">
    <script src="/static/zui-ui/js/zui.min.js"></script>
    <script type="text/javascript" src="/static/js/vue.js"></script>
</head>
<body>
<!-- 引入header.jsp -->
<jsp:include page="header.jsp"></jsp:include>

<hr>
<div id="cart">

<div class="table-responsive">
    <table class="table">
        <thead>
        <tr>
            <th><input type="checkbox" @click="allChecked()">全选</th>
            <th>序号</th>
            <th>名称</th>
            <th>图片</th>
            <th>配置</th>
            <th>单价</th>
            <th>数量</th>
            <th>小计</th>
            <th>炒作</th>
        </tr>
        </thead>
        <hr>
        <tbody>
        <c:forEach items="${cart.items}" var="item">
            <tr>
                <td><input type="checkbox"></td>
                <td>${item.sku.id}</td>
                <td>${item.sku.title}</td>
                <td>
                    <img src="/static/images/${item.sku.images}"
                         width="80px" height="70px" class="img-rounded" alt="图片">
                </td>
                <td>${item.sku.spec}</td>
                <td>${item.sku.price}</td>
                <td>
                    <a href="javascript:void 0" @click="changeMoney(item,-1)">-</a>
                    <input type="text" value="${item.count}" disabled v-model="${item.count}">
                    <a href="javascript:void 0" @click="changeMoney(item,1)">+</a>
                </td>
                <td>${item.subTotal}</td>
                <td><input type="button" value="删除" class="btn btn-primary btn-danger" @click="del(${item.sku.id})"></td>
            </tr>
        </c:forEach>
        </tbody>
        <div>
            <span>
                <label>
                    已选商品<a>{{count}}</a>件，共</a>￥{{price}}</a>
                </label>
            </span>
            <input type="button" value="结算"/>
        </div>
    </table>
</div>

</div>
<!-- footer.jsp -->
<jsp:include page="footer.jsp"></jsp:include>

<%--<script>
    var vm=new Vue({
        el:"#cart",
        data:{
            //控制全选
            allChecked: true,
            //结算
            checked: [],
            price:0,
            count:0,
        },
        methods:{
            //全选
            allChecked:function () {

            },
            //删除
            del:function (id) {
                if (!confirm("确认删除吗")) {
                    window.event.returnValue = false;
                }
                else {
                    //如果该条信息已被选中

                }
            },//del end
        },
        mounted:function () {

        },
    })
</script>--%>
</body>
</html>