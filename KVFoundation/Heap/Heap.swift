//
//  Heap.swift
//  KVFoundation
//
//  Created by Jesús Alfredo Hernández Alarcón on 09/02/20.
//  Copyright © 2020 Jesús Alfredo Hernández Alarcón. All rights reserved.
//

import Foundation

struct Heap<Element> {
	/// Heap elements
	var elements: [Element]
	
	/// This function takes two arguments and returns if
	/// first elemeny has hight priority than the second
	let priorityFunction: (Element, Element) -> Bool
	
	init(elements: [Element] = [], priorityFunction: @escaping ((Element, Element) -> Bool)) {
		self.elements = elements
		self.priorityFunction = priorityFunction
		buildHeap()
	}
	
	mutating func buildHeap() {
		for index in (0 ..< count/2).reversed() {
			siftDown(elementAtIndex: index)
		}
	}
	
	var isEmpty: Bool {
		return elements.isEmpty
	}
	
	var count: Int {
		return elements.count
	}
	
	func peek() -> Element? {
		return elements.first
	}
	
	mutating func enqueue(_ element: Element) {
		elements.append(element)
		siftUp(elementAtIndex: count - 1)
	}
	
	mutating func dequeue() -> Element? {
		guard !isEmpty else { return nil } // Validation when elements is empty
		swapElement(at: 0, with: count - 1)
		let rootElement = elements.removeLast()
		if !isEmpty {
			siftDown(elementAtIndex: 0)
		}
		return rootElement
	}
	
	// Helper functions
	
	func isRoot(_ index: Int) -> Bool {
		return (index == 0)
	}
	
	func leftChildIndex(of index: Int) -> Int {
		return (2 * index) + 1
	}
	
	func rightChildIndex(of index: Int) -> Int {
		return (2 * index) + 2
	}
	
	func parentIndex(of index: Int) -> Int {
		return (index - 1 ) / 2
	}
	
	func isHigherPriority(at firstIndex: Int, than secondIndex: Int) -> Bool {
		return priorityFunction(elements[firstIndex], elements[secondIndex])
	}
	
	func highestPriorityIndex(of parentIndex: Int, and childIndex: Int) -> Int {
		guard (childIndex < count) && isHigherPriority(at: childIndex, than: parentIndex) else {
			return parentIndex
		}
		return childIndex
	}
	
	func highestPriorityIndex(for parent: Int) -> Int {
		let hpi = highestPriorityIndex(of: parent, and: leftChildIndex(of: parent))
		return highestPriorityIndex(of: hpi, and: rightChildIndex(of: parent))
	}
	
	mutating func swapElement(at firstIndex: Int, with secondIndex: Int) {
		guard firstIndex != secondIndex else { return }
		elements.swapAt(firstIndex, secondIndex)
	}
	
	mutating func siftUp(elementAtIndex index: Int) {
		let parent = parentIndex(of: index)
		guard !isRoot(index), isHigherPriority(at: index, than: parent) else { return }
		swapElement(at: index, with: parent)
		siftUp(elementAtIndex: parent)
	}
	
	mutating func siftDown(elementAtIndex index: Int) {
		let hightPriorityIndex = highestPriorityIndex(for: index)
		if (hightPriorityIndex != index){
			swapElement(at: index, with: hightPriorityIndex)
			siftDown(elementAtIndex: hightPriorityIndex)
		}
	}
}
