//
//  Closures.swift
//  Jtrack
//

import Foundation

/// Closure without args and returns void
typealias EmptyClosure = () -> Void

/// Closure with generic args and returnsv void
typealias Closure<I> = (I) -> Void
