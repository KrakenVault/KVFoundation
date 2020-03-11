//
//  String+Extensions.swift
//  Metro CDMX
//
//  Created by Jesús Alfredo Hernández Alarcón on 03/02/20.
//  Copyright © 2020 Jesús Alfredo Hernández Alarcón. All rights reserved.
//

import Foundation

extension String {
	func localized(bundle: Bundle = .main, tableName: String = "Localizable") -> String {
		return NSLocalizedString(self, tableName: tableName, bundle: bundle, value: "\(self)", comment: "")
	}
}
