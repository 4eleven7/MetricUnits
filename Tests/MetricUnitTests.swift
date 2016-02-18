//
//  MetricUnitTests.swift
//  MetricUnits
//
//  Created by Daniel Love on 16/02/2016.
//  Copyright © 2016 Daniel Love, and Shh Love Limited. All rights reserved.
//

import XCTest
@testable import MetricUnits

class MetricUnitTests: XCTestCase
{
	func testAdditionOperation()
	{
		let john = TestRandom(rawValue: 1, unit: .Person)
		let peter = TestRandom(rawValue: 1, unit: .Person)
		
		let combined = john + peter
		XCTAssertEqual(combined.rawValue, 168, "Sewing two people together creates twins. This one should weigh 168")
	}
	
	enum TestRandomWeightsUnit: Double, MetricUnitType
	{
		case Person = 84
		
		static var baseUnit: TestRandomWeightsUnit {
			return .Person
		}
	}

	typealias TestRandom = MetricUnit<TestRandomWeightsUnit>
}
