class SearchController < ApplicationController
  def search
    @users = User.where('name LIKE ?', "%#{params[:name]}%")
  end
end
