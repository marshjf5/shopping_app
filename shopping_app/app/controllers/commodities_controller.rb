class CommoditiesController < ApplicationController
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
