class CategoriesController < ApplicationController
	before_action :set_category, only: [:show, :edit, :update, :destroy]

	def index
		@categories = Category.all
		respond_to do |format|
      format.html
      format.json { render json: @categories}
    end
	end
	
	def show
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
		respond_to do |format|
      format.html
      format.json { render json: @category}
    end
	end

	def update
		@category.update(category_params)

		redirect_to category_path(@category)
	end

	def destroy
		@category.destroy

		redirect_to categories_path
	end

	private
	def set_category
		@category = Category.find(params[:id])
	end

	def category_params
		params.require(:category).permit(:name, :description, :inheritance, :attr, :attr_name)
	end
end


	