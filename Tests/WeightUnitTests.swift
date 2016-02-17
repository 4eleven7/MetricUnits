//
//  WeightUnitTests.swift
//  MetricUnits
//
//  Created by Daniel Love on 16/02/2016.
//  Copyright © 2016 Daniel Love, and Shh Love Limited. All rights reserved.
//

import XCTest
@testable import MetricUnits

class WeightUnitTests: XCTestCase
{
	func testMyWeightInKilograms()
	{
		let weight = 84.kg
		XCTAssertEqual(weight.rawValue, 84, "Weight should equal 84 kilograms")
	}
	
	func testMyExactWeightInKilograms()
	{
		let weight = 84.4.kg
		XCTAssertEqual(weight.rawValue, 84.4, "Weight should equal 84.4 kilograms")
	}
}
