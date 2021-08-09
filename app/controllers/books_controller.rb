class BooksController < ApplicationController
  def create
    @newbook = Book.new(book_params)
    @newbook.user_id = current_user.id
    if @newbook.save
      redirect_to book_path(@newbook.id), notice: "You have created book successfully."
    else
      @books = Book.all.order(id: "DESC")
      render :index
    end
  end

  def index
    @books = Book.all.order(id: "DESC")
    @newbook = Book.new
    @user = User.all
  end

  def show
    @newbook = Book.new
    @book = Book.find(params[:id])
    #@user = User.find(params[:id])
  end
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id), notice: "You have updated book successfully."
    else
      render :edit
    end
  end
  
  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
     render :edit
    else
     redirect_to books_path
    end
  end
  
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end
end
