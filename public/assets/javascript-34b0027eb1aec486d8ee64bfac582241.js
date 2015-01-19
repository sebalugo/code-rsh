$( document ).ready(function() {
    
    $(".example").TimeCircles();
	
	  var editor = ace.edit("editor");
    editor.setTheme("ace/theme/github");
    editor.getSession().setMode("ace/mode/javascript");
    editor.setFontSize(18);

    var line_number = 1;
    var last_line = editor.session.getLength();
    var typed_characters = 0;
    var score = 0;
    var mistakes = 0;

    editor.gotoLine(0,0,false);
    
    editor.selection.selectLine();
   

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
        mistakes = mistakes + 1 ;
        score = score - (line.length*0.25) ;
   			document.getElementById('wrong_audio').play();
   			$("#status").css('has-success');
   			$("#status").addClass('has-error');
        $("#score_count").html( score );

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
   		if(line_number == last_line){
          var time = Math.abs( $(".example").TimeCircles().getTime() );
          window.location = "/results?category=javascript&score="+score+"&time="+time+"&mistakes="+mistakes+"&typed="+typed_characters+"&course="+$("#courseId").val();
      }

	});
	$('#actual_code').keyup(function(e){
	    if(e.keyCode == 13)
	    {
	        $(this).trigger("enterKey");
	    }
	});

});
