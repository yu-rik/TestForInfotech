//
//  CityModelData.swift
//  TestForInfotech
//
//  Created by yurik on 8/28/20.
//  Copyright © 2020 yurik. All rights reserved.
//

import UIKit

struct CityModelData: Codable {
    let id: Int
    let name: String
    let state: String?
    let country: String
    let coord: Coord
}

struct Coord: Codable {
    let lon: Double
    let lat: Double
}
