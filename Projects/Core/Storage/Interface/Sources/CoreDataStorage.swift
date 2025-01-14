//
//  CoreDataStorage.swift
//  CoreStorage
//
//  Created by 박승호 on 1/14/25.
//  Copyright © 2025 Seungho-Park. All rights reserved.
//
import CoreData

public protocol CoreDataStorage {
    func saveContext()
    func performBackgroundTask(_ block: @escaping (NSManagedObjectContext)-> Void)
}
