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
    <nav class="navbar navbar-default navbar-static-top">
        <div class="container">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Weekly Report</a>
          </div>
          <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
              <li><a href="javascript:void(0)" onclick="rc()">本周周报</a></li>
              <li><a href="javascript:void(0)" onclick="sc()">本周考勤</a></li>
              <li><a href="javascript:void(0)" onclick="rs()">周报查找</a></li>
              <li><a href="javascript:void(0)" onclick="se()">汇总导出</a></li>
              <li><a href="javascript:void(0)" onclick="pa()">发布公告</a></li>
              <li><a href="javascript:void(0)" onclick="um()">用户管理</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
              <li>
                <a href="#"><i class="fa fa-info"></i></a>
              </li>
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                  <span class="profile"></span>
                  用户
                  <span class="caret"></span></a>
                <ul class="dropdown-menu">
                  <li><a href="javascript:void(0)" onclick="cp()">修改密码</a></li>
                  <li class="divider"></li>
                  <li><a href="wr/loginpage/logout">退出</a></li>
                </ul>
              </li>
            </ul>
          </div><!--/.nav-collapse -->
        </div>
      </nav>


  <div id="content" class="container col-md-10 col-md-offset-1">
	    <div id="content" class="container clock text-horizonal-center">
			<h1 id="showweek"></h1>
			<h2 id="showtime"></h2>
    	</div>
	</div>



    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="wr/Static/js/jquery-3.3.1.min.js"></script>
    <script src="wr/Static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script src="wr/Static/js/time.js"></script>
    <script type="text/javascript">

    function rc(){
        $.ajax({
            url:"wr/page/reportcollect",
            type:"get",
            success:function(data){
              $("#content").html(data);
            }
          })
    }

    function sc(){
        $.ajax({
            url:"wr/page/signcollect",
            type:"get",
            success:function(data){
              $("#content").html(data);
            }
          })
    }

    function cp(){
      $.ajax({
        url:"wr/page/changepw",
        type:"get",
        async: true,
        success:function(data){
        $("#content").html(data);
        }
      })
    }

    function rs(){
      $.ajax({
        url:"wr/page/reportsearch",
        type:"get",
        async: true,
        success:function(data){
        $("#content").html(data);
        }
      })
    }

    function um(){
      $.ajax({
        url:"wr/page/usermanage",
        type:"get",
        success:function(data){
          $("#content").html(data);
        }
      })
    }

    function se(){
      $.ajax({
        url:"wr/page/summaryexport",
        type:"get",
        success:function(data){
          $("#content").html(data);
        }
      })
    }

    </script>
  </body>
</html>
