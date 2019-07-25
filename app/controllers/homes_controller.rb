class HomesController < ApplicationController
  def home

  end

  def about

  end

    def create
    flash[:notice] = "Signed out successfully."
  end
end
