<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="#">

    <title>WeeklyReport</title>

    <!-- Bootstrap core CSS -->
    <link href="./WEB-INF/Static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">

		<%-- <!--Font Awesome CSS-->
		<link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet"> --%>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style media="screen">
    html,body{
      height: 100%;
      margin: 0;
      padding: 0;
    }

    .loginPage {
      height: 100%;
      margin: 0;
      padding: 0;
      background-image: url(../img/cat.jpg);
      background-size:contain;
      background-repeat: no-repeat;
    }

    .form-login {
      width: 360px;
      height: 300px;
      padding: 15px;
      position:relative;
      top:15%;
      left: 50%;
      transform: translateX(-50%);
      background: transparent;
    }

    input[type="text"], input[type="password"] {
      padding-left: 30px;
    }

    .fa{
      top: 26px;
      left: 6px;
      position: relative;
      color: #ccc;}

    </style>
  </head>


  <body>
    <div class="loginPage">
      <form method="POST" class="form-login" id="loginform">
        
      </form>
    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="./WEB-INF/Static/js/jquery-3.3.1.min.js"></script>
    <script src="./WEB-INF/Static/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <script type="text/javascript">



    </script>
  </body>
</html>