class MainController < ApplicationController
 
  def index
    @user=User.all
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
    p loginMemServer

    #idServer = params[:id]

    @userLogin=User.find_by(user: loginMemServer, password: passwordMemServer)
    # render json: @userName.login
    # flash[:chickUser]=loginMemServer.to_s
    # session[:user_id] = user_id
    @userName = User.find(session[:user_id]).user
    head :ok
   end

   def logout
    reset_session
    head :ok
   end  


  def privatePost
    privatePostServer = params[:privatePost]
    p privatePostServer

    test = {privateCluck: privatePostServer}
    p test

    privateCluck=PrivateCluck.create(
       privateCluck: privatePostServer)
       
       privateCluck.save

    # render json: test
    head :ok
  end

end
