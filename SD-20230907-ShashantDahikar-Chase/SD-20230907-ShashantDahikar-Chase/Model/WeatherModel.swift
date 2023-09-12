//
//  WeatherModel.swift
//  SD-20230907-ShashantDahikar-Chase
//
//  Created by Shashant Dahikar on 08/09/23.
//

import SwiftUI

struct WeatherModel {
    let name: String
    let timezone: Int
    let temp: Double
    let tempMin: Double
    let tempMax: Double
    let pressure: Int
    let humidity: Int
    let description: String
    let wind: Int
    let sunrise: Double
    let sunset: Double
    let visibility: Int
    let iconId: String
    var iconImage: UIImage?
}
