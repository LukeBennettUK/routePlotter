class EditPasswordController < ApplicationController
	def new
	end

	def edit
		@user = User.find_by_auth_token!(cookies[:auth_token])		
  end

	def update
		@user = User.find_by_auth_token!(cookies[:auth_token])		

		if @user.update_attributes(user_params)
			redirect_to root_url, :notice => "Password has been updated!"
		else
			render :edit
		end
	end

	private 

	def user_params
			params.require(:user).permit(:email, :password, :password_confirmation)
	end
end
