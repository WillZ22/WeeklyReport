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
      <div class="container col-md-10 col-md-offset-1" style="margin-top:50px;">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title">发布公告</h3>
          </div>
          <div class="panel-body">
            <div class="container col-md-10 col-md-offset-1 col-sm-12 col-xs-12" style="margin-bottom:15px">

              <form>
                <div class="form-group">
                  <label for="title">标题</label>
                  <input type="text" class="form-control" id="title" >
                </div>
                <div class="form-group">
                  <label for="content">公告内容：</label>
                  <textarea class="form-control" rows="5" cols="7" style="resize: vertical" name="cont" id="cont"></textarea>
                </div>
                <button class="btn btn-default" id="submit" type="button">提交</button>
              </form>
            </div>
          </div>
        </div>
      </div>



    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="wr/Static/js/jquery-3.3.1.min.js"></script>
    <script src="wr/Static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script type="text/javascript">

    $('#submit').click(function(){             //TODO:添加删除后台数据的方法
      $.ajax({
        url: "wr/function/submitnotification",
        type: "post",
        data:{
          content:$('#cont').val(),
          title: $('#title').val()
        },
        contentType:"application/x-www-form-urlencoded",
        async: false,
        success:function(data){
          if(data == "success"){
            alert("发布成功");
          }
        },
        error:function(){
          alert("网络错误");
        }
      })
    });



    </script>
  </body>
</html>
