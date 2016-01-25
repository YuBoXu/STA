<%@ page import="domain.Person" %>
<%--
  Created by IntelliJ IDEA.
  User: ZaraN
  Date: 2016/1/25
  Time: 0:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改密码</title>
  <script src="frame/AmazeUI-2.4.2/assets/js/jquery.min.js" type="text/javascript"></script>
  <script src="frame/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
  <link rel="stylesheet" href="frame/AmazeUI-2.4.2/assets/css/amazeui.min.css">
  <style type="text/css">
    #avatar{
      width: 8vw;
      height: 8vw;
      border-radius: 4vw;
    }
  </style>
</head>
<body>

<%@include file="header.jsp"%>
<img src="img/main/STA.png" style="margin-top: 50px;width: 100%;height: auto"/>

<div style=";margin-top: 5vh;margin-left: 10vw;margin-right: 10vw">
  <div style="width: 10vw;float: left">
    <div style="text-align: center">
      <img id="avatar" src="<%=request.getContextPath() +"/"+ ((Person)session.getAttribute("person")).getProtrait()%>">
      <h2 style="margin-top: 0px"><s:property value="#session.person.account"/></h2>
    </div>
    <ul class="am-nav">
      <li><a href="sitePersonInfo.jsp">个人信息&nbsp;<span class="am-icon-paw"></span></a></li>
      <li class="am-active"><a href="sitePassword.jsp">修改密码&nbsp;<span class="am-icon-suitcase"></span></a></li>
      <li><a href="siteAvatar.jsp">头像设置&nbsp;<span class="am-icon-picture-o"></span></a></li>
      <li><a href="siteGroup.jsp">组队信息&nbsp;<span class="am-icon-users"></span></a></li>
      <li><a href="siteMember.jsp">科协成员&nbsp;<span class="am-icon-send"></span></a></li>
    </ul>
  </div>

  <div style="width: 60vw;float: left;margin-left: 5vw">

    <h1><span class="am-icon-suitcase am-icon-sm"></span>&nbsp;修改密码</h1>
    <hr style="width: 100%;border: black 2px groove">

    <form class="am-form am-form-horizontal">

      <div class="am-form-group">
        <label for="oldPassword" class="am-u-sm-2 am-form-label">旧密码</label>
        <div class="am-u-sm-10">
          <input type="password" id="oldPassword" placeholder="需要确认一下您以前的密码哦">
        </div>
      </div>

      <div class="am-form-group">
        <label for="newPassword1" class="am-u-sm-2 am-form-label">新密码</label>
        <div class="am-u-sm-10">
          <input type="password" id="newPassword1" placeholder="悄悄输入您的新密码">
        </div>
      </div>

      <div class="am-form-group">
        <label for="newPassword2" class="am-u-sm-2 am-form-label">确认下新密码</label>
        <div class="am-u-sm-10">
          <input type="password" id="newPassword2" placeholder="再来一次">
        </div>
      </div>

      <p style="text-align: center;width: 100%"><input type="button" class="am-btn am-btn-primary" value="保存"></p>
    </form>

  </div>
</div>

</body>
</html>
