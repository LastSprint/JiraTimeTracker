//
//  DBIssueFieldEntity+CoreDataProperties.swift
//  
//
//  Created by Александр Кравченков on 11.10.2020.
//
//

import Foundation
import CoreData


extension DBIssueFieldEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DBIssueFieldEntity> {
        return NSFetchRequest<DBIssueFieldEntity>(entityName: "DBIssueFieldEntity")
    }

    @NSManaged public var aggregatetimeoriginalestimate: Int32
    @NSManaged public var descriptionInfo: String?
    @NSManaged public var summary: String
    @NSManaged public var timespent: Int32
    @NSManaged public var issue: DBIssueEntity?
    @NSManaged public var priority: DBIssuePriorityEntity?
    @NSManaged public var status: DBIssueStatusEntity
    @NSManaged public var type: DBIssueTypeEntity

}
