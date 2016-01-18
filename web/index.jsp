<%--
  Created by IntelliJ IDEA.
  User: ZaraN
  Date: 2015/10/15
  Time: 18:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <script src="frame/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
    <script src="frame/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>

    <link rel="stylesheet" href="frame/AmazeUI-2.4.2/assets/css/amazeui.min.css">
    <link rel="stylesheet" href="frame/AmazeUI-2.4.2/assets/css/app.css">
    <link rel="stylesheet" href="css/button.css">
    <title>STA Home</title>
    <style type="text/css" rel="stylesheet">
      @font-face {
        font-family: title;
        src: url("font/title.TTF");
      }

      .title{
        font-family: title;
        color: white;
      }

      .midContent{
        position: absolute;
        top: 35%;
        text-align: center;
        width: 100%
      }

      .bgImg{
        height: 100%;
        width: 100%;
        z-index: -1;
      }

      .halfWindow{
        height: 100%;
        width: 50%;
        float: left;
      }

    </style>
  </head>

  <body>

  <%@include file="header.jsp"%>

  <div style="height: 100%;width: 100%">
    <img src="img/main/mainBg2.png" class="bgImg" id="bg"/>
    <div class="midContent">
      <h1 class="title" style="font-size: 50px;margin-top: 0px;margin-bottom: 0px">中南大学软件学院<br>科学技术协会</h1>
      <p><b class="title" style="font-size: 20px;color: #efefef">为了正在进步的你</b></p>
      <a class="button button-primary button-pill" style="margin-right: 5%;font-family: title;">了解我们</a>
      <a class="button button-pill button-border" style="font-family: title;color: white" id="joinUs">加入我们</a>
    </div>

  <div>
    <div class="halfWindow"></div>
    <div class="halfWindow"></div>
  </div>

  </div>

  </body>

<script type="text/javascript">

  $("#joinUs").on("mouseenter",function(){
    $("#joinUs").css("color","#00a8e6")
  })
  $("#joinUs").on("mouseleave",function(){
    $("#joinUs").css("color","white")
  })

</script>

</html>
