class SearchController < ApplicationController
  
  def search
    if params[:model] == "User"
      if params[:search_method] == "perfect_match"
        @users = User.where('name LIKE ?', "#{params[:name]}")
      elsif params[:search_method] == "forward_match"
        @users = User.where('name LIKE ?', "#{params[:name]}%")
      elsif params[:search_method] == "backward_match"
        @users = User.where('name LIKE ?', "%#{params[:name]}")
      else
        @users = User.where('name LIKE ?', "%#{params[:name]}%")
      end
    else
      if params[:search_method] == "perfect_match"
        @books = Book.where('title LIKE ?', "#{params[:name]}")
      elsif params[:search_method] == "forward_match"
        @books = Book.where('title LIKE ?', "#{params[:name]}%")
      elsif params[:search_method] == "backward_match"
        @books = Book.where('title LIKE ?', "%#{params[:name]}")
      else
        @books = Book.where('title LIKE ?', "%#{params[:name]}%")
      end
    end 
  end
  
end
