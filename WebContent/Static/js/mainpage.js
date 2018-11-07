$(function(){
  queryM(1);
  getFirstNotification();
});


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

  function getFirstNotification(){
    $.ajax({
      url:"wr/function/getfirstnotification",
      type: "get",
      async: false,
      success:function(data){
        $('#title').html(data.title);
        var con = toTextarea(data.content);
        $('#articleCotent').html(con);
        $('#info').html(data.year + "年" + data.month + "月" + data.day + "日");
      }
    })
  }
  
  function toTextarea(str){
      var reg=new RegExp("<br/>","g");
      var regSpace=new RegExp("&nbsp;","g");
      str = str.replace(reg,"\n");
      str = str.replace(regSpace," ");
      return str;
  };


  function wr(){
    $.ajax({
      url:"wr/page/writereport",
      type:"get",
      async: true,
      success:function(data){
        $.ajaxSetup ({ cache: false });
        $("#content").html(data);
      }
    })
  }

  function ws(){
    $.ajax({
      url:"wr/page/writesign",
      type:"get",
      async: true,
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

  function pi(){
    $.ajax({
        url:"wr/page/personalinfo",
        type:"get",
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

    function sysc(){
      $.ajax({
        url:"wr/page/systemcontrol",
        type:"get",
        async: true,
        success:function(data){
        $("#content").html(data);
        }
      })
    }

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
    function se(){
      $.ajax({
        url:"wr/page/summaryexport",
        type:"get",
        success:function(data){
          $("#content").html(data);
        }
      })
    }

    function rn(){
      $.ajax({
        url:"wr/page/notification",
        type:"get",
        success:function(data){
          $("#content").html(data);
        }
      })
    }

    function rr(){
        $.ajax({
            url:"wr/page/reportreview",
            type:"get",
            success:function(data){
              $("#content").html(data);
            }
          })
    }
