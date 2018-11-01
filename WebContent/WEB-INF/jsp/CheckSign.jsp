 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/"; %>
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
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

		<!--Font Awesome CSS-->
		<link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet">

    <!-- Custom styles for this project -->
    <link href="wr/Static/css/style.css" rel="stylesheet">

    <!--Bootstrap table-->
    <link rel="stylesheet" href="wr/Static/bootstrap-table/bootstrap-table.min.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

  </head>

  <body>
      <div class="container col-md-10 col-md-offset-1 col-xs-12" style="margin-top:10px;">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title">本周签到信息</h3>
          </div>
          <div class="panel-body">
            <div class="container col-md-10 col-md-offset-1 col-sm-12 col-xs-12" style="margin-bottom:15px">
              <div class="col-md-3 col-sm-3 col-xs-3">
                <select class="form-control" id="term" onchange=”function select();”>
                  <option>2018上半年</option>
                  <option>2018下半年</option>
                  <option>2019上半年</option>
                  <option>2019下半年</option>
                  <option>2020上半年</option>
                  <option>2020下半年</option>
                </select>
              </div>
            </div>
            <div class="col-md-10 col-md-offset-1">
              <table id="td_signed" ></table>
            </div>
          </div>
        </div>
      </div>



    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <%-- <script src="wr/Static/js/jquery-3.3.1.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> --%>
    <script src="wr/Static/js/custom.js"></script>
    <script src="wr/Static/bootstrap-table/bootstrap-table.min.js"></script>
    <script src="wr/Static/bootstrap-table/bootstrap-table-zh-CN.min.js"></script>

    <script type="text/javascript">
      $(function(){
        //加载表格
        var oTable = new TableInit();
        oTable.Init();
      })

      function textareaTo(str){
        var reg=new RegExp("\n","g");
        var regSpace=new RegExp(" ","g");

        str = str.replace(reg,"<br/>");
        str = str.replace(regSpace,"&nbsp;");
        return str;
      };

      function toTextarea(str){
      var reg=new RegExp("<br/>","g");
      var regSpace=new RegExp("&nbsp;","g");
      str = str.replace(reg,"\n");
      str = str.replace(regSpace," ");
      return str;
    };

      //表格初始化方法
      var TableInit = function () {
          var oTableInit = new Object();
          oTableInit.Init = function () {
            $('#td_signed').bootstrapTable({
                url: "wr/function/getsign",         //请求后台的URL（*）//bootstrap table要求的数据要有rows和total
                method: "post",                     //请求方式（*）
                cache: true,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                pagination: true,                   //是否显示分页（*）
                sidePagination: "client",           //分页方式：client客户端分页，server服务端分页（*）
                contentType: "application/x-www-form-urlencoded",
                pageNumber: 1,                       //初始化加载第一页，默认第一页
                pageSize: 10,                       //每页的记录行数（*）
                pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
                uniqueId: "ID",                     //每一行的唯一标识，一般为主键列
                queryParams : function (params) {
                  var temp = {
                    term: $('#term').val()
                  }
                  return temp;
                },                    //每一行的唯一标识，一般为主键列
                columns: [{
                  field:"nw",
                  title:"周数"
                },{
                  field:"late",
                  title:"迟到",
                },{
                  field:"dayoff",
                  title:"请假"
                },{
                  field:"totalTime",
                  title:"总时间"
                },{
                  field:"submited",
                  title:"是否提交",
                  formatter:function(value, row, index){
                    if (row.submited == 0) {
                      return "未提交";
                    }
                    return "已提交";
                  }
                }],
            });

          };
          return oTableInit;
        };

        $('#term').change(function(){
              $("#td_signed").bootstrapTable('refresh');
        });
    </script>
  </body>
</html>
