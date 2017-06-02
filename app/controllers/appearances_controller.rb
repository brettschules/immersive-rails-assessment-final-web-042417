class AppearancesController < ApplicationController

  def new
    @appearance = Appearance.new
  end

  def create
    @user = current_user
    @appearance = Appearance.new(appearance_params)
    if @appearance.save
      redirect_to @appearance.episode
    else
      redirect_to new_appearance_path
    end


  end

  def show
    @appearance = Appearance.find(params[:id])
  end

  def edit
    @appearance = Appearance.find(params[:id])
  end

  def update
    @appearance = Appearance.new(appearance_params)
    if @appearances.save
      redirect_to appearance_path(@appearance)
    else
      flash.now[:warning] = "You must enter a rating!"
      render :new
    end
  end

  private

  def appearance_params
    params.require(:appearance).permit(:guest_id, :episode_id, :rating, :user_id)
  end

end
