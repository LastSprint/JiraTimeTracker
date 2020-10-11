//
//  DBIssueTypeEntity+Plain.swift
//  JiraTimeTrackerDebug
//
//  Created by Александр Кравченков on 11.10.2020.
//

import Foundation
import CoreData

extension DBIssueTypeEntity {
    func toPlain() -> IssueTypeEntity {
        return .init(id: self.id, iconUrl: self.iconUrl, name: self.name)
    }

    static func fromPlain(context: NSManagedObjectContext,
                          plain: IssueTypeEntity) -> DBIssueTypeEntity {
        let model = DBIssueTypeEntity(context: context)

        model.iconUrl = plain.iconUrl
        model.id = plain.id
        model.name = plain.name

        return model
    }
}
