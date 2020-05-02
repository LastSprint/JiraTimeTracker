//
//  TokenInjectorNode.swift
//  JiraTimeTrackerDebug
//

import Foundation
import NodeKit

struct TokenMetaDataProvider: MetadataProvider {
    func metadata() -> [String: String] {
        return ["Authorization": AppDelegate.authToken ?? ""]
    }
}
