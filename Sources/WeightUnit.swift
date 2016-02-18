//
//  WeightUnit.swift
//  MetricUnits
//
//  Created by Daniel Love on 16/02/2016.
//  Copyright © 2016 Daniel Love, and Shh Love Limited. All rights reserved.
//

import Foundation

public typealias Weight = MetricUnit<WeightUnit>

public enum WeightUnit: Double, MetricUnitType
{
	case Milligrams = 0.001
	case Grams = 1
	case Kilograms = 1_000
	
	public static var baseUnit: WeightUnit {
		return .Grams
	}
}

public extension Double
{
	var mg: Weight { return self.milligrams }
	var milligrams: Weight {
		return MetricUnit(rawValue: self, unit: WeightUnit.Milligrams)
	}
	
	var g: Weight { return self.grams }
	var grams: Weight {
		return MetricUnit(rawValue: self, unit: WeightUnit.Grams)
	}
	
	var kg: Weight { return self.kilograms }
	var kilograms: Weight {
		return MetricUnit(rawValue: self, unit: WeightUnit.Kilograms)
	}
}
