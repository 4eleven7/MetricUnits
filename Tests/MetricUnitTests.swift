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
		let darius = TestRandom(rawValue: 1, unit: .Person)
		let mark = TestRandom(rawValue: 1, unit: .Person)
		
		let combined = darius + mark
		XCTAssertEqual(combined.rawValue, 168, "Sewing two people together creates twins. This one should weigh 168. I call him Marius.")
		XCTAssertEqual(combined.unit, TestRandomWeightsUnit.Person, "We should be getting a Persons weight back")
	}
	
	func testSubtractionOperation()
	{
		let chicken = TestRandom(rawValue: 1, unit: .Chicken)
		let feathers = TestRandom(rawValue: 175, unit: .Feathers)
		
		let pluck = chicken - feathers
		XCTAssertEqual(pluck.rawValue, 15, "If you pluck 175 feathers from a chicken, your chicken should weigh 22")
		XCTAssertEqual(pluck.unit, TestRandomWeightsUnit.Chicken, "We should be getting the Chickens weight back, not the feathers")
	}
	
	enum TestRandomWeightsUnit: Double, MetricUnitType
	{
		case Feathers = 0.04
		case Chicken = 22
		
		case Person = 84
		
		static var baseUnit: TestRandomWeightsUnit {
			return .Person
		}
	}

	typealias TestRandom = MetricUnit<TestRandomWeightsUnit>
}
