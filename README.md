# MetricUnits
Easy to use, read, and convert, units of measurement in Swift.

## Do
* Code as if you were writing (`120.kilograms`)
* Commonly used have shorthand (`120.kg`) and singular (`1.gram`), all units have plural (`2.grams`)
* Supports operators (subtract, multiply, divide, add)
* Strongly typed (no adding a kilogram to a day)
* Converts easily (days to hours)
* Supports standard Swift number formatting (`let everest = 884_800.00.cm`)
* Create typed arrays (Weight units only array)

## Don’t
* Swift doesn’t allow `kg` or `kilograms` as a postfix, so `120kg` will never be. (Prove me wrong, *is there a better way?*)

## Current supported Units
* Weights
* Lengths

I don’t like imperial, I’m a metric kind of guy. Go ahead. Fork me. Make *ImperialUnits*.
