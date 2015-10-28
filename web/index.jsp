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
    <script src="AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
    <script src="AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
    <link rel="stylesheet" href="AmazeUI-2.4.2/assets/css/amazeui.min.css">
    <link rel="stylesheet" href="AmazeUI-2.4.2/assets/css/app.css">
    <title>STA Home</title>
  </head>
  <body>

  <header class="am-topbar am-topbar-inverse am-animation-slide-top">
    <h1 class="am-topbar-brand">
      <a href="#">CSU软院科协</a>
    </h1>

    <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only" data-am-collapse="{target: '#doc-topbar-collapse'}"><span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span></button>

    <div class="am-collapse am-topbar-collapse am-animation-slide-top" id="doc-topbar-collapse">
      <ul class="am-nav am-nav-pills am-topbar-nav">
        <li class="am-active"><a href="#">首页</a></li>
        <li><a href="#">来组团</a></li>
        <li><a href="#">下资源</a></li>
        <li><a href="#">听讲座</a></li>
        <li class="am-dropdown"  data-am-dropdown>
          <a class="am-dropdown-toggle" data-am-dropdown-toggle href="javascript:;">
            找我们 <span class="am-icon-caret-down"></span>
          </a>
          <ul class="am-dropdown-content">
            <li class="am-active"><a href="#">1. 主席团</a></li>
            <li><a href="#">2. 综合事务部</a></li>
            <li><a href="#">3. 技术交流与推广部</a></li>
            <li><a href="#">4. 赛事部</a></li>
            <li><a href="#">5. 项目部</a></li>
            <li><a href="#">6. 公共关系部</a></li>
            <li><a href="#">7. 创新创业项目管理中心</a></li>
            <li><a href="#">8. 研发中心</a></li>
          </ul>
        </li>
      </ul>

      <div class="am-topbar-right">
        <div class="am-dropdown" data-am-dropdown="{boundary: '.am-topbar'}">
          <button class="am-btn am-btn-secondary am-topbar-btn am-btn-sm am-dropdown-toggle" data-am-dropdown-toggle>其他 <span class="am-icon-caret-down"></span></button>
          <ul class="am-dropdown-content">
            <li><a href="#">注册</a></li>
            <li><a href="#">随便看看</a></li>
          </ul>
        </div>
      </div>

      <div class="am-topbar-right">
        <button class="am-btn am-btn-primary am-topbar-btn am-btn-sm" id="login">登录</button>
      </div>
    </div>

  </header>

  <div style="margin-left: 100px;margin-right: 100px;font-family:微软雅黑;">
      <img src="img/1.jpg" width="600px" height="500px" data-am-scrollspy="{animation:'slide-left'}" style="float: left;position:absolute;z-index: -1">

      <span style="font-size: xx-large;float: right;margin-top: 150px" data-am-scrollspy="{animation:'slide-left',delay: 200}">
        <h1 style="margin-bottom: 0px;margin-top: 0px">中南软院科学技术协会</h1>
          <p style="margin-top: 10px;font-size: medium;color: gray;float: right">科协 为了正在进步的   <span style="color: #009cda;font-size: large">你</span></p>
        <div style="margin-top: 200px">
          <button type="button" class="am-btn am-btn-primary am-round" style="float: right;" data-am-scrollspy="{animation:'scale-up',delay: 400}">更多关于我们   <span class="am-icon-university"></span></button>
          <br/>
        </div>

      </span>

  </div>

    <div>

      <div style="margin-top: 700px;font-family:微软雅黑;color: white;background: #1e75ba;height: 800px" data-am-scrollspy="{animation:'fade'}">
        <br/>
        <h1 style="font-size: 80px;margin-top: 20px" data-am-scrollspy="{animation:'scale-down'}">在这里你能了解到各项软件赛事</h1>
        <div style="width: 600px;height: 100px;background: #ff4cb8;margin-top: 80px;cursor: pointer" data-am-scrollspy="{animation:'slide-left'}">
          <p style="font-size: 60px;color: white;text-align: center">软件创新大赛</p>
        </div>

        <div style="width: 600px;height: 100px;background: #87ff00;float: right;cursor: pointer" data-am-scrollspy="{animation:'slide-right',delay: 200}">
          <p style="font-size: 60px;color: white;text-align: center">ACM程序设计大赛</p>
        </div>

        <div style="width: 600px;height: 100px;background: #ff8400;margin-top: 80px;cursor: pointer" data-am-scrollspy="{animation:'slide-left',delay: 400}">
          <p style="font-size: 60px;color: white;text-align: center">服务外包大赛</p>
        </div>

        <div style="width: 600px;height: 100px;background: #00ffd0;float: right;cursor: pointer" data-am-scrollspy="{animation:'slide-right',delay: 600}">
          <p style="font-size: 60px;color: white;text-align: center">花旗杯金融创新大赛</p>
        </div>

        <div style="width: 600px;height: 100px;background: #535353;margin-top: 80px;cursor: pointer" data-am-scrollspy="{animation:'slide-left',delay: 800}">
          <p style="font-size: 60px;color: white;text-align: center">更多....</p>
        </div>

    </div>

      <div style="font-family:微软雅黑;height: 800px">
        <br/>
        <h1 style="font-size: 80px;margin-top: 20px" data-am-scrollspy="{animation:'scale-down'}">在这里你能认识到本院的各种大牛</h1>
        <img src="img/2.jpg" width="600px" height="500px" style="float: right" data-am-scrollspy="{animation:'scale-down'}"/>
      </div>

    <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
    <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
    <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
    <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>

      <div class="am-modal am-modal-prompt" tabindex="-1" id="my-prompt">
        <div class="am-modal-dialog">
          <div class="am-modal-hd"></div>

          <%--<div class="am-modal-bd">--%>
            <%--来来来，输入你的学号--%>
            <%--<input type="text" class="am-modal-prompt-input">--%>
          <%--</div>--%>
          <%--<div class="am-modal-bd">--%>
            <%--不要停，还有你的密码--%>
            <%--<input type="text" class="am-modal-prompt-input">--%>
          <%--</div>--%>

          <div class="am-form-group am-form-warning">
            <label class="am-form-label" for="username">学号</label>
            <input type="text" id="username" class="am-form-field am-modal-prompt-input">
          </div>

          <div class="am-form-group am-form-warning">
            <label class="am-form-label" for="password">密码</label>
            <input type="text" id="password" class="am-form-field am-modal-prompt-input">
          </div>

          <div class="am-modal-footer">
            <span class="am-modal-btn" data-am-modal-cancel>算了</span>
            <span class="am-modal-btn" data-am-modal-confirm>登陆</span>
          </div>
        </div>
      </div>

  </div>

  </body>

