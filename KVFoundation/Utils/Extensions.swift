//
//  UIView+Extensions.swift
//  Metro CDMX
//
//  Created by Jesús Alfredo Hernández Alarcón on 08/03/20.
//  Copyright © 2020 Jesús Alfredo Hernández Alarcón. All rights reserved.
//

import UIKit

extension UIView {
	public func findViewController() -> UIViewController? {
		if let nextResponder = self.next as? UIViewController {
			return nextResponder
		} else if let nextResponder = self.next as? UIView {
			return nextResponder.findViewController()
		} else {
			return nil
		}
	}
}

extension Array where Element: Equatable {
	public mutating func removeDuplicates() {
		var result = [Element]()
		for value in self {
			if !result.contains(value) {
				result.append(value)
			}
		}
		self = result
	}
}

extension UIViewController {
	
	public func setLargeTitleDisplayMode(_ largeTitleDisplayMode: UINavigationItem.LargeTitleDisplayMode) {
		switch largeTitleDisplayMode {
		case .automatic:
			guard let navigationController = navigationController else { break }
			if let index = navigationController.children.firstIndex(of: self) {
				setLargeTitleDisplayMode(index == 0 ? .always : .never)
			} else {
				setLargeTitleDisplayMode(.always)
			}
		case .always, .never:
			navigationItem.largeTitleDisplayMode = largeTitleDisplayMode
			// Even when .never, needs to be true otherwise animation will be broken on iOS11, 12, 13
			navigationController?.navigationBar.prefersLargeTitles = true
		@unknown default:
			assertionFailure("\(#function): Missing handler for \(largeTitleDisplayMode)")
		}
	}
}
