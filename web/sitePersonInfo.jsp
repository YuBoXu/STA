<%@ page import="domain.Person" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
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
  <title>更多信息</title>
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
            <li class="am-active"><a href="sitePersonInfo.jsp">个人信息&nbsp;<span class="am-icon-paw"></span></a></li>
            <li><a href="sitePassword.jsp">修改密码&nbsp;<span class="am-icon-suitcase"></span></a></li>
            <li><a href="siteAvatar.jsp">头像设置&nbsp;<span class="am-icon-picture-o"></span></a></li>
            <li><a href="siteGroup.jsp">组队信息&nbsp;<span class="am-icon-users"></span></a></li>
            <li><a href="siteMember.jsp">科协成员&nbsp;<span class="am-icon-send"></span></a></li>
        </ul>
    </div>

    <div style="width: 60vw;float: left;margin-left: 5vw;">
        <h1><span class="am-icon-paw am-icon-sm"></span>&nbsp;个人信息</h1>
        <hr style="width: 100%;border: black 2px groove">
        <form class="am-form am-form-horizontal">

            <div class="am-form-group">
                <label for="username" class="am-u-sm-2 am-form-label">用户名</label>
                <div class="am-u-sm-10">
                    <input type="text" id="username" disabled value=<s:property value="#session.person.account"/>>
                </div>
            </div>

            <div class="am-form-group">
                <label for="name" class="am-u-sm-2 am-form-label">姓名</label>
                <div class="am-u-sm-10">
                    <input type="text" id="name" disabled value=<s:property value="#session.person.name"/>>
                </div>
            </div>

            <div class="am-form-group">
                <label for="classes" class="am-u-sm-2 am-form-label">班级</label>
                <div class="am-u-sm-10">
                    <input type="text" id="classes" value=<s:property value="#session.person.classes"/>>
                </div>
            </div>

            <div class="am-form-group">
                <label for="qq" class="am-u-sm-2 am-form-label">QQ</label>
                <div class="am-u-sm-10">
                    <input type="text" id="qq" value=<s:property value="#session.person.qq"/>>
                </div>
            </div>

            <div class="am-form-group">
                <label for="tel" class="am-u-sm-2 am-form-label">电话号码</label>
                <div class="am-u-sm-10">
                    <input type="text" id="tel" value=<s:property value="#session.person.tel"/>>
                </div>
            </div>

            <div class="am-form-group">
                <label for="mail" class="am-u-sm-2 am-form-label">邮件</label>
                <div class="am-u-sm-10">
                    <input type="text" id="mail" value=<s:property value="#session.person.mail"/>>
                </div>
            </div>

            <div class="am-form-group">
                <label for="wechat" class="am-u-sm-2 am-form-label">微信</label>
                <div class="am-u-sm-10">
                    <input type="text" id="wechat" value=<s:property value="#session.person.wechat"/>>
                </div>
            </div>

            <div class="am-form-group">
                <label for="hobby" class="am-u-sm-2 am-form-label">兴趣爱好</label>
                <div class="am-u-sm-10">
                    <input type="text" id="hobby" value=<s:property value="#session.person.hobby"/>>
                </div>
            </div>

            <div class="am-form-group">
                <label for="speciality" class="am-u-sm-2 am-form-label">特长</label>
                <div class="am-u-sm-10">
                    <input type="text" id="speciality" value=<s:property value="#session.person.speciality"/>>
                </div>
            </div>


            <div class="am-form-group">
                <label for="introduce" class="am-u-sm-2 am-form-label">个人简介</label>
                <div class="am-u-sm-10">
                    <textarea rows="5" type="text" id="introduce"><s:property value="#session.person.introduce"/></textarea>
                </div>
            </div>

            <p style="text-align: center;width: 100%"><input type="button" class="am-btn am-btn-primary" value="保存"></p>

        </form>
    </div>
</div>

</body>

<script type="text/javascript">

</script>
</html>