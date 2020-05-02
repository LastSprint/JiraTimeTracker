//
//  TabBarViewInput.swift
//  JiraTimeTracker
//

protocol TabBarViewInput: class {
    /// Method for setup initial state of view
    func setupInitialState()

    func select(tab: Tab)
}
