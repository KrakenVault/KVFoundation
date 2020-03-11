//
//  LocationManager.swift
//  Metro CDMX
//
//  Created by Jesús Alfredo Hernández Alarcón on 03/02/20.
//  Copyright © 2020 Jesús Alfredo Hernández Alarcón. All rights reserved.
//

import CoreLocation

public protocol LocationManager {
    var delegate: CLLocationManagerDelegate? { get set }
    var location: CLLocation? { get }
    var desiredAccuracy: CLLocationAccuracy { get set }
    
    // CLLocation methods
    func requestWhenInUseAuthorization()
    func requestAlwaysAuthorization()
    func requestLocation()
    
    // Wrappers for CLLocationManager class functions.
    func authorizationStatus() -> CLAuthorizationStatus
    func locationServicesEnabled() -> Bool
}

extension CLLocationManager: LocationManager {
	public func authorizationStatus() -> CLAuthorizationStatus {
        return CLLocationManager.authorizationStatus()
    }
    
	public func locationServicesEnabled() -> Bool {
        return CLLocationManager.locationServicesEnabled()
    }
}
