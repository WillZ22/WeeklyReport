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
    <link href="wr/Static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">

		<%-- <!--Font Awesome CSS-->
		<link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet"> --%>

    <!-- Custom styles for this project -->
    <link href="wr/Static/css/style.css" rel="stylesheet">

    <!--datetimepicker CSS-->
    <link href="wr/Static/datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">

    <!--Bootstrap table-->
    <link rel="stylesheet" href="wr/Static/bootstrap-table/bootstrap-table.min.css">

    <!--datetimepicker CSS-->
    <link href="wr/Static/timepicker/bootstrap-timepicker.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <style media="screen">
          td {text-align:center;vertical-align: middle;}
          th {text-align:center;vertical-align: middle;}
          input{
              -webkit-border-radius: 0 !important;
              -moz-border-radius: 0 !important;
              border-radius: 0 !important;
              height:25px !important;
          }

          textarea{
            -webkit-border-radius: 0 !important;
            -moz-border-radius: 0 !important;
            border-radius: 0 !important;
          }
    </style>
  </head>

  <body>

    <div class="container col-md-10 col-md-offset-1" style="margin-top:50px;">
      <div class="panel panel-default">
        <div class="panel-heading">
          <h3 class="panel-title">本周签到信息</h3>
        </div>
        <div class="panel-body">
          <table id="td_signCol"></table>
        </div>
      </div>
    </div>

    <!--动态操作模态框-->
    <div class="modal fade" id="checkmodal" tabindex="-1" role="dialog" aria-labelledby="" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title" id="editModalLabel">编辑</h4>
          </div>
          <div class="modal-body">

            <form class="col-md-12 " id="form_sign">
              <table id="td_signed" class="table table-bordered table-responsive col-md-12 ">
                <tr colspan="7">
                  <th colspan="7" id="tablehead" style="font-size:25px"></th>
                </tr>
                <tr>
                  <th></th>
                  <th>周日</th>
                  <th>周一</th>
                  <th>周二</th>
                  <th>周三</th>
                  <th>周四</th>
                  <th >周五</th>
                </tr>

                <tr>
                  <th>上午</th>
                  <td>
                    <input class="inputtime form-control timepicker timepicker-default am_in" type="text" id="sun_am_in" name="sun_am_in" readonly><br/>
                    <input class="inputtime form-control timepicker timepicker-default am_out" type="text" id="sun_am_out" name="sun_am_out" readonly>
                  </td>
                  <td>
                    <input class="inputtime form-control timepicker timepicker-default am_in" type="text" id="mon_am_in" name="mon_am_in" readonly><br/>
                    <input class="inputtime form-control timepicker timepicker-default am_out" type="text" id="mon_am_out" name="mon_am_out" readonly>
                  </td>
                  <td>
                    <input class="inputtime form-control timepicker timepicker-default am_in" type="text" id="tues_am_in" name="tues_am_in" readonly><br/>
                    <input class="inputtime form-control timepicker timepicker-default am_out" type="text" id="tues_am_out" name="tues_am_out" readonly>
                  </td>
                  <td>
                    <input class="inputtime form-control timepicker timepicker-default am_in" type="text" id="wed_am_in" name="wed_am_in" readonly><br/>
                    <input class="inputtime form-control timepicker timepicker-default am_out" type="text" id="wed_am_out" name="wed_am_out" readonly>
                  </td>
                  <td>
                    <input class="inputtime form-control timepicker timepicker-default am_in" type="text" id="thur_am_in" name="thur_am_in" readonly><br/>
                    <input class="inputtime form-control timepicker timepicker-default am_out" type="text" id="thur_am_out" name="thur_am_out" readonly>
                  </td>
                  <td>
                    <input class="inputtime form-control timepicker timepicker-default am_in" type="text" id="fri_am_in" name="fri_am_in" readonly><br/>
                    <input class="inputtime form-control timepicker timepicker-default am_out" type="text" id="fri_am_out" name="fri_am_out" readonly>
                  </td>
                </tr>

                <tr>
                  <th>下午</th>
                  <td>
                    <input class="inputtime form-control timepicker timepicker-default pm_in" type="text" id="sun_pm_in" name="sun_pm_in"  readonly><br/>
                    <input class="inputtime form-control timepicker timepicker-default pm_out" type="text" id="sun_pm_out" name="sun_pm_out" readonly>
                  </td>
                  <td>
                    <input class="inputtime form-control timepicker timepicker-default pm_in" type="text" id="mon_pm_in" name="mon_pm_in" readonly><br/>
                    <input class="inputtime form-control timepicker timepicker-default pm_out" type="text" id="mon_pm_out" name="mon_pm_out" readonly>
                  </td>
                  <td>
                    <input class="inputtime form-control timepicker timepicker-default pm_in" type="text" id="tues_pm_in" name="tues_pm_in" readonly><br/>
                    <input class="inputtime form-control timepicker timepicker-default pm_out" type="text" id="tues_pm_out" name="tues_pm_out" readonly>
                  </td>
                  <td>
                    <input class="inputtime form-control timepicker timepicker-default pm_in" type="text" id="wed_pm_in" name="wed_pm_in" readonly><br/>
                    <input class="inputtime form-control timepicker timepicker-default pm_out" type="text" id="wed_pm_out" name="wed_pm_out" readonly>
                  </td>
                  <td>
                    <input class="inputtime form-control timepicker timepicker-default pm_in" type="text" id="thur_pm_in" name="thur_pm_in" readonly><br/>
                    <input class="inputtime form-control timepicker timepicker-default pm_out" type="text" id="thur_pm_out" name="thur_pm_out" readonly>
                  </td>
                  <td>
                    <input class="inputtime form-control timepicker timepicker-default pm_in" type="text" id="fri_pm_in" name="fri_pm_in" readonly><br/>
                    <input class="inputtime form-control timepicker timepicker-default pm_out" type="text" id="fri_pm_out" name="fri_pm_out" readonly>
                  </td>
                </tr>

                <tr>
                  <th>晚间</th>
                  <td>
                    <input class="inputtime form-control timepicker timepicker-default eve_in" type="text" id="sun_eve_in" name="sun_eve_in" readonly><br/>
                    <input class="inputtime form-control timepicker timepicker-default eve_out" type="text" id="sun_eve_out" name="sun_eve_out" readonly>
                  </td>
                  <td>
                    <input class="inputtime form-control timepicker timepicker-default eve_in" type="text" id="mon_eve_in" name="mon_eve_in" readonly><br/>
                    <input class="inputtime form-control timepicker timepicker-default eve_out" type="text" id="mon_eve_out" name="mon_eve_out" readonly>
                  </td>
                  <td>
                    <input class="inputtime form-control timepicker timepicker-default eve_in" type="text" id="tues_eve_in" name="tues_eve_in" readonly><br/>
                    <input class="inputtime form-control timepicker timepicker-default eve_out" type="text" id="tues_eve_out" name="tues_eve_out" readonly>
                  </td>
                  <td>
                    <input class="inputtime form-control timepicker timepicker-default eve_in" type="text" id="wed_eve_in" name="wed_eve_in" readonly><br/>
                    <input class="inputtime form-control timepicker timepicker-default eve_out" type="text" id="wed_eve_out" name="wed_eve_out" readonly>
                  </td>
                  <td>
                    <input class="inputtime form-control timepicker timepicker-default eve_in" type="text" id="thur_eve_in" name="thur_eve_in" readonly><br/>
                    <input class="inputtime form-control timepicker timepicker-default eve_out" type="text" id="thur_eve_out" name="thur_eve_out" readonly>
                  </td>
                  <td>
                    <input class="inputtime form-control timepicker timepicker-default eve_in" type="text" id="fri_eve_in" name="fri_eve_in" readonly><br/>
                    <input class="inputtime form-control timepicker timepicker-default eve_out" type="text" id="fri_eve_out" name="fri_eve_out" readonly>
                  </td>
                </tr>

                <tr>
                  <th>请假:</th>
                  <td><input class="form-control pull-right"  type="number" id="late" name="late" max="10" min="0" readonly></td>
                  <th>迟到:</th>
                  <td><input class="form-control pull-right" type="number" id="dayoff" name="dayoff" max="10" min="0" readonly></td>
                  <th colspan="2">请假:</th>
                  <td><input class="form-control pull-right" type="number" id="totaltime" name="totaltime" max="100" min="0" readonly></td>
                </tr>

                <tr>
                  <th>备注:</th>
                  <td colspan="6">
                    <textarea name="note" class="form-control" style="width:100%;height:100%;resize:none;" id="note" readonly></textarea>
                  </td>
                </tr>

              </table>
            </form>
          </div>
          <div class="modal-footer">

          </div>
        </div>
      </div>
    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <%-- <script src="wr/Static/js/jquery-3.3.1.min.js"></script>
    <script src="wr/Static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script> --%>
    <script src="wr/Static/timepicker/bootstrap-timepicker.min.js"></script>
    <script src="wr/Static/bootstrap-table/bootstrap-table.min.js"></script>
    <script src="wr/Static/bootstrap-table/bootstrap-table-zh-CN.min.js"></script>


    <!-- Table Method
    ================================================== -->
    <script type="text/javascript">
      $(function(){
        //加载表格
        initTime();
        var oTable = new TableInit();
        oTable.Init();
        initTimePicker();
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


      function initTimePicker(){
        $('.am_in').timepicker({
          template:false,
          defaultTime:'8:30',
          showMeridian:false
        });
        $('.am_out').timepicker({
          template:false,
          defaultTime:'11:30',
          showMeridian:false,
        });
        $('.pm_in').timepicker({
          template:false,
          defaultTime:'14:30',
          showMeridian:false,
        });
        $('.pm_out').timepicker({
          template:false,
          defaultTime:'17:30',
          showMeridian:false,
        });
        $('.eve_in').timepicker({
          template:false,
          defaultTime:'18:30',
          showMeridian:false,
        });
        $('.eve_out').timepicker({
          template:false,
          defaultTime:'20:30',
          showMeridian:false,
        });
      };

      var head;

      function initTime(){
        $.ajax({
          url:"wr/function/gettime",
          type:"get",
          async: false,
          success:function(data){
            var nw = data[0].nw;
            var term = data[0].term;
            if(nw == 0){
              head = "系统未开启";
            } else {
              head = term + "第" + nw + "周签到表";
            }
          }
        });
      };

      //表格初始化方法
      var TableInit = function () {
          var oTableInit = new Object();
          oTableInit.Init = function () {
              $('#td_signCol').bootstrapTable({
                  url: "wr/function/getweeksigns",                 //请求后台的URL（*）//bootstrap table要求的数据要有rows和total
                  method: "get",                      //请求方式（*）
                  cache: true,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                  pagination: true,                   //是否显示分页（*）
                  sidePagination: "client",           //分页方式：client客户端分页，server服务端分页（*）
                  //responseHandler:responseHandler自定义来生成total和row字段
                  //dataField:"data",设置接口返回值中用于填充表格数据的字段
                  pageNumber: 1,                       //初始化加载第一页，默认第一页
                  pageSize: 10,                       //每页的记录行数（*）
                  pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
                  uniqueId: "ID",                     //每一行的唯一标识，一般为主键列
                  columns: [
                    [{
                      title: head,
                      align: "center",
                      valign: "middle",
                      colspan: 8
                    }],
                    [{
                        field: "name",
                        title: "姓名",
                        align: "center",
                        valign: "middle",
                        colspan: 1,
                        rowspan: 1
                    }, {
                        field: "totalTime",
                        title: "总时间",
                        align: "center",
                        valign: "middle",
                        colspan: 1,
                        rowspan: 1
                    }, {
                      field: "late",
                      title: "迟到",
                      align: "center",
                      valign: "middle",
                      colspan: 1,
                      rowspan: 1
                    },{
                      field: "dayoff",
                      title: "请假",
                      align: "center",
                      valign: "middle",
                      colspan: 1,
                      rowspan: 1
                    },{
                      field: "note",
                      title: "备注",
                      align: "center",
                      valign: "middle",
                      colspan: 1,
                      rowspan: 1
                    },{
                      field:"operation",
                      title:"编辑",
                      align: "center",
                      valign: "middle",
                      colspan: 1,
                      rowspan: 1,
                      formatter: function(value, row, index) {
                        var ret = "<button class='btn btn-primary' id='editTable' style='margin-left:10px'><i class='fa fa-edit'>查看</i></button>";
                        return ret;
                      },
                      //这里是一个监听对象，描述发生一定动作后执行的操作，这里是click动作生成模态框
                      events:{
                        'click #editTable':function(e, value, row, index){
                          $.ajax({
                            url:"wr/function/getmembersign",
                            type: "post",
                            contentType:"application/x-www-form-urlencoded",
                            async: true,
                            data: {
                              name:row.name,
                              term:row.term,
                              nw: row.nw
                            },
                            success:function(data){
                              var nw = row.nw;
                              var term = row.term;
                              $('#tablehead').text(term + "第" + nw + "周签到");
                              $('#sun_am_in').val(data.sun_am_in);
                              $('#sun_am_out').val(data.sun_am_out);
                              $('#sun_pm_in').val(data.sun_pm_in);
                              $('#sun_pm_out').val(data.sun_pm_out);
                              $('#sun_eve_in').val(data.sun_eve_in);
                              $('#sun_eve_out').val(data.sun_eve_out);

                              $('#mon_am_in').val(data.mon_am_in);
                              $('#mon_am_out').val(data.mon_am_out);
                              $('#mon_pm_in').val(data.mon_pm_in);
                              $('#mon_pm_out').val(data.sun_pm_out);
                              $('#mon_eve_in').val(data.mon_eve_in);
                              $('#mon_eve_out').val(data.mon_eve_out);

                              $('#tues_am_in').val(data.tues_am_in);
                              $('#tues_am_out').val(data.tues_am_out);
                              $('#tues_pm_in').val(data.tues_pm_in);
                              $('#tues_pm_out').val(data.sun_pm_out);
                              $('#tues_eve_in').val(data.tues_eve_in);
                              $('#tues_eve_out').val(data.tues_eve_out);

                              $('#wed_am_in').val(data.wed_am_in);
                              $('#wed_am_out').val(data.wed_am_out);
                              $('#wed_pm_in').val(data.wed_pm_in);
                              $('#wed_pm_out').val(data.sun_pm_out);
                              $('#wed_eve_in').val(data.wed_eve_in);
                              $('#wed_eve_out').val(data.wed_eve_out);

                              $('#thur_am_in').val(data.thur_am_in);
                              $('#thur_am_out').val(data.thur_am_out);
                              $('#thur_pm_in').val(data.thur_pm_in);
                              $('#thur_pm_out').val(data.sun_pm_out);
                              $('#thur_eve_in').val(data.thur_eve_in);
                              $('#thur_eve_out').val(data.thur_eve_out);

                              $('#fri_am_in').val(data.fri_am_in);
                              $('#fri_am_out').val(data.fri_am_out);
                              $('#fri_pm_in').val(data.fri_pm_in);
                              $('#fri_pm_out').val(data.sun_pm_out);
                              $('#fri_eve_in').val(data.fri_eve_in);
                              $('#fri_eve_out').val(data.fri_eve_out);

                              $('#late').val(data.late);
                              $('#dayoff').val(data.dayoff);
                              $('#totaltime').val(data.totalTime);
                              $('#note').val(toTextarea(data.note));
                              $('#checkmodal').modal();
                            }
                          });
                        }
                      }
                    },{
                      field: "review",
                      title: "审阅",
                      align: "center",
                      valign: "middle",
                      colspan: 1,
                      rowspan: 1,
                      formatter: function(value, row, index) {
                        var ret = "<button class='btn btn-success' id='qualified' style='margin-left:10px'><i class='fa fa-edit'>达标</i></button>"+
                        "<button class='btn btn-warning' id='unqualified' style='margin-left:10px'><i class='fa fa-edit'>未达标</i></button>";
                        return ret;
                      },
                      events:{
                        'click #qualified':function(e, value, row, index){
                          $.ajax({
                            url:'wr/function/reviewsign',
                            type: 'post',
                            data: {
                              qualify: 1,
                              nw: row.nw,
                              term: row.term,
                              name: row.name
                            },
                            async: true,
                            success:function(data){
                              $('#td_signCol').bootstrapTable('refresh');
                            }
                          })
                        },
                        'click #unqualified':function(e, value, row, index){
                            $.ajax({
                              url:'wr/function/reviewsign',
                              type: 'post',
                              data: {
                                qualify: 2,
                                nw: row.nw,
                                term: row.term,
                                name: row.name
                              },
                              async: true,
                              success:function(data){
                                $('#td_signCol').bootstrapTable('refresh');
                              }
                            })
                        }
                      }
                    },{
                      field: "qualify",
                      title: "是否达标",
                      align: "center",
                      valign: "middle",
                      colspan: 1,
                      rowspan: 1,
                      formatter: function(value, row, index){
                        if (row.qualify == 0) {
                          return "未审核";
                        }
                        if(row.qualify == 1){
                          return "达标";
                        }
                        if (row.qualify == 2) {
                          return "未达标";
                        }
                      }
                    }
                    ]
                  ]
              });
          };
          return oTableInit;
      };
    </script>
  </body>
</html>
