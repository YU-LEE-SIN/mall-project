<%--
  Created by IntelliJ IDEA.
  User: Yu
  Date: 2019/12/16
  Time: 0:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- ZUI Javascript组件 -->
    <script src="/static/zui-ui/lib/jquery/jquery.js"></script>
    <script src="/static/zui-ui/js/zui.min.js"></script>
    <link rel="stylesheet" href="/static/zui-ui/css/zui.min.css">

    <script type="text/javascript" src="/static/js/vue.js"></script>

    <title>商品SKU</title>
</head>
<body>
<div id="app">
    <%--模态框sku--%>
 <%--   <div id="mySkuModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">关闭</span></button>
                    <h4 class="modal-title">商品SKU</h4>
                </div>

                <div class="modal-body">
                    <form class="form-horizontal" role="form" id="myform2">

                        <div class="form-group">
                            <label  class="col-sm-2 control-label">商品标题</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control"  name="title" v-model="title" placeholder="标题" />
                            </div>
                        </div>

                        <div class="form-group" v-for="(attKey,index) in attributeKey">
                            <label class="col-sm-2 control-label">{{attKey.attributeName}}</label>
                            <div class="col-sm-10">
                                <input class="form-control" type="text" v-model="inputData[index]" placeholder="属性值" >
                            </div>
                        </div>

                        <div class="form-group">
                            <label  class="col-sm-2 control-label">价格</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control"  name="price" v-model="price" placeholder="元" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="images" class="col-sm-2 control-label">主图片</label>
                            <div class="col-sm-6">
                                <input type="file"  name="image" id="images" @change="onHashchange" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="images" class="col-sm-2 control-label"></label>
                            <div class="col-sm-6">
                                <img id="skuImg" width="150px" height="150px" class="img-responsive">
                            </div>
                        </div>

                        <div class="form-group">
                            <label  class="col-sm-2 control-label">库存</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control"  name="stock" v-model="stock" placeholder="个" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label  class="col-sm-2 control-label">状态</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control"  name="saleable" v-model="saleable" placeholder="0为否，1为是， 默认1"  />
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                <button type="button" class="btn btn-primary" @click="saveSku()">保存</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>--%>
    <!--模态框-->
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

            <hr>

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
                    <div class="btn-group">
                        <button type="button" class="btn dropdown-toggle" data-toggle="dropdown">商品列<span class="caret"></span></button>
                        <ul class="dropdown-menu" role="menu">
                            <li v-for="(spu,index) in spuInfo">
                                <a @click="select(spu)">{{spu.title}}</a>
                            </li>
                        </ul>
                    </div>
                    <hr>
                    <a class="btn" href="/admin/product">返回</a>
                    <hr>
                    <%--  放数据   --%>
                    <div>
                        <table class="table table-bordered" id="tableDataGridExample">
                            <thead>
                            <tr>
                                <th>序号</th>
                                <th>标题</th>
                                <th>商品ID</th>
                                <th>SKU主图</th>
                                <th>属性值</th>
                                <th>销售价格</th>
                                <th>库存</th>
                                <th>是否有效</th>
                                <th>添加时间</th>
                                <th colspan="2">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr v-for="(page,index) in pageInfos.list">
                                <td>{{page.id}}</td>
                                <td>{{page.title}}</td>
                                <td>{{page.spuId}}</td>
                                <td>
                                    <img v-if="page.images" :src="im+page.images"
                                         width="100px" height="70px" class="img-rounded" alt="图片">
                                </td>
                                <td>{{page.spec}}</td>
                                <td>{{page.price}}</td>
                                <td>{{page.stock}}</td>
                                <td v-if="page.enable==true">是</td>
                                <td v-else>否</td>
                                <td>{{page.createTime}}</td>

                                <td>
                                    <a class="btn" href="/admin/product" >添加SKU</a>
                                </td>
                                <td>
                                    <button class="btn btn-info " type="button" @click="edit(page)" >编辑</button>
                                    <button class="btn btn-danger " type="button" @click="del(index,page.id)":key="page.id">删除</button>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <footer>
                            <ul class="pager">
                                <li class="previous"><a href="#" @click="first">首页</a></li>
                                <li v-for="(nums,index) in pageInfos.navigatepageNums">
                                    <a href="#" @click='page=nums'>{{nums}}</a>
                                </li>
                                <li class="next"><a href="#" @click="last">尾页</a></li>
                            </ul>
                        </footer>
                    </div>
                </div>
            </div>
        </div>
</div>
<script>
    window.onload = function() {
        var vue = new Vue({
            el: "#app",
            data: {
                //定义变量接收数据
                pageInfos: [],
                spuInfo:[],
                page:1,
                id:'',
                im:"/static/images/",
            },
            methods:{
                first:function(){
                    vue.page=1;
                },
                last: function () {
                    vue.page=vue.pageInfo.pages;
                },
                //下拉框，根据spuId查sku
                select:function(spu){
                    console.log(spu.id);
                    //根据商品id查Sku
                    $.post("/admin/skuBySpuId",{'spuId':spu.id ,'pageSize':100},function (data) {
                        vue.pageInfos = data.data;
                    },"json");
                },
                //删除
                del(index,id){
                    console.log(id)//当前id
                    if(confirm("你确定要删除🦄")){
                        $.post("/admin/skuDelete",{'id':id},function (data) {
                            if (data.code=="200"){
                                alert("删除成功");
                                window.location.reload();
                            }
                        });
                    }
                },
                //eidt
                edit:function (page) {
                }
            },//mothds end
              //初始化时加载
            mounted:function () {
                //商品Sku
                $.post("/admin/skuList",{pageNum:1},function (data) {
                    vue.pageInfos = data.data;
                },"json");
                //商品spu
                $.post("/admin/spuAll",function (data) {
                    vue.spuInfo = data.data;
                },"json");
            },
            //监听属性 当属性发生改变执行
            watch: {//监听属性 当属性发生改变执行
                page: function () {
                    $.post('/admin/skuList', {pageNum: vue.page}, function (data) {
                        vue.pageInfos = data.data;
                    }, "json");
                }
            },//watch end
        });
    }
</script>
</body>
</html>
