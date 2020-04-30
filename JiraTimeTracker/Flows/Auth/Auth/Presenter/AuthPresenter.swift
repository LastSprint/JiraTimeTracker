//
//  AuthPresenter.swift
//  JiraTimeTracker
//

final class AuthPresenter: AuthViewOutput, AuthModuleInput, AuthModuleOutput {

    // MARK: - AuthModuleOutput

    // MARK: - Properties

    weak var view: AuthViewInput?

    // MARK: - AuthViewOutput

    func viewLoaded() {
        view?.setupInitialState()
    }

    // MARK: - AuthModuleInput

}
