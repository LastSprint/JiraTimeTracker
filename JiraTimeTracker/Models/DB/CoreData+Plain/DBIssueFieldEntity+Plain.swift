//
//  DBIssueFieldEntity+Plain.swift
//  JiraTimeTrackerDebug
//
//  Created by Александр Кравченков on 11.10.2020.
//

import Foundation
import CoreData

extension DBIssueFieldEntity {

    func toPlain() -> IssueFieldEntity {
        return IssueFieldEntity(description: self.descriptionInfo,
                                summary: self.summary,
                                issueType: self.type.toPlain(),
                                priority: self.priority?.toPlain(),
                                status: self.status.toPlain(),
                                aggregatedOriginalEstimate: Int(self.aggregatetimeoriginalestimate),
                                timespent: Int(self.timespent))
    }

    static func fromPlain(context: NSManagedObjectContext,
                          plain: IssueFieldEntity) -> DBIssueFieldEntity {
        let model = DBIssueFieldEntity(context: context)
        model.aggregatetimeoriginalestimate = Int32(plain.aggregatedOriginalEstimate)
        model.descriptionInfo = plain.description
        if let priority = plain.priority {
            model.priority = .fromPlain(context: context, issue: priority)
        }
        model.status = .fromPlain(context: context, plain: plain.status)
        model.summary = plain.summary
        model.timespent = Int32(plain.timespent)
        model.type = .fromPlain(context: context, plain: plain.issueType)

        return model
    }
}
