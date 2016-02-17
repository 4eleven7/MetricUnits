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
}

enum WeightUnit: Double
{
	case Kilogram = 1_000
}

extension Double
{
	var kg: Weight {
		return Weight(rawValue: self, unit: .Kilogram)
	}
}
