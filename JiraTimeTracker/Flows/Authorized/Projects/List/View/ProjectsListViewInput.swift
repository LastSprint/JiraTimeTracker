//
//  ProjectsViewInput.swift
//  JiraTimeTracker
//

protocol ProjectsListViewInput: AnyObject, MessageBannerDisplaybale {
    /// Method for setup initial state of view
    func setupInitialState(models: [ShortProjectEntity])
}
