class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!, :get_new_subscriber

  def get_new_subscriber
  	@new_subscriber = Subscriber.new
  end

end
