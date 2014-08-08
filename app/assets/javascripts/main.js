
$(document).ready(function(){

    var chick_member = $('.chick_member');


    // $(.chick_member).ready(function(){
        // $('.chick_index_button').addClass('hide');
        // $('.chick_logout_button').removeClass('hide');
    // });

    var chick_center = $('.chick_center');
    var chick_width = chick_center.width();

    if (chick_width<600){
        $('.chick_slogan_wrap').addClass('chick_slogan_wrap_small')
                                .removeClass('chick_slogan_wrap');
        $('iframe').css('width', '350', 'height', '225');
    };

	$('.chick_index_button').click(function(){
        $('.hide_image').removeClass('hide');
        $('.chick_login').fadeIn()
        			     .removeClass('hide');
        $('.chick_login_name').focus();
    });
    
    $('.chick_cap_menu').mouseover(function(){
        $(this).prev().fadeIn();
                        
    });

    $('.chick_cap_menu').mouseout(function(){
        $(this).prev().fadeOut();
    });

    $('#chick_cancel_button').click(function(){
    	$('.hide_image').addClass('hide');
    	$('.chick_login').hide();
        $('.chick_login_name').val('');
        $('.chick_lname').val('');
        $('.chick_email').val('');

	});  				

    $('#chick_signup_button').click(function(){ 
        Signup();
	}); 

    $('.chick_contact_form').children().keypress(function(e){ 
        if (e.keyCode==13){
            Signup();
            }
    }); 
    
	
    function Signup(){
        var loginUser = $('input:text[name=chick_login_name2]').val();
        var passwordLogin = $('input:text[name=chick_password2]').val();
        var loginEmail = $('input:text[name=chick_e-mail]').val();
        var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
        var loginName = $('input:text[name=chick_name]').val();
    
        if ((loginUser==null || typeof(loginUser)=="undefined" || loginUser<1) ||
            (loginName==null || typeof(loginName)=="undefined" || loginName<1) ||
            (passwordLogin==null || typeof(passwordLogin)=="undefined" || passwordLogin<1))
            {$('.chicken_output').text("Tell us more about you.");
            return false;   
        }
        if ( !emailReg.test(loginEmail))
            {$('.chicken_output').append("We need your e-mail for our spam files.");
            return false;
        }

        if (loginEmail==null || typeof(loginEmail)=="undefined" || loginEmail<1)
            {$('.chicken_output').append("We need your e-mail for our spam files.");
            return false;
        }

        $.ajax({
            url: '/main/login',
            data: { userLogin: loginUser, passwordLogin: passwordLogin, EMailLogin: loginEmail, nameLogin: loginName},
            type: 'POST'
        }).done(function(data){
            console.log(data);
            $(location).attr('href',"/main/member");   
        });
    };

    $('.btn-danger').click(function(){
        var privateCluck=$('textarea:text[name=private_cluck]').val();
       
        if (privateCluck.length>142){
            // {$('.chicken_output').text("Woah! Too much information.");
            return false;   
            }

            if (privateCluck.length<142){
                $.ajax({
                    url: '/main/privatePost',
                    data: { privatePost: privateCluck},
                    type: 'POST'
                }).done(function(data){
                    console.log(data);
                });
            
            }
        };
        
    });


   $('#chick_continue_button').click(function(){ 
        LoginMem();
    }); 

    $('.chick_login_center').children().keypress(function(e){ 
        if (e.keyCode==13){
            LoginMem();
            }
    }); 

   function LoginMem(){
        var loginMem = $('input:text[name=chick_login_name]').val();
        var passwordLoginMem = $('input:text[name=chick_password]').val();

        $.ajax({
            url: '/main/memberLogin',
            data: { loginMem: loginMem, passwordLoginMem: passwordLoginMem},
            type: 'GET'
        }).done(function(data){
            console.log(data);
        });
        $(location).attr('href',"/main/member");
    };

        $('.chick_logout_button').click(function(){
            $.ajax({
                url: '/main/logout'
                }).done(function(){
                    window.location.replace("/");
                });
            
        });

});
   



