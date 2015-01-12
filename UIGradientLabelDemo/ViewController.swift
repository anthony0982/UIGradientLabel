//
//  ViewController.swift
//  UIGradientLabelDemo
//
//  Created by Alexander Batalov on 1/12/15.
//  Copyright (c) 2015 Alexander Batalov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let orangeLabel = UIGradientLabel(frame: CGRect(x:0, y: 120, width: self.view.bounds.width, height: 70))
        orangeLabel.text = "UIGradientLabel"
        orangeLabel.fromColor = UIColor(red: 255/255, green: 149/255, blue: 0/255, alpha: 1)
        orangeLabel.toColor = UIColor(red: 255/255, green: 94/255, blue: 58/255, alpha: 1)
        orangeLabel.textColor = UIColor.whiteColor()
        orangeLabel.font = UIFont(name: "Helvetica neue", size: 25)
        
        view.addSubview(orangeLabel)
        
        let pinkLabel = UIGradientLabel(frame: CGRect(x: 0, y: 220, width: self.view.bounds.width, height: 70))
        pinkLabel.text = "UIGradientLabel"
        pinkLabel.fromColor = UIColor(red: 255/255, green: 94/255, blue: 58/255, alpha: 1)
        pinkLabel.toColor = UIColor(red: 255/255, green: 42/255, blue: 104/255, alpha: 1)
        pinkLabel.textColor = UIColor.whiteColor()
        pinkLabel.font = UIFont(name: "Helvetica neue", size: 25)
        
        view.addSubview(pinkLabel)
        
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
        
        let blueLabel = UIGradientLabel(frame: CGRect(x: 0, y: 420, width: self.view.bounds.width, height: 70))
        blueLabel.text = "UIGradientLabel .Horizontal"
        blueLabel.fromColor = UIColor(red: 29/255, green: 119/255, blue: 239, alpha: 1)
        blueLabel.toColor = UIColor(red: 129/255, green: 243/255, blue: 253/255, alpha: 1)
        blueLabel.gradientOrientation = .Horizontal
        blueLabel.textColor = UIColor.whiteColor()
        blueLabel.font = UIFont(name: "Helvetica neue", size: 25)
        
        view.addSubview(blueLabel)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

