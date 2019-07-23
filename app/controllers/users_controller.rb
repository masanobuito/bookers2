class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	 @books = @user.books
  	# @books =Book.where(user_id: params[:id])
  	@book = Book.new
  end

  def index
  	@users = User.all
  end

  def edit
  	@user = User.find(params[:id])

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

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end


end
