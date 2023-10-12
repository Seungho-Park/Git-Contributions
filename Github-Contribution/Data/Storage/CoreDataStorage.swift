//
//  CoreDataStorage.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/10/23.
//

import Foundation
import CoreData

final class CoreDataStorage {
    static let shared = CoreDataStorage()
    private init() {  }
    
    private lazy var container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CoreDataStorage")
        container.loadPersistentStores { description, error in
            if let error = error as? NSError {
                assertionFailure("CoreDataStorage Unresolved error \(error), \(error.userInfo)")
            }
        }
        
        return container
    }()
    
    func saveContext() {
        let context = container.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                assertionFailure("CoreDataStorage Unresolved error \(error), \((error as NSError).userInfo)")
            }
        }
    }
    
    func performBackgroundTask(_ task: @escaping (NSManagedObjectContext)-> Void) {
        container.performBackgroundTask(task)
    }
}
