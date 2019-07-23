class BooksController < ApplicationController
  def show
  	@book = Book.find(params[:id])
  end

  def index
  	@books = Book.all
  end

  def create
    book = Book.new(book_params)
    book.user_id = current_user.id

    book.save
    flash[:notice] = "successfully"
    redirect_to user_path(current_user.id)
  end

  def edit
  end

   private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
