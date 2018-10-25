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
            <a class="navbar-brand" href="wr/page/secretary">Weekly Report</a>
          </div>
          <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
              <li id="signed"><a href="javascript:void(0)" onclick="sr()">考勤审核</a></li>
              <li id="announcement"><a href="javascript:void(0)" onclick="mr()">会议记录</a></li>
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
                  <li><a href="javascript:void(0)" onclick="pi()">个人信息</a></li>
                  <li class="divider"></li>
                  <li><a href="wr/loginpage/logout">退出</a></li>
                </ul>
              </li>
            </ul>
          </div><!--/.nav-collapse -->
        </div>
      </nav>


      <div id="content" class="container col-md-10 col-md-offset-1" >
        <div class="row" style="margin-top:50px;" class="col-md-10 col-md-offset-1">
          <div class="container col-sm-7 rule">
            <div class="">
              <h1 id="systemtime"></h1>
            </div>
            <div class="introduction">
              <h2>系统简介</h2><br/>
              <p>一、组员：<br/>
                 1.组员提供提交周报和考勤的功能。<br/>
                 2.周报提交时间为周五。<br/>
                 3.不在系统时间内只能对已提交周报进行编辑。<br/>
                 4.审核未通过的周报必须重新提交，重新由组长审核。<br/>
                 <br/><br/>
                 二、组长：<br/>
                 1.组长除提交周报和考勤的功能。<br/>
                 2.组长提供周报审核功能，对于审核未通过的周报，组员重新提交后，组长需要重新审核。<br/><br/>
                 三、科研秘书：<br/>
                 1.科研秘书提供考勤审核功能，审核全体成员每周考勤。<br/>
                 2.科研秘书提供会议记录功能。
               </p>
            </div>
          </div>

          <div class="container col-sm-4 col-sm-offset-1 panels">

            <div class="panel panel-default" class="notify-module">
              <div class="panel-heading">
                <h3 class="panel-title">公告</h3>
              </div>
              <div class="panel-body">
                  <div class="notify" >
                    <ul id="notify">

                    </ul>

                  </div>
                  <div class="" id="pageDivN">
                    <ul class="pagination pagination-sm" id="NP">
                    </ul>
                  </div>
              </div>
              <div class="panel-footer">
              </div>
            </div>


            <div class="panel panel-default" class="record-module">
              <div class="panel-heading">
                <h3 class="panel-title">会议记录</h3>
              </div>
              <div class="panel-body">
                <div class="record" >
                  <ul id="record">

                  </ul>
                </div>
                <div class="">
                  <ul class="pagination pagination-sm" id="MP">
                  </ul>
                </div>
              </div>
              <div class="panel-footer">
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
    <script type="text/javascript">

    var meetingRecordPage;
    var notificationPage;

    $(function(){
      queryN(1);
      queryM(1);
      queryMeetingRecordPage();
      queryNotificationPage();
    });




      function queryMeetingRecordPage(){
        $.ajax({
          url:"wr/function/getmeetingrecordsumpage",
          type:"get",
          async: false,
          success:function(data){
            meetingRecordPage = data.sumPage;
            for (var i = 0; i < meetingRecordPage; i++) {
              n = i+1;
              $('#MP').append('<li><a href="javascript:void(0)" onclick="queryM('+n+')">'+ n +'</a></li>');
            }
          }
        })
      }

      function queryNotificationPage(){
        $.ajax({
          url:"wr/function/getnotificationsumpage",
          type:"get",
          async: false,
          success:function(data){
            notificationPage = data.sumPage;
            for (var i = 0; i < notificationPage; i++) {
              n = i+1;
              $('#NP').append('<li><a href="javascript:void(0)" onclick="queryN('+n+')">'+ n +'</a></li>');
            }
          }
        })
      }

      function queryN(page){
        $.ajax({
          url:"wr/function/getnotificationpagecutlist",
          type:"post",
          async: false,
          contentType:"application/x-www-form-urlencoded",
          data:{
            pagenum:page,
            pagecut:5
          },
          success:function(data){
            $('#notify').html(" ");
            for (var i = 0; i < data.length; i++) {
               var title = data[i].title;
               var nid = data[i].id;
               $('#notify').append('<a href="javascript:void(0)" dataid = "'+ nid +'" onclick = "njump('+nid+')">'+ title +'</a><br/>');
            }
          }
        })
      }

      function queryM(page){
        $.ajax({
          url:"wr/function/getmeetingreportpagecutlist",
          type:"post",
          async: false,
          contentType:"application/x-www-form-urlencoded",
          data:{
            pagenum:page,
            pagecut:5
          },
          success:function(data){
            $('#record').html(" ");
            for (var i = 0; i < data.length; i++) {
               var mrid = data[i].id ;
               var year = data[i].year;
               var month = data[i].month;
               var day = data[i].day;
               var title = year + "年" + month + "月" + day + "会议记录";
               $('#record').append('<a href="javascript:void(0)" dataid = "'+ mrid +'" onclick = "mjump('+mrid+')">'+ title +'</a><br/>');
            }
          }
        })
      }

      function njump(nid){
        $.ajax({
          url:"wr/function/njump",
          type: "post",
          data:{
            nid:nid
          },
          contentType:"application/x-www-form-urlencoded",
          success:function(data){
            $("#content").html(data);
          }
        })
      }

      function mjump(mrid){
        $.ajax({
          url:"wr/function/mjump",
          type: "post",
          data:{
            mrid:mrid
          },
          contentType:"application/x-www-form-urlencoded",
          success:function(data){
            $("#content").html(data);
          }
        })
      }

    function rc(){
        $.ajax({
            url:"wr/page/reportreview",
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

    function sr(){
        $.ajax({
            url:"wr/page/signreview",
            type:"get",
            success:function(data){
              $("#content").html(data);
            }
          })
    }

    function mr(){
        $.ajax({
            url:"wr/page/meetingrecord",
            type:"get",
            success:function(data){
              $("#content").html(data);
            }
          })
    }

    function pi(){
      $.ajax({
          url:"wr/page/personalinfo",
          type:"get",
          success:function(data){
            $("#content").html(data);
          }
        })
    }

    </script>
  </body>
</html>
