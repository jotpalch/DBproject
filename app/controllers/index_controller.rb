class IndexController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
      @bikestoles = BikeStole.all

  end

  def search
    p(params[:year])
    date_search = (params[:year].to_i-1911).to_s+format("%02d",params[:month]).to_s
    p(date_search)
    @data = case params[:type]
      when "自行車竊盜" then BikeStole.all
      when "機車竊盜" then ScooterStole.all
      when "汽車竊盜" then CarStole.all
      when "住宅竊盜" then HomeStole.all
      #else BikeStole.all+ScooterStole.all+CarStole.all+HomeStole.all
    end
    @data = @data
    .where("location LIKE '%#{params[:district]}%' AND date LIKE '#{date_search}%'")
    .page(params[:page])
    p(@data==[])
  end

  def test
    @bikestole = BikeStole.all
    p(params)
    render partial: "test"
  end

end
