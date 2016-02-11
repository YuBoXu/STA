<%--
  Created by IntelliJ IDEA.
  User: apple
  Date: 16/1/20
  Time: 下午9:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport"
        content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
  <script src="frame/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
  <script src="frame/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
  <script src="frame/bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>
  <link href="css/style.css" rel="stylesheet" type="text/css">
  <link href="frame/bootstrap-3.3.4-dist/css/bootstrap.min.css" rel="stylesheet" media="screen">
  <link rel="stylesheet" href="frame/AmazeUI-2.4.2/assets/css/amazeui.min.css">
  <link rel="stylesheet" href="frame/AmazeUI-2.4.2/assets/css/app.css">
  <link rel="stylesheet" href="css/button.css">
  <title>软院科协-从这里，改变世界</title>
  <style type="text/css" rel="stylesheet">
      /* portfolio section */
      #portfolio {
          background:#000000;
          text-align: center;
          padding-top: 80px;
          padding-bottom: 60px;
          font-family: title;
          color: #FFFFFF;
          font-size: 2.7em;
      }
      #portfolio h2 {
          padding-bottom: 20px;
      }
      #portfolio .col-md-4,
      #portfolio .col-md-3 {
          padding: 0;
          margin: 0;
      }
      #portfolio img {
          width: 100%;
          transition: all 0.4s ease-in;
          opacity: 0.8;
      }
      #portfolio img:hover {
          opacity: 1;
      }
      #portfolio .btn {
          margin-top: 30px;
      }

      .service{
          background:#fff;
          padding:7em 0;
          font-family: title;
      }
      .service-head{
          text-align:center;
      }
      .service-head  h3{
          color:#000;
          font-size:2.7em;
          margin-bottom:14px;
          letter-spacing:1.3px;
          font-weight:600;
      }
      .service-head  h4{
          color:#000;
          font-size:1.2em;
          word-spacing:2px;
          letter-spacing:1.2px;
          font-weight:600;
      }
      .service-grids{
          margin-top:6%;
      }
      .service-grid{
          text-align:center;
          padding:0;
      }
      .service-grid h3{
          color:#000;
          margin-top:1.5em;
          font-weight:600;
          font-size:2.1em;
      }
      .service-grid h4{
          color:#000;
          font-size:1.2em;
          margin-top:1em;
          word-spacing:1.5px;
      }
    /*--teamwork--*/
    .teamwork{
      background:#000;
      padding:5em 0;
        font-family: title;
    }
    .team-head h3{
      color:#fff;
      font-size:2.7em;
      letter-spacing:1.3px;
      font-weight:600;
      text-align:center;
      margin-bottom:10px;
    }
    .team-head h4{
      color: #fff;
      font-size: 1.1em;
      word-spacing: 2px;
      letter-spacing: 1.2px;
      font-weight: 400;
      text-align:center;
    }
    /* --#flexiselDemo3 {
        display: none;
    }-- */
    .nbs-flexisel-container {
      position: relative;
      max-width: 100%;
    }
    .nbs-flexisel-inner {
      overflow: hidden;
      margin:3em 0;
    }
    .nbs-flexisel-item > img {
      cursor: pointer;
      position: relative;
    }
    .nbs-flexisel-container {
      position: relative;
      max-width: 100%;
      margin-top:6%;
    }
    .nbs-flexisel-ul {
      position: relative;
      width: 9999px;
      margin: 0px;
      padding: 0px;
      list-style-type: none;
      text-align: center;
    }
    .nbs-flexisel-inner {
      overflow: hidden;
      margin: 0 auto;
      width:100%;
    }
    .nbs-flexisel-item {
      float: left;
      margin:0px;
      padding:0px;
      cursor: pointer;
      position: relative;
      display: inline-block;
    }
    .course_demo{
      padding: 3% 3% 3% 3%;
    }
    .nbs-flexisel-item img {
      width: 55%;
      cursor: pointer;
      position: relative;
      margin-bottom: 0px;
      display:inline;
      border-radius: 7px;
      -webkit-border-radius: 7px;
      -moz-border-radius: 7px;
      -o-border-radius: 7px;
    }
    /*** Navigation ***/
    .nbs-flexisel-nav-left,
    .nbs-flexisel-nav-right {
      width:44px;
      height:60px;
      position: absolute;
      cursor: pointer;
      z-index: 100;
    }
    .nbs-flexisel-nav-left {
      left: -7em;
      background: url(/img/zong/left.png) 0px 0px no-repeat;
    }
    .nbs-flexisel-nav-right {
      right: -7em;
      background: url(/img/zong/right.png) 0px 0px no-repeat;
    }
    .client h3{
      color: #fff;
      font-weight: 600;
      font-size: 2.1em;
      margin-top: 1em;
    }
    .client h4 {
      color: #fff;
      font-size: 1.3em;
      margin-top: 0.5em;
      word-spacing: 1.5px;
      font-weight:400;
    }
    .detail .carousel-indicators .active {
      background: #0bf397;
    }
    .detail{
      overflow: hidden;
      padding: 50px 0px 0px 0px;
      min-height: 500px;
    }

    .detail .title{
      margin-bottom: 80px;
      text-align: center;
    }

    .detail .features .row{
      margin-bottom: 40px;
    }

    .detail .carousel h1{
      font-size: 3.8em;
    }
    .detail .carousel h1, .detail p{
      text-align: left;
      font-weight: 300;
    }

    .detail p{
      color: #aaa;
    }

    .detail .carousel-control{
      background: none;
    }

    .detail .app-screenshot{
      overflow: hidden;
      overflow: hidden;
      margin-right: auto;
      margin-left: auto;
      padding-top: 95px;
      width: 320px;
      height: 450px;
      background: url('../img/zong/png') no-repeat;
      background-size: 100%;
    }

    .detail .app-screenshot img{
      margin-right: auto;
      margin-left: auto;
      padding-left: 4px;
      width: 280px;
    }

    .detail .carousel-indicators {
      position: relative;
      bottom: 0;
      left: 0;
      margin-top: 0px;
      margin-bottom: 0px;
      margin-left: 0px;
      padding: 5px;
      padding-bottom: 8px;
      width: 100%;
      border-top: 1px solid #eee;
      background: #ffffff;
    }

    .detail .carousel-indicators .active {
      width: 45px;
      height: 5px;
      border: none;
      border-radius: 0px;
    }

    .detail .carousel-indicators li {
      display: inline-block;
      margin: 1px;
      width: 45px;
      height: 5px;
      border: none;
      border-radius: 0px;
      background: #eeeeee;
      text-indent: -999px;
      cursor: pointer;
    }
    @font-face {
      font-family: title;
      src: url("font/title.TTF");
    }

    .title{
      font-family: title;
      color: white;
    }

    .midContent{
      position: absolute;
      top: 35vh;
      text-align: center;
      width: 100%
    }

    .bgImg{
      height: 100%;
      width: 100%;
      z-index: -1;
    }

    .halfWindow{
      height: 100%;
      width: 50%;
      float: left;
    }

    .funcDes{
      text-align: center;
      font-family: title;
      font-size: 50px;
      margin: 0;
    }

    .activityImg{
      width: 200px;
      height: 200px;
      cursor: pointer;
      transition:width 1s, height 1s;
      -moz-transition:width 1s, height 1s, -moz-transform 1s;
      -webkit-transition:width 1s, height 1s,  -webkit-transform 1s;
      -o-transition:width 1s, height 1s, -o-transform 1s;;
    }

    .activityImg:hover{
      width:250px;
      height:250px;
      transform:rotateX(360deg);
      -moz-transform:rotateX(360deg); /* Firefox 4 */
      -webkit-transform:rotateX(360deg); /* Safari and Chrome */
      -o-transform:rotateX(360deg); /* Opera */
    }

  </style>
