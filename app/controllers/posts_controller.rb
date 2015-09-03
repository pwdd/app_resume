class PostsController < ApplicationController
	def index
		@posts = Post.all
		respond_to do |format|
      format.html
      format.json { render json: @posts}
    end
	end

	def show
		@post = Post.find(params[:id])
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
		@post = Post.find(params[:id])
		respond_to do |format|
      format.html
      format.json { render json: @post}
    end
	end

	def update
		@post = Post.find(params[:id])
		@post.update(post_params)

		redirect_to post_path(@post)
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		redirect_to posts_path
	end

	private
	def post_params
		params.require(:post).permit(:title, :body, :category_list, :source_code, :link, :image_url, :image_alt)
	end
end
