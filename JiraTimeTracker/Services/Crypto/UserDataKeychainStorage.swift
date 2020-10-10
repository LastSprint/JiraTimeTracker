//
//  UserDataKeychainStorage.swift
//  JiraTimeTrackerDebug
//

import Foundation
import CryptoKit
import LocalAuthentication

enum UserDataCryptoStoreError: Error {
    case cantGetDataFromSealedBox
    /// If we can't convert `String` value to `Data` using `.utf8` encoding
    case catConvertStringToData
    /// If we can't convert `Data` value to `String`
    /// It happens when we convert decrypted crypto text
    /// Which should be just string that was encoded in `Data` with `.utf8`
    case cantConvertDataToString
    case cantWriteKeyToKeychain(OSStatus)
    case cantWriteCryptoTextToKeychain(OSStatus)
    case cantReadDataFromKecyhain
    case cantFindDataInKeychain
    case cantDelete
}

struct UserDataKeychainStorage: UserDataStorage {

    private enum Const {
        static let keyId = "token.sym.key"
        static let dataId = "token.sym.data"
    }

    /// Generates symmetric 256 bit key
    /// Encrypt data
    /// Saves key and encrypted data in Keychain
    ///
    /// - Parameters
    ///     - data: Data you want to
    ///
    /// - Throws:
    ///     - UserDataCryptoStoreError.catConvertStringToData
    ///     - UserDataCryptoStoreError.cantGetDataFromSealedBox
    ///     - UserDataCryptoStoreError.cantWriteKeyToKeychain
    ///     - UserDataCryptoStoreError.cantWriteCryptoTextToKeychain
    func write(data: String) throws {

        guard let rawData = data.data(using: .utf8, allowLossyConversion: true) else {
            throw UserDataCryptoStoreError.catConvertStringToData
        }

        let key = SymmetricKey(size: .bits256)

        let sealedBox = try AES.GCM.seal(rawData, using: key)

        guard let cryptoText = sealedBox.combined else {
            throw UserDataCryptoStoreError.cantGetDataFromSealedBox
        }

        var err = self.writeGenericPassword(data: key.rawData,
                                            account: Const.keyId)

        guard err == errSecSuccess else {
            throw UserDataCryptoStoreError.cantWriteKeyToKeychain(err)
        }

        err = self.writeGenericPassword(data: cryptoText,
                                        account: Const.dataId)

        guard err == errSecSuccess else {
            throw UserDataCryptoStoreError.cantWriteCryptoTextToKeychain(err)
        }
    }

    func read() throws -> String {

        let key = try readGenericPassword(account: Const.keyId)
        let cryptoText = try readGenericPassword(account: Const.dataId)

        let symKey = SymmetricKey(data: key)

        let box = try AES.GCM.SealedBox(combined: cryptoText)

        let data = try AES.GCM.open(box, using: symKey)

        guard let result = String(data: data, encoding: .utf8) else {
            throw UserDataCryptoStoreError.cantConvertDataToString
        }

        return result
    }

    func clear() throws {
        try self.delete(account: Const.dataId)
        try self.delete(account: Const.keyId)
    }

}

// MARK: - Private Helpers

private extension UserDataKeychainStorage {

    func writeGenericPassword(data: Data, account: String) -> OSStatus {

        let query = [
            kSecClass: kSecClassGenericPassword,
            kSecUseDataProtectionKeychain: true,
            kSecAttrAccount: account,
        ] as CFDictionary

        var result: CFTypeRef?
        let status = SecItemCopyMatching(query, &result)

        switch status {
        case errSecItemNotFound:
            return SecItemAdd([
                kSecClass: kSecClassGenericPassword,
                kSecValueData: data,
                kSecAttrAccessible: kSecAttrAccessibleWhenUnlocked,
                kSecUseDataProtectionKeychain: true,
                kSecAttrAccount: account
            ] as CFDictionary, nil)
        case errSecSuccess:
            return SecItemUpdate(query, [kSecValueData: data, kSecAttrAccount: account] as CFDictionary)
        default:
            return status
        }
    }

    func readGenericPassword(account: String) throws -> Data {

        let query = [
            kSecClass: kSecClassGenericPassword,
            kSecUseDataProtectionKeychain: true,
            kSecAttrAccount: account,
            kSecReturnData: true
        ] as CFDictionary

        var resultRef: CFTypeRef?

        switch SecItemCopyMatching(query, &resultRef) {
        case errSecSuccess:
            guard let data = resultRef as? Data else {
                throw UserDataCryptoStoreError.cantReadDataFromKecyhain
            }
            return data
        default:
            throw UserDataCryptoStoreError.cantFindDataInKeychain
        }
    }

    func delete(account: String) throws {
        let query = [
            kSecClass: kSecClassGenericPassword,
            kSecUseDataProtectionKeychain: true,
            kSecAttrAccount: account
        ] as CFDictionary

        switch SecItemDelete(query) {
        case errSecItemNotFound, errSecSuccess:
            break
        default:
            throw UserDataCryptoStoreError.cantDelete
        }
    }
}
