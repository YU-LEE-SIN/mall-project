<%--
  Created by IntelliJ IDEA.
  User: Yu
  Date: 2019/12/19
  Time: 23:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>商品详情</title>
    <script src="/static/js/jquery-3.3.1.js"></script>
    <!-- ZUI Javascript组件 -->
    <script src="/static/zui-ui/js/zui.js"></script>
    <link rel="stylesheet" href="/static/zui-ui/css/zui.min.css">
    <script type="text/javascript" src="/static/js/vue.js"></script>
    <script type="text/javascript" src="/static/my-js/category.js"></script>

    <link rel="shortcut icon" class="icon icon-th-list" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="/static/fe/script/css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="/static/fe/script/css/details.css"/>
    <script src="/static/fe/script/thirdplugins/require.js" defer async="true" data-main="/static/fe/script/js/details/main"></script>
</head>
<body>
<!-- 导航条 -->
<!-- 引入header.jsp -->
<jsp:include page="header.jsp"></jsp:include>

<div id="info">
    <!--详情页头部-->
    <div class="header">
        <input id="spuId" value="${spuId}" type="hidden">
    </div>
    <div class="body">
        <div class="container">
            <!--左边的图片放大镜-->
            <div class="body-zoom">
                <!--小图和图片列表的盒子-->
                <div class="zoom">
                    <!--放小图的盒子-->
                    <div class="small-imgbox">
                        <template v-for="(item,index) in skuList.list" v-if="index==tag" v-bind:tag="index">
                            <a href="javascript:;">
                                <!--中间的大图 -->
                                <img class="smallimg" :src="'/static/images/'+item.images" alt="" />
                            </a>
                        </template>
                        <!--放大镜-->
                        <div class="loupe"></div>
                    </div>
                    <!--存放图片列表的盒子-->
                    <div class="litimg">
                        <ul class="litimg-list">
                            <template v-for="(item,index) in skuList.list">
                                <li class="active">
                                    <img :src="'/static/images/'+item.images" alt="" />
                                </li>
                            </template>
                        </ul>
                    </div>
                </div>

                <!--放大图的盒子-->
                <div class="big-imgbox">
                    <!--大图-->
                    <img class="bigimg">
                </div>
            </div>
            <!--产品规格选择-->
            <div class="Specification">
                <!--规格板块头部-->
                <template v-for="(item,index) in skuList.list" v-if="index==tag" v-bind:tag="index">
                <div class="sp-title">
                    <h1 class="title-h1">{{item.title}}</h1>
                    <p class="title-p">{{item.title}}</p>
                    <p @click="dianwo(item)">点我</p>
                </div>
                <!--规格板块价格部分-->
                <div class="price-box">
                    <em class="price-title">价格</em>
                    <i class="icon icon-yen"></i>
                    <span class="price">{{item.price}}</span>
                </div>
                </template>
                <!--运费和配送地址-->
                <div class="site-dispatching">
                    <div class="site-box">
                        <span class="site-title">运费</span>
                        <span class="site-nav">
						重庆
						<i class="mui_addr_icon"></i>
					</span>
                    </div>
                </div>
                <!--商品评价和天猫积分-->
                <div class="evaluate">
                    <div class="eva-left">
                        <em class="eva-title">累计评价</em>
                        <span class="eva-count">99+</span>
                    </div>
                    <div class="eva-right">
                        <em class="score-title">送积分</em>
                        <span class="tm-score">998</span>
                    </div>
                </div>

                <!--商品尺寸规格 加入购物车 立即购买-->
                <div class="product-re">
                    <!--商品分类-->
                    <div class="classify-box">
                        <div class="classify-title">
                            <span class="classify-title-span">颜色分类</span>
                        </div>
                        <ul class="classify-list">
                            <li v-for="(item,index) in skuList.list">
                                <a @click="spe(index,item.id)":key="item.id" style="overflow: hidden;">
                                    {{item.spec}}
                                </a>
                            </li>
                            <li>
                                <p id="demo"></p>
                            </li>
                        </ul>
                    </div>
                    <div class="product-count">
                        <span class="count-title"><i class="icon icon-shopping-cart"></i>数量</span>
                        <input type="text" name="p-count" id="p-count" v-model="count"/>
                        <em class="count-button">
                            <span class="count-add" @click="add()">
                                <i class="icon icon-arrow-up"></i>
                            </span>
                            <span class="count-decrease" @click="decrease()">
                                 <i class="icon icon-arrow-down"></i>
                            </span>
                        </em>
                        件
                    </div>
                    <div class="buttons">
                        <button class="buy">立即购买</button>
                        <button @click="addCart()" class="add-shopping-cart">
                            <i></i>
                            加入购物车
                        </button>
                    </div>
                </div>

            </div>
        </div>
    </div>

</div>
<!-- 引入footer.jsp -->
<jsp:include page="footer.jsp"></jsp:include>
</body>
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
        var vm=new Vue({
            el:"#info",
            data:{
                skuList:[],
                attributeKey:[],
                id:'',
                count:1,
                tag:0,
                skuId:'',
                item:'',
            },
            methods:{
                add:function(){
                    vm.count++;
                    console.log($("#p-count").val());
                },
                decrease:function(){
                    if(vm.count<2){
                        vm.count=1;
                    }else{
                        vm.count--;
                    }
                    console.log($("#p-count").val());
                },
                /* dianwo:function(item){
                     //测试   {"机身颜色":"白色","内存":"8GB","机身存储":"256GB"}
                     //将其转换为 JavaScript 对象
                   var obj = JSON.parse(item.spec);
                     console.log(obj);
                     for(let i in vm.attributeKey){
                         var names=vm.attributeKey[i].attributeName
                         console.log(names);
                     }
                   var n=vm.attributeKey[0].attributeName;
                     console.log(n);
                     document.getElementById("demo").innerHTML = obj.n+"+" + obj.内存;
                 },*/
                spe: function (index,id) {
                    vm.skuId=id;
                    vm.tag=index;
                },
                addCart:function(){
                    var id = vm.skuList.list[0].id;
                    var count=vm.count;
                    console.log("购买"+vm.skuId+count);
                    if(vm.skuId==''){
                        $.post('/index/addToCart',{'skuId':id,'count':count},function (data) {
                            if (data==200){
                                alert("购买"+id+count);
                            }
                        })
                    }else{
                        $.post('/index/addToCart',{'skuId':vm.skuId,'count':count},function (data) {
                            if (data==200){
                                alert("购买"+vm.skuId+count);
                            }
                        })
                    }
                },
            },
            mounted:function () {
                const spuId = $(" #spuId ").val();
                $.post('/index/skuListBysId',{'pageNum':1,'spuId':spuId},function (data) {
                    vm.skuList = data.data;
                })
                $.post('/admin/attributeByCid',{'pageSize':10,'cid':1},function (data) {
                    vm.attributeKey = data.data.list;
                })
            },
        })
    };
</script>
</html>
