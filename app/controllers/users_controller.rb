class UsersController < ApplicationController


  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
   if User.find_by_email(params[:user][:email])==nil
     @user=User.create(:encrypted_password=>params[:user][:password],:name=>params[:user][:name],:email=>params[:user][:email])
      render "show"
   else
     flash[:notice]="用户已存在！"
      redirect_to "new"
   end
   
  end

  def new
    @user=User.new
  end
   
end
