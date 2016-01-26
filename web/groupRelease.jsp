<%--
  Created by IntelliJ IDEA.
  User: ZaraN
  Date: 2016/1/25
  Time: 23:40
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
    <link rel="stylesheet" href="css/animate.css">
    <title>发布组队信息-大牛快到碗里来</title>
    <style type="text/css" rel="stylesheet">
        @font-face {
            font-family: title;
            src: url("font/title.TTF");
        }

        .infoArea{
            position: absolute;
            background: rgba(0,0,0,0.4);
            width: 35vw;
            height: 80vh;
            top: 15vh;
            border-radius: 5vw;
            color: white;
            padding-left: 3vw;
            padding-right: 3vw;
            padding-top: 5vh;
            text-align: center;
            font-family: title;
        }

    </style>
</head>

<body>
<%@include file="header.jsp"%>
<img src="img/groupRelease/background.jpg" style="width: 100%;height: 100%"/>
<div class="infoArea" style="left: 10vw" id="infoInput">
    <h1 style="margin-bottom: 15vh;font-size: xx-large">发布一个新的组队信息</h1>
    <div id="titleArea">
        <h2>首先简短地起一个标题吧</h2>
        <div id="titleInput" class="am-input-group am-input-group-primary">
            <span class="am-input-group-label"><i class="am-icon-edit am-icon-fw"></i></span>
            <input id="title" type="text" maxlength="15" class="am-form-field" placeholder="最简洁的标语(16个字之内呢)">
        </div>
        <button id="titleNext" style="margin-top: 5vh" class="button button-3d button-primary button-rounded">下一步</button>
    </div>

    <div id="numberArea" style="display: none">
        <h2>您想招多少位战友？</h2>
        <div id="numberInput" class="am-input-group am-input-group-primary">
            <span class="am-input-group-label"><i class="am-icon-user am-icon-fw"></i></span>
            <input id="number" type="number" class="am-form-field" placeholder="这里是人数呢">
        </div>
        <button id="numberNext" style="margin-top: 5vh" class="button button-3d button-primary button-rounded">下一步</button>
    </div>

    <div id="deadlineArea" style="display: none">
        <h2>什么时候截止招呢？</h2>
        <div id="deadlineInput" class="am-input-group am-input-group-primary">
            <span class="am-input-group-label"><i class="am-icon-calendar am-icon-fw"></i></span>
            <input type="text" readonly class="am-form-field" placeholder="在……这之前？" style="cursor: pointer" id="deadline"/>
        </div>
        <button id="deadlineNext" style="margin-top: 5vh" class="button button-3d button-primary button-rounded">下一步</button>
    </div>

    <div id="introArea" style="display: none">
        <h2>详细介绍下目前的情况</h2>
        <textarea rows="5" id="intro" type="text" maxlength="200" class="am-form-field" placeholder="这里畅所欲言，尽情表达自己（200字内哦）"></textarea>
        <button id="introNext" style="margin-top: 5vh" class="button button-3d button-primary button-rounded">下一步</button>
    </div>

    <div id="finishArea" style="display: none">
        <h2>您已完成信息填写，请核对信息<br>如需修改请直接在右侧修改信息</h2>
        <button id="finish" style="margin-top: 5vh" class="button button-3d button-primary button-rounded">我已核对，确认发布</button>
    </div>

</div>

<div class="infoArea" style="left: 55vw;text-align: left !important;" id="infoOutput">
    <h1 style="font-size: xx-large">您即将发布的组队信息</h1>
    <h2 id="outTitle" style="display: none;color: rgb(0, 186, 255)">标题：<span style="color: white" contenteditable  id="groupTitle"></span></h2>
    <h2 id="outNumber" style="display: none;color: rgb(0, 186, 255)">人数：<span style="color: white" contenteditable  id="groupNumber"></span></h2>
    <h2 id="outDeadline" style="display: none;color: rgb(0, 186, 255)">时间：<span style="cursor: pointer;color: white" id="groupDeadline"></span></h2>
    <h2 id="outIntro" style="display: none;color: rgb(0, 186, 255)">说明：<br><span style="color: white" contenteditable  id="groupIntro"></span></h2>
