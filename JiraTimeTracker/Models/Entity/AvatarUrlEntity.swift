//
//  AvatarUrlEntity.swift
//  Jtrack
//

import NodeKit

struct AvatrUrlsEntity {
    let avatar16x16: String
    let avatar24x24: String
    let avatar32x32: String
    let avatar48x48: String
}

extension AvatrUrlsEntity: DTODecodable {
    static func from(dto: AvatrUrlsEntry) throws -> AvatrUrlsEntity {
        return .init(avatar16x16: dto.avatar16x16,
                     avatar24x24: dto.avatar24x24,
                     avatar32x32: dto.avatar32x32,
                     avatar48x48: dto.avatar48x48)
    }
}
