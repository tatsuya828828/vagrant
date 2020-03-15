class UsersController < ApplicationController

  def edit
  		@user = User.find(params[:id])
  end

  def update
  		@user = User.find(params[:id])
  		if @user.update(user_params)
  		  redirect_to user_path(@user.id)
      else
      render action: :edit
      end
  end

  def index
  		@users = User.all
      @me = User.find(current_user.id)
      @book = Book.new
  end

  def show
  		@user = User.find(params[:id])
      @me = User.find(current_user.id)
      @book = Book.new
      @books = @user.books.page(params[:page]).reverse_order
  end

  private

  def user_params
  		params.require(:user).permit(:name,:introduction,:profile_image)
  end
end
