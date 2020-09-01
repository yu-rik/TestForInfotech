//
//  ManagerJsonData.swift
//  TestForInfotech
//
//  Created by yurik on 9/1/20.
//  Copyright © 2020 yurik. All rights reserved.
//

import UIKit

class ManagerJsonData {
    func downloadJsonData(latitude: Double, longitude: Double) {
    let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&apikey=\(apiKey)&units=metric&lang=uk"
        guard let url = URL(string: urlString) else {return}
    let session = URLSession(configuration: .default)
    let task = session.dataTask(with: url) { (data, response, error) in
        if let data = data {
            let weatherForDisplay = self.parseJSON(withData: data)
        }
    }
    task.resume()
}
    
    func parseJSON(withData data: Data) -> WeatherDataForDisplay? {
        let decoder = JSONDecoder()//создаем декодер для декодирования данных из json формата
        do {
            let weatherJsonData = try decoder.decode(WeatherJsonData.self, from: data)
            //print(weatherJsonData.weather[0].description)
            //создаем объект weatherForDisplay
            guard let weatherForDisplay = WeatherDataForDisplay(weatherJsonData: weatherJsonData) else {return nil}
            return weatherForDisplay
            
            //  print(currentWeatherData.main.temp)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}
