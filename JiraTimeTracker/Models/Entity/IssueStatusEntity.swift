//
//  IssueStatusEntity.swift
//  JiraTimeTrackerDebug
//
import Foundation
import NodeKit

struct IssueStatusEntity {
    let name: String
}

extension IssueStatusEntity: DTODecodable {
    static func from(dto: IssueStatusEntry) throws -> IssueStatusEntity {
        .init(name: dto.name)
    }
}
