class UsersController < ApplicationController

  def edit
      @me = User.find(current_user.id)
      @user = User.find(params[:id])
      if @me != @user
        redirect_to user_path(@me)
      end
  end

  def update
  		@user = User.find(params[:id])
  		if @user.update(user_params)
        flash[:notice] = "You have updated user successfully."
  		  redirect_to user_path(@user)
      else
      render action: :edit
      end
  end

  def index
  		@users = User.all
      @user = User.find_by(params[:id])
      @book = Book.new
  end

  def show
  		@user = User.find(params[:id])
      @book = Book.new
      @books = @user.books.page(params[:page]).reverse_order
  end

  private

  def user_params
  		params.require(:user).permit(:name,:introduction,:profile_image)
  end
end
