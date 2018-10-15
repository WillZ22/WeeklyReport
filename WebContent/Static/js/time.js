$(document).ready(function() {
function time() {
  var date = new Date();
  var ww = date.getDay();
  var hh = date.getHours();
  var mm = date.getMinutes();
  var ss = date.getSeconds();

  switch (ww)
  {
  case 0:
    ww="Sunday";
    break;
  case 1:
    ww="Monday";
    break;
  case 2:
    ww=" Tuesday";
    break;
  case 3:
    ww="Wednesday";
    break;
  case 4:
    ww="Thursday";
    break;
  case 5:
    ww="Friday";
    break;
  case 6:
    ww="Saturday";
    break;
  }


  if (hh < 10) {
    hh = "0"+hh;
  }

  if (mm < 10) {
    mm = "0"+mm;
  }

  if (ss < 10) {
    ss = "0"+ss;
  }

  $("#showtime").html(hh+":"+mm+":"+ss);
  $("#showweek").html(ww);

}
time();
setInterval(time, 1000);
});
