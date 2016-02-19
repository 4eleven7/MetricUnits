# MetricUnits
Easy to use, read, and convert, units of measurement in Swift.

[![Build Status](https://travis-ci.org/4eleven7/MetricUnits.svg?branch=master)](https://travis-ci.org/4eleven7/MetricUnits)

## What it does
* Code as if you were writing (`120.kilograms`)
* Commonly used have shorthand (`120.kg`) and singular (`1.gram`), all units have plural (`2.grams`)
* Supports operators (subtract, multiply, divide, add)
* Strongly typed (no adding a kilogram to a day)
* Converts easily (days to hours)
* Supports standard Swift number formatting (`let everest = 884_800.00.cm`)
* Create typed arrays (Weight units only array)

## What it doesn’t do
* Swift doesn’t allow `kg` or `kilograms` as a postfix, so `120kg` will never be. (Prove me wrong, *is there a better way?*)
* Support Imperial
* Localisation
* Doesn’t throw on divide by zero - returns nan - pretty untested currently.

## Current supported Units
* Weights
* Lengths

I don’t like imperial, I’m a metric kind of guy. Go ahead. Fork me. Make *ImperialUnits*.
