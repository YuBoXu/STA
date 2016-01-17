<%--
  Created by IntelliJ IDEA.
  User: ZaraN
  Date: 2016/1/13
  Time: 17:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8">

  <title>Parallax.js | jQuery Example</title>

  <!-- Behavioral Meta Data -->
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

  <link type="text/css" rel="stylesheet" href="css/animate.css">

  <style rel="stylesheet" type="text/css">
    body {
      background: black !important;
      margin: 0 !important;
      width: 100%;
      height: 100%;
    }

    .fullImg{
      position: fixed;
      width: 100vh;
      height: 100vh;;
    }

    @font-face {
      font-family: content;
      src: url("font/title.TTF");
    }

    .content{
      position: absolute;
      top: 20%;
      left: 20%;
      color: white;
      background: rgba(255,255,255,0.1);
      width: 30%;
      height: 60%;
      padding-left: 2%;
      padding-top: 2%;
      padding-right: 2%;
      font-family: content;
      font-size: 20px;
      border:2px solid;
      border-radius:25px;
      -moz-border-radius:25px;
    }

    #avatar{
      width: 100px;
      height: 100px;
      -webkit-transition: width 2s, height 2s;
      -moz-transition: width 2s, height 2s;
      -ms-transition: width 2s, height 2s;
      -o-transition: width 2s, height 2s;
      transition: width 2s, height 2s;
    }

    #avatar:hover {
      width: 150px;
      height: 150px;
    }

  </style>


</head>
<body>

<%@include file="header.jsp"%>

  <ul id="scene" style="padding: 0;margin: 0">
    <li class="layer fullImg" data-depth="0.20"><img src="img/personInfo/backStar.png"></li>
    <li class="layer fullImg" data-depth="0.40"><img src="img/personInfo/forwardStar.png"></li>
    <li class="layer fullImg" data-depth="0.60"><img src="img/personInfo/leftLight.png"></li>
    <li class="layer fullImg" data-depth="0.80"><img src="img/personInfo/rightLight.png"></li>
    <li class="layer" data-depth="0.00"><img src="img/personInfo/arrow.png" style="top: 25%;left: 60%;position: fixed;z-index: 10;cursor: pointer" id="more"></li>
  </ul>

  <div class="content">
    <p style="text-align: center"><img id="avatar" src="img/avatar/avatar.png"></p>
    <p>姓名：张然</p>
    <p>班级：1304</p>
    <p>秋秋：597699567</p>
    <p>电话：15773181012</p>
    <p>个人说明：啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦</p>
  </div>



<script src="frame/bootstrap-3.3.4-dist/js/jQuery.js"></script>
<script src="plugin/Parallax.js/deploy/jquery.parallax.min.js"></script>
<script>
  $('#scene').parallax();
</script>

</body>
<script>
  $("#more").on("mouseenter",function(event){
    $("#more").addClass('animated flash');
    setTimeout(function(){
      $('#more').removeClass('flash');
    }, 1000);
  })
</script>
</html>

