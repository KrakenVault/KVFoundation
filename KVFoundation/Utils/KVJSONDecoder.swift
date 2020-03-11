//
//  KVJSONDecoder.swift
//
//  Created by Jesús Alfredo Hernández Alarcón on 08/03/20.
//  Copyright © 2020 Kraken Vault. All rights reserved.
//

import Foundation

public final class KVJSONDecoder {
	static func decode<T: Decodable>(from fileName: String, in bundle: Bundle) -> T? {
		guard let jsonFilePath = bundle.path(forResource: fileName, ofType: "json") else { return nil }
		do {
			let data = try Data(contentsOf: URL(fileURLWithPath: jsonFilePath), options: .mappedIfSafe)
			return try JSONDecoder().decode(T.self, from: data)
		}catch {
			return nil
		}
	}
}
