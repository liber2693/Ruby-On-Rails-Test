class UsersController < ApplicationController
  def create
    @user = User.new(permitted_params)
    if @user.save
      head 200
      # render json: {message: "Sucessfully"}, status: 200
    else
      render json: {errors: @user.errors}, status: 422     
    end
  end

  protected

  def permitted_params
    params.require(:user).permit(:name)
  end
end