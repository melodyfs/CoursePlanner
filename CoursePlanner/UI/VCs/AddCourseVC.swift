//
//  AddCourseVc.swift
//  CoursePlanner
//
//  Created by Melody on 12/6/17.
//  Copyright © 2017 Melody Yang. All rights reserved.
//

import UIKit
import CoreData

class AddCourseVC: UIViewController {
    
    let coreDataStack = CoreDataStack.instance
    
    @IBOutlet weak var courseTitleField: UITextField!
    @IBOutlet weak var timeField: UITextField!
    
    @IBAction func savePressed(_ sender: Any) {
        guard let title = courseTitleField.text, let time = timeField.text
            else {return}
        
        let course = Course(context: coreDataStack.privateContext)
        course.name = title
        course.time = time
        
        coreDataStack.saveTo(context: coreDataStack.privateContext)
        
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
