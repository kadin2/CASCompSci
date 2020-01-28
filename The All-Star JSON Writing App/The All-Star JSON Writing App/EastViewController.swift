//
//  EastViewController.swift
//  The All-Star JSON Writing App
//
//  Created by Kadin Mesriani on 1/24/20.
//  Copyright © 2020 Kadin Mesriani. All rights reserved.
//

import UIKit

class EastViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    var players: [String] = []
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 5
    }
    
    func pickerView(_ pickerViewTwo: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return frontcourt1Two.count
        }
        else if component == 1 {
            return frontcourt2Two.count
        }
        else if component == 2 {
            return backcourt1Two.count
        }
        else if component == 3 {
            return backcourt2Two.count
        }
        else {
            return backcourt3Two.count
        }
        
    }
    
    
    @IBOutlet weak var pickerViewTwo: UIPickerView!
    @IBOutlet weak var labelTwo: UILabel!
    
    
    
    let frontcourt1Two = ["Kyrie Irving", "Ben Simmons", "Bradley Beal", "Kemba Walker", "Kyle Lowry", "Trae Young", "Zach LaVine", "Fred VanVleet", "Malcolm Brogdon", "Derrick Rose", "Eric Bledsoe", "Devonte' Graham", "Jaylen Brown", "Spencer Dinwiddie"]
    let frontcourt2Two = ["Kyrie Irving", "Ben Simmons", "Bradley Beal", "Kemba Walker", "Kyle Lowry", "Trae Young", "Zach LaVine", "Fred VanVleet", "Malcolm Brogdon", "Derrick Rose", "Eric Bledsoe", "Devonte' Graham", "Jaylen Brown", "Spencer Dinwiddie"]
    let backcourt1Two = ["Giannis Antetokounmpo", "Joel Embiid", "Kevin Durant", "Blake Griffin", "Khris Middleton", "Nikola Vucevic", "Pascal Siakam", "Andre Drummond", "Jimmy Butler", "Domantas Sabonis", "John Collins", "Jayson Tatum", "Bam Adebayo", "Tobias Harris"]
    let backcourt2Two = ["Giannis Antetokounmpo", "Joel Embiid", "Kevin Durant", "Blake Griffin", "Khris Middleton", "Nikola Vucevic", "Pascal Siakam", "Andre Drummond", "Jimmy Butler", "Domantas Sabonis", "John Collins", "Jayson Tatum", "Bam Adebayo", "Tobias Harris"]
    let backcourt3Two = ["Giannis Antetokounmpo", "Joel Embiid", "Kevin Durant", "Blake Griffin", "Khris Middleton", "Nikola Vucevic", "Pascal Siakam", "Andre Drummond", "Jimmy Butler", "Domantas Sabonis", "John Collins", "Jayson Tatum", "Bam Adebayo", "Tobias Harris"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let existingTeamTwo: String? = try? String(contentsOf: getNameFileURLTwo())
        labelTwo.text = "\(existingTeamTwo ?? "")"
        
        
    }
    
    func pickerView(_ pickerViewTwo: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 { return frontcourt1Two [row]
        }
        else if component == 1 {
            return frontcourt2Two [row]
        }
        else if component == 2 {
            return backcourt1Two [row]
        }
        else if component == 3 {
            return backcourt2Two [row]
        }
        else {
            return backcourt3Two [row]
        }
        
    }
    
    @IBAction func buttonClickTwo(_ sender: Any) {
    let frontcourt1TwoRow = pickerViewTwo.selectedRow(inComponent: 0)
        let FirstFrontPlayer = frontcourt1Two[frontcourt1TwoRow]
        let frontcourt2TwoRow = pickerViewTwo.selectedRow(inComponent: 1)
        let SecondFrontPlayer = frontcourt2Two[frontcourt2TwoRow]
        let backcourt1TwoRow = pickerViewTwo.selectedRow(inComponent: 2)
        let FirstBackPlayer = backcourt1Two[backcourt1TwoRow]
        let backcourt2TwoRow = pickerViewTwo.selectedRow(inComponent: 3)
        let SecondBackPlayer = backcourt2Two[backcourt2TwoRow]
        let backcourt3TwoRow = pickerViewTwo.selectedRow(inComponent: 4)
        let ThirdBackPlayer = backcourt3Two[backcourt3TwoRow]
        
        players = [FirstFrontPlayer, SecondFrontPlayer, FirstBackPlayer, SecondBackPlayer, ThirdBackPlayer]
        
        labelTwo.text = " "+frontcourt1Two[frontcourt1TwoRow]+" at Point Guard\n "+frontcourt2Two[frontcourt2TwoRow]+" at Shooting Guard\n "+backcourt1Two[backcourt1TwoRow]+" at Small Forward\n "+backcourt2Two[backcourt2TwoRow]+" at Power Foward\n "+backcourt3Two[backcourt3TwoRow]+" at Center"
    }
    
    func getNameFileURLTwo() -> URL {
        let documentURLTwo = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        return documentURLTwo.appendingPathComponent("usernameTwo.txt")
    }
    
    
    @IBAction func saveTeamTwo(_ sender: Any) {
    let saverTwo = labelTwo.text!
        try! saverTwo.write(to: getNameFileURLTwo(), atomically: true, encoding: .utf8)
        
    }
    
    @IBAction func resetTeamTwo(_ sender: Any) {
    try? FileManager.default.removeItem(at: getNameFileURLTwo())
        labelTwo.text = ""
    }

}
