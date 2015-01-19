$( document ).ready(function() {

  var faye = new Faye.Client('http://localhost:3000/faye');

  var category = $("#category").val();
  var username = $("#username").val();
  var score = $("#score_count").val();
  var course = $("#course").val();
  var key = $("#key").val();

  var categoryE = $("#category").val();

  var editor = ace.edit("editor");
  editor.setTheme("ace/theme/github");
  editor.getSession().setMode("ace/mode/"+categoryE);
    
  editor.setFontSize(18);

    

  editor.gotoLine(0,0,false);
    
  editor.selection.selectLine();

  var line_number = 1;
  var last_line = editor.session.getLength();
  var typed_characters = 0;
  var score = 0;
  var mistakes = 0;
  

  var subs = faye.subscribe("/multiplayer/"+$("#key").val() , function(data){
      
      
      var score = data.score;
      var user = data.user;
      var tp = data.actionT;
      var time = Math.abs( $(".example").TimeCircles().getTime().toFixed() );
      if( $("#firstPlace").attr("ready" ) != 1 || $("#secondPlace").attr("ready") != 1 )
          $(".example").TimeCircles().stop();

      if(tp == "ready"){
        
        if($("#firstPlace").text() == ""){
          $("#firstPlace").text(user + " 0 pts");
          $("#firstPlace").attr("user" , user);
          $("#firstPlace").attr("ready" , 1);
          if( username == user ){
            $("#firstPlace").attr("own" , 1);
            $("#firstPlace").css("color" , "blue");
          } 
        }

        else{
          $("#secondPlace").text(user + " 0 pts");
          $("#secondPlace").attr("user" , user);
          $("#secondPlace").attr("ready" , 1);
          if( username == user ){
            $("#secondPlace").attr("own" , 1);
            $("#secondPlace").css("color" , "blue");
          } 
        }

      if(  $("#firstPlace").attr("ready") == 1 &&  $("#secondPlace").attr("ready") == 1 ){
          $(".loader").hide();
          $(".example").TimeCircles().start();
        }
      }
      else if(tp == "act"){

        if( $("#firstPlace").attr("own") == "1" && username == user){
          $("#firstPlace").attr("score",score);
          $("#firstPlace").attr("user",user);
          $("#firstPlace").text(user + " "+score+" pts");
        }
        else if($("#secondPlace").attr("own") == "1" && username == user) {
          $("#secondPlace").attr("score",score);
          $("#secondPlace").attr("user",user);
          $("#secondPlace").text(user + " "+score+" pts");
        }
        else if($("#firstPlace").attr("own") == "1" && username != user ){
          $("#secondPlace").attr("score",score);
          $("#secondPlace").attr("user",user);
          $("#secondPlace").text(user + " "+score+" pts");
        }
        else if($("#secondPlace").attr("own") == "1" && username != user ){
          $("#firstPlace").attr("score",score);
          $("#firstPlace").attr("user",user);
          $("#firstPlace").text(user + " "+score+" pts");
        }

        var sc1 = $("#firstPlace").attr("score");
        sc1 = parseFloat(sc1);
        var sc2 = $("#secondPlace").attr("score");
        sc2 = parseFloat(sc2);

        if(sc1 > sc2){
          $("#secondPlace").before($("#firstPlace"));
        }
        else{
          $("#firstPlace").before($("#secondPlace"));
        }
        

      }
        
      else{

        if( $("#firstPlace").attr("own") == "1" && username == user){
          $("#firstPlace").attr("score",score);
          $("#firstPlace").attr("user",user);
          $("#firstPlace").text(user + " "+score+" pts");
          $("#firstPlace").attr("finished",1);
          $("#firstPlace").attr("time",time);
          $("#firstPlace").attr("mistakes",mistakes);
        }
        else if($("#secondPlace").attr("own") == "1" && username == user) {
          $("#secondPlace").attr("score",score);
          $("#secondPlace").attr("user",user);
          $("#secondPlace").text(user + " "+score+" pts");
          $("#secondPlace").attr("finished",1);
          $("#secondPlace").attr("time",time);
          $("#secondPlace").attr("mistakes",mistakes);
        }
        else if($("#firstPlace").attr("own") == "1" && username != user ){
          $("#secondPlace").attr("score",score);
          $("#secondPlace").attr("user",user);
          $("#secondPlace").text(user + " "+score+" pts");
          $("#secondPlace").attr("finished",1);
          $("#secondPlace").attr("time",time);
          $("#secondPlace").attr("mistakes",mistakes);
        }
        else if($("#secondPlace").attr("own") == "1" && username != user ){
          $("#firstPlace").attr("score",score);
          $("#firstPlace").attr("user",user);
          $("#firstPlace").text(user + " "+score+" pts");
          $("#firstPlace").attr("finished",1);
          $("#firstPlace").attr("time",time);
          $("#firstPlace").attr("mistakes",mistakes);
        }

        var sc1 = $("#firstPlace").attr("score");
        sc1 = parseFloat(sc1);
        var sc2 = $("#secondPlace").attr("score");
        sc2 = parseFloat(sc2);

       if(sc1 > sc2){
          $("#secondPlace").before($("#firstPlace"));
        }
        else{
          $("#firstPlace").before($("#secondPlace"));
        }
        
      }

      if( $("#secondPlace").attr("own") == 1 ){
        $("#secondPlace").attr("mistakes",mistakes);
        
      }
      

      if( $("#firstPlace").attr("finished") == "1" && $("#secondPlace").attr("finished") == "1" ){
        
        var score;

        if( $("#secondPlace").attr("own") == "1" ){
          score = $("#secondPlace").attr("score");
          time = $("#secondPlace").attr("time");
          score2 = $("#firstPlace").attr("score");
          time2 = $("#firstPlace").attr("time");
          mistakes2 = $("#firstPlace").attr("mistakes");
          user2 = $("#firstPlace").attr("user");
        }
        else{
          score = $("#firstPlace").attr("score");
          time = $("#firstPlace").attr("time");
          score2 = $("#secondPlace").attr("score");
          time2 = $("#secondPlace").attr("time");
          mistakes2 = $("#secondPlace").attr("mistakes");
          user2 = $("#secondPlace").attr("user");
        } 

        window.location = "/results?category="+category+"&score="+score+"&time="+time+"&mistakes="+mistakes+"&typed="+typed_characters+"&course="+course+"&key="+key+"&score2="+score2+"&time2="+time2+"&mistakes2="+mistakes2+"&user2="+user2;
      }

  });

  $('#actual_code').bind("enterKey",function(e){
      
      var user_input = $("#actual_code").val();
      var line = editor.getCopyText();

      line = line.replace(/(\r\n|\n|\r|\t)/gm,"");

      line = $.trim(line);
      
      if(user_input == line){

        score = score + user_input.length;
        editor.selection.selectLine();
        $("#actual_code").val('');
        line_number = line_number+1;
        document.getElementById('correct_audio').play();
        $("#status").removeClass('has-error');
        $("#status").addClass('has-success');
        typed_characters = typed_characters + user_input.length;
        $("#score_count").html( score );

      }
      else{
        score = score - (line.length*0.25) ;
        mistakes = mistakes + 1 ;
        document.getElementById('wrong_audio').play();
        $("#status").css('has-success');
        $("#status").addClass('has-error');
        $("#score_count").html( score );

      }

      var nLine = editor.getCopyText();
      nLine = nLine.replace(/(\r\n|\n|\r|\t)/gm,"");

      nLine = $.trim(nLine);

      if( nLine == "" ){
        editor.selection.selectLine();
        line_number = line_number+1;
      }

      if( score == 0 ){
        $("#score_count").css("color","black");
      }
      if(score < 0){
        $("#score_count").css("color","red");
      }
      if(score > 0){
        $("#score_count").css("color","green");
      }
      if(line_number == last_line+1){
          var time = Math.abs( $(".example").TimeCircles().getTime() );
          $(".example").TimeCircles().stop();
          var publication = faye.publish('/multiplayer/'+$("#key").val(), {actionT: "finished" , user: $("#username").val() , score:$("#score_count").html()} );
          $("#actual_code").attr("disabled","disabled");
          $("#actual_code").val("Waiting for your opponent to finish!")
          //window.location = "/results?category="+category+"&score="+score+"&time="+time+"&mistakes="+mistakes+"&typed="+typed_characters;
      }
      var publication = faye.publish('/multiplayer/'+$("#key").val(), {actionT: "act" , user: $("#username").val() , score:$("#score_count").html()} );


  });
  $('#actual_code').keyup(function(e){
      if(e.keyCode == 13)
      {
          $(this).trigger("enterKey");
      }
  });

  $('#ready_button').click(function(){
        var publication = faye.publish('/multiplayer/'+$("#key").val(), {actionT: "ready" , user: $("#username").val() , score: "" } );
        $("#ready_button").hide();
        $(".loader").show();
        $("#actual_code").removeAttr("disabled");
        $("#actual_code").focus();
  });

});
