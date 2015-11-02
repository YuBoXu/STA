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
    <script src="plugin/fullPage/jquery.fullpage.min.js"></script>
    <link rel="stylesheet" href="plugin/fullPage/jquery.fullpage.min.css">
    <link rel="stylesheet" href="AmazeUI-2.4.2/assets/css/amazeui.min.css">
    <link rel="stylesheet" href="AmazeUI-2.4.2/assets/css/app.css">
    <title>STA Home</title>
    <style type="text/css" rel="stylesheet">
      .fp-tableCell {
        position: fixed;
      }
    </style>
  </head>
  <body>
  <div id="fullpage">
    <div class="section active" id="section0">
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
    </div>
    <div class="section" id="section1"><h1>第二个页面</h1></div>
    <div class="section" id="section2"><h1>第三个页面</h1></div>
    <div class="section" id="section3"><h1>第四个页面r</h1></div>

  </div>

    <div>
      <div class="am-modal am-modal-prompt" tabindex="-1" id="my-prompt">
        <div class="am-modal-dialog">
          <div class="am-modal-hd"></div>

          <form action="" class="am-form" id="doc-vld-msg">
            <fieldset>
              <legend style="font-family:微软雅黑;color: #00a8e6"><span style="text-align: center;">来来来不要怕就是登个陆</span><button class="am-btn am-btn-warning am-btn-xs" style="position:absolute;margin-bottom: auto;margin-top: auto;margin-left: 15%">注册</button></legend>
              <div class="am-form-group">
                <label for="username">用户名：</label>
                <input type="text" id="username" pattern="^\d{10}$" placeholder="请输入学号(10位)" required/>
              </div>
              <div class="am-form-group">
                <label for="password">密码：</label>
                <input type="password" id="password" minlength="6" placeholder="请输入密码（至少6位)" required/>
              </div>
              </fieldset>
            </form>

          <div class="am-modal-footer">
            <span class="am-modal-btn" data-am-modal-cancel>算了</span>
            <span class="am-modal-btn" data-am-modal-confirm>登陆</span>
          </div>
        </div>
      </div>

  </div>

  </body>

<script type="text/javascript">
  $(function () {
    $('#fullpage').fullpage();
  });


  $('#login').on('click', function() {
      var username = $("#username").val();
      var password = $("#password").val();
      $('#my-prompt').modal({
        relatedTarget: this,
        onConfirm: function(e) {
          if(username.length == 10 && password.length >= 6)
            alert(username + password);
        },
        onCancel: function(e) {
          alert('算了');
        }
      });
    });

    $('#doc-vld-msg').validator({
      onValid: function(validity) {
        $(validity.field).closest('.am-form-group').find('.am-alert').hide();
      },

      onInValid: function(validity) {
        var $field = $(validity.field);
        var $group = $field.closest('.am-form-group');
        var $alert = $group.find('.am-alert');
        // 使用自定义的提示信息 或 插件内置的提示信息
        var msg = $field.data('validationMessage') || this.getValidationMessage(validity);

        if (!$alert.length) {
          $alert = $('<div class="am-alert am-alert-danger"></div>').hide().
                  appendTo($group);
        }

        $alert.html(msg).show();
      }
    });

</script>

</html>
