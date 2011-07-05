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
    @commodity = Commodity.find_by_id(params[:id])
    @supplier = @commodity.supplier
    @package = Package.create(:name=>@supplier.name,:supplier_id =>@supplier.id)
    @order = Order.create(:package_id =>@package.id,:supplier_id=>@supplier.id)
  end
end
