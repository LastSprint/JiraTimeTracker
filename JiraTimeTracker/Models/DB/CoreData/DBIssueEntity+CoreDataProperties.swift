//
//  DBIssueEntity+CoreDataProperties.swift
//  
//
//  Created by Александр Кравченков on 11.10.2020.
//
//

import Foundation
import CoreData


extension DBIssueEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DBIssueEntity> {
        return NSFetchRequest<DBIssueEntity>(entityName: "DBIssueEntity")
    }

    @NSManaged public var id: String
    @NSManaged public var key: String
    @NSManaged public var isFavorite: Bool
    @NSManaged public var fields: DBIssueFieldEntity


}
