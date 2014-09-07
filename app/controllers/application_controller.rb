require 'json'
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
helper_method :_current_user, :_get_plugin_name

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

# def user

# 	id=params[:id]
# 	name=params[:name]
# 	user=params[:user]
# 	password=params[:password]
# 	p id + '|' + name + '|' + user + '|' + password
# 	head :ok

# end

# def privateCluck
# 	id=params[:id]
# 	private_cluck=params[:private_cluck]
# 	user_id=params[:user_id]
# 	p id + '|' + private_cluck + '|' + user_id
# 	head :ok
# end

# def publicCluck
# 	id=params[:id]
# 	public_cluck=params[:public_cluck]
# 	user_id=params[:user_id]
# 	p id + '|' + public_cluck + '|' + user_id
# 	head :ok
# end
end
# null_session or reset_session