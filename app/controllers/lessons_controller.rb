class LessonsController < ApplicationController
	def new
	end

	def create
		@lesson = Lesson.new(lesson_param)
		@lesson.save
		redirect_to @article
	end

	private 
	def lesson_param
		params.require(:lesson).permit(:title,:text)
	end

end
