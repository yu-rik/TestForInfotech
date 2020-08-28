//
//  DecodingData.swift
//  TestForInfotech
//
//  Created by yurik on 8/28/20.
//  Copyright © 2020 yurik. All rights reserved.
//

import UIKit

let citiesList: [CityModelData] = load("city.list.json")

let temp3 = "https://infotech.gov.ua/storage/img/Temp3.png"
let temp1 = "https://infotech.gov.ua/storage/img/Temp1.png"


func load<T: Decodable>(_ filename: String, as type: T.Type = T.self) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
