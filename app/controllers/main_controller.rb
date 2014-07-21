class MainController < ApplicationController
  def index

  end

  def signin
  	firstServer = params[:firstNameLogin]
    lastServer = params[:lastNameLogin]
    emailServer = params[:EMailLogin]
  	p firstServer + '|' + lastServer + '|' + emailServer  	

  	test = {first: firstServer, last: lastServer, email: emailServer}
  	p test 

  	render json: test 
    # ask david why we don't need head ok here
  end

end
