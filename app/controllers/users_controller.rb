class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_current_user, {only: [:edit, :update, :destroy]}


  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end
  
  def index
    @users = User.all
    # @profile_image_id = 
    @user = current_user
    @book = Book.new
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
        flash[:success] = "You have updated user successfully."
    redirect_to user_path(@user.id)
    else

      render action: :edit
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:profile_image, :name, :introduction)  
  end

  def  ensure_current_user
    @user = User.find(params[:id])
 if @user.id != current_user.id
    redirect_to user_path(current_user.id)
 end
end

end
