<%--
  Created by IntelliJ IDEA.
  User: ZaraN
  Date: 2016/2/11
  Time: 12:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <script src="frame/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
    <title>跳转提示</title>
  <style rel="stylesheet" type="text/css">
    @font-face {
      font-family: title;
      src: url("font/title.TTF");
    }
  </style>
</head>
<body>
<div style="text-align: center;font-family: title;margin-top: 40vh;font-size: 30px">
  <span style="color:#00b1ff" mce_style="color:red">要使用此功能清先<span style="color: #ff3585;font-size: 40px">登陆</span>哦么么哒~</span>
  <br/>页面将在3秒后跳转...<br/>
</div>
</body>

<script>
  $(document).ready(function() {
    function jump(count) {
      window.setTimeout(function(){
        count--;
        if(count > 0) {
          $('#num').attr('innerHTML', count);
          jump(count);
        } else {
          location.href="login.jsp";
        }
      }, 1000);
    }
    jump(3);
  });
</script>
</html>
