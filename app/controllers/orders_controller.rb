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
      @suppliers.each do |supplier|
        @package = Package.create(:name=>supplier.name, :supplier_id=>supplier.id)
        @packages<<@package
        hash[supplier.id]=@package.id
       
      end
      @com.each do |commodity|
        @price = commodity.price * (params["value#{commodity.id}"].to_i) 
        @order = Order.create(:package_id =>hash[commodity.supplier_id],:commodity_id=>commodity.id,:amount=>params["value#{commodity.id}"],:order_price=>@price)
      end
    end

    
   
   
    @packages.each do |package|
      @sum =0.0 
      package.orders.each do |order|
        @sum +=order.order_price.to_i
      end
      @total =0.0
      if (@sum>5000)
        @total = @sum
      else
        @suppliers.each do |supplier|
          @sum+=supplier.postage
          @total=@sum
        end
      end
      puts "=========================="
      puts @total
    end
   
    render "/suppliers/suppliers"
  end
end
