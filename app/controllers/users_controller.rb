class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@book = Book.new
  end

  def index
  	@users = User.all
  end

  def edit
  	@user = User.find(params[:id])
  end

  def create
    user = User.new(user_params)
    user.save
    flash[:notice] = "Signed in successfully."
    redirect_to user_path(user.id)
  end
end
