//
//  CoreDataStorage.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 16.08.2023.
//

import CoreData

protocol CoreDataStorageProtocol: AnyObject {
    func fetchData() -> [UserInput]?
}

final class CoreDataStorage: CoreDataStorageProtocol {
    
    // MARK: - Properties
    
    private let container: CoreDataContainerProtocol
    private var context: NSManagedObjectContext {
        return container.context
    }
    
    // MARK: - Init
    
    init(container: CoreDataContainer) {
        self.container = container
    }
    
    // MARK: - Public Method
    
    func saveData(expense: Expense) {
        let userInput = UserInput(context: context)
        
        userInput.categoryText = expense.category?.text
        userInput.date = expense.date
        userInput.amount = expense.amount
        userInput.note = expense.note
        
        if let categoryImage = expense.category?.image {
            userInput.categoryImage = categoryImage.pngData()
        }
        saveContext()
    }
    
    func fetchData() -> [UserInput]? {
        let fetchRequest = NSFetchRequest<UserInput>(entityName: "UserInput")
        do {
            let dataFromCoreData = try context.fetch(fetchRequest)
            return dataFromCoreData
        } catch {
            print("Ошибка при извлечении данных: \(error)")
            return nil
        }
    }
    
    // MARK: - Private Methods
    
    private func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                context.rollback()
                let nserror = error
                assertionFailure("Unresolved error \(nserror), \(nserror.localizedDescription)")
            }
        }
    }
    
    private func delete(_ object: NSManagedObject) {
        context.delete(object)
        saveContext()
    }
}
