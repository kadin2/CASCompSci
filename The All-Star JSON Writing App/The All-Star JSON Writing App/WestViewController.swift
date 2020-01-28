//
//  WestViewController.swift
//  The All-Star JSON Writing App
//
//  Created by Kadin Mesriani on 1/20/20.
//  Copyright © 2020 Kadin Mesriani. All rights reserved.
//

import UIKit

class WestViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var players: [String] = []
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 5
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return frontcourt1.count
        }
        else if component == 1 {
            return frontcourt2.count
        }
        else if component == 2 {
            return backcourt1.count
        }
        else if component == 3 {
            return backcourt2.count
        }
        else {
            return backcourt3.count
        }

    }
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var label: UILabel!
    
    let frontcourt1 = ["James Harden", "Damian Lillard", "Klay Thompson", "Stephen Curry", "D'Angelo Russell", "Russell Westbrook", "Luka Doncic", "Donovan Mitchell", "Devin Booker", "Ja Morant", "Shai Gilgeous-Alexander", "Jrue Holiday", "Chris Paul", "Buddy Hield"]
    let frontcourt2 = ["James Harden", "Damian Lillard", "Klay Thompson", "Stephen Curry", "D'Angelo Russell", "Russell Westbrook", "Luka Doncic", "Donovan Mitchell", "Devin Booker", "Ja Morant", "Shai Gilgeous-Alexander", "Jrue Holiday", "Chris Paul", "Buddy Hield"]
    let backcourt1 = ["Kawhi Leonard", "LeBron James", "Anthony Davis", "Karl-Anthony Towns", "LaMarcus Aldridge", "Paul George", "Nikola Jokic", "Carmelo Anthony", "Kristaps Porzingis", "Brandon Ingram", "Hassan Whiteside", "Rudy Gobert", "Demar DeRozan", "Deandre Ayton"]
    let backcourt2 = ["Kawhi Leonard", "LeBron James", "Anthony Davis", "Karl-Anthony Towns", "LaMarcus Aldridge", "Paul George", "Nikola Jokic", "Carmelo Anthony", "Kristaps Porzingis", "Brandon Ingram", "Hassan Whiteside", "Rudy Gobert", "Demar DeRozan", "Deandre Ayton"]
    let backcourt3 = ["Kawhi Leonard", "LeBron James", "Anthony Davis", "Karl-Anthony Towns", "LaMarcus Aldridge", "Paul George", "Nikola Jokic", "Carmelo Anthony", "Kristaps Porzingis", "Brandon Ingram", "Hassan Whiteside", "Rudy Gobert", "Demar DeRozan", "Deandre Ayton"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let existingTeam: String? = try? String(contentsOf: getNameFileURL())
        label.text = "\(existingTeam ?? "")"
        
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 { return frontcourt1 [row]
        }
        else if component == 1 {
            return frontcourt2 [row]
        }
        else if component == 2 {
            return backcourt1 [row]
        }
        else if component == 3 {
            return backcourt2 [row]
        }
        else {
            return backcourt3 [row]
        }

    }
    
    @IBAction func buttonClick(_ sender: Any) {
        let frontcourt1Row = pickerView.selectedRow(inComponent: 0)
        let FirstFrontPlayer = frontcourt1[frontcourt1Row]
        let frontcourt2Row = pickerView.selectedRow(inComponent: 1)
        let SecondFrontPlayer = frontcourt2[frontcourt2Row]
        let backcourt1Row = pickerView.selectedRow(inComponent: 2)
        let FirstBackPlayer = backcourt1[backcourt1Row]
        let backcourt2Row = pickerView.selectedRow(inComponent: 3)
        let SecondBackPlayer = backcourt2[backcourt2Row]
        let backcourt3Row = pickerView.selectedRow(inComponent: 4)
        let ThirdBackPlayer = backcourt3[backcourt3Row]
        
        players = [FirstFrontPlayer, SecondFrontPlayer, FirstBackPlayer, SecondBackPlayer, ThirdBackPlayer]
        
        label.text = " "+frontcourt1[frontcourt1Row]+" at Point Guard\n "+frontcourt2[frontcourt2Row]+" at Shooting Guard\n "+backcourt1[backcourt1Row]+" at Small Forward\n "+backcourt2[backcourt2Row]+" at Power Foward\n "+backcourt3[backcourt3Row]+" at Center"
    }
    
    func getNameFileURL() -> URL {
        let documentURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        return documentURL.appendingPathComponent("username.txt")
    }
    
    @IBAction func saveTeam(_ sender: Any) {
        let saver = label.text!
        try! saver.write(to: getNameFileURL(), atomically: true, encoding: .utf8)
        
    }
    
    @IBAction func resetTeam(_ sender: Any) {
        try? FileManager.default.removeItem(at: getNameFileURL())
        label.text = ""
    }
}

