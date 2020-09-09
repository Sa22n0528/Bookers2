class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_current_user, {only: [:edit, :update, :destroy]}


  def new
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def show
    @book = Book.new
    @bookdetail = Book.find(params[:id])
    @user = @bookdetail.user
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:success] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      @user = current_user
      render :index
    end
end

def edit
  @bookdetail = Book.find(params[:id])
end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:success] = "Book was successfully updated."
      redirect_to book_path(@book)
    else
      @bookdetail = Book.find(params[:id])
      render action: :edit
    end
  end

  def destroy
    book = Book.find(params[:id]) 
    book.destroy 
    redirect_to books_path  
  end
private
  def book_params
    params.require(:book).permit(:title, :body)
  end

  def  ensure_current_user
    @book = Book.find(params[:id])
    if @book.user_id != current_user.id
        redirect_to books_path
    end
   end

end

