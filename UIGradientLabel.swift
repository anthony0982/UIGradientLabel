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
    
    var fromColor = UIColor.clearColor()
    var toColor = UIColor.clearColor()
    var gradientOrientation = GradientOrientation.Vertical
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
    
    override func drawRect(rect: CGRect) {
        
        var currentContext = UIGraphicsGetCurrentContext()
        CGContextSaveGState(currentContext);
        
        var colorSpace = CGColorSpaceCreateDeviceRGB()
        var fromColorComponents = CGColorGetComponents(fromColor.CGColor)
        var toColorComponents = CGColorGetComponents(toColor.CGColor)
        var colorComponents
        = [fromColorComponents[0], fromColorComponents[1], fromColorComponents[2], fromColorComponents[3], toColorComponents[0], toColorComponents[1], toColorComponents[2], toColorComponents[3]]
        var locations:[CGFloat] = [0.0, 1.0]
        var gradient = CGGradientCreateWithColorComponents(colorSpace,&colorComponents,&locations,2)
        
        if self.gradientOrientation == .Horizontal {
            var startPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMinY(rect))
            var endPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect))
            
            CGContextDrawLinearGradient(currentContext,gradient,startPoint,endPoint, 0)
        } else {
            var startPoint = CGPointMake(0, self.bounds.height)
            var endPoint = CGPointMake(self.bounds.width, self.bounds.height)
            
            CGContextDrawLinearGradient(currentContext,gradient,startPoint,endPoint, 0)
        }
        
        
        CGContextRestoreGState(currentContext);
        
        super.drawRect(rect)
    }
}
