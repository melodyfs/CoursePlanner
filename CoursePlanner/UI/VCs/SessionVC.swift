//
//  SessionVC.swift
//  CoursePlanner
//
//  Created by Melody on 12/8/17.
//  Copyright © 2017 Melody Yang. All rights reserved.
//

import UIKit

class SessionVC: UIViewController {
    
    let coreDataStack = CoreDataStack.instance

    @IBOutlet weak var tableView: UITableView!
    var dataSource = TableDatasource(items: [Session]())
    var sessions = [Session]()
    var course: Course?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = dataSource
        tableView.delegate = self
        
        dataSource.configureCell = { (tableView, indexPath) -> UITableViewCell in
            let cell = tableView.dequeueReusableCell(withIdentifier: "sessionCell")!
            let session = self.sessions[indexPath.row]
            
            cell.textLabel?.text = session.time
            
            return cell
            
        }
        
    }
    @IBAction func addSessionPressed(_ sender: Any) {
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.sessions = FetchRequest.fetchEntity(entity: Session.self, entityRoute: EntityRoute.session(courseName: (course?.name)!))!
        self.dataSource.items = sessions
        self.tableView.reloadData()
    }
    

}

extension SessionVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let session = sessions[indexPath.row]
        let noteVC = storyboard?.instantiateViewController(withIdentifier: "noteVC") as! NoteVC
        noteVC.session = session
        self.navigationController?.pushViewController(noteVC, animated: true)
    }
}

