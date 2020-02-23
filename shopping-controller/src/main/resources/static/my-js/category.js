window.onload = function() {
    //header.jsp加载完毕后通过Ajax去服务器获得所有的分类信息
    var two = new Vue({
        el: "#app",
        data: {
            //定义变量接收数据
            category: [],
            id:'',
            cid:'',
            categoryName:'',
            page:'',
        },
        //初始化时加载
        mounted:function () {
            $.post("/index/categoryList",{pageNum:1,pageSize:100},function (data) {
                two.category = data.data;
            },"json");
        },
    });
}