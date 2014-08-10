class MainController < ApplicationController

  def chick_user_id
    @chick_user_id = User.find(id)
  end

  def clucks
  @clucks = User.find(id).privateClucks
  end

  def PrivateCluck
    @private_clucks = PrivateCluck.all
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

    testcluck = {privateCluck: privatePostServer}

    privateCluckVar=PrivateCluck.create(
       privateCluck: privatePostServer)
       privateCluck.save

    p "done?"

    # render json: test
    head :ok
  end

end
