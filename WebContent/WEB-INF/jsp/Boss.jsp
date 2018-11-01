<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/";
%>

<!DOCTYPE html>
<html lang="zh-CN">
  <head>
  	<base href=" <%=basePath%>">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="#">

    <title>WeeklyReport</title>

    <!-- Bootstrap core CSS -->
    <link href="wr/Static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">

		<%-- <!--Font Awesome CSS-->
		<link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet"> --%>

    <!-- Custom styles for this project -->
    <link href="wr/Static/css/style.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>


  <body>
      <div class="main-header" id="header">

      </div>


      <nav class="mainnav navbar navbar-static-top main-navigation">
        <div class="container">
          <div class="row">
            <div class="col-sm-12">

              <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar">
                  <span class="sr-only">导航</span>
                  <span class="fa fa-bars"></span>
                </button>
              </div>

              <div id="navbar" class="navbar-collapse collapse" style="text-align: center;">
                <ul class="nav navbar-nav" style="display: inline-block;float: none;">
                  <li><a href="wr/page/mainpage">首页</a></li>
                  <li><a href="javascript:void(0)" onclick="rc()">本周周报</a></li>
                  <li><a href="javascript:void(0)" onclick="sc()">本周考勤</a></li>
                  <li><a href="javascript:void(0)" onclick="rs()">周报查找</a></li>
                  <li><a href="javascript:void(0)" onclick="se()">汇总导出</a></li>
                  <li><a href="javascript:void(0)" onclick="rn()">发布公告</a></li>
                  <li><a href="javascript:void(0)" onclick="um()">用户管理</a></li>
                  <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                      <span class="profile"></span>
                      用户
                      <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                      <li><a href="JavaScript:void(0)" onclick="pi()">个人信息</a></li>
                      <li><a href="JavaScript:void(0)" onclick="cp()">修改密码</a></li>
                      <li class="divider"></li>
                      <li><a href="wr/loginpage/logout">退出</a></li>
                    </ul>
                  </li>
                </ul>
              </div><!--/.nav-collapse -->

              </div>
            </div>
          </div>
        </nav>



        <div class="container col-sm-10 col-sm-offset-1 content" id="content">
          <div class="row">
            <div class="container col-sm-8 wrap">
              <div class="panel panel-default notification" style="background:white">
                <div class="panel-heading">
                  <h3 class="panel-title">公告</h3>
                </div>
                <div class="panel-body">
                  <article class="">
                    <h3 id="title"></h1>
                    <div class="" style="text-align: center">
                      <h id="info"></h>
                    </div>
                    <p id="articleCotent"></p>
                  </article>
                </div>
              </div>
            </div>




            <div class="container col-sm-4 panels wrap">

              <div class="panel panel-default record-panel">
                <div class="panel-heading">
                  <h3 class="panel-title">会议记录</h3>
                </div>
                <div class="panel-body">
                  <div id="body" style="height:130px">
                    <ul id="record">
                    </ul>
                  </div>
                  <div id="footer">
                    <nav style="text-align: center">
                      <ul class="pagination pagination-sm" style="text-align:center">
                          <li><a href="javascript:void(0)" onclick="queryM(1)">1</a></li>
                          <li><a href="javascript:void(0)" onclick="queryM(2)">2</a></li>
                          <li><a href="javascript:void(0)" onclick="queryM(3)">3</a></li>
                          <li><a href="javascript:void(0)" onclick="queryM(4)">4</a></li>
                          <li><a href="javascript:void(0)" onclick="queryM(5)">5</a></li>
                      </ul>
                    </nav>
                  </div>
                </div>
              </div>

              <div class="panel panel-default">
                <div class="panel-heading">
                  <h3 class="panel-title">须知</h3>
                </div>
                <div class="panel-body">
                  <p>一、组员：<br/>
                     1.组员提供提交周报和考勤的功能。<br/>
                     2.周报提交时间为周五。<br/>
                     3.不在系统时间内只能对已提交周报进行编辑。<br/>
                     4.审核未通过的周报必须重新提交，重新由组长审核。<br/><br/>
                     二、组长：<br/>
                     1.组长除提交周报和考勤的功能。<br/>
                     2.组长提供周报审核功能，对于审核未通过的周报，组员重新提交后，组长需要重新审核。<br/><br/>
                     三、科研秘书：<br/>
                     1.科研秘书提供考勤审核功能，审核全体成员每周考勤。<br/>
                     2.科研秘书提供会议记录功能。</p>
                </div>
              </div>

            </div>

          </div>
        </div>



    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="wr/Static/js/jquery-3.3.1.min.js"></script>
    <script src="wr/Static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script src="wr/Static/js/mainpage.js"></script>
  </body>
</html>
