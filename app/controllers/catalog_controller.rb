class CatalogController < ApplicationController
  def index


    @search_result = Book.search(params[:search])

    @cart = current_cart  #invoking _cart.html while looking at catalog#index but catalog#index does not have @cart so we need to define it

  end
end
