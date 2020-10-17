//
//  TabBarCoordinator.swift
//  JiraTimeTrackerDebug
//
//  Created by Александр Кравченков on 02.05.2020.
//

import Foundation

final class AuthorizedCoordinator: BaseCoordinator {

    private let router: Router

    init(router: Router) {
        self.router = router
    }

    func run() {
        self.runTabBar()
    }
}

// MARK: - Flow Runner

private extension AuthorizedCoordinator {

    func runTabBar() {
        let (view, output, input) = TabBarModuleConfigurator().configure()

        output.onTabSelected = { [weak self] tab in
            switch tab {
            case .projects:
                self?.runProjects()
            case .favorites:
                self?.runFavorites()
            }
        }

        self.router.setRootModule(view)

        input.select(tab: .projects)
    }

    func runProjects() {
        let flow = ProjectsCoordinator(router: self.router)

        self.addDependency(flow)

        flow.start()
    }

    func runFavorites() {
        let flow = FavoritesCoordinator(router: self.router)
        self.addDependency(flow)
        flow.start()
    }
}
