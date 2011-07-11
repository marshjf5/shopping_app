class Commodity < ActiveRecord::Base
 # has_many :orders, :through => :purchases
  belongs_to :supplier
  has_many :purchases
  attr_reader :quantity
  has_one :order

  
#  def initialize(quantity)
#    @quantity = quantity
#  end
#  def quantity
#    @quantity = 1
#  end
##  自动增加数量
#  def increase_quantity
#    @quantity += 1
#  end
#
#  #传入单种商品的总价 价格*数量
#  def total_price
#    @commodity.price * @quantity
#  end
end
