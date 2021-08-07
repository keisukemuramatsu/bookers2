class BooksController < ApplicationController
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id), notice: "Book was successfully created."
    
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = User.all
  end

  def show
    @newbook = Book.new
    @book = Book.find(params[:id])
    #@user = User.find(params[:id])
  end
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id), notice: "Book was successfully created."
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path, notice: "Book was successfully created."
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end
end
