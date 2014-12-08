class UsersController < ApplicationController

	def index
		@users=User.all
	end

	def new
		@user=User.new
	end

	def create
		name=params[:user][:name]
		email=params[:user][:email]
		@user=User.new(name:name, email:email)
		if @user.save
			redirect_to user_path(@user)
		else
			redirect_to users_path
		end
	end		

	def show
		@user=User.find_by(id:params[:id])
	end

	def edit
		@user=User.find_by(id:params[:id])
	end

	def destroy
		@user=User.find_by(id:params[:id])
		if @user.destroy
			redirect_to users_path
		else
			redirect_to users_path
		end
	end

	def update
		@user=User.find_by(id:params[:id])
		if @user.update_attributes(name:params[:user][:name], email:params[:user][:email])
			redirect_to users_path
		else
			redirect_to users_path
		end
	end
end
