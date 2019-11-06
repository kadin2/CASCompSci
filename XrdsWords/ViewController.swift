//
//  ViewController.swift
//  XrdsWords
//
//  Created by Kadin Mesriani on 11/5/19.
//  Copyright © 2019 Kadin Mesriani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var vocabWord = ""
    var vocabDefinition = ""
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = vocabWord
        label.text = vocabDefinition
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
