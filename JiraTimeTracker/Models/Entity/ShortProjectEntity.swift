//
//  ShortProjectEntity.swift
//  Jtrack
//

import NodeKit

struct ShortProjectEntity {
    /// Physical project ID
    let id: String
    /// Project key (like TRI or IDPT)
    let key: String
    /// Full project name, like iOS Department
    let name: String
    let avatarUrls: AvatrUrlsEntity
}

extension ShortProjectEntity: DTODecodable {
    static func from(dto: ShortProjectEntry) throws -> ShortProjectEntity {
        return try .init(id: dto.id,
                         key: dto.key,
                         name: dto.name,
                         avatarUrls: .from(dto: dto.avatarUrls))
    }
}
