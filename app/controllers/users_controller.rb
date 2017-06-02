class UsersController < ApplicationController
  before_action :logged_in, only: [:show, :edit, :update]

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:sucess] = "Welcome!"
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash.now[:warning] = "Invalid"
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end
end
