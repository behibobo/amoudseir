class UserAvatarsController < ApplicationController

  def create
    @user = User.find params[:user_id]
    @user.image = params[:image]
  end
end
