//
//  IssuesViewOutput.swift
//  JiraTimeTracker
//

protocol IssuesViewOutput {
    /// Notify presenter that view is ready
    func viewLoaded()

    func onIssueSelected(issue: IssueEntity)

    func startTrackIssue(issue: IssueEntity)

    func stopTrackIssue(issue: IssueEntity, seconds: Int)
}
