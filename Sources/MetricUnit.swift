//
//  MetricUnit.swift
//  MetricUnits
//
//  Created by Daniel Love on 16/02/2016.
//  Copyright © 2016 Daniel Love, and Shh Love Limited. All rights reserved.
//

import Foundation

struct MetricUnit<T: MetricUnitType>: Comparable
{
	let rawValue: Double
	let unit: T
	
	func to(toUnit: T) -> MetricUnit<T>
	{
		return MetricUnit(rawValue: rawValue * unit.rawValue / toUnit.rawValue, unit: toUnit)
	}
}

protocol MetricUnitType
{
	static var baseUnit: Self { get }
	
	var rawValue: Double { get }
}

// MARK: Operators

func + <T: MetricUnitType>(lhs: MetricUnit<T>, rhs: MetricUnit<T>) -> MetricUnit<T>
{
	let left = lhs.to(T.baseUnit)
	let right = rhs.to(T.baseUnit)
	
	let unit = (left.rawValue > right.rawValue) ? lhs.unit : rhs.unit
	return MetricUnit(rawValue: lhs.to(unit).rawValue + rhs.to(unit).rawValue, unit: unit)
}

func - <T: MetricUnitType>(lhs: MetricUnit<T>, rhs: MetricUnit<T>) -> MetricUnit<T>
{
	let left = lhs.to(T.baseUnit)
	let right = rhs.to(T.baseUnit)
	
	let unit = (left.rawValue > right.rawValue) ? lhs.unit : rhs.unit
	return MetricUnit(rawValue: lhs.to(unit).rawValue - rhs.to(unit).rawValue, unit: unit)
}

func * <T: MetricUnitType>(lhs: MetricUnit<T>, rhs: MetricUnit<T>) -> MetricUnit<T>
{
	let unit = lhs.unit
	return MetricUnit(rawValue: lhs.to(unit).rawValue * rhs.to(unit).rawValue, unit: unit)
}

func / <T: MetricUnitType>(lhs: MetricUnit<T>, rhs: MetricUnit<T>) -> MetricUnit<T>
{
	let unit = rhs.unit
	return MetricUnit(rawValue: lhs.to(unit).rawValue / rhs.to(unit).rawValue, unit: unit)
}

// MARK: Comparable

func < <T: MetricUnitType>(lhs: MetricUnit<T>, rhs: MetricUnit<T>) -> Bool
{
	let left = lhs.to(T.baseUnit)
	let right = rhs.to(T.baseUnit)
	
	return left.rawValue < right.rawValue
}

func == <T: MetricUnitType>(lhs: MetricUnit<T>, rhs: MetricUnit<T>) -> Bool
{
	let left = lhs.to(T.baseUnit)
	let right = rhs.to(T.baseUnit)
	
	return left.rawValue == right.rawValue
}
