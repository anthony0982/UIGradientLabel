# UIGradientLabel v 0.1
Custom UILabel subclass with gradient background.

![Screenshot](https://github.com/alexbtlv/UIGradientLabel/blob/master/UIGradientLabel_demo.png)

Gradient Label is tested on iOS8. Written in SWIFT.

## Installation

Simply add the file UIGradientLabel.swift in your project

*Pod UIGradientLabel is coming soon.*

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

// By default GradientOrientation is set to .Vertical you can choose between .Horizontal or .Vertical if you want to
grayLabel.gradientOrientation = .Horizontal

// Set text color and font as usual
grayLabel.textColor = UIColor.whiteColor()
grayLabel.font = UIFont(name: "Helvetica neue", size: 25)

// When you are ready to go just add it to its parrent view        
view.addSubview(grayLabel)

```
## Example
![Example](https://github.com/alexbtlv/UIGradientLabel/blob/master/UIGradientLabel_example.png)

## Liscense

Released under the [MIT license](LICENSE).


<form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
<input type="hidden" name="cmd" value="_donations">
<input type="hidden" name="business" value="alexander@postys.co">
<input type="hidden" name="lc" value="US">
<input type="hidden" name="item_name" value="Alexander Batalov">
<input type="hidden" name="no_note" value="0">
<input type="hidden" name="currency_code" value="USD">
<input type="hidden" name="bn" value="PP-DonationsBF:btn_donate_SM.gif:NonHostedGuest">
<input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_donate_SM.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
<img alt="" border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" height="1">
</form>


