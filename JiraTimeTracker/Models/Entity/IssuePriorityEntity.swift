//
//  IssuePriorityEntity.swift
//  JiraTimeTrackerDebug
//

import Foundation
import NodeKit

struct IssuePriorityEntity {
    let iconUrl: String
    let name: String
    let id: String
}

extension IssuePriorityEntity: DTODecodable {
    static func from(dto: IssuePriorityEntry) throws -> IssuePriorityEntity {
        .init(iconUrl: dto.iconUrl, name: dto.name, id: dto.id)
    }
}
