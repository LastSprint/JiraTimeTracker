//
//  UserDataCrytoService.swift
//  JiraTimeTrackerDebug
//

import Foundation

protocol UserDataStorage {
    func write(data: String) throws
    func read() throws -> String
    func clear() throws
}
