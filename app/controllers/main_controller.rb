class MainController < ApplicationController
  def index

  end

  def signin
  	firstServer = params[:firstNameLogin]
    lastServer = params[:lastNameLogin]
    emailServer = params[:EMailLogin]
  	p firstServer + ' | ' + lastServer + ' | ' + emailServer  	

  	test = {clientFirst: firstServer, clientLast: lastServer, clientEmail: emailServer}
  	p test 

  	render json: test 
    # ask david why we don't need head ok here
  end

end
