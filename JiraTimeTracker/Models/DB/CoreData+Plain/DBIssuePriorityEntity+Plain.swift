//
//  DBIssuePriorityEntity+Plain.swift
//  JiraTimeTrackerDebug
//
//  Created by Александр Кравченков on 11.10.2020.
//

import Foundation
import CoreData

extension DBIssuePriorityEntity {
    func toPlain() -> IssuePriorityEntity {
        return .init(iconUrl: self.iconUrl, name: self.name, id: self.id)
    }

    static func fromPlain(context: NSManagedObjectContext,
                          issue: IssuePriorityEntity) -> DBIssuePriorityEntity {
        let model = DBIssuePriorityEntity(context: context)

        model.iconUrl = issue.iconUrl
        model.id = issue.id
        model.name = issue.name

        return model
    }
}
