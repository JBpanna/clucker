class UserFriendshipsController < ApplicationController
	def new
		user = User.authenticate(params[:user], params[:password])
		if user
			session[:user_id] != user.user_id
			redirect_to root_url

			
		end
	end
end
