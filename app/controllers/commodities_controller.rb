class CommoditiesController < ApplicationController

  def index
    @commodities = Commodity.all
  end

  def show
    @commodity = Commodity.find(params[:id])
  end

  def dest
    @commodity = Commodity.find(params[:id])
    @commodity.destroy
    redirect_to "/commodities"
  end

  def order
    @commodity = Commodity.find(params[:id])
    @order = @commodity
  end

  def empty_cart
    session[:cart] = nil
    flash[:empty] = "购物车已清空！"
    redirect_to "/commodities"
  end

  def add_to_cart
    @a=Array.new
    @a=session[:cart] unless session[:cart].nil?
    flash[:notice]="成功放入购物车"
    @a<<params[:id]
    session[:cart] = @a
    redirect_to "/commodities"
  end



  def new
    @commodity = Commodity.new
  end
end

