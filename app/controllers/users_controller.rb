class UsersController < ApplicationController
	before_filter :save_login_state, :only => [:new, :create]
	def new
		@user = User.new
	end

	def create
		@user = User.new(secure_params)
		if @user.save
			flash[:notice] = "You signed up successfully"
			flash[:color]= "valid"
		else
			flash[:notice] = "Form is invalid"
			flash[:color]= "invalid"
		end
		render "new"
	end


	private
	def secure_params
		params.require(:user).permit(:username, :email, :password, :password_confirmation)
	end
end
