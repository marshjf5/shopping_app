class Order < ActiveRecord::Base
  has_many :commodities
  has_many :packages
end
