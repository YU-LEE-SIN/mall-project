<%--
  Created by IntelliJ IDEA.
  User: Yu
  Date: 2019/12/5
  Time: 11:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- ZUI Javascript组件 -->
    <script src="/static/zui-ui/lib/jquery/jquery.js"></script>
    <script src="/static/zui-ui/js/zui.min.js"></script>
    <link rel="stylesheet" href="/static/zui-ui/css/zui.min.css">

    <script type="text/javascript" src="/static/js/vue.js"></script>
    <title>品牌</title>
</head>
<body>
<div id="box">
    <%--模态框--%>
        <div id="myModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">关闭</span></button>
                        <h4 class="modal-title">品牌</h4>
                    </div>

                    <div class="modal-body">
                        <form class="form-horizontal" role="form">

                            <div class="form-group">
                                <label class="col-sm-2 control-label">品牌id</label>
                                <div class="col-sm-10">
                                    <input class="form-control" type="text" id="brandId" name="id" v-model="id" placeholder="此文本框只读" readonly>
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-sm-2 control-label">品牌名称</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="brandName" name="brandName" v-model="brandName"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="brandImage" class="col-sm-2 control-label">图片</label>
                                <div class="col-sm-6">
                                    <input type="file"  name="brandImage" id="brandImage" @change="onHashchange" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="brandImage" class="col-sm-2 control-label"></label>
                                <div class="col-sm-6">
                                    <img id="img" width="150px" height="150px" class="img-responsive">
                                </div>
                            </div>

                            <div class="form-group">
                                <label  class="col-sm-2 control-label">品牌首字母</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="name" name="letter" v-model="letter" />
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
                                <th>品牌id</th>
                                <th>品牌名称</th>
                                <th>品牌Logo</th>
                                <th>品牌首字母</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr v-for="(page,index) in pageInfo.list ">
                                <td>{{page.id}}</td>
                                <td>{{page.brandName}}</td>
                                <td>
                                    <img v-if="page.brandImage" :src="im+page.brandImage"
                                         width="100px" height="70px" class="img-rounded" alt="图片">
                                </td>
                                <td>{{page.letter}}</td>
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
            el:"#box",
            data:{
                //定义变量接收数据
                pageInfo: [],
                page: 1,
                id:"",
                brandName:"",
                brandImage:"",
                letter:"",
                im:"/static/images/",
                myFile:'',
            },
            methods: {
                first: function () {
                    vue.page = 1;
                },
                last: function () {
                    vue.page=vue.pageInfo.pages;
                },
                //删除
                del(index,id){
                    console.log(id)//当前id
                    if(confirm("你确定要删除🦄")){
                        $.post("/admin/deleteBrand",{id:id},function (data) {
                            if (data.code=="200"){
                                alert("删除成功");
                              window.location.reload();
                            }
                        });
                    }
                },
                //1，修改操作，打开模式框，给标签赋值。
                edit:function (page) {
                    $("#myModal").data("op","update");
                    vue.id = page.id;
                    vue.brandName = page.brandName;
                    vue.brandImage = page.brandImage;
                    vue.letter = page.letter;
                    $('#myModal').modal('show');
                },
                //选择文件
                onHashchange:function(ev){
                    if(ev.target.files[0]!=null){
                        let file=ev.target.files[0];
                        let fileRead = new FileReader();
                        fileRead.readAsDataURL(file);
                        fileRead.onload=function () {
                            $("#img").attr("src", fileRead.result);
                        }
                    }
                    vue.myFile = ev.target.files[0];
                   // this.file = ev.target.files[0];
                },

                //1.新增操作,打开模式框
                add:function () {
                    $("#myModal").data("op","insert");
                    vue.id =null;
                    vue.brandName = null;
                    vue.brandImage = null;
                    vue.letter = null;
                    $("#myModal").modal('show');//显示模态框
                },//insert end
                //2.新增操作,打开模态框后的点击保存(save)事件.
                //2.修改操作,打开模态框后的点击保存(save)事件.
                save:function(){
                    const op = $("#myModal").data("op");
                    if (op == "insert") {//如果等于添加就,执行添加
                        const formData = new FormData();
                        formData.append("brandName", vue.brandName); // 表单项
                        formData.append("letter", vue.letter);
                        formData.append("myFile", vue.myFile);
                        $.ajax({
                            url: '/admin/addBrand/',
                            type: 'POST',
                            dataType: 'json',
                            cache: false,
                            data: formData,
                            processData: false,
                            contentType: false,
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
                        const formData = new FormData();
                        formData.append("brandName", vue.brandName); // 表单项
                        formData.append("letter", vue.letter);
                        formData.append("id", vue.id);
                        formData.append("myFile", vue.myFile);
                        $.ajax({
                            url: '/admin/editBrand',
                            type: 'POST',
                            dataType: 'json',
                            cache: false,
                            data: formData,
                            processData: false,
                            contentType: false,
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
                },//save eend
                //查询
                query:function (data) {
                    var brandName = $("#inputSearchExample3").val();
                    console.log(brandName);
                   $.post("/admin/brandListByName",{pageNum:1,brandName:brandName,},function (data) {
                        vue.pageInfo = data.data;
                    },"json")
                }

            },//methods end

            mounted:function () {//初始化时加载
                $.get("/admin/brandList",{pageNum:1},function (data) {
                    vue.pageInfo = data.data;
                },"json")
            },

            watch: {//监听属性 当属性发生改变执行
                page: function () {
                    $.get('/admin/brandList', {pageNum: vue.page}, function (data) {
                        vue.pageInfo = data.data;
                    }, "json");
                }
            },
        });
    }
</script>
</body>
</html>
