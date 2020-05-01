//
//  AuthCoordinator.swift
//  Jtrack
//
//  Created by Александр Кравченков on 01.05.2020.
//

import Foundation

final class AuthCoordinator: BaseCoordinator {

    var authSuccess: EmptyClosure?

    let router: Router

    init(router: Router) {
        self.router = router
    }

    override func start() {
        let (view, output) = AuthModuleConfigurator().configure()

        output.onAuthSuccess = { [weak self] in
            self?.authSuccess?()
        }

        self.router.setRootModule(view)
    }
}
