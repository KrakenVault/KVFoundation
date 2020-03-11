//
//  LocationServiceTests.swift
//  Metro CDMXTests
//
//  Created by Jesús Alfredo Hernández Alarcón on 02/02/20.
//  Copyright © 2020 Jesús Alfredo Hernández Alarcón. All rights reserved.
//

import XCTest
import KVFoundation
import CoreLocation
@testable import Metro_CDMX

class LocationServiceTests: XCTestCase {
    var sut: LocationService!
    
    override func setUp() {
       sut = LocationService()
    }

    override func tearDown() {
       sut = nil
    }
    
    func testAuthorizationStatus_whenLocationServiceIsNotAuthorized() {
        // Given
        let locationManagerFake = LocationManagerFake(authorizationStatus: .notDetermined)
        sut.locationManager = locationManagerFake
		// When
		let result = sut.authorizationStatus()
        XCTAssertEqual(result, CLAuthorizationStatus.notDetermined)
    }
    
    func testAuthorizationStatus_whenRequestLocationServiceToAuthorizedAsAlways() {
		// Given
		let locationManagerFake = LocationManagerFake(authorizationStatus: .notDetermined)
		sut.locationManager = locationManagerFake
		
		// When
        sut.askForPermissions(for: .always)
		
		// Then
        XCTAssertEqual(sut.authorizationStatus(), .authorizedAlways)
    }
	
	func testAuthorizationStatus_whenRequestLocationServiceToAuthorizedInUse() {
		// Given
		let locationManagerFake = LocationManagerFake(authorizationStatus: .notDetermined)
		sut.locationManager = locationManagerFake
		
		// When
		sut.askForPermissions(for: .whenInUse)
		
		// Then
		XCTAssertEqual(sut.authorizationStatus(), .authorizedWhenInUse)
	}
	
	func testRequestLocation_whenAuthorizationStatusIsAlways() {
		// Given
		let locationManagerStub = LocationManagerFake(authorizationStatus: .authorizedAlways,
													  locationServicesEnabled: true)
		sut.locationManager = locationManagerStub
		sut.locationManager.delegate = locationManagerStub
		
		// When
		sut.requestLocation()
		
		// Then
		XCTAssertNotNil(sut.locationManager.location)
		XCTAssertEqual(sut.locationManager.location?.coordinate.latitude, 19.457414)
	}
	
	func testRequestLocation_whenAuthorizationStatusIsDenied() {
		// Given
		let locationManagerStub = LocationManagerFake()
		sut.locationManager = locationManagerStub
		
		// When
		sut.requestLocation()
		
		// Then
		XCTAssertNil(sut.locationManager.location)
	}
}
