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
    session[:cart]=[] if session[:cart]==nil
    session[:cart]<<params[:id]
    @a=session[:cart]
    flash[:notice]="成功放入购物车"
    redirect_to "/commodities"
  end


  def new
    @commodity = Commodity.new

  end

  def cart
    if session[:cart] == nil
      @commodities = nil
    else
      @commodities = Commodity.find_by_sql("select * from commodities c where c.id in (#{session[:cart].join(",")})")

    end
  end
  
end

