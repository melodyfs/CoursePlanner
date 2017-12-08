//
//  AddCourseVc.swift
//  CoursePlanner
//
//  Created by Melody on 12/6/17.
//  Copyright © 2017 Melody Yang. All rights reserved.
//

import UIKit

class AddCourseVC: UIViewController {
    
    let coreDataStack
    
    @IBOutlet weak var courseTitleField: UITextField!
    @IBOutlet weak var timeField: UITextField!
    
    @IBAction func saveTapped(_ sender: Any) {
        guard let title = courseTitleField.text, let time = timeField.text
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
