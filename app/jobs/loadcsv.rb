#rails g model cctv no ps addr direction

require 'csv'

PsAddr.delete_all
CSV.foreach("temp.csv", headers: true) do |row|
  PsAddr.create(
    name: row[0],
    content: row["content"] ,
    traffic_information: row["traffic_information"] ,
    display_addr: row["display_addr"] ,
    poi_addr: row["poi_addr"]
  )
end


CSV.foreach("bike.csv", headers: true) do |row|
  BikeStole.create(
    no: row[0],
    case: row[1] ,
    date: row[2] ,
    time: row[3] ,
    location: row[4]
  )
end

CSV.foreach("car.csv", headers: true) do |row|
  CarStole.create(
    no: row[0],
    case: row[1] ,
    date: row[2] ,
    time: row[3] ,
    location: row[4]
  )
end

CSV.foreach("home.csv", headers: true) do |row|
  HomeStole.create(
    no: row[0],
    case: row[1] ,
    date: row[2] ,
    time: row[3] ,
    location: row[4]
  )
end

CSV.foreach("scooter.csv", headers: true) do |row|
  ScooterStole.create(
    no: row[0],
    case: row[1] ,
    date: row[2] ,
    time: row[3] ,
    location: row[4]
  )
end

CSV.foreach("cctv.csv", headers: true) do |row|
  Cctv.create(
    no: row[0],
    ps: row[1] ,
    addr: row[2] ,
    direction: row[3]
  )
end
