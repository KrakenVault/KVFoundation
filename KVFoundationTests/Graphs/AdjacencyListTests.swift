//
//  AdjacencyListTests.swift
//  KVFoundationTests
//
//  Created by Jesús Alfredo Hernández Alarcón on 09/02/20.
//  Copyright © 2020 Jesús Alfredo Hernández Alarcón. All rights reserved.
//

import XCTest
@testable import KVFoundation

class AdjacencyListTests: XCTestCase {
	var sut: AdjacencyList<String>!
	
    override func setUp() {
        sut = AdjacencyList()
    }

    override func tearDown() {
		sut = nil
	}

    func testAdjacencyListData_shouldBeEmptyByDefault() {
		XCTAssertTrue(sut.dict.isEmpty, "Adjacency list data should be empty")
    }
	
	func testCreateVertex(){
		// Given
		let data = vertexAData
		// When
		let vertexResult = sut.createVertex(data: data)
		// Then
		XCTAssertEqual(vertexResult.data, data, "Vertex data should be \(vertexAData)")
		XCTAssertFalse(sut.dict.isEmpty, "Data dictionary should not be empty")
	}
	
	func testAddDirectedEge() {
		// Given
		sut.dict[vertexAFake] = []	// vertex A exists in dictionary without edges
		// When
		sut.add(.directed,from: vertexAFake, to: vertexBFake, weight: 3.0)
		// Then
		XCTAssertEqual(sut.dict[vertexAFake]?.count, 1, "A new edge should be added to edges array")
	}
	
	func testAddUndirectedEge() {
		// Given
		sut.dict[vertexAFake] = []	// vertex A exists in dictionary without edges
		sut.dict[vertexBFake] = []	// vertex A exists in dictionary without edges
		// When
		sut.add(.undirected, from: vertexAFake, to: vertexBFake, weight: 2.4)
		// Then
		XCTAssertEqual(sut.dict[vertexAFake]?.count, 1, "A new edge should be added to A's edges array")
		XCTAssertEqual(sut.dict[vertexBFake]?.count, 1, "A new edge should be added to B's edges array")
	}
	
	func testWeight_fromVertexBToVertexA_shouldBeNotNil() {
		// Given
		sut = GraphFake().graph
		let expectedWeight = 5.0 // Defined in GraphFake object test
		// When
		let weightResult = sut.weight(from: vertexBFake, to: vertexAFake)
		// Then
		XCTAssertEqual(weightResult, expectedWeight, "Weight result should be \(expectedWeight)")
	}
	
	func testWeight_fromUnknownPath_shouldBeNil() {
		// Given
		sut = GraphFake().graph
		// When
		let weightResult = sut.weight(from: vertexBFake, to: vertexCFake)
		// Then
		XCTAssertNil(weightResult, "Result should be nil due path doesn't exists")
	}
	
	func testGetEdgesFromVertex() {
		// Given
		let graphFake = GraphFake()
		sut = graphFake.graph
		// When
		guard let edges = sut.edges(from: graphFake.vertexAFake) else {
			XCTFail("Should exist edges for Vertex A in [SUT]")
			return
		}
		// Then
		XCTAssertFalse(edges.isEmpty, "Edges should be not empty")
		XCTAssertEqual(edges.count, 2, "Should exist 2 edges for Vertex A")
	}
	
	static var allTests = [
		testAdjacencyListData_shouldBeEmptyByDefault,
	]
}
