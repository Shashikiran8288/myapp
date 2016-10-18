class SessionsController < ApplicationController

	before_filter :authenticate_user, :only => [:home, :profile, :setting]
	before_filter :save_login_state, :only => [:login, :login_attempt]

	def login
	end

	def login_attempt
		authorized_user = User.authenticate(params[:username_or_email],params[:login_password])
		if authorized_user
			session[:user_id] = authorized_user.id
			flash[:notice] = "Wow Welcome again, you logged in as #{authorized_user.username}"
			redirect_to home_path
		else
			flash[:errors] = "Invalid Username or Password"
			render "login"	
		end
	end

	def home
	end

	def profile
	end

	def setting
	end

	def logout
		session[:user_id] = nil
		redirect_to login_path
	end
end
