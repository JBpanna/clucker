class MainController < ApplicationController

  def create
    User.create(user_params)
  end

  def about
  end

  def contact
  end

  def gallery
  end

  def video
  end
 
  def index
    public_clucks = PublicCluck.all
      @id_public = public_clucks.select{|user_id| user_id != nil || undefined}
        p @id_public

      @publicClucks = PublicCluck.joins(:user)
                                  .where(:user_id => @id_public);
      
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

      person=User.new(
         user: userServer,
         password: passwordServer,
         email: emailServer,
         name: nameServer)
      person.save

        @user_new = User.all.find_by(user: userServer)

        session[:user] = @user_new.user
        session[:user_id] = @user_new.id
        
        SimpleMailer.welcome_email(person).deliver
        # person=User.find_by()
        # person.destroy
        render json: person
     
   end

   def memberLogin

    loginMemServer = params[:loginMem]
    passwordMemServer = params[:passwordLoginMem]


    #idServer = params[:id]
    
     @user_login = User.all.find_by(user: loginMemServer, password: passwordMemServer)
     session[:user] = @user_login.user
     session[:user_id] = @user_login.id

    
    # puts "****** @userLogin = #{user}"
    
    # render json: @userName.login
    # flash[:chickUser]=loginMemServer.to_s
    # session[:user_id] = user_id
    # @userName = User.find(session[:user_id]).user
    render json: @user_login
   end

   def member
    session[:user_id];
    @id_private = session[:user_id]
    user=User.all.find_by(id: @id_private)
    @privateClucks = PrivateCluck.joins(:user)
                                  .where(:user_id => user.id);
    @member = session[:user]
   end

   def logout
    reset_session
    head :ok
   end  


  def privateCluckController
    @id_private = session[:user_id]
    p @id_private
    privatePostServer = params[:privatePost]
    user=User.all.find_by(id: @id_private)
    # user_private = @userPrivate.user
    # user_id_private = @userPrivate.id
    private_clucks = PrivateCluck.joins(:user)
                                  .where(:user_id => user.id);
    p user

    testcluck = {private_cluck: privatePostServer}

    privateCluckVar=PrivateCluck.new(
       private_cluck: privatePostServer,
       user_id: user.id)
    privateCluckVar.save

    p "done?"

    render json: privateCluckVar
    
  end

  def publicCluckController
    @id_public = session[:user_id]
    p @id_public
    publicPostServer = params[:publicPost]
    user=User.all.find_by(id: @id_public)

    public_clucks = PublicCluck.joins(:user)
                                  .where(:user_id => user.id);
    
    p user

    testcluck = {public_cluck: publicPostServer}

    publicCluckVar=PublicCluck.new(
       public_cluck: publicPostServer,
       user_id: user.id)
    publicCluckVar.save

    p "done?"

    render json: publicCluckVar
    

  end
 

end
