class MainController < ApplicationController
  def index
    @users=Login.all
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
    loginNameServer = params[:nameLogin]
    passwordServer = params[:passwordLogin]

    @handle=Login.all.find_by(login: loginNameServer)
    @passphrase=Login.all.find_by(password: passwordServer)

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
