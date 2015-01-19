class CoursesController < ApplicationController
  def results
  	@score = params[:score]
  	@time = params[:time]
  	@category = params[:category]
    @course = params[:course]
  	@mistakes = params[:mistakes]
  	@typed = params[:typed]

    @score2 = params[:score2]
    @time2 = params[:time2]
    @mistakes2 = params[:mistakes2]
    @user2 = params[:user2]
    

  	@final_score = Course.getGrade(@mistakes.to_i , @time.to_i , @score.to_i)
    @final_score2 = Course.getGrade(@mistakes2.to_i , @time2.to_i , @score2.to_i)
  	@wpm = Course.getWpm(@typed.to_f,@time.to_f)
   

  	user = User.find(session[:user_id])
    category = Category.find_by_name(@category)
    course = category.courses.find_by_id(params[:course])

  	act_score = Score.new(:points => @final_score,:time => @time , :wpm => @wpm)

    winner = user.username

    if @score < @score2 and @user2
      winner = @user2
    end

    match = Match.new( :category =>@category,:course => course,:first_player => user.username , :second_player =>@user2 , :winner => winner )

  	user.scores << act_score
    course.scores << act_score
    user.matches << match

    match.save
    act_score.save
  	user.save
    course.save
  end

  def index
    @category = Category.find_by_name(params[:category])
  end

  def ruby_courses
    @category = Category.find_by_name("ruby")
  end

  def java_courses
    @category = Category.find_by_name("java")
  end

  def js_courses
    @category = Category.find_by_name("js")
  end

  def python_courses
    @category = Category.find_by_name("python")
  end

  def ruby_practice
    @course = Category.find_by_name("ruby")
    @course = @course.courses.find(params[:id])
  end

  def js_practice
    @course = Category.find_by_name("js")
    @course = @course.courses.find(params[:id])
  end

  def java_practice
    @course = Category.find_by_name("java")
    @course = @course.courses.find(params[:id])
  end

  def python_practice
    @course = Category.find_by_name("python")
    @course = @course.courses.find(params[:id])
  end

end
