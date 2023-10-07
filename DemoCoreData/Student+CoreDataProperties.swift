//
//  Student+CoreDataProperties.swift
//  DemoCoreData
//
//  Created by yapapp on 07/10/23.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var name: String?
    @NSManaged public var mobile: String?
    @NSManaged public var city: String?
    @NSManaged public var address: String?

}

extension Student : Identifiable {

}
