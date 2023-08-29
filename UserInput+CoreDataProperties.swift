//
//  UserInput+CoreDataProperties.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 29.08.2023.
//
//

import Foundation
import CoreData


extension UserInput {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserInput> {
        return NSFetchRequest<UserInput>(entityName: "UserInput")
    }

    @NSManaged public var inputText: String?

}

extension UserInput : Identifiable {

}
