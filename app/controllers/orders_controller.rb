class OrdersController < ApplicationController
  def update_amount
    a=params[:order][:commodity_id_array]
    a=a[1..-2]
    b=a.split(", ")
    @com = Commodity.find(b)
    @suppliers=[]
    @com.each do |commodity| unless @suppliers.include?(commodity.supplier)
        @suppliers<<commodity.supplier
      end
      hash={}
      @packages=[]
      @package_ids=[]
      @suppliers.each do |supplier|
        @package = Package.create(:name=>supplier.name, :supplier_id=>supplier.id)
        @packages<<@package
        hash[supplier.id]=@package.id
        session["#{supplier.id}"]=hash[supplier.id]
      end

      @com.each do |commodity|
        @price = commodity.price * (params["value#{commodity.id}"].to_i) 
        @order = Order.create(:user_id=>session[:id],:package_id =>hash[commodity.supplier_id],:commodity_id=>commodity.id,:amount=>params["value#{commodity.id}"],:order_price=>@price)
      end
    end
   
    @packages.each do |package|
      @sum =0.0 
      package.orders.each do |order|
        @sum +=order.order_price.to_i
      end
      if (@sum>5000)
        package.package_price = @sum
      else
        @sum+=Supplier.find(package.supplier_id).postage
        package.package_price=@sum
      end
    end
   

  end
  
end
