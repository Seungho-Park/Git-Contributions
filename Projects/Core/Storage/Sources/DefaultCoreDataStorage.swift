//
//  DefaultCoreDataStorage.swift
//  CoreStorage
//
//  Created by 박승호 on 1/14/25.
//  Copyright © 2025 Seungho-Park. All rights reserved.
//

import CoreData
import CoreStorageInterface

final
public class DefaultCoreDataStorage: CoreDataStorage {
    public static let shared = DefaultCoreDataStorage()
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CoreDataStorage")
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                assertionFailure("CoreDataStorage Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    public func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                assertionFailure("CoreDataStorage Unresolved error \(error), \((error as NSError).userInfo)")
            }
        }
    }
    
    public func performBackgroundTask(_ block: @escaping (NSManagedObjectContext) -> Void) {
        persistentContainer.performBackgroundTask(block)
    }
}
