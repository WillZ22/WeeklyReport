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

    <!--datetimepicker CSS-->
    <link href="wr/Static/timepicker/bootstrap-timepicker.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
        <style media="screen">
              table{
                table-layout: fixed;
                word-break: break-all;
                word-wrap: break-word;
              }
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

                <div class="container col-md-12 col-xs-12" style="margin-top:10px;">
                  <div class="panel panel-default">
                    <div class="panel-heading">
                      <h3 class="panel-title">本周签到信息</h3>
                    </div>
                    <div class="panel-body">
                      <div class="container col-md-12" style="margin-bottom:15px">
                        <p1 id="pterm"></p1>
                        <p2 id="pnw"></p2>
                      </div>
                      <div class="col-md-12 ">
                        <form class="col-md-12" id="form_sign">
                          <table id="td_signed" class="table table-bordered table-responsive col-md-12">
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
                                <input class="inputtime form-control timepicker timepicker-default am_in" type="text" id="sun_am_in" name="sun_am_in"><br/>
                                <input class="inputtime form-control timepicker timepicker-default am_out" type="text" id="sun_am_out" name="sun_am_out">
                              </td>
                              <td>
                                <input class="inputtime form-control timepicker timepicker-default am_in" type="text" id="mon_am_in" name="mon_am_in"><br/>
                                <input class="inputtime form-control timepicker timepicker-default am_out" type="text" id="mon_am_out" name="mon_am_out">
                              </td>
                              <td>
                                <input class="inputtime form-control timepicker timepicker-default am_in" type="text" id="tues_am_in" name="tues_am_in"><br/>
                                <input class="inputtime form-control timepicker timepicker-default am_out" type="text" id="tues_am_out" name="tues_am_out">
                              </td>
                              <td>
                                <input class="inputtime form-control timepicker timepicker-default am_in" type="text" id="wed_am_in" name="wed_am_in"><br/>
                                <input class="inputtime form-control timepicker timepicker-default am_out" type="text" id="wed_am_out" name="wed_am_out">
                              </td>
                              <td>
                                <input class="inputtime form-control timepicker timepicker-default am_in" type="text" id="thur_am_in" name="thur_am_in"><br/>
                                <input class="inputtime form-control timepicker timepicker-default am_out" type="text" id="thur_am_out" name="thur_am_out">
                              </td>
                              <td>
                                <input class="inputtime form-control timepicker timepicker-default am_in" type="text" id="fri_am_in" name="fri_am_in"><br/>
                                <input class="inputtime form-control timepicker timepicker-default am_out" type="text" id="fri_am_out" name="fri_am_out">
                              </td>
                            </tr>

                            <tr>
                              <th>下午</th>
                              <td>
                                <input class="inputtime form-control timepicker timepicker-default pm_in" type="text" id="sun_pm_in" name="sun_pm_in" ><br/>
                                <input class="inputtime form-control timepicker timepicker-default pm_out" type="text" id="sun_pm_out" name="sun_pm_out">
                              </td>
                              <td>
                                <input class="inputtime form-control timepicker timepicker-default pm_in" type="text" id="mon_pm_in" name="mon_pm_in"><br/>
                                <input class="inputtime form-control timepicker timepicker-default pm_out" type="text" id="mon_pm_out" name="mon_pm_out">
                              </td>
                              <td>
                                <input class="inputtime form-control timepicker timepicker-default pm_in" type="text" id="tues_pm_in" name="tues_pm_in"><br/>
                                <input class="inputtime form-control timepicker timepicker-default pm_out" type="text" id="tues_pm_out" name="tues_pm_out">
                              </td>
                              <td>
                                <input class="inputtime form-control timepicker timepicker-default pm_in" type="text" id="wed_pm_in" name="wed_pm_in"><br/>
                                <input class="inputtime form-control timepicker timepicker-default pm_out" type="text" id="wed_pm_out" name="wed_pm_out">
                              </td>
                              <td>
                                <input class="inputtime form-control timepicker timepicker-default pm_in" type="text" id="thur_pm_in" name="thur_pm_in"><br/>
                                <input class="inputtime form-control timepicker timepicker-default pm_out" type="text" id="thur_pm_out" name="thur_pm_out">
                              </td>
                              <td>
                                <input class="inputtime form-control timepicker timepicker-default pm_in" type="text" id="fri_pm_in" name="fri_pm_in"><br/>
                                <input class="inputtime form-control timepicker timepicker-default pm_out" type="text" id="fri_pm_out" name="fri_pm_out">
                              </td>
                            </tr>

                            <tr>
                              <th>晚间</th>
                              <td>
                                <input class="inputtime form-control timepicker timepicker-default eve_in" type="text" id="sun_eve_in" name="sun_eve_in"><br/>
                                <input class="inputtime form-control timepicker timepicker-default eve_out" type="text" id="sun_eve_out" name="sun_eve_out">
                              </td>
                              <td>
                                <input class="inputtime form-control timepicker timepicker-default eve_in" type="text" id="mon_eve_in" name="mon_eve_in"><br/>
                                <input class="inputtime form-control timepicker timepicker-default eve_out" type="text" id="mon_eve_out" name="mon_eve_out">
                              </td>
                              <td>
                                <input class="inputtime form-control timepicker timepicker-default eve_in" type="text" id="tues_eve_in" name="tues_eve_in"><br/>
                                <input class="inputtime form-control timepicker timepicker-default eve_out" type="text" id="tues_eve_out" name="tues_eve_out">
                              </td>
                              <td>
                                <input class="inputtime form-control timepicker timepicker-default eve_in" type="text" id="wed_eve_in" name="wed_eve_in"><br/>
                                <input class="inputtime form-control timepicker timepicker-default eve_out" type="text" id="wed_eve_out" name="wed_eve_out">
                              </td>
                              <td>
                                <input class="inputtime form-control timepicker timepicker-default eve_in" type="text" id="thur_eve_in" name="thur_eve_in"><br/>
                                <input class="inputtime form-control timepicker timepicker-default eve_out" type="text" id="thur_eve_out" name="thur_eve_out">
                              </td>
                              <td>
                                <input class="inputtime form-control timepicker timepicker-default eve_in" type="text" id="fri_eve_in" name="fri_eve_in"><br/>
                                <input class="inputtime form-control timepicker timepicker-default eve_out" type="text" id="fri_eve_out" name="fri_eve_out">
                              </td>
                            </tr>

                            <tr>
                              <th>请假:</th>
                              <td><input class="form-control pull-right"  type="number" id="late" name="late" max="10" min="0"></td>
                              <th>迟到:</th>
                              <td><input class="form-control pull-right" type="number" id="dayoff" name="dayoff" max="10" min="0"></td>
                              <th colspan="2">总时间:</th>
                              <td><input class="form-control pull-right" type="number" id="totaltime" name="totaltime" max="100" min="0"></td>
                            </tr>

                            <tr>
                              <th>备注:</th>
                              <td colspan="6">
                                <textarea name="note" class="form-control" style="width:100%;height:100%;resize:none;" id="note"></textarea>
                              </td>
                            </tr>

                          </table>
                        </form>
                        <div class="col-md-12 col-sm-12 ">
                          <p id="status" class="col-md-3 col-sm-3 col-xs-3"></p>
                          <button type="button" class="btn btn-success col-md-2 col-sm-2 pull-right" id="save">保存</button>
                        </div>
                      </div>

                    </div>
                  </div>
                </div>
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <%-- <script src="wr/Static/js/jquery-3.3.1.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> --%>
    <script src="wr/Static/timepicker/bootstrap-timepicker.min.js"></script>

    <script type="text/javascript">

    var nowweek;

      $(function(){
        initTime();
        initTimePicker()
        initTable();
        getStatus();
      });

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

      function getStatus(){
        $.ajax({
          url: "wr/function/signstatus",
          type: "get",
          contentType: "application/json",
          async: false,
          success: function(data){
            if (data == "unsubmit") {
            $('#status').text("未提交");
          } else if (data == "submited") {
            $('#status').text("已提交");
            }
          }
        });
      }

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


                function initTime(){
                  $.ajax({
                    url:"wr/function/gettime",
                    type:"get",
                    async: false,
                    success:function(data){
                      var nw = data[0].nw;
                      var term = data[0].term;
                      nowweek = data[0].week;
                      if(data[0].nw == 0){
                      $('#tablehead').text("系统未开启");
                    } else{
                      $('#tablehead').text(term + "第" + nw + "周签到");
                    }
                    }
                  });
                };



                function initTable(){
                  $.ajax({
                    url:"wr/function/getsign",
                    type:"get",
                    contentType:"application/json",
                    async: false,
                    success:function(data){

                      if(data.return != "false"){

                        $('#sun_am_in').val(data.sun_am_in);
                        $('#sun_am_out').val(data.sun_am_out);
                        $('#sun_pm_in').val(data.sun_pm_in);
                        $('#sun_pm_out').val(data.sun_pm_out);
                        $('#sun_eve_in').val(data.sun_eve_in);
                        $('#sun_eve_out').val(data.sun_eve_out);

                        $('#mon_am_in').val(data.mon_am_in);
                        $('#mon_am_out').val(data.mon_am_out);
                        $('#mon_pm_in').val(data.mon_pm_in);
                        $('#mon_pm_out').val(data.mon_pm_out);
                        $('#mon_eve_in').val(data.mon_eve_in);
                        $('#mon_eve_out').val(data.mon_eve_out);

                        $('#tues_am_in').val(data.tues_am_in);
                        $('#tues_am_out').val(data.tues_am_out);
                        $('#tues_pm_in').val(data.tues_pm_in);
                        $('#tues_pm_out').val(data.tues_pm_out);
                        $('#tues_eve_in').val(data.tues_eve_in);
                        $('#tues_eve_out').val(data.tues_eve_out);

                        $('#wed_am_in').val(data.wed_am_in);
                        $('#wed_am_out').val(data.wed_am_out);
                        $('#wed_pm_in').val(data.wed_pm_in);
                        $('#wed_pm_out').val(data.wed_pm_out);
                        $('#wed_eve_in').val(data.wed_eve_in);
                        $('#wed_eve_out').val(data.wed_eve_out);

                        $('#thur_am_in').val(data.thur_am_in);
                        $('#thur_am_out').val(data.thur_am_out);
                        $('#thur_pm_in').val(data.thur_pm_in);
                        $('#thur_pm_out').val(data.thur_pm_out);
                        $('#thur_eve_in').val(data.thur_eve_in);
                        $('#thur_eve_out').val(data.thur_eve_out);

                        $('#fri_am_in').val(data.fri_am_in);
                        $('#fri_am_out').val(data.fri_am_out);
                        $('#fri_pm_in').val(data.fri_pm_in);
                        $('#fri_pm_out').val(data.fri_pm_out);
                        $('#fri_eve_in').val(data.fri_eve_in);
                        $('#fri_eve_out').val(data.fri_eve_out);

                        $('#late').val(data.late);
                        $('#dayoff').val(data.dayoff);
                        $('#totaltime').val(data.totalTime);

                        var str = data.note;
                        str = toTextarea(str);
                        $('#note').val(str);
                      }
                    }
                  });
                };

                $('#save').click(function(){
                    if ($('#late').val() == '' || $('#dayoff').val() == '' || $('#totaltime').val() == '') {
                      alert("请填写迟到，早退，总时间");
                      return;
                    }
                    var formData = new FormData();
                    formData.append('sun_am_in',$('#sun_am_in').val());
                    formData.append('sun_am_out',$('#sun_am_out').val());
                    formData.append('sun_pm_in',$('#sun_pm_in').val());
                    formData.append('sun_pm_out', $('#sun_pm_out').val());
                    formData.append('sun_eve_in',$('#sun_eve_in').val());
                    formData.append('sun_eve_out',$('#sun_eve_out').val());

                    formData.append('mon_am_in',$('#mon_am_in').val());
                    formData.append('mon_am_out',$('#mon_am_out').val());
                    formData.append('mon_pm_in',$('#mon_pm_in').val());
                    formData.append('mon_pm_out', $('#mon_pm_out').val());
                    formData.append('mon_eve_in',$('#mon_eve_in').val());
                    formData.append('mon_eve_out',$('#mon_eve_out').val());

                    formData.append('tues_am_in',$('#tues_am_in').val());
                    formData.append('tues_am_out',$('#tues_am_out').val());
                    formData.append('tues_pm_in',$('#tues_pm_in').val());
                    formData.append('tues_pm_out', $('#tues_pm_out').val());
                    formData.append('tues_eve_in',$('#tues_eve_in').val());
                    formData.append('tues_eve_out',$('#tues_eve_out').val());

                    formData.append('wed_am_in',$('#wed_am_in').val());
                    formData.append('wed_am_out',$('#wed_am_out').val());
                    formData.append('wed_pm_in',$('#wed_pm_in').val());
                    formData.append('wed_pm_out', $('#wed_pm_out').val());
                    formData.append('wed_eve_in',$('#wed_eve_in').val());
                    formData.append('wed_eve_out',$('#wed_eve_out').val());

                    formData.append('thur_am_in',$('#thur_am_in').val());
                    formData.append('thur_am_out',$('#thur_am_out').val());
                    formData.append('thur_pm_in',$('#thur_pm_in').val());
                    formData.append('thur_pm_out', $('#thur_pm_out').val());
                    formData.append('thur_eve_in',$('#thur_eve_in').val());
                    formData.append('thur_eve_out',$('#thur_eve_out').val());

                    formData.append('fri_am_in',$('#fri_am_in').val());
                    formData.append('fri_am_out',$('#fri_am_out').val());
                    formData.append('fri_pm_in',$('#fri_pm_in').val());
                    formData.append('fri_pm_out', $('#fri_pm_out').val());
                    formData.append('fri_eve_in',$('#fri_eve_in').val());
                    formData.append('fri_eve_out',$('#fri_eve_out').val());

                    formData.append('late', $('#late').val());
                    formData.append('dayoff',$('#dayoff').val());
                    formData.append('totaltime',$('#totaltime').val());

                    var str = $('#note').val();
                    str = textareaTo(str);
                    formData.append('note',str);

                    $.ajax({
                      url: "wr/function/submitsign",
                      type: "post",
                      contentType: "application/json",
                      async: false,
                      data: formData,
                      processData: false,
                      contentType: false,
                      success: function(){
                        alert("提交成功");
                        getStatus();
                        initTable();
                      }
                  })
                });

        </script>
  </body>
</html>
