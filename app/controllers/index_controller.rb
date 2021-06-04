class IndexController < ApplicationController
  skip_before_action :verify_authenticity_token



  def index
    Geocoder.configure(lookup: :google, api_key: "AIzaSyBc8zmz3YQWK0t6hCBRCVamuepPjLfcVPk")

    # results = Geocoder.search("臺北市萬華區糖?里大理街159巷1~30號")
    # p(results.first.coordinates)

    #台北市端點
    ####################################
    n = [25.210872, 121.559511]
    s = [24.960526, 121.597278]
    e = [25.029813, 121.665705]
    w = [25.109088, 121.456927]
    ####################################

    @cctvcoor = CctvCoor.all.where(" lat<#{n[0]} and lat>#{s[0]} and lng>#{w[1]} and lng<#{e[1]} ")
    @hash = Gmaps4rails.build_markers(@cctvcoor) do |ps, marker|
        # Cctv.where(no: ps.no).first.addr
        marker.lat ps.lat
        marker.lng ps.lng
        marker.infowindow ps.no
        marker.picture({
                     :url =>"/images/cctv_#{ps.dir}.png",
                     :width   => 40,
                     :height  => 40
                 })
    end

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
