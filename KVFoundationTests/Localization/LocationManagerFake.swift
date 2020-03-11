//
//  Created by Jesús Alfredo Hernández Alarcón on 03/02/20.
//  Copyright © 2020 Jesús Alfredo Hernández Alarcón. All rights reserved.
//

import KVFoundation
import CoreLocation

class LocationManagerFake: NSObject, LocationManager {
	private var authorizationStatusValue: CLAuthorizationStatus
	private var locationServicesEnabledValue: Bool
	
	init(authorizationStatus: CLAuthorizationStatus = .denied,
		 locationServicesEnabled: Bool = false){
		self.authorizationStatusValue = authorizationStatus
		self.locationServicesEnabledValue = locationServicesEnabled
	}
	
	var desiredAccuracy: CLLocationAccuracy = kCLLocationAccuracyThreeKilometers
	var location: CLLocation?
	var delegate: CLLocationManagerDelegate?
	
	func requestWhenInUseAuthorization() {
		locationServicesEnabledValue = true
		authorizationStatusValue = .authorizedWhenInUse
	}
	
	func requestAlwaysAuthorization() {
		locationServicesEnabledValue = true
		authorizationStatusValue = .authorizedAlways
	}
	
	func requestLocation() {
		if locationServicesEnabledValue {
			let fakeLocation = CLLocation(latitude: 19.457414, longitude: -99.236754)
			delegate?.locationManager?(CLLocationManager(), didUpdateLocations: [fakeLocation])
		}
	}
	
	func locationServicesEnabled() -> Bool {
		return locationServicesEnabledValue
	}
	
	func authorizationStatus() -> CLAuthorizationStatus {
		return authorizationStatusValue
	}
}

extension LocationManagerFake: CLLocationManagerDelegate {
	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		self.location = locations.first
	}
}
