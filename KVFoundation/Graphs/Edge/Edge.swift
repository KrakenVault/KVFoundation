//
//  KVEdge.swift
//  KVFoundation
//
//  Created by Jesús Alfredo Hernández Alarcón on 09/02/20.
//  Copyright © 2020 Jesús Alfredo Hernández Alarcón. All rights reserved.
//

import Foundation

public struct Edge<T: Hashable>{
	public var source: Vertex<T>
	public var destination: Vertex<T>
	public let weight: VertexWeight
}

extension Edge: Hashable {
	static public func ==(lhs: Edge<T>, rhs: Edge<T>) -> Bool {
		return lhs.source == rhs.source &&
			lhs.destination == rhs.destination &&
			lhs.weight == rhs.weight
	}
}
