//
//  OtherViewController.swift
//  NumbGuesser
//
//  Created by Kadin Mesriani on 2/19/20.
//  Copyright © 2020 Kadin Mesriani. All rights reserved.
//

import UIKit

class OtherViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    var difficulty = String()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        button()
    }
    func checkDifficulty() -> Int{
        if difficulty == "easy" {
            let random = Int.random(in: 5...15)
            return random
        }
        else if difficulty == "medium" {
            let random = Int.random(in: 45...60)
            return random
        }
        else{
            let random = Int.random(in: 90...250)
            return random
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @objc func button(){
        let actualDifficulty = checkDifficulty()
        let number = Int.random(in: 1...actualDifficulty)
        let buttons = (1...actualDifficulty).map({ (x) -> UIButton in
            let newButton = UIButton()
            newButton.setTitle("Button \(x)", for: .normal)
            newButton.frame = CGRect(x: 0, y: 0, width: 400, height: 25)
            newButton.backgroundColor = UIColor(displayP3Red: 0, green: 0.9, blue: 0, alpha: 1)
            if x > number {
                newButton.addTarget(self, action: #selector(high), for: .touchUpInside)
            }
            else if x < number {
                newButton.addTarget(self, action: #selector(low), for: .touchUpInside)
            }
            else{
                newButton.addTarget(self, action: #selector(correct), for: .touchUpInside)
            }
            return newButton
        })
        stackView.frame = CGRect(x: 0, y: 0, width: 400, height: actualDifficulty*45)
        scrollView.contentSize = CGSize(width: 400, height: actualDifficulty*45)
        stackView.backgroundColor = UIColor(displayP3Red: 0, green: 0.9, blue: 0, alpha: 1)
        scrollView.backgroundColor = UIColor(displayP3Red: 0, green: 0.9, blue: 0, alpha: 1)
        for button in buttons{
            stackView.addArrangedSubview(button)
            let constraint = NSLayoutConstraint(item: button, attribute: .height, relatedBy: .equal, toItem: buttons[0], attribute: .height, multiplier: 1, constant: 0)
            
            if button != buttons[0] {
                stackView.addConstraint(constraint)
                
            }
    
        
    }
    
}
    @objc func low(){
        let alert = UIAlertController(title: "You're wrong...", message: "Your choice was too low. Try selecting a higher number.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Try Again", style: .default))
        self.present(alert, animated: true, completion: {})
    }
    
    @objc func high(){
        let alert = UIAlertController(title: "You're wrong...", message: "Your choice was too high. Try selecting a lower number.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Try Again", style: .default))
        self.present(alert, animated: true, completion: {})
    }
    
    @objc func correct(){
        let alert = UIAlertController(title: "You're correct!", message: "Your choice was perfect, now go try another difficulty.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yeah!", style: .default))
        self.present(alert, animated: true, completion: {})
    }
}

