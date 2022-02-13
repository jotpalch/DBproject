# 台北市竊盜案件大數據平台

2021 Introduction to Database Systems 彭文志教授 Final Project  
  
資料來源 : [臺北市資料大平臺](https://data.taipei/#/)  
取用資料 : `臺北市住宅、自行車、機車、汽車竊盜點位資訊`、`台北市政府警察局名稱與地址`、`台北市政府警察局錄影監視系統設置區位`  

[DEMO VIDEO](https://youtu.be/8-N4cKgbnK0)  
[PROJECT REPORT](https://github.com/jotpalch/DBproject/blob/361e06ad256c37182504481f554ae917a3dcb387/Project_Team02.pdf)

## 實作方法
**Framework** : `Ruby on rails`  
**Database** : `sqlite`  
**API** : `Google Maps`

## 功能介紹
### 地圖查詢
警察單位以藍色大頭針標註  
  
![](https://i.imgur.com/Wm0Q8Fe.png)
  
監視器圖片指向的方向即為監視器拍攝的方位  
  
![](https://i.imgur.com/d6aDKtd.png)
### 清單查詢
提供下拉式分類搜尋功能，方便使用者查詢  
  
![](https://i.imgur.com/oSd8WBQ.png)  
  
使用 `Kaminari` 實現分頁功能  
  
![](https://i.imgur.com/FVHK04Y.png)  
### 圖表查詢
提供下拉式分類搜尋功能，方便使用者查詢  
  
![](https://i.imgur.com/BLOpNww.png)  
  
使用 `chart.js` 製作圖表  
  
![](https://i.imgur.com/dDozLmp.png)  

使用 `Flourish` 製作動態圖表  
  
![](https://github.com/jotpalch/DBproject/blob/d1805256adea466da7c1df371330e0676aea7d4b/dynamic-chart.gif)  

## 參考資料紀錄
[資料crew project - Notion](https://jotpac.notion.site/crew-project-01549d00f13449c897e9d10ff2c0e891)
