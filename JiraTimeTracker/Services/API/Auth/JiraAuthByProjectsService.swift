//
//  JiraAuthByProjectsService.swift
//  Jtrack
//

import Foundation
import NodeKit

struct JiraAuthByProjectsServiceFactory {
    func produce() -> JiraAuthByProjectsService {
        return JiraAuthByProjectsService(userDataStorage: UserDataKeychainStorage())
    }
}

/// Makes authorization by sending projects request
/// And if it's success then save auth data
struct JiraAuthByProjectsService {

    private var builder: UrlChainsBuilder<JiraProjectsRoutes> {
        .init()
    }

    private let userDataStorage: UserDataStorage

    init(userDataStorage: UserDataStorage) {
        self.userDataStorage = userDataStorage
    }
}

extension JiraAuthByProjectsService: JiraAuthService {
    func auth(login: String, password: String) -> Observer<Void> {

        let token = "Basic " + Data("\(login):\(password)".utf8).base64EncodedString()

        return self.builder
            .route(.get, .projects)
            .set(query: ["recent": 5])
            .set(metadata: ["Authorization": token])
            .build()
            .process()
            .map {
                do {
                    try self.userDataStorage.write(data: token)
                } catch {
                    return .emit(error: error)
                }
                return .emit(data: ())
            }
    }
}
