//
//  CoreDataContainer.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 16.08.2023.
//

import Foundation
import CoreData

final class CoreDataContainer {
    
    // MARK: - Properties
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Expense Tracker")
        container.loadPersistentStores(completionHandler: {(storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    lazy var context: NSManagedObjectContext = { return persistentContainer.viewContext
    } ()
}
