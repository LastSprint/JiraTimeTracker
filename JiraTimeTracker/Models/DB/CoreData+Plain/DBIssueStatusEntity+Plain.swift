//
//  DBIssueStatusEntity+Plain.swift
//  JiraTimeTrackerDebug
//
//  Created by Александр Кравченков on 11.10.2020.
//

import Foundation
import CoreData

extension DBIssueStatusEntity {
    func toPlain() -> IssueStatusEntity {
        return .init(name: self.name)
    }

    static func fromPlain(context: NSManagedObjectContext,
                          plain: IssueStatusEntity) -> DBIssueStatusEntity {

        let model = DBIssueStatusEntity(context: context)
        model.name = plain.name
        return model
    }
}
