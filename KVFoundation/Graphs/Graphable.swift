//
//  Graphable.swift
//  KVFoundation
//
//  Created by Jesús Alfredo Hernández Alarcón on 09/02/20.
//  Copyright © 2020 Jesús Alfredo Hernández Alarcón. All rights reserved.
//

import Foundation

/// Vertex Weight type value defined as optional double
public typealias VertexWeight = Double

protocol Graphable {
	associatedtype Element: Hashable
	var description: CustomStringConvertible { get }
	
	/// Creates a Vertex from data
	///	- Parameters:
	///		- data: Vertex's data
	///
	/// - Returns:
	///		- A `Vertex` object
	func createVertex(data: Element) -> Vertex<Element>
	
	/// Provides an utility to add an edge between two vertices
	func add(_ edgeType: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>, weight: VertexWeight)
	
	/// Provides an utility to get the weight from an edge between two vertices
	func weight(from source: Vertex<Element>, to destination: Vertex<Element>) -> VertexWeight?
	
	/// Provides an utility to retrieve all the edges that `source` vertex connects to
	func edges(from source: Vertex<Element>) -> [Edge<Element>]?
}
