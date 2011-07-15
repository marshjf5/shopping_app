class OrdersController < ApplicationController
  def update_amount
    cart
    id = rand(9999999999999999999999)
    a=params[:order][:commodity_id_array]
    a=a[1..-2]
    b=a.split(",")
    @package_ids = []
    @supplier_names = []
    exist=1
    b.each do |commodity_id|
      @commodity=Commodity.find(commodity_id)
      @supplier=@commodity.supplier
      @supplier_names << ""+@supplier.name+id.to_s
      @supplier_names.each do |supplier_name|
        if (Package.find_by_name(supplier_name)==nil)
          exist=0
        end
      end
      if (exist=0)
        @package = Package.create(:name=>""+@supplier.name+id.to_s,:supplier_id=>@supplier.id)
        @package_ids << @package.id
        exist=1
      end
      
      @length = params["value#{commodity_id}"].to_i
      @price= @commodity.price * @length + @commodity.supplier.postage
      if (@price>5000)
        @price = @commodity.price * @length
      end
      @order = Order.create(:package_id =>@package.id,:commodity_id=>@commodity.id,:amount=>params["value#{commodity_id}"],:order_price=>@price)
    end
    render "/suppliers/suppliers"
  end

end
