class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id), notice: 'successfully'
    else
      @user = current_user
      @books = Book.all
      @newbook = @book
      render :index
    end
  end

  def index
    @user = current_user
    @books = Book.all
    @newbook = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @user =  @book.user
    @newbook = Book.new
    @book_comment = BookComment.new
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user != current_user
      redirect_to books_path
    end
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      redirect_to book_path(book.id), notice: 'successfully'
    else
      @book = book
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
