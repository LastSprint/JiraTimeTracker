//
//  UserEntity.swift
//  JiraTimeTrackerDebug
//

import Foundation
import NodeKit

struct UserEntity {
    /// Jira user name
    let jiraName: String
    let avatars: AvatrUrlsEntity
    /// User name (first name + second name)
    let name: String
    let active: Bool
}

extension UserEntity: DTODecodable {
    static func from(dto: UserEntry) throws -> UserEntity {
        try .init(jiraName: dto.name,
              avatars: .from(dto: dto.avatarUrls),
              name: dto.displayName,
              active: dto.active)
    }
}
