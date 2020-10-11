//
//  DBIssueTypeEntity+CoreDataProperties.swift
//  
//
//  Created by Александр Кравченков on 11.10.2020.
//
//

import Foundation
import CoreData


extension DBIssueTypeEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DBIssueTypeEntity> {
        return NSFetchRequest<DBIssueTypeEntity>(entityName: "DBIssueTypeEntity")
    }

    @NSManaged public var iconUrl: String
    @NSManaged public var id: String
    @NSManaged public var name: String
    @NSManaged public var fields: DBIssueFieldEntity?

}
