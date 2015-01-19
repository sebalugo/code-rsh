class CategoriesController < ApplicationController
	def index
		@categories = Category.all
	end
	def java

	end
	
	def ruby
		
	end

	def javascript

	end

	def python
		
	end
	def leaderboards

	@ruby = Category.find_by_name("ruby")
	@ruby = @ruby.courses

	#@ruby = @ruby.scores.sort_by{ |score| -score["points"]}
	
	@js = Category.find_by_name("ruby")
	@js = @js.courses
	#@js = @js.scores.sort_by{ |score| -score["points"]}
	
	@python = Category.find_by_name("ruby")
	@python = @python.courses
	#@python = @python.scores.sort_by{ |score| -score["points"]}
	
	@java = Category.find_by_name("ruby")
	@java = @java.courses
	#@java = @java.scores.sort_by{ |score| -score["points"]}
	end

	def ruby_leaderboards
		@ruby = Category.find_by_name("ruby")
		@ruby = @ruby.courses.find(params[:id])
		@ruby = @ruby.scores.sort_by{ |score| [-score["points"],score["time"] ]}
	end

	def js_leaderboards
		@js = Category.find_by_name("ruby")
		@js = @js.courses.find(params[:id])
		@js = @js.scores.sort_by{ |score| [-score["points"],score["time"] ]}
	end

	def python_leaderboards
		@python = Category.find_by_name("ruby")
		@python = @python.courses.find(params[:id])
		@python = @python.scores.sort_by{ |score| [-score["points"],score["time"] ]}
	end

	def java_leaderboards
		@java = Category.find_by_name("ruby")
		@java = @java.courses.find(params[:id])
		@java = @java.scores.sort_by{ |score| [-score["points"],score["time"] ]}
	end
end
