//
//  DataFlowApp.swift
//  DataFlow
//
//  Created by Salah Khaled on 21/02/2026.
//

import SwiftUI

@main
struct DataFlowApp: App {
    
    @State private var activeTab: AppTab = .envObject
    @State private var isExpanded: Bool = false
    
    var body: some Scene {
        WindowGroup {
            TabView {
                Tab("Env. Object", systemImage: "app.badge") {
                    FirstExampleView()
                }
                Tab("Environment", systemImage: "mountain.2.fill") {
                    SecondExampleView()
                }
                Tab("Preference Key", systemImage: "key.horizontal.fill") {
                    ParentView()
                }
                Tab("Dynamic Width", systemImage: "arrow.left.and.right.square.fill") {
                    ForthExampleView()
                }
            }
            .tint(.primary)
        }
    }
}
