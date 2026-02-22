//
//  Analytics.swift
//  DataFlow
//
//  Created by Salah Khaled on 21/02/2026.
//

import SwiftUI

// MARK: - User
class User {
    
    let username: String = "Salah Khaled"
    
    func log() {
        print("Logged User: (\(username))")
    }
}


// MARK: - Environment Key
struct UserKey: EnvironmentKey {
    
    static let defaultValue: User = User()
}


// MARK: - Environment Value
extension EnvironmentValues {
    var user: User {
        get { self[UserKey.self] }
        set { self[UserKey.self] = newValue }
    }
}
