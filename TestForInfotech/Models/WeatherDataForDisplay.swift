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
    
    let temperature: Double
    var tempString: String {
        return String(format: "%.0f", temperature)
    }
    
    let minTemperature: Double
    var mitTempString: String {
        return String(format: "%.0f", minTemperature)
    }
    
    let maxTemperature: Double
    var maxTempString: String {
        return String(format: "%.0f", maxTemperature)
    }
    
    let humid: Int
    let wind: Double
    let conditionCode: Int
    
    
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
