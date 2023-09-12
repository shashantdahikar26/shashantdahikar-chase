//
//  WeatherViewModelTests.swift
//  SD-20230907-ShashantDahikar-ChaseTests
//
//  Created by Shashant Dahikar on 11/09/23.
//

@testable import SD_20230907_ShashantDahikar_Chase
import XCTest

final class WeatherViewModelTests: XCTestCase {
    let viewModel = WeatherViewModel(locationManager: LocationManager())
    
    func testFetchCityName() {
        let cityName = "Pune"
        Task {
            await viewModel.fetchCityName(cityName: cityName)
            XCTAssertNotNil(viewModel.weatherData)
        }
    }
}
