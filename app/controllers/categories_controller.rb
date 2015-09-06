class CategoriesController < ApplicationController
	def index
		@categories = Category.all
		respond_to do |format|
      format.html
      format.json { render json: @categories}
    end
	end
	
	def show
		@category = Category.find(params[:id])
		respond_to do |format|
      format.html
      format.json { render json: @category}
    end
	end

	def new
		@category = Category.new
		respond_to do |format|
      format.html
      format.json { render json: @category}
    end
	end

	def create
		@category = Category.new(category_params)		
		@category.save
		redirect_to category_path(@category)
	end

	def edit
		@category = Category.find(params[:id])
		respond_to do |format|
      format.html
      format.json { render json: @category}
    end
	end

	def update
		@category = Category.find(params[:id])
		@category.update(category_params)

		redirect_to category_path(@category)
	end

	def destroy
		@category = Category.find(params[:id])
		@category.destroy

		redirect_to categories_path
	end

	private
	def category_params
		params.require(:category).permit(:name, :description, :inheritance, :attr, :attr_name)
	end
end


	