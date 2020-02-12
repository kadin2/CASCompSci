//
//  QueenStackViewController.swift
//  DynamicStackView
//
//  Created by Kadin Mesriani on 2/6/20.
//  Copyright © 2020 Kadin Mesriani. All rights reserved.
//

import UIKit

class QueenStackViewController: UIViewController {
        
        var labelCount = 5
    
    
    @IBOutlet weak var otherLordStackView: UIStackView!
    
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Do any additional setup after loading the view.
            let images = (1...labelCount).map({ (x) -> UIImageView in
                let newImage = "sunset"
                let image = UIImage(named: newImage)
                let imageView = UIImageView(image: image!)
                return imageView
            })
            for (x, images) in images.enumerated() {
                otherLordStackView.addArrangedSubview(images)
                let constraint = NSLayoutConstraint(item: images, attribute: .height, relatedBy: .equal, toItem: images, attribute: .height, multiplier: 1, constant: 1)
                let mult = 1.0 / Double(labelCount - 1)
                if images != images[0]{
                otherLordStackView.addConstraint(constraint)
                }
            }
        }
    }
    

        // Do any additional setup after loading the view.
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


