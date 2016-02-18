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
		XCTAssertTrue(10.mm == 1.cm, "1 centimetre should equal 10 millimetres")
		
		XCTAssertTrue(10.cm == 1.decimetres, "1 decimetre should equal 10 centimetre")
		
		XCTAssertTrue(10.decimetres == 1.metres, "1 decimetre should equal 1 metre")
		
		XCTAssertTrue(10.metres == 1.dekametres, "1 dekametre should equal 10 metres")
		
		XCTAssertTrue(10.dekametres == 1.hectometres, "1 hectometres should equal 10 dekametres")
		
		XCTAssertTrue(10.hectometres == 1.kilometres, "1 kilometres should equal 10 hectometres")
	}
}
