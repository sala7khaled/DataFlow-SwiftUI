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
                        Image(systemName: "1.circle.fill")
                        Text("EnvironmentObject")
                    }
                SecondExampleView()
                    .tabItem {
                        Image(systemName: "2.circle.fill")
                        Text("Environment")
                    }
                ParentView()
                    .tabItem {
                        Image(systemName: "3.circle.fill")
                        Text("PreferenceKey")
                    }
            }
            .tint(.black)
        }
    }
}
