class IndexController < ApplicationController
  skip_before_action :verify_authenticity_token



  def index
    Geocoder.configure(lookup: :google, api_key: "AIzaSyBc8zmz3YQWK0t6hCBRCVamuepPjLfcVPk")

    # Geokit::Geocoders::GoogleGeocoder.api_key = 'AIzaSyBc8zmz3YQWK0t6hCBRCVamuepPjLfcVPk'
    # results = Geocoder.search("臺北市萬華區糖?里大理街159巷1~30號")
    # p(results.first.coordinates)

    #台北市端點
    ####################################
    n = [25.210872, 121.559511]
    s = [24.960526, 121.597278]
    e = [25.029813, 121.665705]
    w = [25.109088, 121.456927]
    ####################################

    @hash = []
    PsCoor.all.each do |ps|
      info = PsAddr.where("id = #{ps.no}").first
      @hash << {
        :lat => ps.lat,
        :lng => ps.lng,
        :infowindow =>  "<h2>#{info.name}</h2><br>(#{info.content})<br>地址:#{info.poi_addr}",
        :picture => {
                     :url =>"http://maps.google.com/mapfiles/ms/micons/blue-pushpin.png",
                     :width   => 27,
                     :height  => 27
                 }
      }
    end
    # p(@hash)
    # @cctvcoor = CctvCoor.all.where(" lat<#{n[0]} and lat>#{s[0]} and lng>#{w[1]} and lng<#{e[1]} ")
    # @hash = Gmaps4rails.build_markers(@cctvcoor) do |ps, marker|
    #     # Cctv.where(no: ps.no).first.addr
    #     marker.lat ps.lat
    #     marker.lng ps.lng
    #     marker.infowindow ps.no
    #     marker.picture({
    #                  :url =>"/images/cctv_#{ps.dir}.png",
    #                  :width   => 40,
    #                  :height  => 40
    #              })
    # end

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


  def map
    @hash = []
    Geocoder.configure(lookup: :google, api_key: "AIzaSyBc8zmz3YQWK0t6hCBRCVamuepPjLfcVPk")
    results = Geocoder.search(params[:q]) if not params[:q].nil?
    results = results.first.coordinates
    # p(results.first.coordinates)

    PsCoor.all.each do |ps|
      next if Geocoder::Calculations.distance_between(results, [ps.lat,ps.lng] , :units => :km ) > 1
      info = PsAddr.where("id = #{ps.no}").first
      @hash << {
        :lat => ps.lat,
        :lng => ps.lng,
        :infowindow =>  "<h2>#{info.name}</h2><br>(#{info.content})<br>地址:#{info.poi_addr}",
        :picture => {
                     :url =>"http://maps.google.com/mapfiles/ms/micons/blue-pushpin.png",
                     :width   => 27,
                     :height  => 27
                 }
      }
    end

    CctvCoor.all.each do |cc|
      next if Geocoder::Calculations.distance_between(results, [cc.lat,cc.lng] , :units => :km ) > 0.5
      info = Cctv.where(no: cc.no).first
      @hash << {
        :lat => cc.lat,
        :lng => cc.lng,
        :infowindow =>  "<h3>#{info.no}</h3><br>管理單位: #{info.ps}<br>地址: #{info.addr}<br>方向: #{info.direction}",
        :picture => {
                     :url =>"/images/cctv_#{cc.dir}.png",
                     :width   => 40,
                     :height  => 40
                 }
      }
    end

    @hash << {
       :lat=> results[0],
       :lng=> results[1],
       :infowindow=> params[:q],
       }
    # @ps = Gmaps4rails.build_markers(PsCoor.all) do |ps, marker|
    #     # Cctv.where(no: ps.no).first.addr
    #     next if Geocoder::Calculations.distance_between(results, [ps.lat,ps.lng] , :units => :km ) > 3
    #     info = PsAddr.where("id = #{ps.no}").first
    #     marker.lat ps.lat
    #     marker.lng ps.lng
    #     marker.infowindow "<h2>#{info.name}</h2><br>(#{info.content})<br>地址:#{info.poi_addr}"
    #     marker.picture({
    #                  :url =>"http://maps.google.com/mapfiles/ms/micons/blue-pushpin.png",
    #                  :width   => 27,
    #                  :height  => 27
    #              })
    # end


  end


  def test
    @bikestole = BikeStole.all
    p(params)
    render partial: "mapbar"
  end

end
