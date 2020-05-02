//
//  IssueTypeEntity.swift
//  JiraTimeTrackerDebug
//

import Foundation
import NodeKit

struct IssueTypeEntity {
    let id: String
    let iconUrl: String
    let name: String
}

extension IssueTypeEntity: DTODecodable {
    static func from(dto: IssueTypeEntry) throws -> IssueTypeEntity {
        .init(id: dto.id, iconUrl: dto.iconUrl, name: dto.name)
    }
}
