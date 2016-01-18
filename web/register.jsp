<%--
  Created by IntelliJ IDEA.
  User: ZaraN
  Date: 2016/1/18
  Time: 16:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <link rel="stylesheet" href="frame/AmazeUI-2.4.2/assets/css/amazeui.min.css">
  <script type="text/javascript" src="frame/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
  <script type="text/javascript" src="frame/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
  <style type="text/css" rel="stylesheet">
    @font-face {
      font-family: title;
      src: url("font/title.TTF");
    }

    p{
      font-family: title;
    }

    title{
      font-size: 50px;
      text-align: center;
    }

    label{
      float:left
    }

    [name=validate]{
      float: right;
    }

  </style>
    <title>注册-加入我们</title>
</head>
<body>
<%@include file="header.jsp"%>
<img src="img/register/register.png" style="margin-top: 50px;margin-left: auto;margin-right: auto;width: 100%;height: auto"/>
<div style="text-align: center">
  <div style="width: 50%;height: auto;margin-right: auto;margin-left: auto">
    <form class="am-form">
      <fieldset>
        <legend>个人信息(<span style="color: red">*</span>为必填)</legend>

        <div class="am-form-group">
          <label for="username">用户名<span style="color: red">*</span></label><span id="usernameValidate" name="validate" class="am-icon-warning"></span>
          <input type="text" class="" id="username" placeholder="登陆用哦">
        </div>

        <div class="am-form-group">
          <label for="password1">密码<span style="color: red">*</span></label><span id="password1Validate" name="validate" class="am-icon-warning"></span>
          <input type="password" class="" id="password1" placeholder="悄悄地输入您的密码">
        </div>

        <div class="am-form-group">
          <label for="password2">再次确认您的密码<span style="color: red">*</span></label><span id="password2Validate" name="validate" class="am-icon-warning"></span>
          <input type="password" class="" id="password2" placeholder="确认一下">
        </div>

        <div class="am-form-group">
          <label for="name">姓名<span style="color: red">*</span></label><span id="nameValidate" name="validate" class="am-icon-warning"></span>
          <input type="password" class="" id="name" placeholder="真实姓名">
        </div>

        <div class="am-form-group">
          <label for="mail">邮件<span style="color: red">*</span></label><span id="mailValidate" name="validate" class="am-icon-warning"></span>
          <input type="email" class="" id="mail" placeholder="输入电子邮件">
        </div>

        <div class="am-form-group">
          <label for="qq">QQ<span style="color: red">*</span></label><span id="qqValidate" name="validate" class="am-icon-warning"></span>
          <input type="email" class="" id="qq" placeholder="输入您的QQ以便之后校内面面面">
        </div>

        <div class="am-form-group">
          <label for="wechat">微信</label>
          <input type="email" class="" id="wechat" placeholder="您的微信">
        </div>

        <div class="am-form-group">
          <label for="hobby">兴趣爱好</label>
          <input type="email" class="" id="hobby" placeholder="寻找同道中人">
        </div>

        <div class="am-form-group">
          <label for="speciality">特长</label>
          <input type="email" class="" id="speciality" placeholder="伯乐就在这里">
        </div>

        <div class="am-form-group">
          <label for="introduce">个人简介</label>
          <textarea class="" rows="5" id="introduce"></textarea>
        </div>

        <div class="am-form-group am-form-file">
          <label for="protrait">上传头像</label><br>
          <div>
            <button type="button" class="am-btn am-btn-default am-btn-sm am-btn-block">
              <i class="am-icon-cloud-upload"></i> 选择要上传的图片</button>
          </div>
          <input type="file" id="protrait">
        </div>
        <label>你的头像</label><br>
        <p style="text-align: center"><img id="avatar" src="img/avatar/avatar.png" style="width: 200px;height: 200px"/></p>

        <p><button type="submit" class="am-btn am-btn-default">提交</button></p>
      </fieldset>
    </form>
  </div>
</div>

</body>
<script>
  $("#protrait").change(function(){
    var objUrl = getObjectURL(this.files[0]) ;
    console.log("objUrl = "+objUrl) ;
    if (objUrl) {
      $("#avatar").attr("src", objUrl) ;
    }
  }) ;

  function getObjectURL(file) {
    var url = null ;
    if (window.createObjectURL!=undefined) {
      url = window.createObjectURL(file) ;
    } else if (window.URL!=undefined) {       // mozilla(firefox)
      url = window.URL.createObjectURL(file) ;
    } else if (window.webkitURL!=undefined) { // webkit or chrome
      url = window.webkitURL.createObjectURL(file) ;
    }
    return url ;
  }

</script>
</html>
