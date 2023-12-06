//
//  YogaEntity+CoreDataProperties.swift
//  YogaApp
//
//  Created by Aroshini Dissanayake on 2023-04-21.
//
//

import Foundation
import CoreData


extension YogaEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<YogaEntity> {
        return NSFetchRequest<YogaEntity>(entityName: "YogaEntity")
    }

    @NSManaged public var name: String?
    @NSManaged public var image: Data?
    @NSManaged public var type: String?
    @NSManaged public var shortdescription: String?
    @NSManaged public var taskduration: Int16
    @NSManaged public var taskdate: Date?

}

extension YogaEntity : Identifiable {

}
