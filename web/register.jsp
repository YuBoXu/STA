<%--
  Created by IntelliJ IDEA.
  User: ZaraN
  Date: 2016/1/18
  Time: 16:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="frame/AmazeUI-2.4.2/assets/css/amazeui.min.css">
    <script type="text/javascript" src="frame/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
    <script type="text/javascript" src="frame/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
    <style type="text/css" rel="stylesheet">
        @font-face {
            font-family: title;
            src: url("font/title.TTF");
        }

        p {
            font-family: title;
        }

        title {
            font-size: 50px;
            text-align: center;
        }

        label {
            float: left
        }

        [name=validate] {
            float: right;
        }

    </style>
    <title>注册-加入我们</title>
    <script>

        var isUsernameIxist = false;

        /*检测用户名是否存在*/
        function checkUsernameIsExist() {

            if ($("#username").val().trim().length < 1) {
                $("#usernameIsExist").html("(用户名不能为空！)");
                $("#usernameIsExist").focus();
                $("#usernameIsExist").css("color", "red");
                isUsernameIxist = false;
            }

            $.ajax({
                type: "POST",  //提交方式
                url: "usernameIsExist",//路径
                dataType: "json",//返回的json格式的数据
                data: {
                    "username": $("#username").val().trim()
                },//数据，这里使用的是Json格式进行传输
                success: function (result) {//返回数据根据结果进行相应的处理

                    if (result.isExist == 'yes') {
                        $("#usernameIsExist").html("(用户名已存在，换个用户名试试吧！)");
                        $("#usernameIsExist").focus();
                        $("#usernameIsExist").css("color", "red");
                        isUsernameIxist = false;
                    }
                    else if (result.isExist == "no") {
                        $("#usernameIsExist").html("(用户名可以使用，一定要记清楚喔，忘了就没了！)");
                        $("#usernameIsExist").css("color", "green");
                        isUsernameIxist = true;
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(errorThrown);
                }
            });
        }
        /*检测密码是否合法，最少为6位*/
        function checkPasswordIsLeagal() {

            if ($("#password1").val().trim().length >= 6) {
                $("#passwordIsLegal").html("(密码可以使用！)");
                $("#passwordIsLegal").css("color", "green");
                return true;
            }
            else {
                $("#passwordIsLegal").html("(亲，密码最少6位！)");
                $("#passwordIsLegal").focus();
                $("#passwordIsLegal").css("color", "red");
                return false;
            }

        }
        /*检测确认密码是否正确*/
        function checkPassword2IsCorrect() {
            var password1 = $("#password1").val().trim();
            var password2 = $("#password2").val().trim();
            if (password1 != password2) {
                $("#password2IsLegal").html("(两次密码不一致，请检查！)");
                $("#password2IsLegal").focus();
                $("#password2IsLegal").css("color", "red");
                return false;
            }
            else {
                $("#password2IsLegal").html("(两次密码一致！)");
                $("#password2IsLegal").css("color", "green");
                return true;
            }
        }
        /*校验姓名是否正确,有中文姓名以及行文姓名*/
        function checkNameIsCorrect() {
            var name = $("#name").val().trim();
            var chineseValidator = /^[\u4e00-\u9fa5 ]{2,20}$/;
            var englishValidator = /^[a-z\/ ]{2,20}$/i;

            if (chineseValidator.test(name) || englishValidator.test(name)) {
                $("#nameValidator").html("(姓名输入正确！)");
                $("#nameValidator").css("color", "green");
                return true;
            }
            else {
                $("#nameValidator").html("(姓名输入不正确！)");
                $("#nameValidator").focus();
                $("#nameValidator").css("color", "red");
                return false;
            }
        }
        /*校验班级是否正确*/
        function checkClassesIsCorrect() {
            var classes = $("#classes").val().trim();
            if (classes.length > 0) {
                $("#classesValidator").html("(班级输入正确！)");
                $("#classesValidator").css("color", "green");
                return true;
            }
            else {
                $("#classesValidator").html("(班级输入不正确！)");
                $("#classesValidator").focus();
                $("#classesValidator").css("color", "red");
                return false;
            }
        }

        /*校验电话号码是否正确*/
        function checkTelIsLegal() {
            var tel = $("#tel").val().trim();
            var telValidator = /^1\d{10}$/;

            if (telValidator.test(tel)) {
                $("#telValidator").html("(电话号码输入正确！)");
                $("#telValidator").css("color", "green");
                return true;
            }
            else {
                $("#telValidator").html("(电话号码输入不正确！)");
                $("#telValidator").focus();
                $("#telValidator").css("color", "red");
                return false;
            }

        }

        /*校验邮件地址是否正确*/
        function checkMailIsLegal() {
            var mail = $("#mail").val().trim();
            var mailValidator = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
            if (mailValidator.test(mail)) {
                $("#mailValidator").html("(邮箱地址输入正确！)");
                $("#mailValidator").css("color", "green");
                return true;
            }
            else {
                $("#mailValidator").html("(邮箱地址输入不正确！)");
                $("#mailValidator").focus();
                $("#mailValidator").css("color", "red");
                return false;
            }
        }
        /*校验qq是否正确*/
        function checkQqIsCorrect() {
            var qq = $("#qq").val().trim();
            var qqValidator = /^[1-9][0-9]{4,11}$/;
            if (qqValidator.test(qq)) {
                $("#qqValidator").html("(qq号码输入正确！)");
                $("#qqValidator").css("color", "green");
                return true;
            }
            else {
                $("#qqValidator").html("(qq号码输入不正确！)");
                $("#qqValidator").focus();
                $("#qqValidator").css("color", "red");
                return false;
            }
        }

        var isPortraitleagel = true;
        /*选择图片*/
        function selectPortrait() {
            var docObj = document.getElementById("protrait");

            var imgObjPreview = document.getElementById("avatar");
            if (docObj.files && docObj.files[0]) {
                if (!isImage(docObj.value)) {
                    alert("请选择正确的图片格式！");
                    isPortraitleagel = false;
                    return;
                }
                isPortraitleagel = true;
                //火狐下，直接设img属性
                //imgObjPreview.src = docObj.files[0].getAsDataURL();
                //火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式
                imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
            } else {
                //IE下，使用滤镜
                isPortraitleagel = true;
                docObj.select();
                var imgSrc = document.selection.createRange().text;
                var localImagId = document.getElementById("localImag");
                //必须设置初始大小
                //localImagId.style.width = "92";
                //localImagId.style.height = "112";
                //图片异常的捕捉，防止用户修改后缀来伪造图片
                try {
                    localImagId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
                    localImagId.filters
                            .item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
                } catch (e) {
                    isPortraitleagel = false;
                    alert("您上传的图片格式不正确，请重新选择!");
                    return false;
                }
                imgObjPreview.style.display = 'none';
                document.selection.empty();
            }
            return true;
        }
        /*校验图片是否正确*/
        function isImage(str) {
            var b = /\w+([.jpg|.png|.gif|.swf|.bmp|.jpeg]){1}$/;
            var t_value = str.toLowerCase();
            var a = b.test(t_value);
            return a;
        }

        /*注册用户信息*/
        function register() {
            /*alert(isUsernameIxist);
             alert(checkPasswordIsLeagal());
             alert(checkPassword2IsCorrect());
             alert(checkNameIsCorrect());
             alert(checkClassesIsCorrect());
             alert(checkMailIsLegal());
             alert(checkQqIsCorrect());
             alert(isPortraitleagel);*/
            if (isUsernameIxist && checkPasswordIsLeagal() && checkPassword2IsCorrect() && checkNameIsCorrect() && checkClassesIsCorrect() && checkMailIsLegal() && checkQqIsCorrect() && isPortraitleagel && checkTelIsLegal()) {
                var form = document.getElementById("registerForm");
                form.action = "register";
                form.submit();
            }
            else {
                alert("信息填写不正确，请检查！");
                document.getElementsByTagName('BODY')[0].scrollTop = 0;
            }
        }
    </script>
</head>
<body>
<%@include file="header.jsp" %>
<img src="img/register/register.png"
     style="margin-top: 50px;margin-left: auto;margin-right: auto;width: 100%;height: auto"/>

<div style="text-align: center">
    <div style="width: 50%;height: auto;margin-right: auto;margin-left: auto">
        <form id="registerForm" class="am-form" enctype="multipart/form-data" method="post">
            <fieldset>
                <legend>个人信息(<span style="color: red">*</span>为必填)</legend>

                <div class="am-form-group">
                    <label for="username">用户名<span style="color: red">*</span>
                        <small id="usernameIsExist"></small>
                    </label><span id="usernameValidate" name="validate" class="am-icon-warning"></span>
                    <input type="text" class="" id="username" name="person.account" placeholder="登陆用哦"
                           onblur="checkUsernameIsExist()">
                </div>

                <div class="am-form-group">
                    <label for="password1">密码<span style="color: red">*</span>
                        <small id="passwordIsLegal"></small>
                    </label><span id="password1Validate"
                                  name="validate"
                                  class="am-icon-warning"></span>
                    <input type="password" class="" name="person.password" id="password1" placeholder="悄悄地输入您的密码"
                           onblur="checkPasswordIsLeagal()">
                </div>

                <div class="am-form-group">
                    <label for="password2">再次确认您的密码<span style="color: red">*</span>
                        <small id="password2IsLegal"></small>
                    </label><span id="password2Validate"
                                  name="validate"
                                  class="am-icon-warning"></span>
                    <input type="password" class="" id="password2" placeholder="确认一下"
                           onblur="checkPassword2IsCorrect()">
                </div>

                <div class="am-form-group">
                    <label for="name">姓名<span style="color: red">*</span>
                        <small id="nameValidator"></small>
                    </label><span id="nameValidate" name="validate"
                                  class="am-icon-warning"></span>
                    <input type="text" class="" name="person.name" id="name" placeholder="真实姓名"
                           onblur="checkNameIsCorrect()">
                </div>
                <div class="am-form-group">
                    <label for="classes">班级<span style="color: red">*</span>
                        <small id="classesValidator"></small>
                    </label><span id="classesValidate" name="validate"
                                  class="am-icon-warning"></span>
                    <input type="text" class="" name="person.classes" id="classes" placeholder="所在班级"
                           onblur="checkClassesIsCorrect()">
                </div>

                <div class="am-form-group">
                    <label for="tel">电话号码<span style="color: red">*</span>
                        <small id="telValidator"></small>
                    </label><span id="telValidate" name="validate"
                                  class="am-icon-warning"></span>
                    <input type="email" class="" name="person.tel" id="tel" placeholder="输入电话号码"
                           onblur="checkTelIsLegal()">
                </div>

                <div class="am-form-group">
                    <label for="mail">邮件<span style="color: red">*</span>
                        <small id="mailValidator"></small>
                    </label><span id="mailValidate" name="validate"
                                  class="am-icon-warning"></span>
                    <input type="email" class="" name="person.mail" id="mail" placeholder="输入电子邮件"
                           onblur="checkMailIsLegal()">
                </div>

                <div class="am-form-group">

                    <label for="qq">QQ<span style="color: red">*</span>
                        <small id="qqValidator"></small>
                    </label><span id="qqValidate" name="validate"
                                  class="am-icon-warning"></span>
                    <input type="text" class="" name="person.qq" id="qq" placeholder="输入您的QQ以便之后校内面面面"
                           onblur="checkQqIsCorrect()">
                </div>

                <div class="am-form-group">
                    <label for="wechat">微信</label>
                    <small id="wechatValidator"></small>
                    <input type="text" class="" name="person.wechat" id="wechat" placeholder="您的微信">
                </div>

                <div class="am-form-group">
                    <label for="hobby">兴趣爱好</label>
                    <input type="text" class="" name="person.hobby" id="hobby" placeholder="寻找同道中人">
                </div>

                <div class="am-form-group">
                    <label for="speciality">特长</label>
                    <input type="text" class="" name="person.speciality" id="speciality" placeholder="伯乐就在这里">
                </div>

                <div class="am-form-group">
                    <label for="introduce">个人简介</label>
                    <textarea class="" rows="5" name="person.introduce" id="introduce"></textarea>
                </div>

                <div class="am-form-group am-form-file">
                    <label for="protrait">上传头像</label><br>

                    <div>
                        <button type="button" class="am-btn am-btn-default am-btn-sm am-btn-block">
                            <i class="am-icon-cloud-upload"></i> 选择要上传的图片
                        </button>
                    </div>
                    <input type="file" id="protrait" name="portrait" onchange="selectPortrait(this)">
                </div>
                <label>你的头像</label><br>

                <p style="text-align: center"><img id="avatar" src="img/avatar/avatar.png"
                                                   style="width: 200px;height: 200px"/></p>

                <p>
                    <%--<button type="submit" class="am-btn am-btn-default">提交</button>--%>
                    <input type="button" class="am-btn am-btn-default" value="提交" onclick="register()">
                </p>
            </fieldset>
        </form>
    </div>
</div>

</body>
<script>
    /*$("#protrait").change(function () {
     var objUrl = getObjectURL(this.files[0]);
     console.log("objUrl = " + objUrl);
     if (objUrl) {
     $("#avatar").attr("src", objUrl);
     }
     });

     function getObjectURL(file) {
     var url = null;
     if (window.createObjectURL != undefined) {
     url = window.createObjectURL(file);
     } else if (window.URL != undefined) {       // mozilla(firefox)
     url = window.URL.createObjectURL(file);
     } else if (window.webkitURL != undefined) { // webkit or chrome
     url = window.webkitURL.createObjectURL(file);
     }
     return url;
     }*/
</script>
</html>
