//
//  EdgeTests.swift
//  KVFoundationTests
//
//  Created by Jesús Alfredo Hernández Alarcón on 09/02/20.
//  Copyright © 2020 Jesús Alfredo Hernández Alarcón. All rights reserved.
//

import XCTest
@testable import KVFoundation

class EdgeTests: XCTestCase {

	var sut: Edge<String>!
	
    override func setUp() {
        sut = Edge<String>(source: vertexAFake, destination: vertexBFake, weight: 3.0)
    }

    override func tearDown() {
        sut = nil
    }

    func testIsEqual_compareTwoEdges_shouldBeTrue() {
		// Given
		let edge = edgeFakeAtoB
		// When
		let result = (sut == edge)
		// Then
		XCTAssertTrue(result, "Both edges should be equal")
    }
	
	func testIsEqual_compareTwoEdges_shouldBeFalse() {
		// Given
		let edge = Edge<String>(source: vertexAFake, destination: vertexBFake, weight: 1.0)
		// When
		let result = (sut == edge)
		// Then
		XCTAssertFalse(result, "Both edges should not be equal")
	}
}
