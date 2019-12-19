//
//  ViewController.swift
//  RecipeAPIProject
//
//  Created by Kadin Mesriani on 12/18/19.
//  Copyright © 2019 Kadin Mesriani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textView: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func pressButton(_ sender: Any) {
        let searchValue = textView.text!
        let url: URL = URL(string: "http://www.recipepuppy.com/api/?q=\(searchValue)")!
        let responseData: Data? = try? Data(contentsOf: url)
        if let responseData = responseData {
            let json: Any? = try? JSONSerialization.jsonObject(with: responseData, options: [])
            if let json = json {
                let dictionary: [String: Any]? = json as? [String: Any]
                if let dictionary = dictionary {
                    let title: String? = dictionary["title"] as? String
                    let ingredients: String? = dictionary["ingredients"] as? String
                    let href: String? = dictionary["href"] as? String
                    if let title = title {
                        label.text = "Here's a recipe for \(title). The ingredients you'll need to use to make it are: \(ingredients). If you would like detailed step-by-step instructions please visit this link: \(href)."
                    }
                }
            }
        }
    }
}

