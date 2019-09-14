class ProfileController < ApplicationController

	def profile_page
		@user = User.find_by_auth_token!(cookies[:auth_token])
	end
	
	# def edit_email
	# 	@user = User.find_by_auth_token!(cookies[:auth_token])
	# end

	# def edit_password
	# 	@user = User.find_by_auth_token!(cookies[:auth_token])
	# end

	# def update
	# 	@user = User.find_by_auth_token!(cookies[:auth_token])
	# 	if @user.update_attributes(user_params)
	# 		redirect_to root_url, :alert => "Password reset has expired."
	# 	end
	# 	# if @user.password_reset_sent_at < 1.hours.ago
	# 	# 	redirect_to new_password_reset_path, :alert => "Password reset has expired."
	# 	# elsif @user.update_attributes(user_params)
	# 	# 	redirect_to root_url, :notice => "Password has been reset!"
	# 	# else
	# 	# 	# If there are any validation errors then render the edit template again
	# 	# 	render :edit
	# 	# end
	# end
end
