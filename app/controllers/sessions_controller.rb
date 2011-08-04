class SessionsController < ApplicationController
  def new
    
  end

  def create
    @commodities = Commodity.all
    @user = User.find_by_email(params[:session][:email])
    if @user.nil?
      render "/users/new"
    else
      session[:email]=@user.email
      session[:id]=@user.id
      redirect_to "/commodities"
    end
  end

  def destroy

  end

end
