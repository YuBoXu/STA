<%--
  Created by IntelliJ IDEA.
  User: ZaraN
  Date: 2016/1/23
  Time: 13:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <script src="frame/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
  <script src="frame/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>

  <link rel="stylesheet" href="frame/AmazeUI-2.4.2/assets/css/amazeui.min.css">
  <link rel="stylesheet" href="frame/AmazeUI-2.4.2/assets/css/app.css">
  <link rel="stylesheet" href="css/button.css">
    <title></title>
  <style type="text/css" rel="stylesheet">
    @font-face {
      font-family: title;
      src: url("font/title.TTF");
    }
  </style>
</head>
<body>
<%@include file="header.jsp"%>
<img src="img/group/groupTitle.png" style="margin-top: 50px;width: 100vw;height: auto"/>
<div style="text-align: center;margin-top: 20px;margin-left: 10vw;margin-right: 10vw">
  <form class="am-form-inline" role="form">
    <div class="am-form-group">
      <input type="text" class="am-form-field button-block" placeholder="团队关键字……">
    </div>
    <a class="button button-royal button-rounded">搜索团队</a>
  </form>
  <table class="am-table am-table-striped am-table-hover">
    <thead>
    <tr>
      <th style="width: 40%">组队标题<a class="button button-tiny button-pill button-primary" style="margin-left: 10%">我要发布</a></th>
      <th>已加入/需要人数</th>
      <th>发起人</th>
      <th>时间截止</th>
      <th>查看详细</th>
    </tr>
    </thead>
    <tbody>
    <tr  style="vertical-align: middle">
      <td>软件创新大赛求来大牛</td>
      <td>0/4</td>
      <td>豆豆</td>
      <td>2012-10-01</td>
      <td> <a class="button button-caution button-tiny" data-am-modal="{target: '#information'}" id="show1">Show</a></td>
    </tr>

    <tr  style="vertical-align: middle">
      <td>花旗杯招人啦</td>
      <td>2/3</td>
      <td>豆豆</td>
      <td>2012-10-01</td>
      <td><a class="button button-caution button-tiny" data-am-modal="{target: '#information'}" id="show2">Show</a></td>
    </tr>
    </tbody>
  </table>
  <ul class="am-pagination am-pagination-centered">
    <li class="am-disabled"><a href="#">&laquo;</a></li>
    <li class="am-active"><a href="#">1</a></li>
    <li><a href="#">2</a></li>
    <li><a href="#">3</a></li>
    <li><a href="#">4</a></li>
    <li><a href="#">5</a></li>
    <li><a href="#">&raquo;</a></li>
  </ul>
</div>


<div class="am-popup" id="information" style="height: auto">
  <div class="am-popup-inner">
    <div class="am-popup-hd">
      <h4 class="am-popup-title">title</h4>
      <span data-am-modal-close
            class="am-close">&times;</span>
    </div>
    <div class="am-popup-bd">
      <p>标题:&nbsp;<span id="title"></span></p>
      <p>发起人:&nbsp;<span id="leader"></span></p>
      <p>需要人数:&nbsp;<span id="needNum"></span></p>
      <p>现有人数:&nbsp;<span id="nowNum"></span></p>
      <p>截止日期:&nbsp;<span id="deadline"></span></p>
      <p style="margin-bottom: 0">详细说明:&nbsp;</p>
      <span id="introduce"></span>
    </div>
    <div class="am-modal-footer">
      <span class="am-modal-btn" data-am-modal-cancel>取消</span>
      <span class="am-modal-btn" data-am-modal-confirm>申请</span>
    </div>
  </div>
</div>

</body>

<script>
  $("#show1").click(function(){
    $("#title").text("软件创新大赛求来大牛");
    $("#leader").text("豆豆");
    $("#needNum").text("4");
    $("#nowNum").text("0");
    $("#deadline").text("2012-10-01");
    $("#introduce").text("我们团队特NB，来了绝对拿国奖，现在我们团队已经完成了队长选举，没错就是本大爷，现在还需要一个给本大爷出创意的和一个编代码的，像蹭我的光就赶紧来！");
  })

  $("#show2").click(function(){
    $("#title").text("花旗杯");
    $("#leader").text("豆豆");
    $("#needNum").text("3");
    $("#nowNum").text("1");
    $("#deadline").text("2012-10-01");
    $("#introduce").text("现在手上已有创意，现征集一位代码大神，万分感激");
  })
</script>
</html>
