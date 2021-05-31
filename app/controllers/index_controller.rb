class IndexController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
      @bikestoles = BikeStole.all

  end

  def search
    p(params)
    @data = case params[:type]
      when "1" then BikeStole.all
      when "2" then ScooterStole.all
      when "3" then CarStole.all
      when "4" then HomeStole.all
      #else BikeStole.all+ScooterStole.all+CarStole.all+HomeStole.all
    end
    @data = @data
    .page(params[:page])
  end

  def test
    @bikestole = BikeStole.all
    p(params)
    render partial: "test"
  end

end
