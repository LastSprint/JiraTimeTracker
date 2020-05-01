//
//  AuthPresenter.swift
//  JiraTimeTracker
//

import Foundation

final class AuthPresenter: AuthViewOutput, AuthModuleInput, AuthModuleOutput {

    private enum Constants {
        static let minLoginLength = 4
        static let minPasswordLength = minLoginLength
    }

    // MARK: - AuthModuleOutput

    var onAuthSuccess: EmptyClosure?

    // MARK: - Properties

    weak var view: AuthViewInput?

    private let service: JiraAuthService

    private var login: String
    private var password: String

    init(service: JiraAuthService) {
        self.service = service
        self.login = ""
        self.password = ""
    }

    // MARK: - AuthViewOutput

    func viewLoaded() {
        self.view?.setupInitialState()
    }

    func onSignIn() {

        self.view?.showLoading()

        self.service
            .auth(login: self.login, password: self.password)
            .onCompleted { [weak self] in
                self?.onAuthSuccess?()
            }.onError { [weak self] _ in
                self?.view?.show(error: "Incorrect login and password")
            }.defer { [weak self] in
                self?.view?.stopLoading()
            }
    }

    func onLoginChange(value: String) {
        self.login = value
        self.validateLoginAndPassword()
    }

    func onPasswordChange(value: String) {
        self.password = value
        self.validateLoginAndPassword()
    }
}

private extension AuthPresenter {

    func validateLoginAndPassword() {
        guard
            self.login.count >= Constants.minLoginLength,
            self.password.count >= Constants.minPasswordLength
        else {
            return
        }

        self.view?.showValiadtionSuccess()
    }
}
