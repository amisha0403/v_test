class PostsController < ApplicationController
	before_action :authenticate_user!
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  
  def index
    @posts = Post.all
  end

  def show
		redirect_to posts_path if @post.nil?
  end
  
  def new
  	@post = Post.new
  end

  def create
		@post = current_user.posts.new(post_params)
	 	if @post.save
	 		flash[:notice] = "post created successfully"
      flash[:color]= "valid"
	 		redirect_to posts_path
	 	else
	 		flash[:notice] = "Form is invalid"
      flash[:color]= "invalid"
	 		render :new
	  end
	end

  def edit
  	@post = Post.find(params[:id])
  end

	def update
		debugger
	 	if @post && @post.update(post_params)
	 		redirect_to posts_path
	 	else
	 		render 'edit'
	  end
	end

	def destroy
		@post.destroy
    redirect_to posts_path
	end

	private
	  def post_params
      params.require(:post).permit(:user_id, :title, :category, :description, :image)
    end

    def find_post
    	@post = Post.find_by_id(params[:id])
    end

end
