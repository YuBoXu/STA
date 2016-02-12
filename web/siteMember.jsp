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
  <link rel="stylesheet" href="frame/AmazeUI-2.4.2/assets/css/amazeui.min.css">
  <script type="text/javascript" src="frame/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
  <script type="text/javascript" src="frame/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
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

    <h1><span class="am-icon-send am-icon-sm"></span>&nbsp;科协成员</h1>
    <hr style="width: 100%;border: black 2px groove">
    <s:if test="%{#session.person.isMenber==0}">
      <button class="am-btn am-btn-block am-btn-primary">加入科协</button>
    </s:if>
    <s:else>
      <form class="am-form am-form-horizontal">

        <div class="am-form-group">
          <label for="account" class="am-u-sm-2 am-form-label">任职部门</label>

          <div class="am-u-sm-10">
            <input type="text" id="account" disabled value=<s:property value="#session.person.departments"/>>
          </div>
        </div>

        <div class="am-form-group">
          <label for="name" class="am-u-sm-2 am-form-label">职位</label>

          <div class="am-u-sm-10">
            <input type="text" id="name" disabled value=<s:property value="#session.person.job"/>>
          </div>
        </div>

      </form>
    </s:else>

  </div>
</div>

</body>
</html>
