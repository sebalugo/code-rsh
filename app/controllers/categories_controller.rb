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
		@ruby = @ruby.scores.sort_by{ |score| -score["points"]}

		@js = Category.find_by_name("javascript")
		@js = @js.scores.sort_by{ |score| -score["points"]}

		@python = Category.find_by_name("python")
		@python = @python.scores.sort_by{ |score| -score["points"]}

		@java = Category.find_by_name("java")
		@java = @java.scores.sort_by{ |score| -score["points"]}

	end
end
