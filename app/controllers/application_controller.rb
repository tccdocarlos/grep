class ApplicationController < ActionController::Base
  def require_living
    unless current_user.dweller.house
      redirect_to new_house_path
    end
  end
end
