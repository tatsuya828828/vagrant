class BooksController < ApplicationController
  def index
  		@books = Book.all
  		@book = Book.new
      @me = User.find(current_user.id)
  end

  def create
  		@book = Book.new(book_params)
  		@book.user_id = current_user.id
  		if @book.save(book_params)
        flash[:notice] = "You have creatad book successfully."
  		redirect_to book_path(@book.id)
      else
        @books = Book.all
        @me = User.find(current_user.id)
        render action: :index
      end
  end

  def update
      @book = Book.find(params[:id])
      if @book.update(book_params)
        flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
      end
  end

  def show
  		@book = Book.find(params[:id])
      @me = User.find(current_user.id)
      @newbook = Book.new
  end

  def edit
      @book = Book.find(params[:id])
  end

  def destroy
  		book = Book.find(params[:id])
  		book.destroy
  end
  private
  def book_params
    params.require(:book).permit(:title,:body)
  end
end
