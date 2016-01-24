<%@ page import="domain.Person" %>
<%--
  Created by IntelliJ IDEA.
  User: ZaraN
  Date: 2016/1/25
  Time: 0:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>科协成员</title>
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
      <li><a href="sitePassword.jsp">修改密码&nbsp;<span class="am-icon-suitcase"></span></a></li>
      <li><a href="siteAvatar.jsp">头像设置&nbsp;<span class="am-icon-picture-o"></span></a></li>
      <li><a href="siteGroup.jsp">组队信息&nbsp;<span class="am-icon-users"></span></a></li>
      <li class="am-active"><a href="siteMember.jsp">科协成员&nbsp;<span class="am-icon-send"></span></a></li>
    </ul>
  </div>

  <div style="width: 60vw;float: left;margin-left: 5vw">

    <h1><span class="am-icon-send am-icon-sm"></span>&nbsp;科协成员</h1>
    <hr style="width: 100%;border: black 2px groove">

  </div>
</div>

</body>
</html>
