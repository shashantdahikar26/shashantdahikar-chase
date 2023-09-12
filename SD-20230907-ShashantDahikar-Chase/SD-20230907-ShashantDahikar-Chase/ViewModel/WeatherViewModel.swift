//
//  WeatherViewModel.swift
//  SD-20230907-ShashantDahikar-Chase
//
//  Created by Shashant Dahikar on 08/09/23.
//

import Foundation
import CoreLocation

class WeatherViewModel: ObservableObject {
    @Published var weatherData: WeatherModel?
    @Published var currentCity: String = ""
    
    var locationManager: LocationManager

    private let weatherResource = WeatherResource()
    
    init(locationManager: LocationManager) {
        self.locationManager = locationManager
        self.locationManager.requestAuthorization()
    }
    
    func getUserCurrentCityWithLocation() {
        LocationHelper.shared.startUpdatingLocation(currentLocationUpdate: { [self] currentCityName in
            currentCity = currentCityName
            
            Task {
                await fetchCityName(cityName: currentCityName)
            }
        })
    }
    
    @MainActor
    func fetchCityName(cityName: String) async {
        do {
            UserDefaults.standard.setValue(cityName, forKey: "lastSearchedCity")
            weatherData = try await weatherResource.getCurrentWeatherForCity(cityName: cityName)
            guard let iconId = weatherData?.iconId else { return }
            weatherData?.iconImage = try await weatherResource.getIconImage(icon: iconId)
            
        } catch {
            print(error)
        }
    }
}