</head>

<body>

<%@include file="header.jsp"%>


<div style="height: auto;width: 100%">
  <img src="img/zong/zong.jpg" class="bgImg" id="bg"/>
  <div class="midContent">
    <h1 class="title" style="font-size: 50px;margin-top: 0px;margin-bottom: 0px;color: #030303">综合<br>事务部</h1>
    <p><b class="title" style="font-size: 20px;color: #088ef0">一句话</b></p>
  </div>
    <div id="teamwork" class="teamwork">
        <div class="container">
            <div class="team-head">
                <h3>部门成员</h3>
                <h4>综合事务部</h4>
            </div>
            <div class="clients">
                <div class="course_demo1">
                    <ul id="flexiselDemo1">
                        <li>
                            <div class="client">
                                <img src="img/zong/per1.png" alt="" />
                                <h3>部长</h3>
                                <h4>张奥运</h4>
                            </div>
                        </li>
                        <li>
                            <div class="client">
                                <img src="img/zong/per2.png" alt="" />
                                <h3>部员</h3>
                                <h4>钟志杰</h4>
                            </div>
                        </li>
                        <li>
                            <div class="client">
                                <img src="img/zong/per4.png" alt="" />
                                <h3>部员</h3>
                                <h4>刘童</h4>
                            </div>
                        </li>
                        <li>
                            <div class="client">
                                <img src="img/zong/per3.png" alt="" />
                                <h3>部员</h3>
                                <h4>陈东kun</h4>
                            </div>
                        </li>
                        <li>
                            <div class="client">
                                <img src="img/zong/per2.png" alt="" />
                                <h3>xx</h3>
                                <h4>xxxx</h4>
                            </div>
                        </li>
                        <li>
                            <div class="client">
                                <img src="img/zong/per3.png" alt="" />
                                <h3>xxxx</h3>
                                <h4>xxxxx</h4>
                            </div>
                        </li>
                        <li>
                            <div class="client">
                                <img src="img/zong/per4.png" alt="" />
                                <h3>xxxxxx</h3>
                                <h4>xxxxx</h4>
                            </div>
                        </li>
                    </ul>
                </div>
                <link rel="stylesheet" href="/img/zong/css/flexslider.css" type="text/css" media="screen" />
                <script type="text/javascript">
                    $(window).load(function() {
                        $("#flexiselDemo1").flexisel({
                            visibleItems: 4,
                            animationSpeed: 1000,
                            autoPlay: true,
                            autoPlaySpeed: 3000,
                            pauseOnHover: true,
                            enableResponsiveBreakpoints: true,
                            responsiveBreakpoints: {
                                portrait: {
                                    changePoint:480,
                                    visibleItems: 1
                                },
                                landscape: {
                                    changePoint:640,
                                    visibleItems: 2
                                },
                                tablet: {
                                    changePoint:768,
                                    visibleItems: 3
                                }
                            }
                        });

                    });
                </script>
                <script type="text/javascript" src="/img/zong/js/jquery.flexisel.js"></script>
            </div>
        </div>
    </div>

