//
//  ViewController.swift
//  SWAPI
//
//  Created by Kadin Mesriani on 12/13/19.
//  Copyright © 2019 Kadin Mesriani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func pressButton1(_ sender: Any) {
        let url: URL = URL(string: "https://swapi.co/api/films/5/")!
        let responseData: Data? = try? Data(contentsOf: url)
        if let responseData = responseData {
            let json: Any? = try? JSONSerialization.jsonObject(with: responseData, options: [])
            if let json = json {
                let dictionary: [String: Any]? = json as? [String: Any]
                if let dictionary = dictionary {
                    let title: String? = dictionary["title"] as? String
                    let date: String? = dictionary["release_date"] as? String
                    let director: String? = dictionary["director"] as? String
                    let producer: String? = dictionary["producer"] as? String
                    if let title = title {
                        label1.text = "The title is \(title), and it was released on \(date ?? "(date unavailable)"). The director is \(director ?? "(director unavailable)") and the producer is \(producer ?? "(producer unavailable)")."
                    }
                }
            }
            
        }
    }
    
    
    @IBAction func pressButton2(_ sender: Any) {
        let url: URL = URL(string: "https://swapi.co/api/films/6/")!
        let responseData: Data? = try? Data(contentsOf: url)
        if let responseData = responseData {
            let json: Any? = try? JSONSerialization.jsonObject(with: responseData, options: [])
            if let json = json {
                let dictionary: [String: Any]? = json as? [String: Any]
                if let dictionary = dictionary {
                    let title: String? = dictionary["title"] as? String
                    let date: String? = dictionary["release_date"] as? String
                    let director: String? = dictionary["director"] as? String
                    let producer: String? = dictionary["producer"] as? String
                    if let title = title {
                        label2.text = "The title is \(title), and it was released on \(date ?? "(date unavailable)"). The director is \(director ?? "(director unavailable)") and the producer is \(producer ?? "(producer unavailable)")."
                    }
                }
            }
            
        }
    }
    
    @IBAction func pressButton3(_ sender: Any) {
        let url: URL = URL(string: "https://swapi.co/api/films/7/")!
        let responseData: Data? = try? Data(contentsOf: url)
        if let responseData = responseData {
            let json: Any? = try? JSONSerialization.jsonObject(with: responseData, options: [])
            if let json = json {
                let dictionary: [String: Any]? = json as? [String: Any]
                if let dictionary = dictionary {
                    let title: String? = dictionary["title"] as? String
                    let date: String? = dictionary["release_date"] as? String
                    let director: String? = dictionary["director"] as? String
                    let producer: String? = dictionary["producer"] as? String
                    if let title = title {
                        label3.text = "The title is \(title), and it was released on \(date ?? "(date unavailable)"). The director is \(director ?? "(director unavailable)") and the producer is \(producer ?? "(producer unavailable)")."
                    }
                }
            }
            
        }
    }
}


