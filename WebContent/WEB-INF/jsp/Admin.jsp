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
    <div class="navigation_h" id="navagation_h">
      <div class="wrap" id="wrap">
        <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
          <div class="container">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand" href="#">WeeklyReport</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="navbar">
              <ul class="nav navbar-nav">
                <li><a href="#">
                </a></li>
                <li><a href="javascript:void(0)" onclick="um()"><i class="fa fa-book">用户管理</i></a></li>
                <li><a href="javascript:void(0)" onclick="dm()"><i class="fa fa-book">数据管理</i></a></li>
                <li><a href="javascript:void(0)" onclick="si()"><i class="fa fa-book">签到导入</i></a></li>
                <li><a href="javascript:void(0)" onclick="sc()"><i class="fa fa-book">系统控制</i></a></li>
              </ul>


              <ul class="nav navbar-nav navbar-right">
                <li><a href="#"><i class="fa fa-info"></i></a></li>
                <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <span>
                      <img src="../img/profile.png" alt="" class="profile">
                    </span>
                    <span>用户</span>
                    <span class="caret"></span>
                  </a>
                  <ul class="dropdown-menu" role="menu" aria-labelledby="">
                  <li>
                    <a href="javascript:void(0)" onclick="cp()">修改密码</a>
                  </li>
                  <li class="divider"></li>
                  <li>
                    <a href="wr/loginpage/logout">退出</a>
                  </li>
                  </ul>
                </li>
              </ul>

            </div><!-- /.navbar-collapse -->
          </div><!-- /.container-fluid -->
        </nav>
      </div>
    </div>

	<div id="content" class="container col-md-10 col-md-offset-1">
	    <div  class="container clock text-horizonal-center">
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
    function um(){

      $.ajax({
        url:"wr/page/usermanage",
        type:"get",
        success:function(data){
          $("#content").html(data);
        }
      })

    }

    function dm(){

      $.ajax({
        url:"wr/page/datamanage",
        type:"get",
        success:function(data){
          $("#content").html(data);
        }
      })

    }

    function si(){

      $.ajax({
        url:"wr/page/signinput",
        type:"get",
        success:function(data){
          $("#content").html(data);
        }
      })
    }

      function sc(){
        $.ajax({
          url:"wr/page/systemcontrol",
          type:"get",
          async: true,
          success:function(data){
          $("#content").html(data);
          }
        })
      }
    </script>
  </body>
</html>
