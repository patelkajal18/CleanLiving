//
//  ViewController2.swift
//  app
//
//  Created by kayuri on 10/7/18.
//  Copyright © 2018 Kajal Patel. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var circleLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var number: UILabel!
    var gradientLayer: CAGradientLayer!
    let shapeLayer = CAShapeLayer()
    
    var listCancer:[String] = [" bacon", " sausage", " hot dog", " pepperoni", " prosciutto", " beef jerky", " salami", " acetaldehyde", " acheson process", " acid mist", " aflatoxin", " 4-Aminobiphenyl", " areca nut", " aristolochic acid", " arsenic", " asbestos", " auramine production", " azathioprine", " benzene", " betel quid", " coal", " ethanol", " ethylene oxide", " formaldehyde", " isopropyl alcohol", " 2-Naphthylamine", " 3,4,5,3’,4’-Pentachlorobiphenyl",  " 2,3,4,7,8-Pentachlorodibenzofuran", " phenacetin", " salted fish", " shale oil", " silica dust", " soot", " sulfur mustard", " vinyl chloride", " wood dust"];
    var listCancer2:[String] = ["bacon", "sausage", "hot dog", "pepperoni", "prosciutto", "beef jerky", "salami", "acetaldehyde", "acheson process", "acid mist", "aflatoxin", "4-Aminobiphenyl", "areca nut", "aristolochic acid", "arsenic", "asbestos", "auramine production", "azathioprine", "benzene", "betel quid", "coal", "ethanol", "ethylene oxide", "formaldehyde", "isopropyl alcohol", "2-Naphthylamine", "3,4,5,3’,4’-Pentachlorobiphenyl",  "2,3,4,7,8-Pentachlorodibenzofuran", "phenacetin", "salted fish", "shale oil", "silica dust", "soot", "sulfur mustard", "vinyl chloride", " wood dust"];
    var matches: [String] = []
    var myText:String = ""
    var inputArr: [String] = []
    
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
    override func viewDidLoad() {
        let lower: String = myText.lowercased()
        let inputArr = lower.split(separator: ",")

        print(inputArr.count)
        
        for cancer in listCancer {
            for input in inputArr {
                if cancer == input {
                    matches.append(cancer)
                    print(cancer)
                }
                
            }
        }
        for cancer2 in listCancer2 {
            for input in inputArr {
                if cancer2 == input {
                    matches.append(cancer2)
                    print(cancer2)
                }
                
            }
        }
        print(matches)
        
        number.text = String(matches.count)
        print(matches.count)
        if (matches.count == 1) {
            label.text = matches.joined()
            circleLabel.text = "carcinogen"
        }
        else if (matches.count == 0) {
            label.text = "No carcinogens found!"
        }
        else {
            label.text = matches.joined(separator: ",")
            circleLabel.text = "carcinogens"
        }
        super.viewDidLoad()
        //label.delegate = self
        label.layer.backgroundColor = UIColor.white.cgColor
        label.layer.borderColor = UIColor.gray.cgColor
        label.layer.borderWidth = 0.0
        label.layer.cornerRadius = 10
        label.layer.masksToBounds = true
        label.layer.shadowRadius = 2.0
        
        backButton.layer.borderWidth = 1.0
        backButton.layer.borderColor = UIColor.blue.cgColor
        backButton.backgroundColor = UIColor.clear
        backButton.layer.cornerRadius = 5
        backButton.setTitleColor(UIColor.white, for: UIControlState.selected)
        backButton.setTitleColor(UIColor.blue, for: UIControlState.normal)
        
        //drawing a circle
        
        let center = view.center
        
        //creating track layer
        let trackLayer = CAShapeLayer()
        
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: 208, y: 320), radius: 125, startAngle: -CGFloat.pi / 2, endAngle: 2*CGFloat.pi, clockwise: true)
      
        trackLayer.path = circularPath.cgPath
        
        //circle color
        trackLayer.strokeColor = UIColor.black.cgColor
        trackLayer.lineWidth = 20
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineCap = kCALineCapRound
        view.layer.addSublayer(trackLayer)
 
        shapeLayer.path = circularPath.cgPath
        
        shapeLayer.strokeColor = UIColor.white.cgColor
        shapeLayer.lineWidth = 20
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = kCALineCapRound
       
       
       
        shapeLayer.strokeEnd = 0
        
        view.layer.addSublayer(shapeLayer)
        
      
        animateCircle()
        
    }
    
    
    @IBAction func backButtonTapped(_ sender: Any) {
        if self.backButton.backgroundColor == UIColor.clear {
            self.backButton.backgroundColor = UIColor.blue
        }
        else if self.backButton.backgroundColor == UIColor.blue {
            self.backButton.backgroundColor = UIColor.clear
        }
    }
    
    private func percentOfCancer() {
        print("Attempting to find the amount of carcinogens")
        
        
    }
    
    private func animateCircle() {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        //creating sample array of ingredients

        let countMatchCar = matches.count
        print(inputArr.count)
        print(matches.count)
        if countMatchCar == 0 {
            basicAnimation.toValue = 0
        }
        else if countMatchCar == inputArr.count {
            basicAnimation.toValue = 1
        }
        else {
            if countMatchCar == 1 {
                basicAnimation.toValue = 0.05
            }
            else if countMatchCar == 2 {
                basicAnimation.toValue = 0.1
            }
            else if countMatchCar == 3 {
                basicAnimation.toValue = 0.15
            }
            else if countMatchCar == 4 {
                basicAnimation.toValue = 0.2
            }
            else if countMatchCar == 5 {
                basicAnimation.toValue = 0.25
            }
            else if countMatchCar == 6 {
                basicAnimation.toValue = 0.3
            }
            else if countMatchCar == 7 {
                basicAnimation.toValue = 0.35
            }
            else if countMatchCar == 8 {
                basicAnimation.toValue = 0.4
            }
            else if countMatchCar == 9 {
                basicAnimation.toValue = 0.45
            }
            else if countMatchCar == 10 {
                basicAnimation.toValue = 0.5
            }
            else if countMatchCar < 10{
                basicAnimation.toValue = 0.55;
            }
                
            else {
                basicAnimation.toValue = 0.7;
            }
        }
        
        basicAnimation.duration = 4
        
        basicAnimation.fillMode = kCAFillModeForwards
        basicAnimation.isRemovedOnCompletion = false
        
        shapeLayer.add(basicAnimation, forKey: "urSoBasic")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    
}
