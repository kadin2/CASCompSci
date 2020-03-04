//
//  galleryViewController.swift
//  PhotoGallery
//
//  Created by Kadin Mesriani on 2/27/20.
//  Copyright © 2020 Kadin Mesriani. All rights reserved.
//

import UIKit

class galleryViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    var images: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        galleryPhotos()
        // Do any additional setup after loading the view.
    }
    
    func galleryPhotos(){
        let pics = images.map({(image) -> UIImageView in let otherImageView = UIImageView()
            otherImageView.image = image
            otherImageView.frame = CGRect(x: 0, y:0, width: 400, height: 600)
            return otherImageView
        })
        let count = images.count
        stackView.frame = CGRect(x: 0, y:0, width: 400, height: count*600)
        scrollView.contentSize = CGSize(width: 400, height: count*600)
        for (_, image) in pics.enumerated(){
            stackView.addArrangedSubview(image)
            let constraint = NSLayoutConstraint(item: image, attribute: .height, relatedBy: .equal, toItem: pics[0], attribute: .height, multiplier: 1, constant: 1)
            if image != pics[0] {
                stackView.addConstraint(constraint)
            }
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

}
