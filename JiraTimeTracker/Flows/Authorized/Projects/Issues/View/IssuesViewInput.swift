//
//  IssuesViewInput.swift
//  JiraTimeTracker
//

protocol IssuesViewInput: class {
    /// Method for setup initial state of view
    func setupInitialState(project: ShortProjectEntity)
}
