class Order < ActiveRecord::Base
  has_many :purchases
  belongs_to :package
  belongs_to :commodity
end
