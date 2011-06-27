class Order < ActiveRecord::Base
  has_many :commodities
  belongs_to :package
end
