class MainController < ApplicationController
 
  def index
    @login=Login.all
  end

   def login
  	 loginNameServer = params[:nameLogin]
      passwordServer = params[:passwordLogin]
     # emailServer = params[:EMailLogin]
  	 

  	 testlogin = {login: loginNameServer, password: passwordServer}
     p testlogin

     person=Login.create(
       login: loginNameServer,
       password: passwordServer)
       person.save

      # person=Login.find_by()
      # person.destroy

      head :ok
    
   end

   def memberLogin
    loginMemServer = params[:nameMemLogin]
    passwordMemServer = params[:passwordMemLogin]
    p loginMemServer

    #idServer = params[:id]

    @userName=Login.find_by(login: loginMemServer, password: passwordMemServer)
    # render json: @userName.login
    # flash[:chickUser]=loginMemServer.to_s
    # session[:user_id] = user_id
    # @userName = Login.find(session[:logins_id]).login
    head :ok
   end

   def logout
    reset_session
    head :ok
   end  


  # def privatePost
    # privatePostServer = params[:privatePost]
    # p privatePostServer

    # test = {clientPrivatePost: privatePostServer}
    # p test

    # render json: test

  # end

end
