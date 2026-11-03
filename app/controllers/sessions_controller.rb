class SessionsController < ApplicationController
  def new
    redirect_to dashboard_path if session[:user_id]
  end

  def create
    username  = params[:username].to_s.strip
    password  = params[:password].to_s
    user_role = nil

    File.foreach(Rails.root.join('Password.txt')) do |line|
      next if line.strip.empty?
      user, pass, role = line.strip.split(',')
      if user == username && pass == password
        user_role = role
        break
      end
    end

    if user_role
      session[:user_id] = username
      session[:role]    = user_role
      flash[:notice] = "Login successful! Welcome, #{username}."
      redirect_to dashboard_path
    else
      flash[:error] = "Invalid username or password."
      redirect_to login_path
    end
  end

  def destroy
    reset_session
    flash[:notice] = "You have logged out."
    redirect_to login_path
  end
end