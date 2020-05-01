//
//  AuthModuleOutput.swift
//  JiraTimeTracker
//

protocol AuthModuleOutput: class {
    var onAuthSuccess: EmptyClosure? { get set }
}
