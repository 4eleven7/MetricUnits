//
//  LengthUnit.swift
//  MetricUnits
//
//  Created by Daniel Love on 18/02/2016.
//  Copyright © 2016 Daniel Love, and Shh Love Limited. All rights reserved.
//

import Foundation

public typealias Length = MetricUnit<LengthUnit>

public enum LengthUnit: Double, MetricUnitType
{
	case Millimetres = 0.001
	case Centimetres = 0.01
	case Decimetres = 0.1
	case Metres = 1
	case Dekametres = 10
	case Hectometres = 100
	case Kiilometres = 1_000
	
	public static var baseUnit: LengthUnit
	{
		return .Metres
	}
}

public extension Double
{
	var millimetres: Length {
		return MetricUnit(rawValue: self, unit: LengthUnit.Millimetres)
	}
	
	var centimetres: Length {
		return MetricUnit(rawValue: self, unit: LengthUnit.Centimetres)
	}
	
	var decimetres: Length {
		return MetricUnit(rawValue: self, unit: LengthUnit.Decimetres)
	}

	var metres: Length {
		return MetricUnit(rawValue: self, unit: LengthUnit.Metres)
	}
	
	var dekametres: Length {
		return MetricUnit(rawValue: self, unit: LengthUnit.Dekametres)
	}
	
	var hectometres: Length {
		return MetricUnit(rawValue: self, unit: LengthUnit.Hectometres)
	}
	
	var kilometres: Length {
		return MetricUnit(rawValue: self, unit: LengthUnit.Kiilometres)
	}
}

public extension Double
{
// MARK: Singular
	
	var millimetre: Length {
		return self.millimetres
	}
	
	var centimetre: Length {
		return self.centimetres
	}
	
	var metre: Length {
		return self.metres
	}
	
	var kilometre: Length {
		return self.kilometres
	}
	
// MARK: Convenience
	
	var mm: Length {
		return self.millimetres
	}
	
	var cm: Length {
		return self.centimetres
	}
	
	var m: Length {
		return self.metres
	}
	
	var km: Length {
		return self.kilometres
	}
}
