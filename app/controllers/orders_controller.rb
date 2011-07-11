class OrdersController < ApplicationController
  def update_amount
    cart        #调用cart方法
    id=rand(999999999999999999)    #设置随机数为了区分不同的包裹
   
    a=params[:order][:commodity_id_array]
    a=a[1..-2]
    b=a.split(", ")
    @package_ids=[]
    @supplier_names=[]
    exist=1
    b.each do |commodity_id|
      @commodity=Commodity.find(commodity_id)
      @supplier = @commodity.supplier
      @supplier_names<<""+@supplier.name+id.to_s
      @supplier_names.each do |supplier_name|
        if (Package.find_by_name(supplier_name)==nil)
          exist=0
        end
      end
      if(exist==0)
        @package = Package.create(:name=>""+@supplier.name+id.to_s,:supplier_id =>@supplier.id)  #生成包裹
        @package_ids<<@package.id
        exist=1
      end

      @length = params["value#{commodity_id}"].to_i
      puts @length
      @price = @commodity.price * @length + @commodity.supplier.postage
      if (@price > 5000)
         @price = @commodity.price * @length
      end
      puts "==========================================="
      puts @price                #计算商品总价


      @order = Order.create(:package_id =>@package.id,:commodity_id=>@commodity.id,:amount=>params["value#{commodity_id}"],:order_price=>@price)
    #生成订单
    
    end
    render "/suppliers/package"
    
    #
    #    if @commodities == nil
    #
    #    else
    #      puts "============================================================="
    #      puts commodity.id
    #      render "/suppliers/#{commodity.id}/package"
    #    end
  end

  #  def price
  #    @price = Order.find_by_id(params[:id])
  #
  #  end

end
