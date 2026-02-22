//
//  AppBar.swift
//  DataFlow
//
//  Created by Salah Khaled on 22/02/2026.
//

import SwiftUI

enum AppTab: String, MorphTabProtocol {
    case envObject = "Env. Object"
    case environment = "Environment"
    case preferenceKey = "Preference Key"
    case dynamicWidth = "Dynamic Width"
    
    var icon: String {
        switch self {
        case .envObject: "app.badge"
        case .environment: "mountain.2.fill"
        case .preferenceKey: "key.horizontal.fill"
        case .dynamicWidth: "arrow.left.and.right.square.fill"
        }
    }
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .envObject: FirstExampleView()
        case .environment: SecondExampleView()
        case .preferenceKey: ParentView()
        case .dynamicWidth: ForthExampleView()
        }
    }

}


//            ZStack(alignment: .bottom) {
//                Rectangle()
//                    .foregroundStyle(.clear)
//                    .overlay {
//                        activeTab.view
//                    }
//                MorphTabBar(activeTab: $activeTab, isExpanded: $isExpanded) {
//
//                }
//                .padding(.horizontal, 20)
//                .padding(.bottom, 25)
//            }
//            .ignoresSafeArea()
