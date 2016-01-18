<%--
  Created by IntelliJ IDEA.
  User: ZaraN
  Date: 2016/1/18
  Time: 14:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
  <link rel="stylesheet" href="frame/AmazeUI-2.4.2/assets/css/amazeui.min.css">
  <script type="text/javascript" src="frame/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
  <script type="text/javascript" src="frame/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
  <style type="text/css" rel="stylesheet">
    @font-face {
      font-family: title;
      src: url("font/title.TTF");
    }

    .loginArea{
      margin-left: auto;
      margin-right: auto;
      background: rgba(255,255,255,0.1);
      width: 30%;
      height: auto;
      padding: 20px;
    }

    .bgImg{
      height: 100%;
      width: 100%;
      z-index: -1;
    }

    .midContent{
      position: absolute;
      top: 20%;
      text-align: center;
      width: 100%
    }
  </style>
</head>
<body>

<%@include file="header.jsp"%>

<div style="width: 100%;height: 100%">
  <img src="img/login/loginBg.png" class="bgImg">
  <div class="midContent">
    <h1 style="text-align: center;font-family: title,serif;font-size: 50px;color: white;margin-bottom: 5%">改变世界，从<span style="font-size: 60px;color: coral">现在</span>开始</h1>
    <div class="loginArea">
      <form action="" class="am-form">
        <div class="am-form-group am-form-success am-form-icon am-form-feedback">
          <label class="am-form-label" for="username">请输入用户名</label>
          <input type="text" id="username" class="am-form-field">
          <span class="am-icon-check"></span>
        </div>
        <div class="am-form-group am-form-success am-form-icon am-form-feedback">
          <label class="am-form-label" for="password">请输入密码</label>
          <input type="password" id="password" class="am-form-field">
          <span class="am-icon-check"></span>
        </div>
        <button type="button" class="am-btn am-btn-warning am-btn-block">登陆</button>
        <a href="register.jsp"><button type="button" class="am-btn am-btn-secondary am-btn-block">注册</button></a>
      </form>
    </div>
  </div>
</div>
</body>
</html>
