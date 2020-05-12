//
//  Helpers.swift
//  app
//
//  Created by kayuri on 10/10/18.
//  Copyright © 2018 Kajal Patel. All rights reserved.
//
import UIKit

extension UITextView {
    func underlined(){
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.lightGray.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}
