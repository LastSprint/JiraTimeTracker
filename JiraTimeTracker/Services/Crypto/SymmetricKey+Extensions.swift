//
//  SymmetricKey+Extensions.swift
//  JiraTimeTrackerDebug
//

import Foundation
import CryptoKit

extension SymmetricKey {

    /// Returns bytes representation of key
    var rawData: Data {
        return self.withUnsafeBytes { (pointer) -> Data in
            let cfData = CFDataCreateWithBytesNoCopy(nil,
                                                     pointer.baseAddress?.assumingMemoryBound(to: UInt8.self),
                                                     pointer.count,
                                                     kCFAllocatorNull)
            return (cfData as Data?) ?? Data()
        }
    }
}
