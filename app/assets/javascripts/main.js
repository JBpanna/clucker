
$(document).ready(function(){

	$('#chick_index_button').click(function(){
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
        var loginName = $('input:text[name=chick_login_name2]').val();
        var passwordLogin = $('input:text[name=chick_password2]').val();
        // var loginEmail = $('input:text[name=chick_login_email]').val();
        // var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
    
        if ((loginName==null || typeof(loginName)=="undefined" || loginName<1) ||
            (passwordLogin==null || typeof(passwordLogin)=="undefined" || passwordLogin<1))
            {$('.chicken_output').text("Go to our contact page to join us.");
            return false;   
        }
        // if ( !emailReg.test(loginEmail))
            // {$('.chicken_output').append("We need your e-mail for our spam files.");
            // return false;
        // }

        // if (loginEmail==null || typeof(loginEmail)=="undefined" || loginEmail<1)
            // {$('.chicken_output').append("We need your e-mail for our spam files.");
            // return false;
        // }

        $.ajax({
            url: '/main/login',
            data: { nameLogin: loginName, passwordLogin: passwordLogin},
            type: '?'
        }).done(function(data){
            console.log(data);
            $(location).attr('href',"/main/member");   
        });
    };

    // $('.btn-danger').click(function(){
        // var privateCluck=$('textarea[name=private_post]').val();
       
        // if (privateCluck.length>142){
            // alert("Please use less than 142 characters.")
            // return false;
        // }

        // if (privateCluck.length<142){
            // $.ajax({
                // url: '/main/privatePost',
                // data: { privatePost: privateCluck},
                // type: 'POST'
            // }).done(function(data){
                // console.log(data);
            // });
        // };
        
    // });


  //  function PostPrivate(){

   // }

   $('#chick_continue_button').click(function(){ 
        Login();
    }); 

    $('.chick_login_center').children().keypress(function(e){ 
        if (e.keyCode==13){
            Login();
            }
    }); 

   function Login(){
        var loginName = $('input:text[name=chick_login_name]').val();
        var passwordLogin = $('input:text[name=chick_password2]').val();

        $.ajax({
            url: '/main/login',
            data: { nameLogin: loginName, passwordLogin: passwordLogin},
            type: 'get'
        }).done(function(data){
            console.log(data);
        }

         var handle = $(<%=@handle%>)
         var passphrase = $(<%=@passphrase%>)

          if (handle==nil || passphrase==nil)
                 {$('.chicken_output').text("Go to our contact page to join us.");
                 return false;   
         }
         
         {$(location).attr('href',"/main/member");
         $('.chick_member').val(loginName);
         }

    });

});
   