<script type="text/javascript">
  $('#login').on('click', function() {
    $('#my-prompt').modal({
      relatedTarget: this,
      onConfirm: function(e) {
        alert('你输入的是：' + (e.data[0] + e.data[1]) || '')
      },
      onCancel: function(e) {

      }
    });
  });

  var setBlurOnLogin = function(){
    $('#username').blur(function(e){
      var username = $('#username').val();
      if(username == ""){
        $('#username').parent().replaceWith('<div class="am-form-group am-form-error"> <label class="am-form-label" for="username">您必须输入学号</label> <input type="text" id="username" class="am-form-field am-modal-prompt-input"> </div>')
      }
      else{
        $('#username').parent().replaceWith('<div class="am-form-group am-form-success am-form-icon am-form-feedback"> <label class="am-form-label" for="username">学号</label> <input type="text" id="username" class="am-form-field am-modal-prompt-input"> <span class="am-icon-check"></span> </div>')
        $('#username').val(username)
      }
    })

    $('#password').blur(function(e){
      var password = $('#password').val();
      if(password == ""){
        $('#password').parent().replaceWith('<div class="am-form-group am-form-error"> <label class="am-form-label" for="password">您必须输入密码</label> <input type="text" id="password" class="am-form-field am-modal-prompt-input"> </div>')
      }
      else{
        $('#password').parent().replaceWith('<div class="am-form-group am-form-success am-form-icon am-form-feedback"> <label class="am-form-label" for="password">密码</label> <input type="text" id="password" class="am-form-field am-modal-prompt-input"> <span class="am-icon-check"></span> </div>')
        $('#password').val(password)
      }
    })
    setBlurOnLogin();
  }

  setBlurOnLogin();

</script>

</html>
