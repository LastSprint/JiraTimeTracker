//
//  JiraAuthByProjectsService.swift
//  Jtrack
//

import Foundation
import NodeKit

/// Makes authorization by sending projects request
/// And if it's success then save auth data
struct JiraAuthByProjectsService {

    private var builder: UrlChainsBuilder<JiraProjectsRoutes> {
        .init()
    }
}

extension JiraAuthByProjectsService: JiraAuthService {
    func auth(login: String, password: String) -> Observer<Void> {

        let token = Data("\(login):\(password)".utf8).base64EncodedString()

        return self.builder
            .set(query: ["recent": 5])
            .set(metadata: ["Authorization": token])
            .build()
            .process()
    }
}
