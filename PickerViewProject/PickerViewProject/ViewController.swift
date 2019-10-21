//
//  ViewController.swift
//  PickerViewProject
//
//  Created by Kadin Mesriani on 10/21/19.
//  Copyright © 2019 Kadin Mesriani. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return breadFlavors.count
    }
    

    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var label: UILabel!
    
    let breadFlavors = ["Garlic", "Jalapeno", "Scallion", "Recycled", "Squid Ink"]
    
    let breadPrices = ["$5.00","$5.50","$6.50","$1.00","$3,000.00"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return breadFlavors [row]
    }
    
    @IBAction func buttonClick(_ sender: Any) {
        let row = pickerView.selectedRow(inComponent: 0)
        label.text = "You ordered: "+breadFlavors[row]+" Bread for "+breadPrices[row]
    }
    
}

