//
//  LengthUnitTests.swift
//  MetricUnits
//
//  Created by Daniel Love on 18/02/2016.
//  Copyright © 2016 Daniel Love, and Shh Love Limited. All rights reserved.
//

import XCTest
@testable import MetricUnits

class LengthUnitTests: XCTestCase
{
	func testAllLengthUnits()
	{
		XCTAssertEqual(0.5.metres, 500.millimetres, "Milligrams should equal 0.5 metres")
		
		XCTAssertEqual(2.metres, 200.centimetres, "Centigram should equal 2 metres")
		
		XCTAssertEqual(3.metres, 30.decimetres, "Decigrams should equal 3 metres")
		
		XCTAssertEqual(40.metres, 4.dekametres, "Dekagrams should equal 40 metres")
		
		XCTAssertEqual(500.metres, 5.hectometres, "Hectograms should equal 500 metres")
		
		XCTAssertEqual(1_500.metres, 1.5.kilometres, "Kilograms should equal 1,500 metres")
	}
}
