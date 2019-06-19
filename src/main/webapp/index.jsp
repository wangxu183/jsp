<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%--<!doctype html>--%>
<%--<html lang="en">--%>
<head>
    <script  src="./js/jquery-3.2.1.js"></script>
    <script src="./js/jquery.cookie.js"></script>
    <meta charset="UTF-8">
    <meta name="Generator" content="EditPlus®">
    <meta name="Author" content="">
    <meta name="Keywords" content="">
    <meta name="Description" content="">
    <title>用户登录</title>
    <style>
        body,div,img,p,input,form{
            margin:0;
            padding:0;
        }
        body{
            background:#000;
        }
        .content{
            position:relative;
            width:380px;
            height:380px;
            margin-top:100px;
            margin-left:130px;
        }
        .content > p{
            position:absolute;
            width:0;
            height:5px;
            background:#33ffff;
            animation:length 5s forwards;
            transform-origin:0 0;
        }
        .content .c-p1{
            top:0;
            left:0;
        }
        .content .c-p2{
            top:0;
            left:380px;
            transform:rotate(90deg);
        }
        .content .c-p3{
            top:380px;
            left:380px;
            transform:rotate(180deg);
        }
        .content .c-p4{
            top:380px;
            left:0px;
            transform:rotate(-90deg);
        }
        @keyframes length{
            0%{
                width:0;
            }
            100%{
                width:100%;
            }
        }
        .content div{
            position:relative;
            width:300px;
            height:300px;
            transform:translate(40px,40px);
        }
        .content div img{
            width:300px;
            height:300px;
        }
        .content div p{
            position:absolute;
            width:100px;
            height:100px;
            background:#000;
            animation:bcg 1s forwards;
            animation-iteration-count:1;
        }
        .content div .box1{
            top:0;
            left:0;
        }
        .content div .box2{
            top:0;
            left:100px;
            animation-delay:1s;
        }
        .content div .box3{
            top:0;
            left:200px;
            animation-delay:2s;
        }
        .content div .box4{
            top:100px;
            left:0;
            animation-delay:1s;
        }
        .content div .box5{
            top:100px;
            left:100px;
            animation-delay:2s;
        }
        .content div .box6{
            top:100px;
            left:200px;
            animation-delay:3s;
        }
        .content div .box7{
            top:200px;
            left:0;
            animation-delay:2s;
        }
        .content div .box8{
            top:200px;
            left:100px;
            animation-delay:3s;
        }
        .content div .box9{
            top:200px;
            left:200px;
            animation-delay:4s;
        }
        @keyframes bcg{
            0%{
                opacity:1;
            }
            100%{
                opacity:0;
            }
        }

        .main{
            width:1280px;
            height:600px;
            margin:0 auto;
        }
        form{
            position:absolute;
            top:90px;
            right:50px;
            width:330px;
            height:380px;
            padding:10px 30px;
            background:#FFFAF0;
            margin-right:2px;
        }
        .main form img{
            float:right;
            width:50px;
            height:50px;
        }

        .main form p{
            margin-top:20px;
            font-size:20px;
            color:#99261F;
        }
        [type="text"],[type="password"]{
            width:100%;
            height:40px;
            margin-top:20px;
            text-indent:50px;
        }
        [type="text"]{
            background:#DED2B3; url("./images/num.png") 0 0/40px no-repeat;
        }
        [type="password"]{
            background:#DED2B3; url("./images/pwd.png") 0 0/40px no-repeat;
        }
        [type="button"]{
            width:100%;
            height:40px;
            margin-top:20px;
            color:#fff;
            font-size:20px;
            text-align:center;
            border:0;
            background:#ffb606;
        }
        [type="button1"]{
            margin-top:30px;
            color:#000;
            padding-right:30px;
            font-size:18px;
            background:0;
            border:0;
        }
        #forgetpwd{
            margin-left:130px;
        }
    </style>
</head>
<body>
<div class="content">
    <div>
        <img src="images/g1.jpg" alt="">
        <p class="box1"></p>
        <p class="box2"></p>
        <p class="box3"></p>
        <p class="box4"></p>
        <p class="box5"></p>
        <p class="box6"></p>
        <p class="box7"></p>
        <p class="box8"></p>
        <p class="box9"></p>
    </div>
    <p class="c-p1"></p>
    <p class="c-p2"></p>
    <p class="c-p3"></p>
    <p class="c-p4"></p>
</div>

<div class="main">
    <form>
        <p>密码登录</p>
        <input type="text" name="username" id="u" placeholder="请输入用户名">
        <input type="password" id="p" name="pwd">
        <input type="button" name="login" onclick="tohome()" value="登录">
        <input type="button" name="register" onclick="goo()"  value="免费注册">
    </form>
</div>
</body>
</html>
<script language="JavaScript">
    function tohome() {
        var uname=$("#u").val();
        var pwd=$("#p").val();
        var user={
            username:uname,
            password:pwd
        };
        $.ajax({
            type:"post",
            url:"user/login.action",
            contentType:"application/json",
            data: JSON.stringify(user),
            dataType: "json",
            success: function (data) {
                switch (data) {
                    case 1:
                        setCookie("name",uname);
                        window.location="home.jsp";
                        break;
                    case 0:
                        alert("密码或用户名错误，请重新输入!");
                        document.getElementById("p").value ="";
                        document.getElementById("u").value ="";
                        break;
                }
            },
            error: function (e) {
                console.log("错误是:" + e.responseText);
            }

        });
    }

    function goo() {
        window.location="userRegister.jsp";
    }
    function setCookie(cname,cvalue) {
        var d=new Date();
        d.setTime(d.getTime()+7*24*60*60*1000);
        var expires="expires="+d.toGMTString();
        document.cookie=cname+"="+cvalue+";"+expires;
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

</script>
