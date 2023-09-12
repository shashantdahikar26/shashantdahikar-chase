//
//  WeatherManager.swift
//  SD-20230907-ShashantDahikar-Chase
//
//  Created by Shashant Dahikar on 08/09/23.
//

import Foundation
import SwiftUI

enum WeatherAppError: Error {
    case invalidURLError
    case serverError
    case iconProcessingError
}

class WeatherResource {
    
    func getCurrentWeatherForCity(cityName: String) async throws -> WeatherModel {
        
        guard let url = URL(string: AppConstants().getCityDetailsURL(cityName: cityName)) else { throw WeatherAppError.invalidURLError }
        let urlRequest = URLRequest(url: url)
        
        let(data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw WeatherAppError.serverError }
        
        let decodedData = try JSONDecoder().decode(WeatherData.self, from: data)
        
        return parseWeatherModel(dataModel: decodedData)
    }
    
    func getIconImage(icon: String) async throws -> UIImage {
        
        guard let url = URL(string: AppConstants().getWeatherImageURL(iconImage: icon)) else { throw WeatherAppError.invalidURLError }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        guard let img = UIImage(data: data)  else { throw WeatherAppError.iconProcessingError }
        
        return img
    }
    
    func parseWeatherModel(dataModel: WeatherData) -> WeatherModel {
        let model = WeatherModel(name: dataModel.name ?? "",
                                      timezone: dataModel.timezone ?? 0,
                                      temp: dataModel.main.temp ?? 0,
                                      tempMin: dataModel.main.tempMin ?? 0,
                                      tempMax: dataModel.main.tempMax ?? 0,
                                      pressure: dataModel.main.pressure ?? 0,
                                      humidity: dataModel.main.humidity ?? 0,
                                      description: dataModel.weather[0].description ?? "" ,
                                      wind: Int(dataModel.wind.speed ?? 0),
                                      sunrise: dataModel.sys.sunrise ?? 0,
                                      sunset: dataModel.sys.sunset ?? 0,
                                      visibility: dataModel.visibility ?? 0,
                                      iconId: dataModel.weather[0].icon ?? ""
        )
        return model
    }
}

