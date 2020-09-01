//
//  WeatherJsonData.swift
//  TestForInfotech
//
//  Created by yurik on 9/1/20.
//  Copyright © 2020 yurik. All rights reserved.
//

import UIKit
//модель для json с OpenWeather
struct WeatherJsonData: Codable {
    let weather: [Weather]
    let main: Main
    let wind: Wind
}

struct Weather: Codable{
    let id: Int
    let description: String
}

struct Main: Codable {
    let temp: Double
    let minTemp: Double
    let maxTemp: Double
    let humidity: Int
    
    enum CodingKeys: String, CodingKey {
        case temp
        case minTemp = "temp_min"
        case maxTemp = "temp_max"
        case humidity
    }
}

struct Wind: Codable {
    let speed: Double
}
