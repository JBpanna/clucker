class MainController < ApplicationController
  def index

  end

  def api
  	login = params[:login]
  	p login
  	

  	test = {login: login}
  	p test 

  	render json: test 
    # ask david why we don't need head ok here
  end

end
