//
//  Saving+CoreDataProperties.swift
//  What's Where (Core Data)
//
//  Created by Maryam TayyabII on 2020-11-10.
//
//

import Foundation
import CoreData


extension Saving {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Saving> {
        return NSFetchRequest<Saving>(entityName: "Saving")
    }

    @NSManaged public var names: String?
    @NSManaged public var imageD: Data?
    @NSManaged public var locations: String?


}

extension Saving : Identifiable {

}
