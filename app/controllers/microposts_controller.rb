class MicropostsController < ApplicationController
	
	def new
		@micropost= Micropost.new
	end

	def create
		content=params[:micropost][:content]
		user_id=params[:micropost][:user_id]
		@micropost=Micropost.new(content:content, user_id:user_id)
		if @micropost.save
			redirect_to microposts_path
		else
			flash[:danger]=@micropost.errors.full_messages.join(",")
			# render action:'new'

			redirect_to microposts_path
		end
	end

	def index
		@micropost=Micropost.all
	end

	def edit
		@micropost=Micropost.find_by(id:params[:id])
	end

	def update
		@micropost=Micropost.find_by(id:params[:id])
		if @micropost.update_attributes(content:params[:micropost][:content], user_id:params[:micropost][:user_id])
			redirect_to microposts_path
		else
			redirect_to microposts_path
		end
	end

	def destroy
		@micropost=Micropost.find_by(id:params[:id])
		if @micropost.destroy
			redirect_to microposts_path
		else
			redirect_to microposts_path
		end
	end

	def show
		@micropost=Micropost.find_by(id:params[:id])
	end
end
