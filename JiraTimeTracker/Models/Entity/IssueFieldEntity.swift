//
//  IssueFieldEntity.swift
//  JiraTimeTrackerDebug
//

import Foundation
import NodeKit

struct IssueFieldEntity {
    let description: String?
    let summary: String
    let issueType: IssueTypeEntity
    let priority: IssuePriorityEntity?
    let status: IssueStatusEntity

    let aggregatedOriginalEstimate: Int
    let timespent: Int
}

extension IssueFieldEntity: DTODecodable {
    static func from(dto: IssueFieldEntry) throws -> IssueFieldEntity {
        try .init(description: dto.description,
                  summary: dto.summary,
                  issueType: .from(dto: dto.issuetype),
                  priority: .from(dto: dto.priority),
                  status: .from(dto: dto.status),
                  aggregatedOriginalEstimate: dto.aggregatetimeoriginalestimate ?? 0,
                  timespent: dto.timespent ?? 0)
    }
}
