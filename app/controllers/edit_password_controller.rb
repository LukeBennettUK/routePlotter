class EditPasswordController < ApplicationController
  def edit
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
end
