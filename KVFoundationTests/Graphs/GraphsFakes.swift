//
//  GraphsFakes.swift
//  KVFoundationTests
//
//  Created by Jesús Alfredo Hernández Alarcón on 09/02/20.
//  Copyright © 2020 Jesús Alfredo Hernández Alarcón. All rights reserved.
//

import Foundation
@testable import KVFoundation

// Fake vertex data
let vertexAData = "Station_A"
let vertexBData = "Station_B"
let vertexCData = "Station_C"

// Fake Vertices
let vertexAFake = Vertex(data: vertexAData)
let vertexBFake = Vertex(data: vertexBData)
let vertexCFake = Vertex(data: vertexCData)

// Fake edges
let edgeFakeAtoB = Edge<String>(source: vertexAFake, destination: vertexBFake, weight: 3.0)
let edgeFakeBtoA = Edge<String>(source: vertexBFake, destination: vertexAFake, weight: 5.0)

let edgeFakeAtoC = Edge<String>(source: vertexAFake, destination: vertexCFake, weight: 7.0)
let edgeFakeCtoA = Edge<String>(source: vertexCFake, destination: vertexAFake, weight: 1.0)


// MARK: - Fake graph

class GraphFake {
	// Fake vertex data
	let vertexAData = "Station_A"
	let vertexBData = "Station_B"
	let vertexCData = "Station_C"
	
	// Vertices
	var vertexAFake: Vertex<String>!
	var vertexBFake: Vertex<String>!
	var vertexCFake: Vertex<String>!
	
	// Graph
	var graph: AdjacencyList<String>!
	
	init() {
		graph = AdjacencyList<String>()
		vertexAFake = graph.createVertex(data: vertexAData)
		vertexBFake = graph.createVertex(data: vertexBData)
		vertexCFake = graph.createVertex(data: vertexCData)
		graph.add(.directed, from: vertexAFake, to: vertexBFake, weight: 3.0)
		graph.add(.directed, from: vertexBFake, to: vertexAFake, weight: 5.0)
		graph.add(.directed, from: vertexAFake, to: vertexCFake, weight: 7.0)
		graph.add(.directed, from: vertexCFake, to: vertexAFake, weight: 1.0)
	}
}
