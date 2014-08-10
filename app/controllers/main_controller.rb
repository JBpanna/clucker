class MainController < ApplicationController

  def user
    @user=User.all
    head :ok
  end

  def privateCluck
    @privateCluck=PrivateCluck.all
    head :ok
  end

  # def session
    # @request.session
  # end

  def flash
    @request.flash
  end

  # def cookies
    # @request.cookie_jar
  # end
    
  def index
    # s=@request.session
    # p s
    # f=@request.flash
    # p f
    
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
    
     @userLogin=User.all.find_by(user: loginMemServer)
     

     p @userogin = "#{loginMemServer}"

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
    p privatePostServer

    testcluck = {privateCluck: privatePostServer}
    p testcluck

    privateCluckVar=PrivateCluck.create(
       privateCluck: privatePostServer)
       privateCluck.save

    # render json: test
    head :ok
  end

end
