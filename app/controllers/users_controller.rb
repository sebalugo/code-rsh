class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)

  	if @user.save
  		redirect_to login_path, :notice => "Account created!"
  	else
  		render "new"
  	end

  end

  def user_params
    params.require(:user).permit(:username, :email, :password , :password_confirmation)
  end

  def profile
    @user = User.find_by_username(params[:name])
    @wpm = User.getWpm(params[:name])
    @coursesCompleted = @user.scores.length
    @wl = User.getWl(params[:name])
    @completed = User.getCourses(params[:name])
    @pastWpms = User.getPastWpms(params[:name])
  end

end
