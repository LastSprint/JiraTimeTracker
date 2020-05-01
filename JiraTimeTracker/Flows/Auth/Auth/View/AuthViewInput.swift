//
//  AuthViewInput.swift
//  JiraTimeTracker
//

protocol AuthViewInput: AnyObject, MessageBannerDisplaybale {

    func setupInitialState()

    func showValidationError()
    func showValiadtionSuccess()

    func showLoading()
    func stopLoading()
}
