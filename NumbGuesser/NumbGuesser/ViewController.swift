//
//  ViewController.swift
//  NumbGuesser
//
//  Created by Kadin Mesriani on 2/19/20.
//  Copyright © 2020 Kadin Mesriani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var easy: UIButton!
    @IBOutlet weak var medium: UIButton!
    @IBOutlet weak var hard: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let guessingVC = segue.destination as? OtherViewController, let sender = sender as? UIButton {
            if sender == easy {
                guessingVC.difficulty = "easy"
            }
            if sender == medium {
                guessingVC.difficulty = "medium"
            }
            if sender == hard {
                guessingVC.difficulty = "hard"
            }
        }
    }

}

