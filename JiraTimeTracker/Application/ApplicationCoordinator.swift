//
//  ApplicationCoordinator.swift
//  Jtrack
//

import Foundation

final class ApplicationCoordinator: BaseCoordinator {

    enum Option {
        case auth
        case skipAuth
    }

    private let router: Router

    override init() {
        self.router = MainRouter()
    }

    func start(option: Option) {
        switch option {
        case .auth:
            self.runAuthFlow()
        case .skipAuth:
            self.authorizedFlow()
        }
    }

}

// MARK: - Flows Runner

extension ApplicationCoordinator {

    func runAuthFlow() {
        let authCoord = AuthCoordinator(router: self.router)

        authCoord.authSuccess = { [weak self, weak authCoord] in
            if let authCoord = authCoord {
                self?.removeDependency(authCoord)
            }
            self?.authorizedFlow()
        }

        self.addDependency(authCoord)

        authCoord.start()
    }

    func authorizedFlow() {
        let flow = AuthorizedCoordinator(router: self.router)
        self.addDependency(flow)

        flow.run()
    }
}
