class MainController < ApplicationController


  def PrivateCluck
    @privateClucks = PrivateCluck.all
  end

  def User  
    @user=User.all
  end

  def about
  end

  def contact
  end

  def gallery
  end

  def member
  end

  def video
  end
 
  def index
  
  end

   def login
  	  userServer = params[:userLogin]
      passwordServer = params[:passwordLogin]
      emailServer = params[:EMailLogin]
      nameServer = params[:nameLogin]
    
  	 

  	 testlogin = {user: userServer, password: passwordServer,
                  email: emailServer, name: nameServer}
     p testlogin

     person=User.create(
       user: userServer,
       password: passwordServer,
       email: emailServer,
       name: nameServer)
       person.save

      # person=User.find_by()
      # person.destroy

      head :ok
    
   end

   def memberLogin
    loginMemServer = params[:loginMem]
    passwordMemServer = params[:passwordLoginMem]


    #idServer = params[:id]

    
    # session[:user_id] = user.id
    
     @user_login=User.all.find_by(user: loginMemServer)
     

     p @userlogintext = "#{loginMemServer}"

    # puts "****** @userLogin = #{user}"
    
    # render json: @userName.login
    # flash[:chickUser]=loginMemServer.to_s
    # session[:user_id] = user_id
    # @userName = User.find(session[:user_id]).user
    head :ok
   end

   def logout
    reset_session
    head :ok
   end  


  def privateCluckController
    
    privatePostServer = params[:privatePost]

    testcluck = {private_cluck: privatePostServer}

    privateCluckVar=PrivateCluck.create(
       private_cluck: privatePostServer)
       privateCluckVar.save

    p "done?"

    # render json: test
    head :ok
  end

end
