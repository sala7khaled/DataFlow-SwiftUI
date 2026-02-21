//
//  FirstExampleView.swift
//  DataFlow
//
//  Created by Salah Khaled on 21/02/2026.
//

import SwiftUI

struct FirstExampleView: View {
    
    @StateObject var analytics = Analytics()
    @State private var selectedTab = 0
    
    var body: some View {
        VStack {
            Picker("Select Tab", selection: $selectedTab) {
                Text("Tab 1").tag(0)
                Text("Tab 2").tag(1)
                Text("Tab 3").tag(2)
            }
            .pickerStyle(.segmented)
            
            Spacer()
            
            switch selectedTab {
            case 0: Tab1View()
            case 1: Tab2View()
            case 2: Tab3View()
            default: Tab1View()
            }
            
            Spacer()
        }
        .environmentObject(analytics)
        .padding()
    }
}

#Preview {
    FirstExampleView()
}
