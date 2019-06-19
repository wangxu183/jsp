<%@ page language="java" pageEncoding="utf-8" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>修改书籍信息</title>
    <link rel="stylesheet" type="text/css" href="assets/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="assets/css/main.css"/>
    <script type="text/javascript" src="assets/js/libs/modernizr.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="assets/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="assets/ueditor/ueditor.all.js"> </script>
    <script type="text/javascript" charset="utf-8" src="assets/ueditor/lang/zh-cn/zh-cn.js"></script>
    <script src="assets/js/jquery-3.2.1.js"></script>
    <script src="assets/layer/layer.js"></script>
    <script src="assets/js/dateFormat.js"></script>
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
                <li><a class="on" href="index.jsp">退出</a></li>
            </ul>
        </div>
    </div>
</div>
<div class="container clearfix">


    <div class="main-wrap">
        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font"></i><a  href="bookadd.jsp">首页</a><span class="crumb-step">&gt;</span>图书管理<span class="crumb-step">&gt;</span><span>修改图书信息</span></div>
        </div>

        <div class="result-wrap">
            <div class="result-content">
                <form  id="add-book" >
                    <table class="insert-tab" width="100%">
                        <tbody>
                             <tr>
                                <th>
                                    <i class="require-red">*</i>书名：</th>
                                <td>
                                    <input class="common-text required"  size="50"  type="text" id="bookname">
                                </td>
                            </tr>
                            <tr>
                                <th width="120">
                                    <i class="require-red">*</i>分类：</th>
                                <td>
                                    <select name="cate" id="cateId" class="required common-text">
                                        <option value="">请选择</option>
                                        <option value="编程">编程</option>
                                        <option value="文学">文学</option>
                                        <option value="历史">历史</option>
                                        <option value="艺术">艺术</option>
                                        <option value="其他">其他</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>价格：</th>
                                <td>
                                    <input type="number" min="0" max="1000"  class="common-text" id="bookprice">
                                </td>
                            </tr>
                            <tr>
                                <th>作者：</th>
                                <td>
                                    <input class="common-text"  size="50" type="text" id="bookauthor">
                                </td>
                            </tr>
                            <tr>
                                <th>出版社：</th>
                                <td>
                                    <input class="common-text"  size="50" type="text" id="bookpublish">
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <i class="require-red">*</i>缩略图：</th>
                                <td>
                                    <input type=file name="img" id="img" onchange="javascript:setImagePreview();">
                                     <img id="preview"  style="diplay:inline-block;width: 150px;margin-left: 10px" src="${book.img}"/>
                                </td>             
                            </tr>
                            <tr>
                                <th>详细信息：</th>
                                <td>
                                    <textarea name="con" class="common-textarea" id="content" cols="30" style="width: 98%;" rows="10"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <th></th>
                                <td>
                                    <button class="btn btn-primary btn6 mr10" type="button" onclick="update()" >提交</button>
                                    <input class="btn btn6" onclick="history.go(-1)" value="返回" type="button">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>

<script type="text/javascript">
    function setImagePreview() {
        var docObj = document.getElementById("img");
        var imgObjPreview = document.getElementById("preview");
        if (docObj.files && docObj.files[0]) {
            //火狐下，直接设img属性
            imgObjPreview.style.width = '150px';
            imgObjPreview.style.display="inline-block";
            imgObjPreview.style.marginLeft="10px";
            //imgObjPreview.style.height = '120px';
            //imgObjPreview.src = docObj.files[0].getAsDataURL();
            //火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式
            imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
        } else {
            //IE下，使用滤镜
            docObj.select();
            var imgSrc = document.selection.createRange().text;
            var localImagId = document.getElementById("localImag");
            //必须设置初始大小
            localImagId.style.width = "50px";
            //localImagId.style.height = "200px";
            //图片异常的捕捉，防止用户修改后缀来伪造图片
            try {
                localImagId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
                localImagId.filters
                    .item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
            } catch (e) {
                alert("您上传的图片格式不正确，请重新选择!");
                return false;
            }
            imgObjPreview.style.display = 'none';
            document.selection.empty();
        }
        return true;
    }
    function getbook() {
        var id=getCookie("bookid");
        $.ajax({
            type:"post",
            url:"book/findbookByid.action",
            contentType:"application/json",
            data: JSON.stringify(id),
            dataType: "json",
            success:function (data) {
               console.log(data);
               document.getElementById("bookname").value=data.bookname;
               var t=data.type;
               console.log(t);
                $("#cateId").val(t);
               document.getElementById("bookprice").value=data.price;
                document.getElementById("bookauthor").value=data.author;
                document.getElementById("bookpublish").value=data.publish;
                document.getElementById("content").value=data.description;
            },
            error:function (e) {
                console.log("错误是:" + e.responseText);
            }
        })
    }
    function update() {
        if(confirm("确认修改该书籍？")){
            updatebook();
        }
    }
    function updatebook() {
        var book={
            id:getCookie("bookid"),
            bookname:$("#bookname").val(),
            type:$("#cateId").find("option:selected").text(),
            price:$("#bookprice").val(),
            author:$("#bookauthor").val(),
            publish:$("#bookpublish").val(),
            description:$("#content").val(),
        };
        console.log(book);
        $.ajax({
            type:"put",
            url:"book/updatebook.action",
            contentType:"application/json",
            data: JSON.stringify(book),
            dataType: "json",
            success:function (data) {
                alert("修改成功");
            },
            error:function (data) {
                console.log("错误是:" + e.responseText);
            }
        })
    }
    function getCookie(cname){
        var name=cname+"=";
        var ca=document.cookie.split(';');
        for (var i=0;i<ca.length;i++){
            var c=ca[i].trim();
            if(c.indexOf(name)==0){
                return c.substring(name.length,c.length);
            }
        }
    }
    window.onload=getbook();
</script>
