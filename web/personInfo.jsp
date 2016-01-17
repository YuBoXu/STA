<%--
  Created by IntelliJ IDEA.
  User: ZaraN
  Date: 2016/1/13
  Time: 17:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
      background: black;
      margin: 0;
    }

    .fullImg{
      position: fixed;
      width: 100vh;
      height: 100vh;;
    }

  </style>

</head>
<body>

  <ul id="scene" class="scene">
    <li class="layer fullImg" data-depth="0.20"><img src="img/personInfo/backStar.png"></li>
    <li class="layer fullImg" data-depth="0.40"><img src="img/personInfo/forwardStar.png"></li>
    <li class="layer fullImg" data-depth="0.50"><img src="img/personInfo/leftLight.png"></li>
    <li class="layer fullImg" data-depth="0.60"><img src="img/personInfo/rightLight.png"></li>
    <li class="layer" data-depth="1.00"><img src="img/personInfo/arrow.png" style="top: 20%;left: 60%;position: fixed;z-index: 10;cursor: pointer" id="more"></li>
  </ul>



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

