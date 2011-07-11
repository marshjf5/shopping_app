class SuppliersController < ApplicationController
  def new
    @supplier = Supplier.new
  end

  def create
    @supplier = Supplier.new(params[:supplier])
  end

  def index
    @suppliers = Supplier.all
  end
 
end
