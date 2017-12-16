//
//  FetchRequest.swift
//  CoursePlanner
//
//  Created by Melody on 12/14/17.
//  Copyright © 2017 Melody Yang. All rights reserved.
//

import Foundation
import CoreData

enum EntityRoute {
    case course
    case session(courseName: String)
    case note(sessionName: String)
    case project(courseName: String)
    
    func predicate() -> NSPredicate? {
        switch self {
        case let .session(courseName):
            return NSPredicate(format: "courseName == %@", courseName)
        case let .note(sessionName):
            return NSPredicate(format: "Session == %@", sessionName)
        case let .project(courseName):
            return NSPredicate(format: "courseName == %@", courseName)
        default:
            return nil
        }
    }
}

class FetchRequest {
    
    
    class func fetchEntity<T: NSManagedObject>(entity: T.Type, entityRoute: EntityRoute) -> [T]? {
        var coreDataStack = CoreDataStack.instance
        var result: [T]?
        let fetch = NSFetchRequest<T>(entityName: NSStringFromClass(T.self))
        fetch.predicate = entityRoute.predicate()
        
        do {
            result = try coreDataStack.privateContext.fetch(fetch)
            
        }catch let error {
            print(error)
        }
        return result
    }
    
}





