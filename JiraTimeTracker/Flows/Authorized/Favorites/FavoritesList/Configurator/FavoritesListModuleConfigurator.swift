//
//  FavoritesListModuleConfigurator.swift
//  JiraTimeTracker
//

import UIKit

final class FavoritesListModuleConfigurator {

    // MARK: - Internal methods

    func configure() -> (FavoritesListViewController, FavoritesListModuleOutput) {
        guard let view = UIStoryboard(name: String(describing: FavoritesListViewController.self),
                                      bundle: Bundle.main).instantiateInitialViewController() as? FavoritesListViewController else {
            fatalError("Can't load FavoritesListViewController from storyboard, check that controller is initial view controller")
        }
        let presenter = FavoritesListPresenter(service: JiraIssuesNetworkServiceProvider().get(),
                                               favoritesService: FavoritesStorageProvider().get())

        presenter.view = view
        view.output = presenter

        return (view, presenter)
    }

}
