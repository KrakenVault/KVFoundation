//
//  VertexTests.swift
//  KVFoundationTests
//
//  Created by Jesús Alfredo Hernández Alarcón on 09/02/20.
//  Copyright © 2020 Jesús Alfredo Hernández Alarcón. All rights reserved.
//

import XCTest
@testable import KVFoundation

class VertexTests: XCTestCase {
	var sut: Vertex<String>!
	
    override func setUp() {
		sut = Vertex(data: "Station_A")
    }

    override func tearDown() {
		sut = nil
    }
	
	func testIsEqual_forTwoStrings_shouldBeEqual(){
		// Given
		let vertex = Vertex<String>(data: "Station_A")
		// When
		let result = (sut == vertex)
		// Then
		XCTAssertTrue(result, "Both vertex should be equal")
	}
	
	func testIsNotEqual_forTwoStrings_shouldBeEqual(){
		// Given
		let vertex = Vertex<String>(data: "Station_B")
		// When
		let result = (sut == vertex)
		// Then
		XCTAssertFalse(result, "Both vertex should not be equal")
	}
}
