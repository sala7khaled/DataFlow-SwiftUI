//
//  DataFlowApp.swift
//  DataFlow
//
//  Created by Salah Khaled on 21/02/2026.
//

import SwiftUI

@main
struct DataFlowApp: App {
    
    var body: some Scene {
        WindowGroup {
            TabView {
                FirstExampleView()
                    .tabItem {
                        Image(systemName: "app.badge")
                        Text("Environment Object")
                    }
                SecondExampleView()
                    .tabItem {
                        Image(systemName: "mountain.2.fill")
                        Text("Environment")
                    }
                ParentView()
                    .tabItem {
                        Image(systemName: "key.horizontal.fill")
                        Text("Preference Key")
                    }
                ForthExampleView()
                    .tabItem {
                        Image(systemName: "arrow.left.and.right.square.fill")
                        Text("Dynamic Width")
                    }
            }
            .tint(.black)
        }
    }
}
