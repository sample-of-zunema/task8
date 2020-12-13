class UsersController < ApplicationController

  def index
    @user = current_user
    @users = User.all
    @newbook = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @newbook = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: 'successfully'
    else
      render :edit
    end
  end
  
  def followuser
    @user = User.find(params[:id])
    
  end

  def followeruser
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(user_params)
 
    respond_to do |format|
      if @user.save
        Thanks.update_when_create(@user).deliver
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
