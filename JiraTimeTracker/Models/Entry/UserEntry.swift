//
//  UserEntry.swift
//  JiraTimeTrackerDebug
//

import Foundation
import NodeKit

struct UserEntry: Codable {
    let name: String
    let avatarUrls: AvatrUrlsEntry
    let displayName: String
    let active: Bool
}

extension UserEntry: RawMappable {
    typealias Raw = Json
}
