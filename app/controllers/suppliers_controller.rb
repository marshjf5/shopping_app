class SuppliersController < ApplicationController

  def new
    @supplier = Supplier.new
  end

  def create
    @supplier = Supplier.new(params[:supplier])
  end

  def suppliers_list
    @suppliers = Supplier.all
  end

  def supplier_commodities
    @package=Package.find(session["#{params[:id]}"])
    if @package.nil?
      flash[:notice]="没有货物需要发售！"
    else
      @package=Package.find(session["#{params[:id]}"])
    end
  end
end
