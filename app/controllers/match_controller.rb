class MatchController < ApplicationController

	def set_match

		@course = Category.find_by_name(params[:category])
		@course = @course.courses.find(params[:course])
		@key = params[:key]

	end

end
