
Geocoder.configure(lookup: :google, api_key: "AIzaSyBc8zmz3YQWK0t6hCBRCVamuepPjLfcVPk")
Cctv.all.each do |i|
  results = Geocoder.search(i.addr).first
  next if results.nil?
  results = results.coordinates
  d =""
  d = d + "s" if i.direction.include?("南")
  d = d + "n" if i.direction.include?("北")
  d = d + "w" if i.direction.include?("西")
  d = d + "e" if i.direction.include?("東")

  CctvCoor.create(
    no:  i.no.to_s,
    lat: results[0].to_f,
    lng: results[1].to_f,
    dir: d
  )
end


Geocoder.configure(lookup: :google, api_key: "AIzaSyBc8zmz3YQWK0t6hCBRCVamuepPjLfcVPk")
PsAddr.all.each do |i|
  results = Geocoder.search(i.display_addr).first
  next if results.nil?
  results = results.coordinates

  PsCoor.create(
    no:  i.id,
    lat: results[0].to_f,
    lng: results[1].to_f,
  )
end
