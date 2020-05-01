//
//  AuthService.swift
//  Jtrack
//

import Foundation
import NodeKit

protocol JiraAuthService {
    func auth(login: String, password: String) -> Observer<Void>
}
