//
//  PagingEntity.swift
//  JiraTimeTrackerDebug
//

import Foundation
import NodeKit

struct PagingEntity {
    let startAt: Int
    let maxResults: Int
    let total: Int
    let issues: [IssueEntity]
}

extension PagingEntity: DTODecodable {
    static func from(dto: PagingEntry) throws -> PagingEntity {
        try .init(startAt: dto.startAt,
                  maxResults: dto.maxResults,
                  total: dto.total, issues: .from(dto: dto.issues))
    }
}
