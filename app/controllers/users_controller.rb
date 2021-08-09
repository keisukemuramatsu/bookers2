class UsersController < ApplicationController
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id), notice: "You have created book successfully."
    else
      @books = Book.all.order(id: "DESC")
      render :index
    end
  end
  
  def index
    @users = User.all
    @user = current_user
    @newbook = Book.new
  end
  
  def show
    @user = User.find(params[:id])
    @books = Book.all
    @newbook = Book.new
  end
  
  def edit
   @user = User.find(params[:id])
   if @user == current_user
     render :edit
   else
     redirect_to user_path(current_user)
   end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
      render :edit
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end
end
