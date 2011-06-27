class Package < ActiveRecord::Base
  has_many :suppliers

  belongs_to :order

  has_many :orders

end
