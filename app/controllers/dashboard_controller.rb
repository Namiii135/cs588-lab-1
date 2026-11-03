class DashboardController < ApplicationController
  def index
    unless session[:user_id]
      flash[:error] = "Please log in first."
      redirect_to login_path
    end
  end
end