//
//  IssuesViewOutput.swift
//  JiraTimeTracker
//

protocol IssuesViewOutput {
    /// Notify presenter that view is ready
    func viewLoaded()

    func onIssueSelected(issue: IssueEntity)
}
