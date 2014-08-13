require 'json'
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
helper_method :_current_user, :_get_plugin_name

def user

	id=params[:id]
	name=params[:name]
	user=params[:user]
	password=params[:password]
	p id + '|' + name + '|' + user + '|' + password
	head :ok

end

def privateCluck
	id=params[:id]
	private_cluck=params[:private_cluck]
	user_id=params[:user_id]
	user=params[:user]
	p id + '|' + private_cluck + '|' + user_id + '|' + user
	head :ok
end

def publicCluck
	id=params[:id]
	public_cluck=params[:public_cluck]
	user_id=params[:user_id]
	user=params[:user]
	p id + '|' + public_cluck + '|' + user_id + '|' + user
	head :ok
end
end
# null_session or reset_session