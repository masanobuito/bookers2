class UsersController < ApplicationController
 before_action :authenticate_user!
 before_action :ensure_correct_user,{only: [:edit, :update]}
  def show
  	@user = User.find(params[:id])
  	@books = Book.all
  	@book_new = Book.new
  end

  def index
  	@users = User.all
    @user = current_user
    @book_new = Book.new
  end

  def edit
  	@user = User.find(params[:id])
  	@book_new = Book.new

  end

  def update
  	user = User.find(params[:id])
  	user.update(user_params)
  	flash[:notice] = "You have updated user successfully."
  	redirect_to user_path(user.id)
  end

  def create
    user = User.new(user_params)
    user.save
    flash[:notice] = "Signed in successfully."
    redirect_to user_path(user.id)
  end

  def ensure_correct_user
  	user = User.find(params[:id])
  if current_user.id !=  user.id
   redirect_to users_path
  end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end


end
