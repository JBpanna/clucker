class MainController < ApplicationController
  def index

  end

  def api
  	id = params[:id]
  	name = params[:name]
  	p id + " | " + name
  	

  	test = {id: id, name: name}
  	p test 

  	render json: test 
    # ask david why we don't need head ok here
  end

end
