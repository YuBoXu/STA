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
  <script src="frame/bootstrap-3.3.4-dist/js/jQuery.js" type="text/javascript"></script>
    <link rel="stylesheet" href="frame/AmazeUI-2.4.2/assets/css/amazeui.min.css">
  <style type="text/css">
    *{margin:0;padding:0;}
    #save   {position: absolute;left:42.52%;top: 19%;z-index: 1;width: 90px; height: 25px;}
    #cchange{position: absolute;left:42.52%;top: 19%;z-index: 2;width: 90px; height: 25px;}
    #Photo  {position: absolute;left:10%;   top: 10%; z-index: 2;width: 75px; height: 32px;}
    #Mem1   {position: absolute;left:42.52%;top: 10.93%; z-index: 2;width: 510px;height: 23px;}
    #User   {position: absolute;left:20.29%;top: 10.26%; z-index: 2;width: 235px;height: 26px;}
    #Inf1   {position: absolute;left:20.14%;top: 18.53%;z-index: 2;width: 242px;height: 26px;}
    #Name1  {position: absolute;left:20.14%;top: 29.06%;z-index: 2;width: 241px;height: 24px;}
    #Class1 {position: absolute;left:42.52%;top: 29.06%;z-index: 2;width: 241px;height: 24px;}
    #Email1 {position: absolute;left:65.20%;top: 29.06%;z-index: 2;width: 348px;height: 24px;}
    #Tel1   {position: absolute;left:20.14%;top: 40%;z-index: 2;width: 230px;height: 25px;}
    #QQ1    {position: absolute;left:65.20%;top: 40%;z-index: 2;width: 277px;height: 25px;}
    #We1    {position: absolute;left:42.52%;top: 40%;z-index: 2;width: 274px;height: 25px;}
    #Spe1   {position: absolute;left:20.14%;top:80%;z-index: 2;width: 347px;height:192px;}
    #Hobby1 {position: absolute;left:42.52%;top: 80%;z-index: 2;width: 505px;height: 26px;}
    #Per1   {position: absolute;left:65.20%;top: 56%;z-index: 2;width: 456px;height: 25px;}
    #team  {position: absolute;left:53.5%;top: 19%;z-index: 2;width: 120px; height: 25px;}

    @font-face {font-family: title;src: url("font/title.TTF");}
    p{font-family: title;}
  </style>

</head>
<body style="font-family: title">
<!--背景-->
<img src="img/morePersonInfo/background.png" style="z-index:-1;position:absolute">

<div id="team">
    <input id="team1" class="am-btn am-btn-secondary" type="button" value="组&nbsp;队&nbsp;信&nbsp;息" style="width:100%;">
</div>

<div id="cchange">
  <input id="cchange1" type="button" value="修&nbsp;&nbsp;&nbsp;改" class="am-btn am-btn-secondary" style="width:100%;height:100%;border:0px">
</div>

<div id="save">
  <input id="save1"    type="button" value="保&nbsp;&nbsp;&nbsp;存"  class="am-btn am-btn-secondary" style="width:100%;height:100%;border:0px;display: none">
</div>

<!--这里是头像-->
<div id="photo"><s:property value="#session.protrait"><img src="img/morePersonInfo/avatar.png">
</div>

<div id="User">
       <span style="font-size:25px;color:#FFFFFF">User:
       <span id="User2" style="font-size:20px;color:#FFFFFF"><s:property value="#session.account"></span></span>
</div>

<div id="Mem1"><!--这里把是否是科协成员和Job连在一起写了，先是科协成员，然后是职务-->
       <span style="font-size:25px;color:#FFFFFF">(
       <span id="Mem2" style="font-size:20px;color:#FFFFFF"> <s:property value="#session.isMember">科协成员</span>->
       <span id="Job2" style="font-size:20px;color:#FFFFFF"> <s:property value="#session.job">研发中心干事</span> )</span>
</div>

