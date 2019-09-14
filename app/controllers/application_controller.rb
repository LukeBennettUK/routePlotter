class ApplicationController < ActionController::Base
    protect_from_forgery

    private

    def current_user
        #find the user model based off of the user id, only do it if the session variable exists
        # User.find... will most likely be called many times per request, so good idea to cache in an instance variable so it will only be fetched one time per request. e.g. @current_user, the ||= assigns whatever is found on the right, to the left, and once assigned, does nothing thereafter
        @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
    end

    #turns the current_user method into a helper_method so it can be accessed from the view
    helper_method :current_user

    def authorise
        redirect_to login_url, alert: "Not authorised" if current_user.nil?  
    end
end
