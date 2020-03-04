//
//  ViewController.swift
//  PhotoGallery
//
//  Created by Kadin Mesriani on 2/27/20.
//  Copyright © 2020 Kadin Mesriani. All rights reserved.
//

import AVFoundation
import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var takerController: UIImagePickerController!
    @IBOutlet weak var gallery: UIButton!
    var photos : [UIImage] = []
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        switch AVCaptureDevice.authorizationStatus(for: .video) {
            case .notDetermined:
                AVCaptureDevice.requestAccess(for: .video) { granted in
                    if granted {
                    }
            }
            default:
                return
        }
    }


    
    @IBAction func takePic(_ sender: Any) {
        takeIt()
    }
    
    
    func takeIt() {
        takerController = UIImagePickerController()
        takerController.delegate = self
        takerController.sourceType = .photoLibrary
        present(takerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        takerController.dismiss(animated: true, completion: nil)
        imageView.image = info[.originalImage] as? UIImage
       let image = info[.originalImage] as? UIImage
        photos.append(image!)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let theGallery = segue.destination as? galleryViewController, let sender = sender as? UIButton {
            if sender == gallery {
            theGallery.images = photos
        }
    }
}

}
