class HousesController < ApplicationController
  before_action :require_not_living

  def new
    @house = House.new
  end

  def create
    @house = House.new(house_params)

    if @house.save
      current_user.dweller.update_attribute(:house, @house)
      redirect_to bill_types_path, notice: "House created"
    else
      render :new
    end
  end

  private
  def house_params
    params.require(:house).permit(:name, :description)
  end

  def require_not_living
    if current_user.dweller.house
      redirect_to root_url
    end
  end
end
