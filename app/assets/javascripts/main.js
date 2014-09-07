var chick_member = $('.chick_member');
var chick_center = $('.chick_center');
var chick_width = chick_center.width();

window.onresize=function(){

    if ($('body').width()<600){
        $('.chick_slogan_wrap').addClass('chick_slogan_wrap_small')
                                .removeClass('chick_slogan_wrap');
        $('iframe').css('width', '350', 'height', '225');
    } 
};

$('body').onresize=function(){

    if ($('body').width()>600){
        $('.chick_slogan_wrap').addClass('chick_slogan_wrap')
                                .removeClass('chick_slogan_wrap_small');
        $('iframe').css('width', '740', 'height', '300');
    } 
};


$(document).ready(function(){

    if ($('body').width()<600){
        $('.chick_slogan_wrap').addClass('chick_slogan_wrap_small')
                                .removeClass('chick_slogan_wrap');
        $('iframe').css('width', '350', 'height', '225');
    };

    if ($('.chick_member').text() !== '') {
        $('.chick_index_button').addClass('hide');
        $('.chick_logout_button').removeClass('hide');
    }
    else { 
        $('.chick_index_button').removeClass('hide');
        $('.chick_logout_button').addClass('hide');

    }
   

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

    $('#chick_friend_cancel_button').click(function(){
        $('.chick_friend').val('');
        
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

    $('.btn-public').click(function(){

        
        var publicCluckInput=$('textarea[name=public_message]').val();

        if (publicCluckInput==null || typeof(publicCluckInput)=="undefined" || publicCluckInput<1)
            {$('.chick_public_error').append("I didn't quite get that. Could you type it again?");
            return false;
        }
    
        if (publicCluckInput.length>142)
            {$('.chick_public_error').text("Woah! Too much information.");
            return false;   
            }
            
            $.ajax({
                url: '/main/publicCluckController',
                data: { publicPost: publicCluckInput},
                type: 'POST'
            }).done(function(data){
                console.log(data);
                $('.public_message').val('');
            });
        
    });

    $('.btn-private').click(function(){

        
        var privateCluckInput=$('textarea[name=private_message]').val();

        if (privateCluckInput==null || typeof(privateCluckInput)=="undefined" || privateCluckInput<1)
            {$('.chick_private_error').append("I didn't quite get that. Could you type it again?");
            return false;
        }
    
        if (privateCluckInput.length>142)
            {$('.chick_private_error').text("Woah! Too much information.");
            return false;   
            }
            
            $.ajax({
                url: '/main/privateCluckController',
                data: { privatePost: privateCluckInput},
                type: 'POST'
            }).done(function(data){
                console.log(data);
                $('.private_message').val('');
            });
        
    });

     $('#chick_friend_button').click(function(event){
        event.preventDefault();
        var addFriendshipbtn = $(this);
        
        var PeepInput=$('input:text[name=chick_friend]').val();

        if (PeepInput==null || typeof(PeepInput)=="undefined" || PeepInput<1)
            {$('.chick_public_error').append("I didn't quite get that. Could you type it again?");
            return false;
        }
    
        if (publicCluckInput.length>142)
            {$('#friend_error').text("Don't be shy, Cluckie. Type your new Peep.");
            return false;   
            }
            
            $.ajax({
                url: '/user_friendships/create',
                data: { Peep: PeepInput},
                type: 'POST'
            }).done(function(data){
                console.log(data);
                $('.chick_friend').val('');
            });
        
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

        if ((loginMem==null || typeof(loginMem)=="undefined" || loginMem<1) ||
            (passwordLoginMem==null || typeof(passwordLoginMem)=="undefined" || passwordLoginMem<1))
            {$('.chicken_output').text("Only Anime Chicken Lovers May Enter");
            return false;   
        }

        $.ajax({
            url: '/main/memberLogin',
            data: { loginMem: loginMem, passwordLoginMem: passwordLoginMem},
            type: 'GET'
        }).done(function(data){
            console.log(data);
           $(location).attr('href',"/main/member");
            return true;
        });
        
    };

    $('.chick_logout_button').click(function(){
        $.ajax({
            url: '/main/logout'
        }).done(function(){
            $('.chicken_logout_message').text("Buh-bye, clucker");
            $('.chicken_logout_message').fadeIn(function(){
                setTimeout(function(){
                $('.chicken_logout_message').fadeOut();
                window.location.replace("/");
                },1000);
            });
        });
            
    });

    window.onerror=function(errmsg, url, line){
        console.log(errmsg, url, line, data);
        $(location).attr('href',"/main/fail");
        return true;
    };

});


   

       
        


