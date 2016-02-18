//
//  MetricUnit.swift
//  MetricUnits
//
//  Created by Daniel Love on 16/02/2016.
//  Copyright © 2016 Daniel Love, and Shh Love Limited. All rights reserved.
//

import Foundation

public struct MetricUnit<T: MetricUnitType>: Comparable
{
	let rawValue: Double
	let unit: T
	
	func to(toUnit: T) -> MetricUnit<T>
	{
		return MetricUnit(rawValue: rawValue * unit.rawValue / toUnit.rawValue, unit: toUnit)
	}
	
	private var baseUnitValue: Double
	{
		return to(T.baseUnit).rawValue
	}
}

public protocol MetricUnitType
{
	static var baseUnit: Self { get }
	
	var rawValue: Double { get }
}

// MARK: Operators

public func + <T: MetricUnitType>(lhs: MetricUnit<T>, rhs: MetricUnit<T>) -> MetricUnit<T>
{
	let unit = (lhs.baseUnitValue > rhs.baseUnitValue) ? lhs.unit : rhs.unit
	return MetricUnit(rawValue: lhs.to(unit).rawValue + rhs.to(unit).rawValue, unit: unit)
}

public func - <T: MetricUnitType>(lhs: MetricUnit<T>, rhs: MetricUnit<T>) -> MetricUnit<T>
{
	let unit = (lhs.baseUnitValue > rhs.baseUnitValue) ? lhs.unit : rhs.unit
	return MetricUnit(rawValue: lhs.to(unit).rawValue - rhs.to(unit).rawValue, unit: unit)
}

public func * <T: MetricUnitType>(lhs: MetricUnit<T>, rhs: MetricUnit<T>) -> MetricUnit<T>
{
	let unit = lhs.unit
	return MetricUnit(rawValue: lhs.to(unit).rawValue * rhs.to(unit).rawValue, unit: unit)
}

public func / <T: MetricUnitType>(lhs: MetricUnit<T>, rhs: MetricUnit<T>) -> MetricUnit<T>
{
	let unit = rhs.unit
	return MetricUnit(rawValue: lhs.to(unit).rawValue / rhs.to(unit).rawValue, unit: unit)
}

// MARK: Comparable

public func < <T: MetricUnitType>(lhs: MetricUnit<T>, rhs: MetricUnit<T>) -> Bool
{
	return lhs.baseUnitValue < rhs.baseUnitValue
}

public func == <T: MetricUnitType>(lhs: MetricUnit<T>, rhs: MetricUnit<T>) -> Bool
{
	return lhs.baseUnitValue == rhs.baseUnitValue
}
