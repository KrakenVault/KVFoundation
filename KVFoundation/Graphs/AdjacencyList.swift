//
//  AdjacencyList.swift
//  KVFoundation
//
//  Created by Jesús Alfredo Hernández Alarcón on 09/02/20.
//  Copyright © 2020 Jesús Alfredo Hernández Alarcón. All rights reserved.
//

import Foundation

open class AdjacencyList<T: Hashable>{
	public var dict: [Vertex<T>: [Edge<T>]] = [:]
	public init() {}
}

extension AdjacencyList: Graphable {
	public typealias Element = T
	
	public var description: CustomStringConvertible {
		return dict.description
	}
	
	public func createVertex(data: T) -> Vertex<T> {
		let newVertex = Vertex(data: data)
		// if vertex doesn't exists, then initialize the new vertex without edges
		if(dict[newVertex] == nil ){
			dict[newVertex] = []
		}
		return newVertex
	}
	
	public func add(_ edgeType: EdgeType, from source: Vertex<T>, to destination: Vertex<T>, weight: VertexWeight) {
		switch edgeType {
		case .directed:
			addDirectedEdge(from: source, to: destination, weight: weight)
		case .undirected:
			addUndirectedEdge(vertices: (source, destination), weight: weight)
		}
	}
	
	public func weight(from source: Vertex<T>, to destination: Vertex<T>) -> VertexWeight? {
		guard let edges = dict[source] else { return nil }	// Do not exist edges for source
		for edge in edges {
			if(edge.destination == destination ){
				return edge.weight
			}
		}
		return nil
	}
	
	public func edges(from source: Vertex<T>) -> [Edge<T>]? {
		return dict[source]
	}
	
	// MARK: - Private helper methods
	
	fileprivate func addDirectedEdge(from source: Vertex<T>, to destination: Vertex<T>, weight: VertexWeight) {
		let newEdge = Edge(source: source, destination: destination, weight: weight)
		dict[source]?.append(newEdge) // Adds new edge to edge's array
	}
	
	fileprivate func addUndirectedEdge(vertices: (Vertex<T>, Vertex<T>), weight: VertexWeight) {
		let (source, destination) = vertices
		addDirectedEdge(from: source, to: destination, weight: weight)
		addDirectedEdge(from: destination, to: source, weight: weight)
	}
}
