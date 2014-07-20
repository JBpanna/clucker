
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

       // if (lastName==null || typeof(lastName)=="undefined");
            //{$('.chicken_output').append("</br>We need your last name for our spam files.")}
       // if  ( !emailReg.test(loginEmail))
           // {return false};
          //  {$('.chicken_output').append("</br>We need a valid e-mail for our spam files.")}
        $('#chick_continue_button').click(function(){ 
            var firstName = $('input:text[name=chick_first_name]').val();
            var lastName = $('input:text[name=chick_last_name]').val();
            var loginEmail = $('input:text[name=chick_login_email]').val();
            var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
            if ((firstName==null || typeof(firstName)=="undefined" || firstName<1) ||
                (lastName==null || typeof(lastName)=="undefined" || lastName<1))
                {$('.chicken_output').text("We need your name for our spam files.");
                return false;   
            };
        

            $.ajax({
    		  url: '/main/api',
    		  data: { login: {firstNameLogin: firstName, lastNameLogin: lastName, EMailLogin: loginEmail}},
    		  type: 'POST'
    	    }).done(function(data){
    			console.log(data)
            });
	    }); 
    
});
	

