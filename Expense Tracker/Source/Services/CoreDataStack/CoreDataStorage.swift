//
//  CoreDataStorage.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 16.08.2023.
//

import Foundation
import CoreData

final class CoreDataStorage {
    
    // MARK: - Properties
    
    private let container: CoreDataContainer
    var context: NSManagedObjectContext {
        return container.context
    }
    
    // MARK: - Init
    
    init(container: CoreDataContainer) {
        self.container = container
    }
    
    // MARK: - Public Method
    
    func fetchData() -> [UserInput] {
        let fetchRequest = NSFetchRequest<UserInput>(entityName: "UserInput")
        do {
            let dataFromCoreData = try context.fetch(fetchRequest)
            return dataFromCoreData
        } catch {
            print("Ошибка при извлечении данных: \(error)")
            return []
        }
    }
    
    // MARK: - Private Methods
    
    private func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                context.rollback()
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    private func delete(_ object: NSManagedObject) {
        context.delete(object)
        saveContext()
    }
}
