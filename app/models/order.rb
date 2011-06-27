class Order < ActiveRecord::Base
  has_many :commodities

  has_many :packages

  belongs_to :package

end
