class PackagesController < ApplicationController
  def index
    @package = Package.all
  end

  def new
    @package = Package.new
  end

  def commodities
    @package = Package.find_by_id(params[:id])
    @commodities = @package.commodities
  end

end
