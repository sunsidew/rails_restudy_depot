class StoreController < ApplicationController
  def index
  	@products = Product.order(:title).reverse
  	@cart = current_cart
  end
end
