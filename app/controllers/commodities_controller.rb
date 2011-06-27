class CommoditiesController < ApplicationController
  def new
    @commodity = Commodity.new
  end
end