//
//  AppConstants.swift
//  SD-20230907-ShashantDahikar-Chase
//
//  Created by Shashant Dahikar on 08/09/23.
//

import Foundation

struct AppConstants {
    let baseUrlString = "https://api.openweathermap.org/"
    let baseImageUrlString = "https://openweathermap.org/"
    let appid = "fa99480b67c33a042547fbc416c344b2"
    func getCityDetailsURL(cityName: String) -> String {
        let urlString = baseUrlString + "/data/2.5/weather?q=" + cityName.replacingOccurrences(of: " ", with: "%20") + "&appid=" + appid + "&units=metric"
        return urlString
    }
    
    func getWeatherImageURL(iconImage: String) -> String {
        let urlString = baseImageUrlString + "/img/wn/" + iconImage + "@2x.png"
        return urlString
    }
}