</div>
</body>
<script>
    $("#titleNext").click(function(event){
        if($("#title").val() == ''){
            $("#titleInput").addClass('animated shake');
            setTimeout(function() {
                $("#titleInput").removeClass('shake');
            },1000);
            return;
        }
        $("#titleArea").addClass('animated fadeOutRight');
        $("#groupTitle").text($("#title").val());
        $("#outTitle").show().addClass('animated fadeInLeft');
        setTimeout(function() {
            $("#titleArea").remove();
            $("#numberArea").show().addClass('animated fadeInLeft')
        },500);
    });

    $("#numberNext").click(function(event){
        if($("#number").val() == '' || Number($("#number").val()) < 1){
            $("#numberInput").addClass('animated shake');
            setTimeout(function() {
                $("#numberInput").removeClass('shake');
            },1000);
            return;
        }
        $("#numberArea").addClass('animated fadeOutRight');
        $("#groupNumber").text($("#number").val());
        $("#outNumber").show().addClass('animated fadeInLeft');
        setTimeout(function() {
            $("#numberArea").remove();
            $("#deadlineArea").show().addClass('animated fadeInLeft');
        },500);
    });

    $("#deadlineNext").click(function(event){
        if($("#deadline").val() == ''){
            $("#deadlineInput").addClass('animated shake');
            setTimeout(function() {
                $("#deadlineInput").removeClass('shake');
            },1000);
            return;
        }
        $("#deadlineArea").addClass('animated fadeOutRight');
        $("#groupDeadline").text($("#deadline").val());
        $("#outDeadline").show().addClass('animated fadeInLeft');
        setTimeout(function() {
            $("#deadlineArea").remove();
            $("#introArea").show().addClass('animated fadeInLeft');
        },500);
    });

    $("#introNext").click(function(event){
        if($("#intro").val() == ''){
            $("#intro").addClass('animated shake');
            setTimeout(function() {
                $("#intro").removeClass('shake');
            },1000);
            return;
        }
        $("#introArea").addClass('animated fadeOutRight');
        $("#groupIntro").text($("#intro").val());
        $("#outIntro").show().addClass('animated fadeInLeft');
        setTimeout(function() {
            $("#introArea").remove();
            $("#finishArea").show().addClass('animated fadeInLeft');
        },500);
    });

    $("#finish").click(function(){
        if($("#groupTitle").text() == '' || $("#groupTitle").text().length > 16){
            alert("组队标题不能为空且不能超过16个字")
        }
        if($("#groupNumber").text() == '' || isNaN($("#groupNumber").text()) || Number($("#groupNumber").text()) < 0){
            alert("人数填写不正确！（必须为数字且>0）")
        }
        if($("#groupIntro").text() == '' || $("#groupIntro").text() > 200) {
            alert("团队说明不能为空且不能超过200个字")
        }
    })

    $(function() {
        var nowTemp = new Date();
        var nowDay = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0).valueOf();
        var nowMoth = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), 1, 0, 0, 0, 0).valueOf();
        var nowYear = new Date(nowTemp.getFullYear(), 0, 1, 0, 0, 0, 0).valueOf();
        var deadline = $('#groupDeadline');
        var checkin = deadline.datepicker({
            onRender: function(date, viewMode) {
                var viewDate = nowDay;
                switch (viewMode) {
                    case 1:
                        viewDate = nowMoth;
                        break;
                    case 2:
                        viewDate = nowYear;
                        break;
                }
                return date.valueOf() < viewDate ? 'am-disabled' : '';
            }
        }).on('changeDate.datepicker.amui', function(ev) {
            var month = Number(ev.date.getMonth()) + 1;
            $('#groupDeadline').text(ev.date.getFullYear() + '-' + month + '-' + ev.date.getDate());
            checkin.close();
        }).data('amui.datepicker');
    });

    $(function() {
        var nowTemp = new Date();
        var nowDay = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0).valueOf();
        var nowMoth = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), 1, 0, 0, 0, 0).valueOf();
        var nowYear = new Date(nowTemp.getFullYear(), 0, 1, 0, 0, 0, 0).valueOf();
        var deadline = $('#deadline');
        var checkin = deadline.datepicker({
            onRender: function(date, viewMode) {
                var viewDate = nowDay;
                switch (viewMode) {
                    case 1:
                        viewDate = nowMoth;
                        break;
                    case 2:
                        viewDate = nowYear;
                        break;
                }
                return date.valueOf() < viewDate ? 'am-disabled' : '';
            }
        }).on('changeDate.datepicker.amui', function(ev) {
            checkin.close();
        }).data('amui.datepicker');
    });
</script>
</html>
