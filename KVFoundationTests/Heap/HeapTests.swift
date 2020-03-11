//
//  HeapTests.swift
//  KVFoundationTests
//
//  Created by Jesús Alfredo Hernández Alarcón on 09/02/20.
//  Copyright © 2020 Jesús Alfredo Hernández Alarcón. All rights reserved.
//

import XCTest
@testable import KVFoundation

class HeapTests: XCTestCase {
	var sut: Heap<Int>!
	
    override func setUp() {
		let elements = [7, 5, 2, 4, 3, 1]
		sut = Heap(elements: elements, priorityFunction: > )
    }

    override func tearDown() {
        sut = nil
    }

    func testPeek_whenElementsIsNotEmpty() {
		// When
		let element = sut.peek()
		// Then
		XCTAssertNotNil(element, "Element should be not nil")
    }
	
	func testIsRoot() {
		XCTAssertTrue(sut.isRoot(0))
		XCTAssertFalse(sut.isRoot(1))
	}
	
	func testLeftChildIndex() {
		XCTAssertEqual(sut.leftChildIndex(of: 0), 1)
		XCTAssertEqual(sut.leftChildIndex(of: 1), 3)
		XCTAssertEqual(sut.leftChildIndex(of: 2), 5)
	}
	
	func testRightChildIndex() {
		XCTAssertEqual(sut.rightChildIndex(of: 0), 2)
		XCTAssertEqual(sut.rightChildIndex(of: 1), 4)
		XCTAssertEqual(sut.rightChildIndex(of: 2), 6)
	}
	
	func testParentIndex() {
		XCTAssertEqual(sut.parentIndex(of: 0), 0)
		XCTAssertEqual(sut.parentIndex(of: 1), 0)
		XCTAssertEqual(sut.parentIndex(of: 2), 0)
		XCTAssertEqual(sut.parentIndex(of: 3), 1)
		XCTAssertEqual(sut.parentIndex(of: 6), 2)
	}
	
	func testIsHigherPriority() {
		XCTAssertTrue(sut.isHigherPriority(at: 0, than: 1))
		XCTAssertFalse(sut.isHigherPriority(at: 2, than: 1))
		XCTAssertFalse(sut.isHigherPriority(at: 5, than: 1))
	}
	
	func testHighestPriorityIndexWithParentAndChilder() {
		XCTAssertEqual(sut.highestPriorityIndex(of: 0, and: 4), 0, "Index at 0 (value = 1) should has more priority than index at 4 (value 5)")
		XCTAssertEqual(sut.highestPriorityIndex(of: 1, and: 3), 1, "Index at 1 (value = 5) should has more priority than index at 3 (value 4)")
		XCTAssertEqual(sut.highestPriorityIndex(of: 3, and: 0), 0, "Index at 3 (value = 4) should has lower priority than index at 0 (value = 7)")
	}
	
	func testHighestPriorityIndexForParentAndLeftRightIndex() {
		XCTAssertEqual(sut.highestPriorityIndex(for: 0), 0)
		XCTAssertEqual(sut.highestPriorityIndex(for: 3), 3)
		XCTAssertEqual(sut.highestPriorityIndex(for: 1), 1)
	}
	
	func testSwapElement() {
		// When
		sut.swapElement(at: 0, with: 1)
		// Then
		XCTAssertEqual(sut.elements[0], 5, "Element at index 0 should be 5")
		XCTAssertEqual(sut.elements[1], 7, "Element at index 1 should be 7")
	}
	
	func testEnqueue(){
		// When
		sut.enqueue(7)
		// Then
		XCTAssertEqual(sut.elements[2], 7, "Element at index 3 now should be 7")
		XCTAssertEqual(sut.elements[6], 2, "Element at index 8 now should be 2 due swap")
	}
	
	func testDequeue() {
		// When
		let element = sut.dequeue()
		// Then
		XCTAssertEqual(element, 7, "Dequeued element should be 7")
		XCTAssertEqual(sut.elements[0], 5, "Element at root should be 7")
		XCTAssertEqual(sut.elements[2], 2, "Element at index 2 should be 7")
		XCTAssertEqual(sut.elements[3], 1, "Element at index 3 should be 1")
	}
	
	func testBuildHeap() {
		// Given
		let elements = [0,1,2,3]
		// When
		sut = Heap(elements: elements, priorityFunction: >)
		// Then
		XCTAssertEqual(sut.elements[0], 3)
		XCTAssertEqual(sut.elements[1], 1)
	}
}
