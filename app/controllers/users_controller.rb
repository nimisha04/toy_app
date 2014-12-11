class UsersController < ApplicationController

	def index
		@users=User.all
	end

	def new
		@user=User.new
	end

	def create
		# name=params[:user][:name]
		# email=params[:user][:email]
		# password=params[:user][:password]
		# password_confirmation=params[:user][:password_confirmation]
		@user=User.new(user_params)
		if @user.save
			flash[:success]="Welcome to the Sample App!"
			redirect_to users_path
		else
			render 'new'
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

	private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
