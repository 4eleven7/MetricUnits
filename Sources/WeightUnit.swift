//
//  WeightUnit.swift
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

enum WeightUnit: Double, MetricUnitType
{
	case Grams = 1
	case Kilograms = 1_000
}

extension Double
{
	var g: Weight { return self.grams }
	var grams: Weight {
		return MetricUnit(rawValue: self, unit: WeightUnit.Grams)
	}
	
	var kg: Weight { return self.kilograms }
	var kilograms: Weight {
		return MetricUnit(rawValue: self, unit: WeightUnit.Kilograms)
	}
}

protocol MetricUnitType
{
	var rawValue: Double { get }
}

typealias Weight = MetricUnit<WeightUnit>
