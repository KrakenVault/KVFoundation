//
//  HeapTests.swift
//  KVFoundationTests
//
//  Created by Jesús Alfredo Hernández Alarcón on 09/02/20.
//  Copyright © 2020 Jesús Alfredo Hernández Alarcón. All rights reserved.
//

import XCTest
@testable import KVFoundation

class KVJSONDecoderTests: XCTestCase {
	var sut: KVJSONDecoder!
	
	override func setUp() {
		sut = KVJSONDecoder()
	}
	
	override func tearDown() {
		sut = nil
	}
	
	class MyTestObject: Codable {
		let name: String
		let version: String
	}
	
	func testDecode_whenReadingFromFileThatDoesntExist_sholdBeNil() {
		// Given
		let file = "FileThatDoesntExist"
		// When
		let result: MyTestObject? = KVJSONDecoder.decode(from: file, in: Bundle(for: KVJSONDecoderTests.self))
		// Then
		XCTAssertNil(result)
	}
	
	func testDecode_whenReadingFromFileExists_shouldNotBeNil() {
		// Given
		let file = "MyTestObject"
		// When
		let result: MyTestObject? = KVJSONDecoder.decode(from: file, in: Bundle(for: KVJSONDecoderTests.self))
		// Then
		XCTAssertNotNil(result)
		XCTAssertEqual(result?.name, "Kraken Vault")
	}
}