<div id="Inf1"><span style="font-size:25px;color:#FFFFFF">的&nbsp;详&nbsp;细&nbsp;资&nbsp;料</span></div>

<div id="Name1">
       <span style="font-size:25px;color:#FFFFFF">Name:
       <span id="Name2" style="font-size:20px;color:#FFFFFF"> <s:property value="#session.username"></span></span>
</div>

<div id="Class1">
       <span style="font-size:25px;color:#FFFFFF">Class:
       <span id="Class2" style="font-size:20px;color:#FFFFFF"> <s:property value="#session.class"></span></span>  </div>

<div id="Email1">
       <span style="font-size:25px;color:#FFFFFF">E-mail:
       <span id="Email2" style="font-size:20px;color:#FFFFFF"> <s:property value="#session.mail"></span></span>
</div>

<div id="Tel1">
       <span style="font-size:25px;color:#FFFFFF">Tel:
       <span id="Tel2" style="font-size:20px;color:#FFFFFF"> <s:property value="#session.tel"></span></span>     </div>

<div id="QQ1">
       <span style="font-size:25px;color:#FFFFFF">QQ:
       <span id="QQ2" style="font-size:20px;color:#FFFFFF"> <s:property value="#session.qq"></span></span>
</div>

<div id="We1">
         <span style="font-size:25px;color:#FFFFFF">Wechat:
         <span id="We2" style="font-size:20px;color:#FFFFFF"> <s:property value="#session.wechat"></span></span>  </div>
<!--到银河的下半部分了-->
<div id="Per1">
       <span style="font-size:25px;color:#FFFFFF">个人简介:<br>
       <span id="Per2" style="font-size:20px;color:#FFFFFF"> <s:property value="#session.introduce"></span></span>
</div>

<div id="Hobby1">
       <span style="font-size:25px;color:#FFFFFF">兴趣爱好:<br>
       <span id="Hobby2" style="font-size:20px;color:#FFFFFF"> <s:property value="#session.hobby"></span></span>  </div>

<div id="Spe1">
       <span style="font-size:25px;color:#FFFFFF">特长:<br>
       <span id="Spe2" style="font-size:20px;color:#FFFFFF"> <s:property value="#session.speciality"></span></span><!--这里写的是speciality，但是数据库表里面写的是sprciality，怀疑是数据库表里面打错了，特此注明-->
</div>
</body>

<script type="text/javascript">
  $("#cchange1").click(function(event){
    document.getElementById("cchange").style.zIndex="1";
    document.getElementById("save").style.zIndex="2";
    $("#cchange1").hide();$("#save1").show();
    Change(Name2);Change(Class2);Change(Email2);Change(Tel2);
    Change(QQ2);Change(We2);Change(Per2);Change(Hobby2);Change(Spe2);Change(User2);Change(Mem2);Change(Job2);
  });

  $("#save1").click(function(event){
    document.getElementById("save").style.zIndex="1";
    document.getElementById("cchange").style.zIndex="2";
    $("#save1").hide();$("#cchange1").show();
    End(Name2);End(Class2);End(Email2);End(Tel2);End(QQ2);End(We2);
    End(Per2);End(Hobby2);End(Spe2);End(User2);End(Mem2);End(Job2);
  });

  function Change(element)
  {
    var oldhtml = element.innerHTML;
    var newobj = document.createElement('textarea');
    newobj.value=oldhtml;
      $(element).replaceWith("<textarea id='"+element.id+"' rows='2' cols='20' style='font-size:9px;color:#000'>"+newobj.value+"</textarea>");
  }<!--点击修改以后触发的事件，工作正常-->

  function End(element)
  {
    var oldhtml=$(element).val();
    $(element).replaceWith("<span id='"+element.id+"' style='font-size:20px;color:#FFFFFF'>"+oldhtml+"</span>");
  }<!--点击保存以后触发的事件，工作正常-->
</script>
</html><!--不明EOF错误来源，(应该)不影响使用(吧)-->