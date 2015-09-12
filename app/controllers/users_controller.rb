class UsersController < ApplicationController
  load_and_authorize_resource

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def destroy
    @user = current_user 
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      flash[:info] = "You have successfully logged in"
      redirect_to root_url
    else
      render :new
    end
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    end
  end

  def index
    @user = User.all.excludes(id: current_user.id)
  end

  protected
    def user_params
      params.require(:user).permit(:name, :email, :password, :avatar)
    end
end
