class Package < ActiveRecord::Base
  has_many :suppliers
  has_many :orders
end
