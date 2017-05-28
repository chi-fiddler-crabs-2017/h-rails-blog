module ApplicationHelper
	def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    session[:user_id] != nil
  end

  def authenticate!
    redirect '/users/login' unless logged_in?
  end
  def authorize?
    if logged_in? && current_user.id == session[:user_id]
  	end
  end
end
