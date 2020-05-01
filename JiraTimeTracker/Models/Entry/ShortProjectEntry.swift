//
//  ShortProjectEntry.swift
//  Jtrack
//

import Foundation
import NodeKit

struct ShortProjectEntry: Codable {
    let id: String
    let key: String
    let name: String
    let avatarUrls: AvatrUrlsEntry
}

extension ShortProjectEntry: RawMappable {
    typealias Raw = Json
}
