<%--
  Created by IntelliJ IDEA.
  User: Yu
  Date: 2019/12/6
  Time: 11:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-cn">
<head>
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
    <%--模态框sku--%>
    <div id="mySkuModal" class="modal fade">
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
    </div>
    <%--模态框spu--%>
    <div id="myModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">关闭</span></button>
                    <h4 class="modal-title">商品</h4>
                </div>

                <div class="modal-body">
                    <form class="form-horizontal" role="form" id="myform1">

                        <div class="form-group">
                            <label class="col-sm-2 control-label">商品id</label>
                            <div class="col-sm-10">
                                <input class="form-control" type="text" id="pid" name="id" v-model="id" placeholder="此文本框只读" readonly>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">商品主标题</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="title" v-model="title"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label  class="col-sm-2 control-label">商品副标题</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="subTitle" v-model="subTitle"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="image" class="col-sm-2 control-label">主图片</label>
                            <div class="col-sm-6">
                                <input type="file"  name="image" id="image" @change="onHashchange" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="image" class="col-sm-2 control-label"></label>
                            <div class="col-sm-6">
                                <img id="img" width="150px" height="150px" class="img-responsive">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="categoryId" class="col-sm-2 control-label">所属分类</label>
                            <div class="col-sm-10">
                                <select class="form-control"  id="categoryId" style="width: 150px"
                                        class="form-control cate-select col-md-5" name="categoryId" v-model="categoryId">
                                    <option value="0">请选择类型</option>
                                    <option :value="cate.id" v-for="(cate,index) in category.list">{{cate.categoryName}}
                                    </option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="brandId" class="col-sm-2 control-label">所属品牌</label>
                            <div class="col-sm-10">
                                <select class="form-control"  id="brandId" style="width: 150px"
                                        class="form-control cate-select col-md-5" name="brandId" v-model="brandId">
                                    <option value="0">请选择品牌</option>
                                    <option :value="bran.id" v-for="(bran,index) in brand.list">{{bran.brandName}}
                                    </option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label  class="col-sm-2 control-label">定价</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control"  name="pricing" v-model="pricing" placeholder="元" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="categoryId" class="col-sm-2 control-label">是否上架</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control"  name="saleable" v-model="saleable" placeholder="0为否，1为是， 默认1"  />
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
    <%--模态框 end--%>
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
                        商品主页
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
                    <button class="btn" type="button" @click="add">添加商品</button>


                    <%--  放数据   --%>
                    <div>
                        <table class="table table-bordered" id="tableDataGridExample">
                            <thead>
                            <tr>
                                <th>商品序号</th>
                                <th>商品标题</th>
                                <th>商品类目</th>
                                <th>商品品牌</th>
                                <th>商品主图</th>
                                <th>商品定价</th>
                                <th>是否上架</th>
                                <th>添加时间</th>
                                <th colspan="2">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr v-for="(page,index) in pageInfo.list">
                                <td>{{page.id}}</td>
                                <td>{{page.title}}</td>
                                <td>{{page.categoryName}}</td>
                                <td>{{page.brandName}}</td>
                                <td>
                                    <img v-if="page.image" :src="im+page.image"
                                         width="100px" height="70px" class="img-rounded" alt="图片">
                                </td>
                                <td>{{page.pricing}}</td>
                                <td v-if="page.saleable==true">是</td>
                                <td v-else>否</td>
                                <td>{{page.createTime}}</td>

                                <td>
                                    <button class="btn" type="button" @click="addSku(page)" >添加SKU</button>
                                    <a class="btn" href="/admin/sku" >查看SKU</a>
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
                category:[],
                brand:[],
                page: 1,
                im:"/static/images/",
                id:'',
                title:'',
                subTitle:'',
                brandId:'',
                categoryId:'',
                image:'',
                pricing:'',
                saleable:true,
                myFile:'',
                //sku
                spuId:'',
                attributeKey:[],
                inputData:[],
                price:'',
                stock:'',
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
                        $.post("/admin/spuDelete",{id:id},function (data) {
                            if (data.code=="200"){
                                alert("删除成功");
                                window.location.reload();
                            }
                        });
                    }
                },
                //选择文件
                onHashchange:function(ev){
                    if(ev.target.files[0]!=null){
                        let file=ev.target.files[0];
                        let fileRead = new FileReader();
                        fileRead.readAsDataURL(file);
                        fileRead.onload=function () {
                            //添加图
                            $("#img").attr("src", fileRead.result);
                            //修改图
                            $("#skuImg").attr("src", vue.im+fileRead.result);
                        }
                    }
                    vue.myFile = ev.target.files[0];
                },
                //添加sku
                addSku:function(page){
                    //显示模态框
                    $("#mySkuModal").modal('show');
                    //查询所对应的类型 属性key
                    console.log(page.categoryId);
                    $.post("/admin/attributeByCid",{'cid':page.categoryId},function (data) {
                            vue.attributeKey=data.data.list;
                    });
                    vue.title=null;
                    vue.price=null;
                    vue.stock=null;
                    vue.spuId=page.id;
                    vue.saleable=null;
                    $("#mySkuModal").data("op","insert");
                },
                //2.保存sku
                saveSku: function () {
                    const op = $("#mySkuModal").data("op");
                    if (op == "insert") {//如果等于添加就,执行添加
                        const formData = new FormData();
                        const arr = vue.inputData;
                        // 表单项
                        formData.append("spuId", vue.spuId);
                        formData.append("title", vue.title);
                        formData.append("myFile", vue.myFile);
                        formData.append("price", vue.price);
                        formData.append("spec", arr.join(","))
                        formData.append("stock", vue.stock);
                        formData.append("isEnable", vue.saleable);
                        console.log(formData.get("spec"));
                        $.ajax({
                            url: '/admin/addSku',
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
                        });//ajax end
                    }
                },//save end

                //1.新增操作,打开模式框
                add:function () {
                    $("#myModal").data("op","insert");
                    vue.id =null;
                    vue.title=null;
                    vue.subTitle=null;
                    vue.image=null;
                    vue.categoryId=0;
                    vue.brandId=0;
                    vue.pricing=null;
                    vue.saleable=null;
                    $("#myModal").modal('show');//显示模态框
                },//insert end
                //1.修改操作,打开模式框
                edit:function(page){
                    $("#myModal").data("op","update");
                    vue.id =page.id;
                    vue.title=page.title;
                    vue.subTitle=page.subTitle;
                    vue.image=page.image;
                    vue.categoryId= page.categoryId;
                    vue.brandId= page.brandId;
                    vue.pricing=page.pricing;
                    vue.saleable=page.saleable;
                    $("#myModal").modal('show');//显示模态框
                    //显示图片
                    $("#img").attr("src", vue.image);

                },
                //点击保存
                save:function(){
                    const op = $("#myModal").data("op");
                    if (op == "insert") {//如果等于添加就,执行添加
                        const formData = new FormData();
                        formData.append("title", vue.title); // 表单项
                        formData.append("subTitle", vue.subTitle);
                        formData.append("myFile", vue.myFile);
                        formData.append("cid", vue.categoryId);
                        formData.append("bid", vue.brandId);
                        formData.append("pricing", vue.pricing);
                        formData.append("saleable", vue.saleable);
                        $.ajax({
                            url: '/admin/addSpu',
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
                    }else {
                        //执行修改
                        const formData = new FormData();
                        formData.append("id", vue.id);
                        formData.append("title", vue.title); // 表单项
                        formData.append("subTitle", vue.subTitle);
                        formData.append("myFile", vue.myFile);
                        formData.append("cid", vue.categoryId);
                        formData.append("bid", vue.brandId);
                        formData.append("pricing", vue.pricing);
                        formData.append("saleable", vue.saleable);
                        console.log(formData.get("title"));
                        console.log(formData.get("myFile"));
                        $.ajax({
                            url: '/admin/editSpu',
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
                    }//if end
                    $("#myModal").modal('hide');//隐藏模态框
                },//save end
                //查询
                query:function (data) {
                    var title = $("#inputSearchExample3").val();
                    console.log(title);
                    $.post("/admin/spuListByTitle",{pageNum:1,title:title},function (data) {
                        vue.pageInfo = data.data;
                    },"json")
                },
            },
            //初始化时加载
            mounted :function () {
                //商品
                $.post("/admin/spuList",{pageNum:1},function (data) {
                    vue.pageInfo = data.data;
                },"json");
                //分类
                $.post("/admin/categoryList",{pageNum:1},function (data) {
                    vue.category = data.data;
                },"json");
                //品牌
                $.post("/admin/brandList",{pageNum:1},function (data) {
                    vue.brand = data.data;
                },"json");
            },
            //监听属性 当属性发生改变执行
            watch: {//监听属性 当属性发生改变执行
                page: function () {
                    $.post('/admin/spuList', {pageNum: vue.page}, function (data) {
                        vue.pageInfo = data.data;
                    }, "json");
                }
            },

        });
    }
</script>
</body>
</html>
