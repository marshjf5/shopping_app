class Cart
  attr_reader:purchase
  attr_reader:price
  attr_reader:name
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
