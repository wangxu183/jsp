<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>书籍查询界面</title>
    <link rel="stylesheet" type="text/css" href="assets/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="assets/css/main.css"/>
    <link rel="stylesheet" type="text/css" href="assets/css/pagination.css">
    <script type="text/javascript" src="assets/js/libs/modernizr.min.js"></script>
    <script src="assets/js/jquery-3.2.1.js"></script>
    <script src="assets/layer/layer.js"></script>
    <script src="assets/js/dateFormat.js"></script>
    <style type="text/css">
        td,#col-title th{text-align: center;}
    </style>
</head>
<body>
<div class="topbar-wrap white">
    <div class="topbar-inner clearfix">
        <div class="topbar-logo-wrap clearfix">
            <ul class="navbar-list clearfix">
                <li><a class="on" href="home.jsp">首页</a></li>
            </ul>
        </div>
        <div class="top-info-wrap">
            <ul class="top-info-list clearfix">
                <li><a href="index.jsp">退出</a></li>
            </ul>
        </div>
    </div>
</div>
<div class="container clearfix">
    <div class="main-wrap">
        <div class="crumb-wrap">
            <div class="crumb-list">
                <i class="icon-font"></i>
                <a href="bookadd.jsp">首页</a>
                <span class="crumb-step">&gt;</span>图书管理<span class="crumb-step">&gt;</span><span>查询图书信息</span></div>
        </div>
        <div class="search-wrap">
            <div class="search-content">
                <form >
                    <table class="search-tab" >
                        <tr>  
                            <th width="70">书名:</th>
                            <td><input class="common-text" placeholder="" name="name"  id="bookname" value="${type=="search"?formerKeywords:""}" type="text" style="width:150px"></td>
                            <th width="80">选择分类:</th>
                            <td>
                                <select name="cateId" class="common-text" id="cateId">
                                    <option value="">请选择</option>
                                    <option value="">编程</option>
                                    <option value="">文学</option>
                                    <option value="">历史</option>
                                    <option value="">艺术</option>
                                    <option value="">其他</option>
                                </select>
                            </td>

                            <td style="padding-left:50px"><button class="btn btn-primary btn2" type="button" onclick="findbook()">查询</button></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
        <div class="result-wrap">
            <form >
                <div class="result-content">
                    <table class="result-tab" width="100%" id="tab">
                        <tr id="col-title">
                            <th>ID</th>
                            <th>书名</th>
                            <th>作者</th>
                            <th>类别</th>
                            <th>出版社</th>
                            <th>价格</th>
                            <th>描述</th>

                        </tr>

                    </table>
                    <div class="list-page">

                        <ul class="pagination">
                            <li><a href="#">首页</a></li>
                            <li><a href="#">&laquo;</a></li>
                            <li>
                                <a href="#">&raquo;</a>
                            </li>
                            <li><a href="#">尾页</a></li>
                        </ul>
                    </div>
                </div>
            </form>
        </div>
    </div>

</div>

</body>
</html>
<script language="JavaScript">
    function findbook() {
        var book={
            bookname:$("#bookname").val()
        };
        $.ajax({
            type:"post",
            url:"book/findbook.action",
            contentType:"application/json",
            data: JSON.stringify(book),
            dataType: "json",
            success: function (data) {
                console.log(data);
                var str = "";//定义用于拼接的字符串
                for (var i = 0; i < data.length; i++) {
                    //拼接表格的行和列
                    str = "<tr> <td class='tc'> <input name='ids[]' type='checkbox' class='singleChoose'> </td><td>"+data[i].bookname+"</td> <td>"+data[i].author+"</td> <td>"+data[i].type+"</td> <td>"+data[i].publish+"</td> <td>"+data[i].price+"</td> <td>"+data[i].description+"</td></tr>";
                    //追加到table中
                    $("#tab").append(str);
                }
            },
            error: function (e) {
                console.log("错误是:" + e.responseText);
            }
        })
    }
</script>

