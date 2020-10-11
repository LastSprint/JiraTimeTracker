//
//  DBIssueStatusEntity+CoreDataProperties.swift
//  
//
//  Created by Александр Кравченков on 11.10.2020.
//
//

import Foundation
import CoreData


extension DBIssueStatusEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DBIssueStatusEntity> {
        return NSFetchRequest<DBIssueStatusEntity>(entityName: "DBIssueStatusEntity")
    }

    @NSManaged public var name: String
    @NSManaged public var fields: DBIssueFieldEntity?

}
