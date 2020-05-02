//
//  UpdateWorklogEntity.swift
//  JiraTimeTrackerDebug
//

import Foundation
import NodeKit

struct UpdateWorklogEntity {
    let comment: String
    let timeSpentSeconds: Int
}

extension UpdateWorklogEntity: DTOEncodable {
    func toDTO() throws -> UpdateWorklogEntry {
        .init(comment: self.comment, timeSpentSeconds: self.timeSpentSeconds)
    }
}
