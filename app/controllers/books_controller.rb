class BooksController < ApplicationController
  def show
  	@book = Book.find(params[:id])
  end

  def index
  end

  def create
    book = Book.new(book_params)
    book.save
    flash[:notice] = "successfully"
    redirect_to book_path(book.id)
  end

  def edit
  end
end
