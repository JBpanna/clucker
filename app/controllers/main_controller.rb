class MainController < ApplicationController

  def publiclucks
    @publicClucks = PublicCluck.all
    render json: @publicClucks
  end

  def privateclucks
    @privateClucks = PrivateCluck.all
    render json: @privateClucks
  end

  def users 
    @users = User.all
    render json: @users
  end

  def about
  end

  def contact
  end

  def gallery
  end

  def member
    session[:user_id];
    
  end

  def video
  end
 
  def index
    # session[:user_id];
  end

  def fail
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
    
     @user_login = User.all.find_by(user: loginMemServer, password: passwordMemServer)

     session[:user_id] = @user_login.id
     
    # puts "****** @userLogin = #{user}"
    
    # render json: @userName.login
    # flash[:chickUser]=loginMemServer.to_s
    # session[:user_id] = user_id
    # @userName = User.find(session[:user_id]).user
    render json: @user_login
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

def publicCluckController
    
    publicPostServer = params[:publicPost]

    testcluck = {public_cluck: publicPostServer}

    publicCluckVar=PublicCluck.create(
       public_cluck: publicPostServer)
       publicCluckVar.save

    p "done?"

    # render json: test
    head :ok
  end

end
