//
//  LocationService.swift
//  Metro CDMX
//
//  Created by Jesús Alfredo Hernández Alarcón on 02/02/20.
//  Copyright © 2020 Jesús Alfredo Hernández Alarcón. All rights reserved.
//

import Foundation
import CoreLocation

public class LocationService {
    public var locationManager: LocationManager
    
    public init(locationManager: LocationManager = CLLocationManager()) {
        self.locationManager = locationManager
    }
    
    public func askForPermissions(for permission: LocationPermission) {
        switch authorizationStatus() {
        case .notDetermined:
           ask(for: permission)
        case .denied:
            /// TODO: Should display a message that user don't allow location permission
            ask(for: permission)
        default:
            ask(for: permission)
        }
    }
    
    private func ask(for permission: LocationPermission) {
        switch permission {
           case .always:
               locationManager.requestAlwaysAuthorization()
           case .whenInUse:
               locationManager.requestWhenInUseAuthorization()
        }
    }
    
    public func authorizationStatus() -> CLAuthorizationStatus {
        return locationManager.authorizationStatus()
    }
    
    public func locationServicesEnabled() -> Bool {
        return locationManager.locationServicesEnabled()
    }
    
	@discardableResult
    public func requestLocation() -> Bool {
        if locationServicesEnabled() {
            locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
            locationManager.requestLocation()
            return true
        }
        return false
    }
}
