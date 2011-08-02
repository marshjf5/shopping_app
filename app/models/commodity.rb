class Commodity < ActiveRecord::Base
  belongs_to :supplier
  has_one :order
  belongs_to :user
end
