class Commodity < ActiveRecord::Base
  belongs_to :order
  belongs_to :supplier
end
