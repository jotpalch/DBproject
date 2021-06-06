select substr(發生地點,4,3) as 行政區,count(*) as 案件數量 from 臺北市機車竊盜點位資訊
where substr(臺北市機車竊盜點位資訊.發生日期,4,2) like '01'
group by 行政區
order by 案件數量 desc
limit 5;

ScooterStole.find_by_sql("select substr(location,4,3) as d,count(*) as n from scooter_stoles
where substr(scooter_stoles.date,4,2) like '01'
group by d
order by n desc
limit 5")

ScooterStole.select("substr(location,4,3) as d,count(*) as n").group("substr(location,4,3)")
