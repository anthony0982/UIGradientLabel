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
        
        let yellowLabel = UIGradientLabel(frame: CGRect(x: 0, y: 320, width: self.view.bounds.width, height: 70))
        yellowLabel.text = "UIGradientLabel"
        yellowLabel.fromColor = UIColor(red: 255/255, green: 219/255, blue: 76/255, alpha: 1)
        yellowLabel.toColor = UIColor(red: 255/255, green: 205/255, blue: 102/255, alpha: 1)
        yellowLabel.textColor = UIColor.blackColor()
        yellowLabel.font = UIFont(name: "Helvetica neue", size: 25)
        
        view.addSubview(yellowLabel)
        
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

