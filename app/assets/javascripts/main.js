
$(document).ready(function(){


		$('#chick_index_button').click(function(){
        	$('.chick_login').fadeIn()
        					.removeClass('hide');
        	$('.hide_image').removeClass('hide');  				
	});

	$.ajax({
		url: '/main/api',
		data: { id: 444, name: 'REALLY'},
		type: 'POST'
	}).done(function(data){
		console.log(data)
	});
});
	

