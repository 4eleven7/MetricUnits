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
	func testAdditionOperationSimple()
	{
		let water = TestRandom(rawValue: 1, unit: .Glass)
		let fizzy = TestRandom(rawValue: 1, unit: .Glass)
		
		let totalDrinks = water + fizzy
		
		XCTAssertEqual(totalDrinks.rawValue, 2, "We should have two glasses of drinks")
		XCTAssertEqual(totalDrinks.unit, TestRandomUnit.Glass, "We should be getting a Glass back")
	}
	
	func testAdditionOperationComplex()
	{
		let water = TestRandom(rawValue: 3, unit: .Glass)
		let fizzy = TestRandom(rawValue: 1, unit: .Bottle)
		let glass = TestRandom(rawValue: 1, unit: .Glass)
		
		let totalBottles = water + fizzy
		
		XCTAssertEqual(totalBottles.rawValue, 2, "We should have two bottles of drinks")
		XCTAssertEqual(totalBottles.unit, TestRandomUnit.Bottle, "We should be getting a Bottle back")
		
		let totalDrinks = glass + totalBottles
		
		XCTAssertEqualWithAccuracy(totalDrinks.rawValue, 2.3, accuracy: 0.1, "We should have two bottles of drinks")
		XCTAssertEqual(totalDrinks.unit, TestRandomUnit.Bottle, "We should be getting a Bottle back")
	}
	
	func testSubtractionOperationSimple()
	{
		let totalDrinks = TestRandom(rawValue: 42, unit: .Glass)
		let water = TestRandom(rawValue: 1, unit: .Glass)
		
		let avaliableDrinks = totalDrinks - water
		
		XCTAssertEqual(avaliableDrinks.rawValue, 41, "We should have 41 glasses of drinks remaining")
		XCTAssertEqual(avaliableDrinks.unit, TestRandomUnit.Glass, "We should be getting a Glass back")
	}
	
	func testSubtractionOperationComplex()
	{
		let totalWater = TestRandom(rawValue: 1, unit: .Bucket)
		let glasses = TestRandom(rawValue: 3, unit: .Glass)
		
		let waterRemaining = totalWater - glasses
		
		XCTAssertEqual(waterRemaining.rawValue, 0.25, "We should have a quarter of a bucket remaining")
		XCTAssertEqual(waterRemaining.unit, TestRandomUnit.Bucket, "We should be getting a Bucket back")
		
		let glassesRemaining = waterRemaining.to(.Glass)
		
		XCTAssertEqual(glassesRemaining.rawValue, 1, "We should have one glass remaining")
		XCTAssertEqual(glassesRemaining.unit, TestRandomUnit.Glass, "We should be getting a Glass back")
	}
	
	func testComparableMetricsOperation()
	{
		let oneGlass = TestRandom(rawValue: 1, unit: .Glass)
		let threeGlasses = TestRandom(rawValue: 3, unit: .Glass)
		let jug = TestRandom(rawValue: 1, unit: .Jug)
		let bucket = TestRandom(rawValue: 1, unit: .Bucket)
		
		XCTAssertTrue(bucket > jug, "A bucket is more than a jug")
		XCTAssertTrue(threeGlasses > jug, "3 glasses is more than a jug")
		XCTAssertTrue(jug > oneGlass, "A jug is more than 1 glass")
		
		XCTAssertTrue(jug < bucket, "A jug is less than a bucket")
		XCTAssertTrue(jug < threeGlasses, "A jug is less than 3 glasses")
		XCTAssertTrue(oneGlass < jug, "1 glass is less than a jug")
	}
	
	func testEquatableMetricsOperation()
	{
		let oneGlass = TestRandom(rawValue: 1, unit: .Glass)
		let twoGlasses = TestRandom(rawValue: 2, unit: .Glass)
		let jug = TestRandom(rawValue: 1, unit: .Jug)
		let largeJug = TestRandom(rawValue: 2, unit: .Jug)
		let bucket = TestRandom(rawValue: 1, unit: .Bucket)
		
		XCTAssertFalse(oneGlass == jug, "A jug should contain two glasses")
		XCTAssertTrue(twoGlasses == jug, "A jug should contain two glasses")
		XCTAssertTrue(bucket == largeJug, "A bucket should contain two jugs")
	}
	
	func testCanBeStoredInArray()
	{
		let stock:[TestRandom] = [
									TestRandom(rawValue: 1, unit: .Glass),
									TestRandom(rawValue: 2, unit: .Glass),
									TestRandom(rawValue: 3, unit: .Glass)
								]
		
		XCTAssertEqual(stock.count, 3, "Our stock count should be 3")
		XCTAssertEqual(stock[0].rawValue, 1, "We should have 1 unit of Glass")
		XCTAssertEqual(stock[1].rawValue, 2, "We should have 2 unit of Glass")
		XCTAssertEqual(stock[2].rawValue, 3, "We should have 3 unit of Glass")
		
		
	}
	
	func testCanBeStoredInDictionary()
	{
		let stock: [String: TestRandom] = [
											"cola" : TestRandom(rawValue: 2, unit: .Glass),
											"water" : TestRandom(rawValue: 7, unit: .Glass)
										]
		
		XCTAssertEqual(stock.count, 2,  "Our stock count should be 2")
		XCTAssertEqual(stock["cola"]?.rawValue, 2,  "Our stock should contain 2 cokes")
		XCTAssertEqual(stock["water"]?.rawValue, 7,  "Our stock should contain 7 waters")
	}
	
	enum TestRandomUnit: Double, MetricUnitType
	{
		case Glass = 1
		case Jug = 2
		case Bottle = 3
		case Bucket = 4
		case Ocean = 500
		
		static var baseUnit: TestRandomUnit {
			return .Glass
		}
	}

	typealias TestRandom = MetricUnit<TestRandomUnit>
}
