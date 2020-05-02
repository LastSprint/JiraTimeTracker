//
//  ProjectCategoryEntity.swift
//  JiraTimeTrackerDebug
//

import Foundation
import NodeKit

struct ProjectCategoryEntity {
    let description: String
}

extension ProjectCategoryEntity: DTODecodable {
    static func from(dto: ProjectCategoryEntry) throws -> ProjectCategoryEntity {
        .init(description: dto.description)
    }
}
