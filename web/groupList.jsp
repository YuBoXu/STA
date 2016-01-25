<%@ page import="java.util.List" %>
<%@ page import="domain.Person" %>
<%@ page import="domain.Team" %>
<%@ page import="java.util.Map" %>
<%--
  Created by IntelliJ IDEA.
  User: ZaraN
  Date: 2016/1/23
  Time: 13:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Person> ministers = (List<Person>) session.getAttribute("ministers");
    List<Team> teams = (List<Team>) session.getAttribute("teams");
    Integer pageNumber = (Integer) session.getAttribute("pageNumber");
    Integer targetPage = Integer.parseInt((String) session.getAttribute("targetPage"));
    String retriveStatus = (String) session.getAttribute("retriveStatus");

    int start = ((Map<String, Integer>) session.getAttribute("startAndEnd")).get("start");
    int end = ((Map<String, Integer>) session.getAttribute("startAndEnd")).get("end");

%>
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

        #page {
            border-top: medium none;
            border-left: medium none;
            border-right: medium none;
            width: 10vh;
            text-align: center;
            line-height: 5vh;
        }

    </style>
</head>
<body>
<%@include file="header.jsp" %>
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
            <th style="width: 40%">组队标题<a class="button button-tiny button-pill button-primary"
                                          style="margin-left: 10%">我要发布</a></th>
            <th>已加入/总人数</th>
            <th>发起人</th>
            <th>时间截止</th>
            <th>查看详细</th>
        </tr>
        </thead>
        <tbody>
        <%
            if (!teams.isEmpty()) {
                for (int i = 0; i < teams.size(); i++) {
        %>
        <tr style="vertical-align: middle">
            <td><%=teams.get(i).getName()%>
            </td>
            <td><%=teams.get(i).getCurrentSize()%>/<%=teams.get(i).getTeamSize()%>
            </td>
            <td><%=ministers.get(i).getName()%>
            </td>
            <td><%=teams.get(i).getExpiryDate()%>
            </td>
            <td><a class="button button-caution button-tiny" data-am-modal="{target: '#information'}"
                   onclick="javascript:showDetail('<%=teams.get(i).getName()%>','<%=ministers.get(i).getName()%>','<%=teams.get(i).getTeamSize()%>','<%=teams.get(i).getCurrentSize()%>','<%=teams.get(i).getPublishTime()%>','<%=teams.get(i).getIntroduce()%>','<%=teams.get(i).getExpiryDate()%>')">Show</a>
            </td>
        </tr>
        <%
                }
            }
        %>
        </tbody>
    </table>
    <ul class="am-pagination am-pagination-centered">
        <li class="am-disabled"><a href="#">&laquo;</a></li>

        <%
            for (int i = start; i <= end; i++) {
        %>
        <li
                <%
                    if (i == targetPage) {
                %>
                class="am-active"
                <%
                    }
                %>
                ><a href="retriveTeamByPage?targetPage=<%=i%>"><%=i%>
        </a></li>
        <%
            }
        %>

        <li>共<s:property value="#session.pageNumber"/>页，跳转到<input id="page" type="text"
                                                                  value="<s:property value="#session.targetPage"/>">页
            <button id="changePage" class="button button-tiny button-pill button-primary button-caution"
                    style="margin-left: 1vh">确定
            </button>
        </li>
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
            <p>团队名称:&nbsp;<span id="title"></span></p>

            <p>发起人:&nbsp;<span id="leader"></span></p>

            <p>现有人数:&nbsp;<span id="nowNum"></span></p>

            <p>还需人数:&nbsp;<span id="needNum"></span></p>

            <p>发布日期:&nbsp;<span id="publishTime"></span></p>

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
    function showDetail(name, minister, teamSize, currentSize, publishTime, introduce, dateLine) {
        $("#title").text(name);
        $("#leader").text(minister);
        $("#needNum").text(teamSize - currentSize);
        $("#nowNum").text(currentSize);
        $("#publishTime").text(publishTime);
        $("#deadline").text(dateLine);
        $("#introduce").text(introduce);
    }

    $("#changePage").click(function () {
        var targetPage = $("#page").val().trim();
        var pageNumber = <%=pageNumber%>;
        if (targetPage <= pageNumber)
            window.location.href = "retriveTeamByPage?targetPage=" + targetPage;
        else
            alert("输入不合法！");
    })
</script>
</html>
