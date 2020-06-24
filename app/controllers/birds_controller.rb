class BirdsController < ApplicationController
	before_action :authentication_required

	def index
		
      if params[:user_id]
        @birds = User.find(params[:user_id]).birds
      elsif params[:category_name]
      	@birds = Bird.search_category(params[:category_name])
      else
        @birds = Bird.all
      end
    end


	def show
      @bird = Bird.find(params[:id])
	end

  	def new
      @bird = Bird.new
  	end

	def create
	  @bird = current_user.birds.build(bird_params)
		if @bird.save
			flash[:success] = "Your sighting was sucessfully created!"
		  	redirect_to bird_url(@bird)
	  	else
	  	 #validations -- render keeps @post info/error messages vs. redirect
	  	 	flash[:danger] = "Please try again"
			@birds = Bird.all
			render :index
		end
	end

	def edit
	  @bird = Bird.find(params[:id])
	end

	def update
	  @bird = Bird.find(params[:id])
	  if @bird.update(bird_params)
		  flash[:success] = "Your sighting was sucessfully updated!"
	      redirect_to bird_path(@bird)
	  else
	  	render :edit
	  end
	end

	def destroy
      @bird = Bird.find(params[:id]).destroy
      flash[:success] = "Your sighting was sucessfully deleted!"

      #back to index
	  redirect_to birds_path
  end

	def bird_params #strong parameters
	  params.require(:bird).permit(:title, :content, category_ids:[], categories_attributes: [:name])
	end
end
