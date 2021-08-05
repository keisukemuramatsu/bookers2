class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def show
    @user = current_user
    @books = Book.all

  end
  
  def edit
   @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id), notice: "Book was successfully created."
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
end
