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
  def package
    num = params[:num]
    @commodity = Commodity.find_by_id(params[:id])
    @supplier = @commodity.supplier
    @package = Package.create(:name=>@supplier.name,:supplier_id =>@supplier.id)
    total_price = @commodity.price * num.to_i
    @order = Order.create(:package_id =>@package.id,:supplier_id=>@supplier.id, :amount=>num, :order_price =>total_price)
  end
end
