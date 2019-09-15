class HomeController < ApplicationController
  def index
    if current_user.nil?
      redirect_to login_url
    end
  end
end
