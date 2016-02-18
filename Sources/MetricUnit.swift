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
	
	func to(toUnit: T) -> MetricUnit<T>
	{
		let base = rawValue * unit.rawValue
		return MetricUnit(rawValue: base / toUnit.rawValue, unit: toUnit)
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
	
	let leftValue = lhs.rawValue * unit.rawValue
	let rightValue = rhs.to(unit).rawValue * unit.rawValue
	
	return MetricUnit(rawValue: leftValue + rightValue, unit: unit)
}
