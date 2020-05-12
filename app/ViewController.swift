//
//  ViewController.swift
//  CleanLiving
//
//  Created by Kajal on 10/4/18.
//  Copyright © 2018 Kajal Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {
    var gradientLayer: CAGradientLayer!
    
    
    @IBOutlet weak var textViewBox: UITextView!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textViewBox.underlined()
        
        textViewBox.text = "Enter all ingredients separated with commas (ex: sugar, water, salt)"
        textViewBox.textColor = UIColor.gray
        textViewBox.font = UIFont(name: "HelveticaNeue-Thin", size: 25.0)
        textViewBox.returnKeyType = .done

        textViewBox.delegate = self
        textViewBox.layer.backgroundColor = UIColor.white.cgColor
        textViewBox.layer.borderColor = UIColor.gray.cgColor
        textViewBox.layer.borderWidth = 0.0
        
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.blue.cgColor
        button.backgroundColor = UIColor.white
        button.layer.cornerRadius = 5
        button.setTitleColor(UIColor.white, for: UIControlState.selected)
        button.setTitleColor(UIColor.blue, for: UIControlState.normal)
      
        
        textViewBox.layer.cornerRadius = 10
        textViewBox.layer.masksToBounds = true
        textViewBox.layer.shadowRadius = 2.0
        textViewBox.layer.shadowColor = UIColor.black.cgColor
        textViewBox.layer.shadowOffset = CGSize.init(width: 2.0, height: 2.0)
        textViewBox.layer.shadowOpacity = 0.5
        textViewBox.layer.shadowRadius = 2.0
    }
        
    @IBAction func buttonTapped(_ sender: Any) {
        
            if self.button.backgroundColor == UIColor.white {
                self.button.backgroundColor = UIColor.blue
            }
            else if self.button.backgroundColor == UIColor.blue {
                self.button.backgroundColor = UIColor.white
            }
    
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is ViewController2 {
            let vc = segue.destination as? ViewController2
            vc?.myText = textViewBox.text!
        }
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Enter all ingredients separated with commas (ex: sugar, water, salt)" {
            textView.text = ""
            textView.textColor = UIColor.black
            textView.font = UIFont(name: "HelveticaNeue-Thin", size: 25.0)
        }
    }
        
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
        }
        return true
    }
        
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == "" {
            textView.text = "Enter all ingredients separated with commas (ex: sugar, water, salt)"
            textView.textColor = UIColor.lightGray
            textView.font = UIFont(name: "HelveticaNeue-Thin", size: 25.0)
        }
    }
    
    
    
    
    func createGradientLayer() {
        gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = self.view.bounds
        
        gradientLayer.colors = [UIColor.init(red:0.01, green:0.93, blue:0.87, alpha:1.0).cgColor, UIColor.init(red:0.01, green:0.71, blue:0.93, alpha:1.0).cgColor, UIColor.init(red:0.01, green:0.43, blue:0.93, alpha:1.0).cgColor]
        
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        createGradientLayer()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

