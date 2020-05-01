//
//  AvatarUrlEntry.swift
//  Jtrack
//

import Foundation
import NodeKit

struct AvatrUrlsEntry: Codable {

    enum CodingKeys: String, CodingKey {
        case avatar16x16 = "16x16"
        case avatar24x24 = "24x24"
        case avatar32x32 = "32x32"
        case avatar48x48 = "48x48"
    }

    let avatar16x16: String
    let avatar24x24: String
    let avatar32x32: String
    let avatar48x48: String
}

extension AvatrUrlsEntry: RawMappable {
    typealias Raw = Json
}
