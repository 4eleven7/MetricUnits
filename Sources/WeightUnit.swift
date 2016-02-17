//
//  WeightUnit.swift
//  MetricUnits
//
//  Created by Daniel Love on 16/02/2016.
//  Copyright © 2016 Daniel Love, and Shh Love Limited. All rights reserved.
//

import Foundation

typealias Weight = MetricUnit<WeightUnit>

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
