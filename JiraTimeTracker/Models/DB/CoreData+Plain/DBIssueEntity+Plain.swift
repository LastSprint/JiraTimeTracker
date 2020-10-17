//
//  DBIssueEntity+Plain.swift
//  JiraTimeTrackerDebug
//
//  Created by Александр Кравченков on 11.10.2020.
//

import Foundation
import CoreData

extension DBIssueEntity {

    func toPlain() -> IssueEntity {
        return .init(id: self.id,
                     key: self.key,
                     fields: self.fields.toPlain(),
                     isFavorite: self.isFavorite)
    }

    static func fromPlain(context: NSManagedObjectContext,
                          plain: IssueEntity) -> DBIssueEntity {

        let model = DBIssueEntity(context: context)
        model.id = plain.id
        model.key = plain.key
        model.isFavorite = plain.isFavorite
        model.fields = .fromPlain(context: context, plain: plain.fields)

        return model
    }
}
