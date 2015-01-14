class CoursesController < ApplicationController
  def results
  	@score = params[:score]
  	@time = params[:time]
  	@category = params[:category]
  	@mistakes = params[:mistakes]
  	@typed = params[:typed]
  	@final_score = Course.getGrade(@mistakes.to_i , @time.to_i , @score.to_i)
  	@wpm = Course.getWpm(@typed.to_f,@time.to_f)

  	user = User.find(session[:user_id])
    category = Category.find_by_name(@category)

  	act_score = Score.new(:points => @final_score,:time => @time)

  	user.scores << act_score
    category.scores << act_score

    act_score.save
  	user.save
    category.save


  end

end