<script type="text/javascript">
    $("#joinUs").on("mouseenter",function(){
        $("#joinUs").css("color","#00a8e6")
    })
    $("#joinUs").on("mouseleave",function(){
        $("#joinUs").css("color","white")
    })
</script>


    <div id="service" class="service">
        <div class="container">
            <div class="service-head">
                <h3>部门职责</h3>
                <h4>WHAT WE DO?</h4>
            </div>
            <div class="service-grids">
                <div class="col-md-4 service-grid">
                    <img src="/img/zong/pic1.png" alt=""/>
                    <h3>统计</h3>
                    <h4>财务</h4>
                </div>
                <div class="col-md-4 service-grid">
                    <img src="/img/zong/pic2.png" alt=""/>
                    <h3>xxxx</h3>
                    <h4>xxxxx</h4>
                </div>
                <div class="col-md-4 service-grid">
                    <img src="/img/zong/pic3.png" alt=""/>
                    <h3>调研</h3>
                    <h4>xxxxxx</h4>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>

    <div style="width: 100%;height: 80vh;background: #000;color: #fff;">
        <br>
        <br>
        <br>
        <br>
        <br>
        <h1 class="funcDes" style="margin-top: 60px">定期举行</h1>
        <h1 class="funcDes" style="font-size: 60px">部门活动</h1>

    </div>


