//
//  ViewController.swift
//  PizzaPicker
//
//  Created by Kadin Mesriani on 10/16/19.
//  Copyright © 2019 Kadin Mesriani. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pizzaFlavors.count
    
    }
    
    @IBOutlet weak var pizzaScroll: UIPickerView!
    @IBOutlet weak var pizzaOrder: UILabel!
    
    let pizzaFlavors = ["Goat", "Meat Lovers", "Margherita", "Veggie Monster", "Cookie"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pizzaFlavors[row]
    }
    
    
    
    @IBAction func buttonClick(_ sender: Any) {
        let row = pizzaScroll.selectedRow(inComponent: 0)
        pizzaOrder.text = "You ordered a: "+pizzaFlavors[row]+" Pizza"
    }
    
}

