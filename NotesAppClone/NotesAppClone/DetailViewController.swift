//
//  DetailViewController.swift
//  NotesAppClone
//
//  Created by Kadin Mesriani on 11/14/19.
//  Copyright © 2019 Kadin Mesriani. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
var note:Note?
    
    @IBOutlet weak var textView: UITextView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = "\(note!.note)"
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        note?.note = textView.text
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
