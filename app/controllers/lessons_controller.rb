class LessonsController < ApplicationController
	def index 
		@lessons = Lesson.all
	end

	def show
		@lesson = Lesson.find(params[:id])
	end

	def new
		@lesson = Lesson.new
	end

	def create
		@lesson = Lesson.new(lesson_param)
		if @lesson.save
			redirect_to @lesson
		else
			render 'new'
		end
	end

	private 
	def lesson_param
		params.require(:lesson).permit(:title,:text)
	end

end
