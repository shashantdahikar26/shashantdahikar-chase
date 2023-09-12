//
//  LocationManager.swift
//  SD-20230907-ShashantDahikar-Chase
//
//  Created by Shashant Dahikar on 08/09/23.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private var locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.delegate = self
        
    }
    
    func requestAuthorization() {
        locationManager.requestWhenInUseAuthorization()
    }
}
