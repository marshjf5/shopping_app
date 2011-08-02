module ApplicationHelper
    def current_user?(user)
      current_user = User.find_by_email(session[:user_email])
      user == current_user
    end
    
    def current_user
       User.find_by_email(session[:user_email])
    end
end
