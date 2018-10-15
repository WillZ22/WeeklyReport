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

    <!--datetimepicker CSS-->
    <link href="wr/Static/datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">

    <!--Bootstrap table-->
    <link rel="stylesheet" href="wr/Static/bootstrap-table/bootstrap-table.min.css">

    <!--Bootstrap FileInput-->
    <link rel="stylesheet" href="wr/Static/bootstrap-fileinput/css/fileinput.min.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

  </head>

  <body>

    <div class="container col-md-10 col-md-offset-1"  style="margin-top:50px;">
      <div class="panel panel-default">
        <div class="panel-heading">
          <h3 class="panel-title">本周签到信息</h3>
        </div>
        <div class="panel-body">
          <table id="td_signCol"></table>
          <div class="container col-md-12" style="margin-top:20px">
            <div class="col-md-2">
              <input type="file" name="mhtFile" id="mhtFile" class="file-loading ">
            </div>
            <div class="col-md-2 col-md-offset-8">
              <button type="button" id="btn_submit" class="btn btn-info">保存</button>
            </div>
          </div>
        </div>
      </div>
    </div>


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="wr/Static/js/jquery-3.3.1.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="wr/Static/bootstrap-table/bootstrap-table.min.js"></script>
    <script src="wr/Static/bootstrap-table/bootstrap-table-zh-CN.min.js"></script>
    <script src="wr/Static/bootstrap-fileinput/js/fileinput.min.js"></script>
    <script src="wr/Static/bootstrap-fileinput/js/zh.js"></script>


    <!-- Table Method
    ================================================== -->
    <script type="text/javascript">
      $(function(){
        //加载表格
        var oTable = new TableInit();
        oTable.Init();
        //加载文件上传控件
        var oInput = new FileInput();
        oInput.Init('mhtFile', '#');
      })

      //表格初始化方法
      var TableInit = function () {
          var oTableInit = new Object();
          oTableInit.Init = function () {
              $('#td_signCol').bootstrapTable({
                  url: "./data.json",                  //请求后台的URL（*）//bootstrap table要求的数据要有rows和total
                  method: "get",                      //请求方式（*）
                  cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                  pagination: false,                   //是否显示分页（*）
                  sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
                  //responseHandler:responseHandler自定义来生成total和row字段
                  //dataField:"data",设置接口返回值中用于填充表格数据的字段
                  pageNumber: 1,                       //初始化加载第一页，默认第一页
                  pageSize: 10,                       //每页的记录行数（*）
                  pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
                  uniqueId: "ID",                     //每一行的唯一标识，一般为主键列
                  columns: [{
                    field: "name",
                    title: "姓名"
                  }, {
                    field: "time",
                    title: "时间"
                  }, {
                    field: "late",
                    title: "迟到"
                  },{
                    field: "leave",
                    title: "请假"
                  },{
                    field: "qualified",
                    title: "是否达标",
                  }],
              });
          };
          return oTableInit;
      };

      var FileInput = function(){
        var oFileInput = new Object();
        oFileInput.Init = function(inputId, uploadUrl){
          $('#' + inputId).fileinput({
            language: 'zh', //设置语言
            uploadUrl: uploadUrl, //上传的地址
            allowedFileExtensions: ['mht'],//接收的文件后缀
            showUpload: true, //是否显示上传按钮
            showCaption: false,//是否显示标题
            browseClass: "btn btn-primary", //按钮样式
            dropZoneEnabled: false,//是否显示拖拽区域
            //maxFileSize: 0,//单位为kb，如果为0表示不限制文件大小
            //minFileCount: 0,
            maxFileCount: 1, //表示允许同时上传的最大文件个数
            enctype: 'multipart/form-data',
            validateInitialCount:true,
            previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",
            msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
          });
        };
        return oFileInput;
      };


    </script>

  </body>
</html>
