class BooksController < ApplicationController
	before_action :authenticate_user!
	before_action :ensure_correct_user,{only: [:edit, :update, :destroy]}
  def show
  	@book = Book.find(params[:id])
  	@book_new = Book.new
  	@user = @book.user
  end

  def index
    @books = Book.all
  	@book_new = Book.new
    @user = current_user
  end

  def create
  	@book_new = Book.new(book_params)
    @book_new.user_id = current_user.id
    if @book_new.save
    flash[:notice] = "successfully"
    redirect_to user_path(current_user.id)
    else
    @user = current_user
    @books = Book.all
    render :index
    end
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def destroy
    book = Book.find(params[:id])
      book.destroy
      redirect_to books_path
  end

  def update
    book = Book.find(params[:id])
      book.update(book_params)
      flash[:notice] = "successfully"
      redirect_to book_path(book.id)
  end

  def ensure_correct_user
  	book = Book.find(params[:id])
  	user = book.user
  if current_user.id !=  user.id
   redirect_to books_path
  end
  end

   private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end