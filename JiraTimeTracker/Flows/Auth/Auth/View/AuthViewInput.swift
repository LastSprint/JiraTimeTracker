//
//  AuthViewInput.swift
//  JiraTimeTracker
//

protocol AuthViewInput: AnyObject, MessageBannerDisplaybale {

    func showValidationError()
    func showValiadtionSuccess()

    func showLoading()
}
