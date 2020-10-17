//
//  FacoritesCoordinator.swift
//  JiraTimeTrackerDebug
//
//  Created by Александр Кравченков on 17.10.2020.
//

import Foundation

final class FavoritesCoordinator: BaseCoordinator {

    private let router: Router

    private var isStarted = false

    init(router: Router) {
        self.router = router
    }

    override func start() {

        guard !self.isStarted else {
            return
        }

        self.isStarted = true

        self.runListFlow()
    }
}

private extension FavoritesCoordinator {
    func runListFlow() {

        let (view, output) = FavoritesListModuleConfigurator().configure()

        self.router.setNavigationControllerRootModule(view, animated: false, hideBar: false)
    }
}
