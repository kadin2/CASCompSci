//
//  ViewController.swift
//  GetMySchedule
//
//  Created by Kadin Mesriani on 10/23/19.
//  Copyright © 2019 Kadin Mesriani. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return dayType.count
        }
        else if component == 1 {
            return weekDay.count
        }
        else {
            return theSchedule.count
        }
    }
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var label: UILabel!
    
    let dayType = ["A", "C", "B"]
    let weekDay = ["Monday","Tuesday","Wednesday","Thursday","Friday"]
    let theSchedule = ["Regular","Double Period","Assembly"]
    
    let mySchedule:[String:String] = [
        "A" : "CAS Physics",
        "B" : "CAS Computer Science/Mobile",
        "C" : "CAS HSE Other Side of History",
        "D" : "Eng 4 Sci Fi",
        "E" : "Calculus",
        "M/W 5/6" : "CAS Photo",
        "F 5/6" : "Senior Mysteries"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 { return dayType [row]
        }
        else if component == 1 {
            return weekDay [row]
        } else {
            return theSchedule [row]
        }
    }
    
    @IBAction func buttonClick(_ sender: Any) {
        let dayTypeRow = pickerView.selectedRow(inComponent: 0)
        let ACBDay = dayType[dayTypeRow]
        let weekDayRow = pickerView.selectedRow(inComponent: 1)
        let theDayOfWeek = weekDay[weekDayRow]
        
        
        let periodRotation:[String:[String:[String]]] = [
            "A": [
                "Monday":["A","B","D","E","M/W 5/6"],
                "Tuesday":["A","B","D","E"],
                "Wednesday":["A","B","D","E","M/W 5/6"],
                "Thursday":["A","B","D","E"],
                "Friday":["A","B","D","E", "F 5/6"]
            ],
            "C": [
                "Monday":["C","A","F","D","M/W 5/6"],
                "Tuesday":["C","A","F","D"],
                "Wednesday":["C","A","F","D","M/W 5/6"],
                "Thursday":["C","A","F","D"],
                "Friday":["C","A","F","D", "F 5/6"]
            ],
            "B":[
                "Monday":["B","C","E","F","M/W 5/6"],
                "Tuesday":["B","C","E","F"],
                "Wednesday":["B","C","E","F","M/W 5/6"],
                "Thursday":["B","C","E","F"],
                "Friday":["B","C","E","F", "F 5/6"]
            ]
        ]
        
        
        
        let mySched = getScheduleForDay(periods: periodRotation[ACBDay]! [theDayOfWeek]!, mySchedule: mySchedule)
        label.text = mySched
        
        
    }
    func getScheduleForDay(periods:[String], mySchedule:[String:String]) -> String{
        var output = ""
        for period in periods{
            output += "\(period) - "
            output += mySchedule[period] ?? "Free Period"
            output += "\n"
            
            
        }
        return output
    }
    
    
    
}

