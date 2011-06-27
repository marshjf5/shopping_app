class CommoditiesController < ApplicationController
<<<<<<< HEAD
  def add_to_cart
    commodity = Commodity.find(params[:id])
    @cart=add_commodity
    @cart.add_purchase(commodity)
    session[:shopping_cart]=@cart

  end
  private
  def add_commodity
    if session[:shopping_cart]!=nil
      return session[:shopping_cart]
    else 
      return Cart.new
    end
  end
end
=======
  def new
    @commodity = Commodity.new
  end
end
>>>>>>> 72546e6668e5bb2da5312d5dec6a75d4b9e6cb50
