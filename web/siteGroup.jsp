<%@ page import="domain.Person" %>
<%--
  Created by IntelliJ IDEA.
  User: ZaraN
  Date: 2016/1/25
  Time: 0:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>组队信息</title>
  <style type="text/css">
    #avatar {
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
  <%@include file="siteNavigation.jsp" %>

  <div style="width: 60vw;float: left;margin-left: 5vw">

    <h1><span class="am-icon-users am-icon-sm"></span>&nbsp;组队信息</h1>
    <hr style="width: 100%;border: black 2px groove">

  </div>
</div>

</body>
</html>
