class Supplier < ActiveRecord::Base

  belongs_to :commodity

  has_many :commodities

  belongs_to :package
end
