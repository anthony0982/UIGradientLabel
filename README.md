# UIGradientLabel
Custom UILabel subclass with gradient background.


Gradient Label is tested on iOS8. Written in SWIFT.

## Usage

``` swift

// Inittialize gradient label like regulal label
let grayLabel = UIGradientLabel(frame: CGRect(x: 0, y: 320, width: self.view.bounds.width, height: 70))

// Set text
grayLabel.text = "UIGradientLabel"

// By default background color is UIColor.clearColor() to set gradient please apply fromColor ( UIColor value )
grayLabel.fromColor = UIColor(red: 43/255, green: 43/255, blue: 43/255, alpha: 1)

// Set toColor Value
grayLabel.toColor = UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 1)

// By default GradientOrientation is set to .Vertical you can choose between .Horizontal or .Vertical if you want like so
grayLabel.gradientOrientation = .Horizontal

// Set text color and font as usual
grayLabel.textColor = UIColor.whiteColor()
grayLabel.font = UIFont(name: "Helvetica neue", size: 25)

// When you are ready to go just add it to its parrent view        
view.addSubview(grayLabel)

```
## Example

## Installation

Simply add the file UIGradientLabel.swift in your project

