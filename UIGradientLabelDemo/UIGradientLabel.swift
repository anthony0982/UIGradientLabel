//
//  UIGradientLabel.swift
//  UIGradientLabelDemo
//
//  Created by Alexander Batalov on 1/12/15.
//  Copyright (c) 2015 Alexander Batalov. All rights reserved.
//

import UIKit

class UIGradientLabel: UILabel {
    
    enum GradientOrientation {
        case Horizontal, Vertical
    }
    
    var fromColor = UIColor.clear
    var toColor = UIColor.clear
    var gradientOrientation = GradientOrientation.Vertical
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)!
    }
    
    override func draw(_ rect: CGRect) {
        
        let currentContext = UIGraphicsGetCurrentContext()
        currentContext!.saveGState();
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let fromColorComponents = fromColor.cgColor.components
        let toColorComponents = toColor.cgColor.components
        var colorComponents
            = [fromColorComponents![0], fromColorComponents![1], fromColorComponents![2], fromColorComponents![3], toColorComponents![0], toColorComponents![1], toColorComponents![2], toColorComponents![3]]
        var locations:[CGFloat] = [0.0, 1.0]
        let gradient = CGGradient(colorSpace: colorSpace,colorComponents: &colorComponents,locations: &locations,count: 2)
        
        if self.gradientOrientation == .Horizontal {
            let startPoint = CGPoint(x: rect.midX, y: rect.minY)
            let endPoint = CGPoint(x: rect.midX, y: rect.maxY)
            
            currentContext!.drawLinearGradient(gradient!,start: startPoint,end: endPoint, options: CGGradientDrawingOptions(rawValue: 0))
        } else {
            let startPoint = CGPoint(x: 0, y: self.bounds.height)
            let endPoint = CGPoint(x: self.bounds.width, y: self.bounds.height)
            
            currentContext!.drawLinearGradient(gradient!,start: startPoint,end: endPoint, options: CGGradientDrawingOptions(rawValue: 0))
        }
        
        
        currentContext!.restoreGState();
        
        super.draw(rect)
    }
}

/**
 MissingHashMarkAsPrefix:   "Invalid RGB string, missing '#' as prefix"
 UnableToScanHexValue:      "Scan hex error"
 MismatchedHexStringLength: "Invalid RGB string, number of characters after '#' should be either 3, 4, 6 or 8"
 */
public enum UIColorInputError : Error {
    case missingHashMarkAsPrefix,
    unableToScanHexValue,
    mismatchedHexStringLength
}

extension UIColor {
    /**
     The shorthand three-digit hexadecimal representation of color.
     #RGB defines to the color #RRGGBB.
     
     - parameter hex3: Three-digit hexadecimal value.
     - parameter alpha: 0.0 - 1.0. The default is 1.0.
     */
    public convenience init(hex3: UInt16, alpha: CGFloat = 1) {
        let divisor = CGFloat(15)
        let red     = CGFloat((hex3 & 0xF00) >> 8) / divisor
        let green   = CGFloat((hex3 & 0x0F0) >> 4) / divisor
        let blue    = CGFloat( hex3 & 0x00F      ) / divisor
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    /**
     The shorthand four-digit hexadecimal representation of color with alpha.
     #RGBA defines to the color #RRGGBBAA.
     
     - parameter hex4: Four-digit hexadecimal value.
     */
    public convenience init(hex4: UInt16) {
        let divisor = CGFloat(15)
        let red     = CGFloat((hex4 & 0xF000) >> 12) / divisor
        let green   = CGFloat((hex4 & 0x0F00) >>  8) / divisor
        let blue    = CGFloat((hex4 & 0x00F0) >>  4) / divisor
        let alpha   = CGFloat( hex4 & 0x000F       ) / divisor
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    /**
     The six-digit hexadecimal representation of color of the form #RRGGBB.
     
     - parameter hex6: Six-digit hexadecimal value.
     */
    public convenience init(hex6: UInt32, alpha: CGFloat = 1) {
        let divisor = CGFloat(255)
        let red     = CGFloat((hex6 & 0xFF0000) >> 16) / divisor
        let green   = CGFloat((hex6 & 0x00FF00) >>  8) / divisor
        let blue    = CGFloat( hex6 & 0x0000FF       ) / divisor
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    /**
     The six-digit hexadecimal representation of color with alpha of the form #RRGGBBAA.
     
     - parameter hex8: Eight-digit hexadecimal value.
     */
    public convenience init(hex8: UInt32) {
        let divisor = CGFloat(255)
        let red     = CGFloat((hex8 & 0xFF000000) >> 24) / divisor
        let green   = CGFloat((hex8 & 0x00FF0000) >> 16) / divisor
        let blue    = CGFloat((hex8 & 0x0000FF00) >>  8) / divisor
        let alpha   = CGFloat( hex8 & 0x000000FF       ) / divisor
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    /**
     The rgba string representation of color with alpha of the form #RRGGBBAA/#RRGGBB, throws error.
     
     - parameter rgba: String value.
     */
    public convenience init(rgba_throws rgba: String) throws {
        guard rgba.hasPrefix("#") else {
            throw UIColorInputError.missingHashMarkAsPrefix
        }
        
        guard let hexString: String = rgba.substring(from: rgba.characters.index(rgba.startIndex, offsetBy: 1)),
            var   hexValue:  UInt32 = 0
            , Scanner(string: hexString).scanHexInt32(&hexValue) else {
                throw UIColorInputError.unableToScanHexValue
        }
        
        switch (hexString.characters.count) {
        case 3:
            self.init(hex3: UInt16(hexValue))
        case 4:
            self.init(hex4: UInt16(hexValue))
        case 6:
            self.init(hex6: hexValue)
        case 8:
            self.init(hex8: hexValue)
        default:
            throw UIColorInputError.mismatchedHexStringLength
        }
    }
    
    /**
     The rgba string representation of color with alpha of the form #RRGGBBAA/#RRGGBB, fails to default color.
     
     - parameter rgba: String value.
     */
    public convenience init(rgba: String, defaultColor: UIColor = UIColor.clear) {
        guard let color = try? UIColor(rgba_throws: rgba) else {
            self.init(cgColor: defaultColor.cgColor)
            return
        }
        self.init(cgColor: color.cgColor)
    }
    
    /**
     Hex string of a UIColor instance.
     
     - parameter rgba: Whether the alpha should be included.
     */
    public func hexString(_ includeAlpha: Bool) -> String {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        
        if (includeAlpha) {
            return String(format: "#%02X%02X%02X%02X", Int(r * 255), Int(g * 255), Int(b * 255), Int(a * 255))
        } else {
            return String(format: "#%02X%02X%02X", Int(r * 255), Int(g * 255), Int(b * 255))
        }
    }
    
    open override var description: String {
        return self.hexString(true)
    }
    
    open override var debugDescription: String {
        return self.hexString(true)
    }
}


