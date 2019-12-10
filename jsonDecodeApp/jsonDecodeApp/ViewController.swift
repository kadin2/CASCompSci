//
//  ViewController.swift
//  jsonDecodeApp
//
//  Created by Riley John Gibbs on 12/3/19.
//  Copyright © 2019 Riley John Gibbs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var jsonFileData: Data?
    var jsonFileString: String?

    // TODO: Come up with a better UI than just a single boring label.

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let fileUrl = Bundle.main.url(forResource: "data", withExtension: "json") {
            jsonFileData = try? Data(contentsOf: fileUrl)
            jsonFileString = try? String(contentsOf: fileUrl)
            self.view.backgroundColor = UIColor.red
        }
        
        // This just puts the file contents (unparsed) into the label.
        if let string = jsonFileString {
            textView.text = string
            textView.textColor = UIColor.white
            textView.backgroundColor = UIColor.red
        }
        
        if let data = jsonFileData {
            // TODO: Parse the JSON data and display it in the app.
            let json = try! JSONSerialization.jsonObject(with: data, options: [])
            let dictionary = json as! [String: Any]
            let candy = dictionary["candy"] as! String
            let year = dictionary["year"] as! Int
            let flavors = dictionary["flavors"] as! [String]
            let types = dictionary ["types"] as! [String]
            textView.text = ("\(candy) are one of the most popular candies in the United States and they were first made commercially in \(year). The different flavors consist of: \(flavors.joined(separator: ", ")). There are different types of Skittles including: \(types.joined(separator: ", ")).")
        }
    }
}

