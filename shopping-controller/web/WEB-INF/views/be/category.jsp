<%--
  Created by IntelliJ IDEA.
  User: Yu
  Date: 2019/12/6
  Time: 11:02
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
    <title>分类</title>
</head>
<body>
<div id="app">
    <%--模态框--%>
    <div id="myModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">关闭</span></button>
                    <h4 class="modal-title">分类</h4>
                </div>

                <div class="modal-body">
                    <form class="form-horizontal" role="form" id="myform">

                        <div class="form-group">
                            <label class="col-sm-2 control-label">类目id</label>
                            <div class="col-sm-10">
                                <input class="form-control" type="text" id="brandId" name="id" v-model="id" placeholder="此文本框只读" readonly>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">类目名称</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="categoryName" v-model="categoryName"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label  class="col-sm-2 control-label">父类目id</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control"  name="parentId" v-model="parentId" placeholder="此文本框只读" readonly/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label  class="col-sm-2 control-label">是否为父节点</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control"  name="parent" v-model="parent" placeholder="0为否，1为是， 默认1"  />
                            </div>
                        </div>

                        <div class="form-group">
                            <label  class="col-sm-2 control-label">排序指数</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control"  name="sort" v-model="sort" placeholder="越小越靠前" />
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                <button type="button" class="btn btn-primary" @click="save()">保存</button>
                            </div>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>
    <%--模态框--%>
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
                        分类主页
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
                    <div class="input-group" style="width: 400px;">
                        <div class="input-control search-box search-box-circle has-icon-left has-icon-right search-example" id="searchboxExample">
                            <input id="inputSearchExample3" type="search" class="form-control search-input" placeholder="搜索" escToClear="true">
                            <label for="inputSearchExample3" class="input-control-icon-left search-icon"><i class="icon icon-search"></i></label>
                        </div>
                        <span class="input-group-btn">
                            <button class="btn btn-primary" type="button" @click="query()">搜索</button>
                        </span>
                    </div>

                    <hr>
                    <button class="btn" type="button" @click="add">添加</button>
                    <hr>

                    <%--  放数据   --%>
                    <div>
                        <table class="table table-bordered" id="tableDataGridExample">
                            <thead>
                            <tr>
                                <th>类目id</th>
                                <th>类目名称</th>
                                <th>父id</th>
                                <th>是否为父</th>
                                <th>排序序号</th>
                                <th colspan="2">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr v-for="(page,index) in pageInfo.list">
                                <td>{{page.id}}</td>
                                <td>{{page.categoryName}}</td>
                                <td>{{page.parentId}}</td>
                                <td v-if="page.isParent==true">
                                    是
                                </td>
                                <td v-else>否</td>
                                <td>{{page.sort}}</td>
                                <td>
                                    <a class="btn" href="/admin/attribute" >查看属性</a>
                                </td>
                                <td>
                                    <button class="btn" type="button" @click="edit(page)" >编辑</button>
                                    <button class="btn btn-danger " type="button" @click="del(index,page.id)":key="page.id">删除</button>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <footer>
                            <ul class="pager">
                                <li class="previous"><a href="#" @click="first">首页</a></li>
                                <li v-for="(nums,index) in pageInfo.navigatepageNums">
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
    window.onload = function(){
        var vue=new Vue({
            el:"#app",
            data:{
                //定义变量接收数据
                pageInfo: [],
                page: 1,
                id:'',
                categoryName:'',
                parentId: '',
                parent:'',
                sort: '',
            },
            methods: {
                first:function(){
                    vue.page=1;
                },
                last: function () {
                    vue.page=vue.pageInfo.pages;
                },
                //删除
                del(index,id){
                    console.log(id)//当前id
                    if(confirm("你确定要删除🦄")){
                        $.post("/admin/categoryDelete",{id:id},function (data) {
                            if (data.code=="200"){
                                alert("删除成功");
                                window.location.reload();
                            }
                        });
                    }
                },
                //1.新增操作,打开模式框
                add:function () {
                    $("#myModal").data("op","insert");
                    vue.id =null;
                    vue.categoryName=null;
                    vue.parentId = 0;
                    vue.parent = 1;
                    vue.sort=null;
                    $("#myModal").modal('show');//显示模态框
                },//insert end
                //1.修改操作,打开模式框
                edit:function(page){
                    vue.id =page.id;
                    vue.categoryName=page.categoryName;
                    vue.parentId = page.parentId;
                    vue.parent = page.parent;
                    vue.sort=page.sort;
                    $("#myModal").modal('show');//显示模态框
                },
                //点击保存
                save:function(){
                    const op = $("#myModal").data("op");
                    const isParent = vue.parent;
                    if(isParent=="1"){
                        vue.parent=true;
                    }else{
                        vue.parent=false;
                    };
                    const objce={'categoryName':vue.categoryName,'parentId':vue.parentId,
                    'parent':vue.parent,'sort':vue.sort};
                    if (op == "insert") {//如果等于添加就,执行添加
                        $.ajax({
                            url: '/admin/addCategory',
                            type: 'POST',
                            dataType: 'json',
                            cache: false,
                            data:objce,
                            success: function(data) {
                                console.log(data)
                                if (data.code == "200") {
                                    alert("添加成功");
                                    window.location.reload();
                                }
                            }
                        });
                        $("#myModal").modal('hide');//隐藏模态框
                    } else {
                        //执行修改
                        const isParent = vue.parent;
                        if(isParent=="1"){
                            vue.parent=true;
                        }else{
                            vue.parent=false;
                        };
                        const objce={'categoryName':vue.categoryName,'parentId':vue.parentId,
                            'parent':vue.parent,'sort':vue.sort,'id':vue.id};
                        $.ajax({
                            url: '/admin/editCategory',
                            type: 'POST',
                            dataType: 'json',
                            cache: false,
                            data: objce,
                            success: function(data) {
                                console.log(data)
                                if (data.code == "200") {
                                    alert("修改成功");
                                    window.location.reload();
                                }
                            }
                        });
                        $("#myModal").modal('hide');//隐藏模态框
                    };
                },//save end
                //查询
                query:function (data) {
                    var categoryName = $("#inputSearchExample3").val();
                    console.log(categoryName);
                    $.post("/admin/categoryListByName",{pageNum:1,categoryName:categoryName},function (data) {
                        vue.pageInfo = data.data;
                    },"json")
                },
                // 在初始化的时候设置事件回调函数
                onPressEnter: function(event) {
                    alert("enter");
                }
            },
            //初始化时加载
            mounted :function () {
              $.post("/admin/categoryList",{pageNum:1},function (data) {
                  vue.pageInfo = data.data;
              },"json")
            },
            //监听属性 当属性发生改变执行
            watch: {//监听属性 当属性发生改变执行
                page: function () {
                    $.post('/admin/categoryList', {pageNum: vue.page}, function (data) {
                        vue.pageInfo = data.data;
                    }, "json");
                }
            },

        });
    }
</script>
</body>
</html>
