//
//  AddSessionVC.swift
//  CoursePlanner
//
//  Created by Melody on 12/8/17.
//  Copyright © 2017 Melody Yang. All rights reserved.
//

import UIKit

class AddSessionVC: UIViewController {
    
    let coreDataStack = CoreDataStack.instance
    var course: Course?
    
    @IBOutlet weak var dateField: UITextField!
    
    @IBAction func savePressed(_ sender: Any) {
        
        guard let date = dateField.text else {return}
    
        let session = Session(context: coreDataStack.privateContext)
        session.time = date
        coreDataStack.saveTo(context: coreDataStack.privateContext)
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
