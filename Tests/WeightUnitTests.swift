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
	func testWeightInKilograms()
	{
		let weight = 84.kg
		XCTAssertEqual(weight.rawValue, 84, "Weight should equal 84 kilograms")
		
		let target = 80.kilograms
		XCTAssertEqual(target.rawValue, 80, "Target weight should equal 80 kilograms")
	}
	
	func testExactWeightInKilograms()
	{
		let weight = 84.4.kg
		XCTAssertEqual(weight.rawValue, 84.4, "Weight should equal 84.4 kilograms")
		
		let target = 80.2.kilograms
		XCTAssertEqual(target.rawValue, 80.2, "Target weight should equal 80.2 kilograms")
	}
	
	func testConvertingKilogramsToGrams()
	{
		let kilograms = 120.kg
		XCTAssertEqual(kilograms.rawValue, 120, "Weight should equal 120 kilograms")
		
		let grams = kilograms.to(.Grams)
		XCTAssertEqual(grams.rawValue, 120_000, "Weight should equal 120,000 grams")
	}
	
	func testConvertingGramsToKilograms()
	{
		let grams = 540.g
		XCTAssertEqual(grams.rawValue, 540, "Weight should equal 540 grams")
		
		let kilograms = grams.to(.Kilograms)
		XCTAssertEqual(kilograms.rawValue, 0.54, "Weight should equal 0.54 kilograms")
	}
	
	func testConvertingKilogramsToMilligrams()
	{
		let kilograms = 45.kg
		XCTAssertEqual(kilograms.rawValue, 45, "Weight should equal 45 kilograms")
		
		let milligrams = kilograms.to(.Milligrams)
		XCTAssertEqual(milligrams.rawValue, 45_000_000, "Weight should equal 45,000,000 milligrams")
	}
	
	func testConvertingMilligramsToKilograms()
	{
		let milligrams = 8_000_000.mg
		XCTAssertEqual(milligrams.rawValue, 8_000_000, "Weight should equal 8,000,000 milligrams")
		
		let kilograms = milligrams.to(.Kilograms)
		XCTAssertEqual(kilograms.rawValue, 8, "Weight should equal 8 kilograms")
	}
}
