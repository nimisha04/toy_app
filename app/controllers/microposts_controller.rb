class MicropostsController < ApplicationController
	before_action :correct_user,   only: :destroy
	
	def new
		@micropost= Micropost.new
	end

	def create
		@micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
    	@feed_items = []
      render 'static_pages/home'
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
		@micropost.destroy
    flash[:success] = "Micropost deleted"
    redirect_to request.referrer || root_url
	end

	def show
		@micropost=Micropost.find_by(id:params[:id])
	end

private

    def micropost_params
      params.require(:micropost).permit(:content, :picture)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end

end
