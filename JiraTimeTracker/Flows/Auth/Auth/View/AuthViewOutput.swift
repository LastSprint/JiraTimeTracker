//
//  AuthViewOutput.swift
//  JiraTimeTracker
//

protocol AuthViewOutput {
    /// Notify presenter that view is ready
    func viewLoaded()

    /// Called shen user wan't to sign in to jira
    func onSignIn()

    func onLoginChange(value: String)
    func onPasswordChange(value: String)
}
