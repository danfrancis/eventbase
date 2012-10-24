$(function(){
	$('.dropdown-menu').click(function(e) {
	    e.stopPropagation();
	});

	$('#sign_up').live('click', function(){
	  $('#user_first_name').focus();
	});
	$('#sign_in').live('click', function(){
	  $('#email').focus();
	});
});