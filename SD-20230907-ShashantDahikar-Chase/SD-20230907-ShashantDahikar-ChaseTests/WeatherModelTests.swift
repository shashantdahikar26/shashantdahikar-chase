//
//  WeatherModelTests.swift
//  SD-20230907-ShashantDahikar-ChaseTests
//
//  Created by Shashant Dahikar on 11/09/23.
//

@testable import SD_20230907_ShashantDahikar_Chase
import XCTest

final class WeatherModelTests: XCTestCase {
    
    func testWeatherModel() {
        let model = getMockWeatherModel()
        XCTAssertEqual(model.name, "San Francisco")
        XCTAssertEqual(model.iconId, "humid")
        XCTAssertEqual(model.temp, 10)
        XCTAssertEqual(model.description, "Few Clouds")
    }
}

extension WeatherModelTests {
    
    func getMockWeatherModel() -> WeatherModel {
        return WeatherModel(name: "San Francisco", timezone: 0, temp: 10, tempMin: 2, tempMax: 15, pressure: 4, humidity: 10, description: "Few Clouds", wind: 2, sunrise: 12000, sunset: 10000, visibility: 6, iconId: "humid")
    }
}
