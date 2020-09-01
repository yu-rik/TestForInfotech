//
//  WeatherDataForDisplay.swift
//  TestForInfotech
//
//  Created by yurik on 9/1/20.
//  Copyright © 2020 yurik. All rights reserved.
//

import UIKit
//модель для обновления данных на экране
struct WeatherDataForDisplay {
    let descript: String
    
   fileprivate let temperature: Double
    var tempString: String {
        return String(format: "%.0f", temperature)
    }
    
    fileprivate let minTemperature: Double
    var minTempString: String {
        return String(format: "%.0f", minTemperature)
    }
    
   fileprivate let maxTemperature: Double
    var maxTempString: String {
        return String(format: "%.0f", maxTemperature)
    }
    
   fileprivate let humid: Int
    var humidString: String {
        return String(humid)
    }
    
    fileprivate let wind: Double
    var windString: String {
        return String(format: "%.1f", wind)
    }
    
    fileprivate let conditionCode: Int
    var systemWeatherIcon: String {
           switch conditionCode {
           case 200...232:
               return "cloud.bolt.rain.fill"
           case 300...321:
               return "cloud.drizzle.fill"
           case 500...531:
               return "cloud.rain.fill"
           case 600...622:
               return "cloud.snow.fill"
           case 701...781:
               return "tornado"
           case 800:
               return "sun.max.fill"
           case 801...804:
               return "cloud.fill"
               
           default:
               return "nosign"
           }
       }
    
    
    //инициализатор для создания объекта WeatherDataForDisplay с полученных данных объекта WeatherJsonData
    init?(weatherJsonData: WeatherJsonData) {
        descript = weatherJsonData.weather.first!.description
        temperature = weatherJsonData.main.temp
        minTemperature = weatherJsonData.main.minTemp
        maxTemperature = weatherJsonData.main.maxTemp
        humid = weatherJsonData.main.humidity
        wind = weatherJsonData.wind.speed
        conditionCode = weatherJsonData.weather.first!.id
    }
}
