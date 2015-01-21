$(function(){
	var faye = new Faye.Client('http://ancient-lowlands-4557.herokuapp.com/faye');
	
	var subs = faye.subscribe("/lobby/java" , function(data){
		var message = data["message"].content;
		var newUrl = "/multiplayer?"+"key="+data["message"].key+"&category="+data["message"].category+"&course="+data["message"].course;
		if(message.indexOf("ready") > -1) window.location.href=newUrl;
		
	});
	
});

