class BooksController < ApplicationController
  
  def new
  end

  def create
  end

  def index
    @user = current_user
    @users = User.all
  end

  def show
  end

  def destroy
  end
  
end