<!-- DETAILS
    ================================================== -->
<section class="detail">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div id="carousel-example-generic-2" class="carousel slide">
<h1>通知公告</h1>
          <!-- Wrapper for slides -->
          <div class="carousel-inner">
            <div class="item active">
              <div class="row">
                <div class="col-sm-12 col-md-offset-1 col-md-6">
                  <h2>公告一</h2>
                  <p class="lead"><font color="#333">xxxxx</font></p>
                </div>
                <div class="col-sm-12 col-md-5">
                  <div class="app-screenshot">
                    <img src="/img/zong/1.png" class="img-responsive" alt=" 1">
                  </div>
                </div>
              </div>
            </div>
            <div class="item">
              <div class="row">
                <div class="col-sm-12 col-md-offset-1 col-md-6">
                  <h2>公告2</h2>
                  <p class="lead"><font color="#333">xxxx</font></p>
                </div>
                <div class="col-sm-12 col-md-5">
                  <div class="app-screenshot">
                    <img src="/img/zong/2.png" class="img-responsive" alt=" 2">
                  </div>
                </div>
              </div>
            </div>
            <div class="item">
              <div class="row">
                <div class="col-sm-12 col-md-offset-1 col-md-6">
                  <h2>公告3</h2>
                  <p class="lead"><font color="#333">xxxxx</font></p>
                </div>
                <div class="col-sm-12 col-md-5">
                  <div class="app-screenshot">
                    <img src="/img/zong/3.png" class="img-responsive" alt="3">
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Indicators -->
          <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic-2" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic-2" data-slide-to="1"></li>
            <li data-target="#carousel-example-generic-2" data-slide-to="2"></li>
          </ol>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- portfolio section -->
<div id="portfolio">
    <div class="container">
        <div class="row">
            <div class="col-md-offset-2 col-md-8 col-sm-12">
                <h2> 成果展示</h2>
                <p>xxxxxxxx</p>
            </div>
        </div>

        <div class="row mt30">

            <div class="col-md-4 col-sm-4 col-xs-6">
                <img src="/img/zong/portfolio-img1.jpg" alt="portfolio img"></a>
            </div>
            <div class="col-md-4 col-sm-4 col-xs-6">
                <img src="/img/zong/portfolio-img2.jpg" alt="portfolio img"></a>
            </div>
            <div class="col-md-4 col-sm-4 col-xs-6">
                <img src="/img/zong/portfolio-img3.jpg" alt="portfolio img"></a>
            </div>

            <div class="col-md-3 col-sm-6 col-xs-6">
                <img src="/img/zong/portfolio-img4.jpg" alt="portfolio img"></a>
            </div>
            <div class="col-md-3 col-sm-6 col-xs-6">
                <img src="/img/zong/portfolio-img5.jpg" alt="portfolio img"></a>
            </div>
            <div class="col-md-3 col-sm-6 col-xs-6">
                <img src="/img/zong/portfolio-img6.jpg" alt="portfolio img"></a>
            </div>
            <div class="col-md-3 col-sm-6 col-xs-12">
                <img src="/img/zong/portfolio-img7.jpg" alt="portfolio img"></a>
            </div>
            <div class="col-md-12 col-sm-12">
                <a rel="nofollow" href="index.jsp" class="btn btn-info">View More</a>
            </div>
        </div>
    </div>
</div>
    </div>

<div style="width: 100%;height: 100vh">
    <h1 class="funcDes" style="margin-top: 35vh">展望未来</h1>
    <h1 class="funcDes" style="font-size: 60px">提升自己，改变世界</h1>
</div>

</body>

</html>
