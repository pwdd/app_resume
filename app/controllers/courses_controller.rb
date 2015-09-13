class CoursesController < ApplicationController
	before_action :set_course, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:show]

	def index
		@courses = Course.all
		respond_to do |format|
      format.html
      format.json { render json: @courses}
    end
	end
	
	def show
		respond_to do |format|
      format.html
      format.json { render json: @course}
    end
	end

	def new
		@course = Course.new
		respond_to do |format|
      format.html
      format.json { render json: @course}
    end
	end

	def create
		@course = Course.new(course_params)		
		@course.save
		redirect_to course_path(@course)
	end

	def edit
		respond_to do |format|
      format.html
      format.json { render json: @course}
    end
	end

	def update
		@course.update(course_params)

		redirect_to course_path(@course)
	end

	def destroy
		@course.destroy

		redirect_to course_path
	end

	private
	def set_course
		@course = Course.find(params[:id])
	end

	def course_params
		params.require(:course).permit(:name, :where, :university, :status)
	end

end
