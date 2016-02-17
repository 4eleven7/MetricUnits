//
//  WeightUnit.swift
//  MetricUnits
//
//  Created by Daniel Love on 16/02/2016.
//  Copyright © 2016 Daniel Love, and Shh Love Limited. All rights reserved.
//

import Foundation

struct Weight
{
	let rawValue: Double
	let unit: WeightUnit
	
	func to(toUnit: WeightUnit) -> Weight
	{
		let base = rawValue * unit.rawValue
		return Weight(rawValue: base / toUnit.rawValue, unit: toUnit)
	}
}

enum WeightUnit: Double
{
	case Grams = 1
	case Kilograms = 1_000
}

extension Double
{
	var g: Weight {
		return Weight(rawValue: self, unit: .Grams)
	}
	
	var kg: Weight {
		return Weight(rawValue: self, unit: .Kilograms)
	}
}
