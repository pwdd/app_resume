class PostsController < ApplicationController
	before_action :set_post, only: [:show, :edit, :update, :destroy]

	def index
		@posts = Post.all
		respond_to do |format|
      format.html
      format.json { render json: @posts}
    end
	end

	def show
		respond_to do |format|
      format.html
      format.json { render json: @post}
    end
	end

	def new
		@post = Post.new
		respond_to do |format|
      format.html
      format.json { render json: @post}
    end
	end

	def create
		@post = Post.new(post_params)		
		@post.save
		redirect_to post_path(@post)
	end

	def edit
		respond_to do |format|
      format.html
      format.json { render json: @post}
    end
	end

	def update
		@post.update(post_params)

		redirect_to post_path(@post)
	end

	def destroy
		@post.destroy

		redirect_to posts_path
	end

	private
	def set_post
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:title, :body, :category_list, :source_code, :link, :image_url, :image_alt)
	end
end
