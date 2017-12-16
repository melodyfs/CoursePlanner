//
//  AddNoteVC.swift
//  CoursePlanner
//
//  Created by Melody on 12/8/17.
//  Copyright © 2017 Melody Yang. All rights reserved.
//

import UIKit

class AddNoteVC: UIViewController {

    @IBOutlet weak var noteTextView: UITextView!
    
    
    
    @IBAction func savePressed(_ sender: Any) {
        
//        coreDataStack.saveTo(context: coreDataStack.privateContext)
        
        self.navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
