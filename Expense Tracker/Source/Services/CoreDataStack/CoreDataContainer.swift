//
//  CoreDataContainer.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 16.08.2023.
//

import CoreData

protocol CoreDataContainerProtocol: AnyObject {
    var context: NSManagedObjectContext { get }
}

final class CoreDataContainer: CoreDataContainerProtocol {
    
    // MARK: - Properties
    
    static let shared = CoreDataContainer()
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Expense Tracker")
        container.loadPersistentStores(completionHandler: {(storeDescription, error) in
            if let error = error {
                assertionFailure("Unresolved error \(error), \(error.localizedDescription)")
            }
        })
        return container
    }()
    
    lazy var context: NSManagedObjectContext = { return persistentContainer.viewContext }()
    
    private init() {}
}
