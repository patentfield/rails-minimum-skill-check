class HomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to dashboard_path
    else
      if Rails.env == 'production'
        redirect_to new_user_session_path
      end
    end
  end
end
