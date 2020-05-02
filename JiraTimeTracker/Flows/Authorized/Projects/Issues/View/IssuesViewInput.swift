//
//  IssuesViewInput.swift
//  JiraTimeTracker
//

protocol IssuesViewInput: AnyObject, MessageBannerDisplaybale {
    /// Method for setup initial state of view
    func setupInitialState(project: ShortProjectEntity)

    func show(issues: [IssueEntity])
}
