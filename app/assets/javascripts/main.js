
$(document).ready(function(){

	$('#chick_index_button').click(function(){
        $('.hide_image').removeClass('hide');
        $('.chick_login').fadeIn()
        				.removeClass('hide');
    });

    $('#chick_cancel_button').click(function(){
    	$('.hide_image').addClass('hide');
    	$('.chick_login').hide();
	 });  				

    $('#chick_continue_button').click(function(){
    	var firstName = $('input:text[name=chick_first_name]').val();
    	var lastName = $('input:text[name=chick_last_name]').val();
    	var loginEmail = $('input:text[name=chick_login_email]').val();
    	$.ajax({
    		url: '/main/api',
    		data: { login: {firstNameLogin: firstName, lastNameLogin: lastName, EMailLogin: loginEmail}},
    		type: 'POST'
    	}).done(function(data){
    			console.log(data)
    	});
	 });



//	$.ajax({
//		url: '/main/api',
//		data: { id: 444, name: 'REALLY'},
//		type: 'POST'
//	}).done(function(data){
//		console.log(data)
//	});
});
	

