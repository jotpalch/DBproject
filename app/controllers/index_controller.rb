class IndexController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    Geocoder.configure(lookup: :google, api_key: "AIzaSyBc8zmz3YQWK0t6hCBRCVamuepPjLfcVPk")
    # results = Geocoder.search("臺北市中山區中山北路二段1號")
    # p(results.first.coordinates)
    @ps = PsAddr.last
    @hash = Gmaps4rails.build_markers(@ps) do |ps, marker|
        results = Geocoder.search(ps.poi_addr)
        sleep(0.5)
        next if results.first.nil?
        marker.lat results.first.coordinates[0]
        marker.lng results.first.coordinates[1]
        marker.infowindow ps.name
        marker.picture({
                     :url =>"/images/cctv_w.png",
                     :width   => 40,
                     :height  => 40
                 })
    end
    # @hash = [{:lat=>25.03368625, :lng=>121.56481033101315, :infowindow=>"1"}, {:lat=>25.0375198, :lng=>121.5636796, :infowindow=>"123"}, {:lat=>23.3332726, :lng=>121.3162746, :infowindow=>"111"}]
  end

  def search
    if params[:month]!="整年"
      params[:month] = "_"+format("%02d",params[:month]).to_s
      date_search = (params[:year].to_i-1911).to_s+params[:month][1..2]
    else
      date_search = (params[:year].to_i-1911).to_s
    end
    @data = case params[:type]
      when "自行車竊盜" then BikeStole.all
      when "機車竊盜" then ScooterStole.all
      when "汽車竊盜" then CarStole.all
      when "住宅竊盜" then HomeStole.all
      #else BikeStole.all+ScooterStole.all+CarStole.all+HomeStole.all
    end
    if params[:district] != ""
      @data = @data.where("location LIKE '%#{params[:district]}%'")
    end
    @data = @data
    .where("date LIKE '#{date_search}%'")
    .order(:date)
    @count = @data.count()
    @data = @data.page(params[:page])
  end

  def test
    @bikestole = BikeStole.all
    p(params)
    render partial: "test"
  end

end
