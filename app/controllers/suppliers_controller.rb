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
    @packages=session["#{params[:id]}"]
   if @com.nil?
     flash[:notice]="没有货物需要发售！"
   else
     @packages=session[:package]
   end
  end
end
