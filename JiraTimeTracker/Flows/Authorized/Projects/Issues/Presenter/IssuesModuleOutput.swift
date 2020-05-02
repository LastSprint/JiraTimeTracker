//
//  IssuesModuleOutput.swift
//  JiraTimeTracker
//

protocol IssuesModuleOutput: AnyObject {
    var onIssueSelected: Closure<IssueEntity>? { get set }
}
