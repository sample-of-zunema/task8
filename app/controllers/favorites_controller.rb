class FavoritesController < ApplicationController

  def create
    # /books/:book_id/favorites
    
    @book = Book.find(params[:book_id])
    favorite = current_user.favorites.new(book_id: @book.id)
    favorite.save
    # render template: "books/create"
  end

  def destroy
    @book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: @book.id)
    favorite.destroy
    # render template: "books/destroy"
  end

end
