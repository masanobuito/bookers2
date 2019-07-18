class BooksController < ApplicationController
  def show
  	@book = Book.find(params[:id])
  end

  def index
  end
end
