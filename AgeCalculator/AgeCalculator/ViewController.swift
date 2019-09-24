//
//  ViewController.swift
//  AgeCalculator
//
//  Created by Kadin Mesriani on 9/19/19.
//  Copyright © 2019 Kadin Mesriani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
     
    @IBOutlet weak var textBox: UITextField!
    @IBOutlet weak var onlySwitch: UISwitch!
    @IBOutlet weak var onlyButton: UIButton!
    @IBOutlet weak var theOnlyLabelTwo: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    var age = 0
    var thisYear = 2019
    var birthYear = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func getYear(_ sender: UIButton) {
        var putInAge = (Int(textBox.text!) ?? -1) 
        if putInAge > -1 {
            let bornBorn = thisYear - putInAge + birthYear
            theOnlyLabelTwo.text = "\(bornBorn)"
        } else {
            theOnlyLabelTwo.text = "Please Enter a Valid Age"
        }
    }
    
    @IBAction func TheSwitch( sender: UISwitch){
            if onlySwitch.isOn {
                birthYear = 0
            } else {
                birthYear = -1
            }
        }
        
    }

    


