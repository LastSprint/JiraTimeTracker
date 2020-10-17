//
//  IssueEntity.swift
//  JiraTimeTrackerDebug
//

import Foundation
import NodeKit

struct IssueEntity {
    let id: String
    let key: String
    let fields: IssueFieldEntity
    var isFavorite: Bool
}

extension IssueEntity: DTODecodable {
    static func from(dto: IssueEntry) throws -> IssueEntity {
        try .init(id: dto.id,
                  key: dto.key,
                  fields: .from(dto: dto.fields),
                  isFavorite: false)
    }
}
