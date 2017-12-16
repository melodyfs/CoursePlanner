//
//  ViewController.swift
//  CoursePlanner
//
//  Created by Melody on 11/27/17.
//  Copyright © 2017 Melody Yang. All rights reserved.
//

import UIKit
import CoreData

class CourseVC: UIViewController {
    
    let coreDataStack = CoreDataStack.instance

    @IBOutlet weak var tableView: UITableView!
    var dataSource = TableDatasource(items: [Course]())
    var courses = [Course]()
//    var course: Course?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = dataSource
        
        dataSource.configureCell = { (tableView, indexPath) -> UITableViewCell in
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "courseCell")!
            let course = self.courses[indexPath.row]
            
            cell.textLabel?.text = course.name
            cell.detailTextLabel?.text = course.time
           
            return cell
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.courses = FetchRequest.fetchEntity(entity: Course.self, entityRoute: EntityRoute.course)!
        self.dataSource.items = self.courses
        self.tableView.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension CourseVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let course = courses[indexPath.row]
        let sessionVC = storyboard?.instantiateViewController(withIdentifier: "sessionVC") as! SessionVC
        sessionVC.course = course
        self.navigationController?.pushViewController(sessionVC, animated: true)
    }
}

