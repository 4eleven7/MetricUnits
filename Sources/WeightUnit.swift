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
	case Centigrams = 0.01
	case Decigrams = 0.1
	case Grams = 1
	case Dekagrams = 10
	case Hectograms = 100
	case Kilograms = 1_000
	case Ton = 1_000_000
	
	public static var baseUnit: WeightUnit
	{
		return .Grams
	}
}

public extension Double
{
	var mg: Weight {
		return self.milligrams
	}
	
	var g: Weight {
		return self.grams
	}
	
	var kg: Weight {
		return self.kilograms
	}
}

public extension Double
{
	var milligrams: Weight {
		return MetricUnit(rawValue: self, unit: WeightUnit.Milligrams)
	}
	
	var centigrams: Weight {
		return MetricUnit(rawValue: self, unit: WeightUnit.Centigrams)
	}
	
	var decigrams: Weight {
		return MetricUnit(rawValue: self, unit: WeightUnit.Decigrams)
	}
	
	var grams: Weight {
		return MetricUnit(rawValue: self, unit: WeightUnit.Grams)
	}
	
	var dekagrams: Weight {
		return MetricUnit(rawValue: self, unit: WeightUnit.Dekagrams)
	}
	
	var hectograms: Weight {
		return MetricUnit(rawValue: self, unit: WeightUnit.Hectograms)
	}
	
	var kilograms: Weight {
		return MetricUnit(rawValue: self, unit: WeightUnit.Kilograms)
	}
	
	var ton: Weight {
		return MetricUnit(rawValue: self, unit: WeightUnit.Ton)
	}
}
