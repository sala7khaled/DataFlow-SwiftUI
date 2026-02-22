//
//  Analytics.swift
//  DataFlow
//
//  Created by Salah Khaled on 21/02/2026.
//

import SwiftUI

// MARK: - Analytics
class Analytics: ObservableObject {
    
    @Published var totalClick: Int = 0
    
    func send(tag: String) {
        print("---")
        print("[Analytics] Tag (\(tag)) was send")
        increaseClick()
    }
    
    func increaseClick() {
        totalClick += 1
        print("[Clicks] Total count: \(totalClick)")
    }
}


// MARK: - Environment Key
struct AnalyticsKey: EnvironmentKey {
    
    static let defaultValue: Analytics = Analytics()
}


// MARK: - Environment Value
extension EnvironmentValues {
    var analytics: Analytics {
        get { self[AnalyticsKey.self] }
        set { self[AnalyticsKey.self] = newValue }
    }
}
