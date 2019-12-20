//
//  ViewController.swift
//  MyApiProject
//
//  Created by Kadin Mesriani on 12/20/19.
//  Copyright © 2019 Kadin Mesriani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
   
    @IBAction func button(_ sender: Any) {
    let randomNumber = Int.random(in: 0 ..< 88)
        let url: URL = URL(string: "https://swapi.co/api/people/\(randomNumber)/")!
        let responseData: Data? = try? Data(contentsOf: url)
        if let responseData = responseData {
            let json: Any? = try? JSONSerialization.jsonObject(with: responseData, options: [])
            if let json = json {
                let dictionary: [String: Any]? = json as? [String: Any]
                if let dictionary = dictionary {
                    let name: String? = dictionary["name"] as? String
                    let height: String? = dictionary["height"] as? String
                    let mass: String? = dictionary["mass"] as? String
                    let hair_color: String? = dictionary["hair_color"] as? String
                    let eye_color: String? = dictionary["eye_color"] as? String
                    let gender: String? = dictionary["gender"] as? String
                    if let name = name {
                        label.text = "You've gotten information about \(name). \(name) has a height of \(height ?? "(Sorry, the height could not be found") and a mass of \(mass ?? "(Sorry, the mass could not be found)"). \(name) has \(hair_color ?? "(Sorry, their hair color could not be found)") hair and \(eye_color ?? "(Sorry, their eye color could not be found)") eyes. \(name) identifies as a \(gender ?? "(Sorry, their gender could not be found)")."
                    }
                }
            }
        }
    }
}

