//
//  Localizable.swift
//  Metro CDMX
//
//  Created by Jesús Alfredo Hernández Alarcón on 03/02/20.
//  Copyright © 2020 Jesús Alfredo Hernández Alarcón. All rights reserved.
//

import Foundation

public protocol Localizable {
	var tableName: String { get }
	var localized: String { get }
}

extension Localizable where Self: RawRepresentable, Self.RawValue == String {
	public var localized: String {
		return rawValue.localized(tableName: tableName)
	}
}
