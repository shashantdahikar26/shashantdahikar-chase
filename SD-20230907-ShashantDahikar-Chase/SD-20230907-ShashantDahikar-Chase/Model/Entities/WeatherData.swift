//
//  WeatherData.swift
//  SD-20230907-ShashantDahikar-Chase
//
//  Created by Shashant Dahikar on 11/09/23.
//

import Foundation

struct WeatherData: Decodable {
    let id: Int?
    let name: String?
    let cod: Int?
    let base: String?
    let visibility: Int?
    let dt: Int?
    let timezone: Int?
    let coord: Coord
    let weather: [Weather]
    let main: MainResponse
    let wind: Wind
    let clouds: Clouds
    let sys: Sys
}

struct Coord: Codable {
    let lon, lat: Double?
}

struct Weather: Codable {
    let id: Int?
    let main, description, icon: String?
}

struct MainResponse: Codable {
    let temp: Double?
    let pressure, humidity: Int?
    let tempMin, tempMax: Double?
    
    enum CodingKeys: String, CodingKey {
        case temp, pressure, humidity
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
}

struct Wind: Codable {
    let speed: Double?
    let deg: Int?
}

struct Clouds: Codable {
    let all: Int?
}

struct Sys: Codable {
    let type, id: Int?
    let message: Double?
    let country: String?
    let sunrise, sunset: Double?
}
