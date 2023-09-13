//
//  UserInput+CoreDataProperties.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 13.09.2023.
//
//

import CoreData


extension UserInput {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserInput> {
        return NSFetchRequest<UserInput>(entityName: "UserInput")
    }

    @NSManaged public var amount: String?
    @NSManaged public var categoryImage: Data?
    @NSManaged public var categoryText: String?
    @NSManaged public var date: Date?
    @NSManaged public var note: String?

}

extension UserInput : Identifiable {

}
