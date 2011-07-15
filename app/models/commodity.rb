class Commodity < ActiveRecord::Base
  has_one :order
  belongs_to :supplier
end
