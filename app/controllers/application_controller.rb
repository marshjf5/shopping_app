class ApplicationController < ActionController::Base

  def cart
     if session[:cart] == nil
       @commodities = nil
     end
  else
    @commodities = Commodity.find_by_sql("select * from commodities c where c.id in (#{session[:cart].join(",")})")
  end


end
