class PasswordResetsController < ApplicationController
  	def new
  	end

	def create
		# find_by method being used again here to find user by email
		user = User.find_by_email(params[:email])
		# calls send_password_reset method from the user model if the user is defined then redirects to root, and notice
		user.send_password_reset if user
		redirect_to root_url, :notice => "Email sent with password reset instructions."
	end

	def edit
		# fetches a user based off password_reset_token
		# By using the ! on the method find_by, if the password_reset_token is not found it will raise a 404
		# With my current understanding the :id symbol is getting the cookie id and matching against password_reset_token using some crazy sorcery
		@user = User.find_by_password_reset_token!(params[:id])
	end

	def update
		@user = User.find_by_password_reset_token!(params[:id])
		redirect_to root_url, :notice => "Password has been reset!"
		if @user.password_reset_sent_at < 2.hours.ago
			redirect_to new_password_reset_path, :alert => "Password reset has expired."
		elsif @user.update_attributes(user_params)
			redirect_to root_url, :notice => "Password has been reset!"
		else
			# If there are any validation errors then render the edit template again
			render :edit
		end
	end

	private 

    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
