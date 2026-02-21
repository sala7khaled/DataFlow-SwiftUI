//
//  SecondExampleView.swift
//  DataFlow
//
//  Created by Salah Khaled on 21/02/2026.
//


import SwiftUI

struct SecondExampleView: View {

    @State private var selectedScreen = 0
    
    var body: some View {
        VStack {
            Picker("Select Tab", selection: $selectedScreen) {
                Text("Screen 1").tag(0)
                Text("Screen 2").tag(1)
            }
            .pickerStyle(.segmented)
            
            Spacer()
            
            switch selectedScreen {
            case 0: Screen1View()
            case 1: Screen2View()
            default: Screen1View()
            }
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    SecondExampleView()
}
