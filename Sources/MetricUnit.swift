//
//  MetricUnit.swift
//  MetricUnits
//
//  Created by Daniel Love on 16/02/2016.
//  Copyright © 2016 Daniel Love, and Shh Love Limited. All rights reserved.
//

import Foundation

struct MetricUnit<T: MetricUnitType>
{
	let rawValue: Double
	let unit: T
	
	private var quanity: Double {
		return rawValue * unit.rawValue
	}
	
	func to(toUnit: T) -> MetricUnit<T>
	{
		return MetricUnit(rawValue: quanity / toUnit.rawValue, unit: toUnit)
	}
}

protocol MetricUnitType
{
	typealias T
	static var baseUnit: T { get }
	
	var rawValue: Double { get }
}

func + <T: MetricUnitType>(lhs: MetricUnit<T>, rhs: MetricUnit<T>) -> MetricUnit<T>
{
	let unit = lhs.unit
	let addition = rhs.to(unit).quanity
	return MetricUnit(rawValue: lhs.quanity + addition, unit: unit)
}

func - <T: MetricUnitType>(lhs: MetricUnit<T>, rhs: MetricUnit<T>) -> MetricUnit<T>
{
	let unit = lhs.unit
	let subtraction = rhs.to(unit).quanity
	return MetricUnit(rawValue: lhs.quanity - subtraction, unit: unit)
}
