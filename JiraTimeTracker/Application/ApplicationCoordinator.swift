//
//  ApplicationCoordinator.swift
//  Jtrack
//

import Foundation

final class ApplicationCoordinator: BaseCoordinator {

    private let router: Router

    override init() {
        self.router = MainRouter()
    }

    override func start() {
        self.runAuthFlow()
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
