$( document ).ready(function(){

var ctx = document.getElementById("myChart").getContext("2d");

var amount = [];
var pastWpms = [];

var sWp =  $("#pastWpms").val().split(" ");

for( i = 0 ; i < $("#coursesCompleted").val() ; i++){
	amount.push(i+1);
	pastWpms.push(sWp[i]);
}

var data1 = {
  labels : amount,
  datasets : [
    {
      fillColor : "rgba(255,255,255,.1)",
      strokeColor : "rgba(255,255,255,1)",
      pointColor : "#123",
      pointStrokeColor : "rgba(255,255,255,1)",
      data : pastWpms
    }
  ]
}

var options1 = {
  scaleFontColor : "rgba(255,255,255,1)",
  scaleLineColor : "rgba(255,255,255,1)",
  scaleGridLineColor : "transparent",
  bezierCurve : false,
  scaleOverride : true,
  scaleSteps : 5,
  scaleStepWidth : 30,
  scaleStartValue : 0
}

var myLineChart = new Chart(ctx).Line(data1,options1);

});

