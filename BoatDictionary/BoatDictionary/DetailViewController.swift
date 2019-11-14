//
//  DetailViewController.swift
//  BoatDictionary
//
//  Created by Kadin Mesriani on 11/14/19.
//  Copyright © 2019 Kadin Mesriani. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var boat:Boat?
    
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = boat?.name
        detailsLabel.text = "Color: \(boat!.color)\nSize: \(boat!.size)\nDolphin Power: \(boat!.dolphinPower)"

       
        
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
