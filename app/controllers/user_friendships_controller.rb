class UserFriendshipsController < ApplicationController
	def new
		user_id_friend = User.find_by(params[:user], params[:password]).id
		if session[:user_id] != user_id_friend
			p session[:user_id]
			p user_id_friend
			redirect_to root_url
		end
		if params[:friend_id]
			@friend = User.find(params[:friend_id])
			raise ActiveRecord::RecordNotFound if @friend.nil?
			@user_friendship = current_user.user_friendships.new(friend: @friend)
		else
			p "friend required"
		end
	# rescue ActiveRecord::RecordNotFound
		# render file 'public/404', status: :not_found
	# end
	end

	def create
		if params[:user_friendship] && params[:user_friendship].has_key?(:friend_id)
			@friend = User.find(params[:user_friendship][:friend_id])
			@user_friendship = current_user.user_friendships.new(friend: @friend)
			@user_friendship.save
			redirect_to profile_path(@friend)
		else
		p "no friend id"
		redirect_to root_url
		end
		render json: @user_friendship

	end
end
