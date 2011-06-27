class Supplier < ActiveRecord::Base
  belongs_to :commodity
  belongs_to :package
end
