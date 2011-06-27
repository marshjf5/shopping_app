class Cart < ActiveRecord::Base
  
  attr_reader:price
  def add_purchase(item)
    appendFlag = true
    for purchase in @purchase
      if(item.id == item.purchase.id)
        appendFlag = false
        purchase.quantity += 1
      end
    end
  end
end
