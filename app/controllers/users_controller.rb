class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_url, notice: "Thank you for signing up!"
        else
            render "new"
        end
    end

    private

    def user_params
        # params is a local object variable, but remember Ruby definitions return the last line of a definition by default, so the definition self.user_params is returning the params object variable wherever self.user_params is referenced
        params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
