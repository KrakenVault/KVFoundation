//
//  Vertex.swift
//  KVFoundation
//
//  Created by Jesús Alfredo Hernández Alarcón on 09/02/20.
//  Copyright © 2020 Jesús Alfredo Hernández Alarcón. All rights reserved.
//

import Foundation

public struct Vertex<T: Hashable> {
	public var data: T
}

extension Vertex: Hashable {
	static public func ==(lhs: Vertex, rhs: Vertex) -> Bool {
		return lhs.data == rhs.data
	}
}
