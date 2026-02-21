//
//  Tab2View.swift
//  DataFlow
//
//  Created by Salah Khaled on 21/02/2026.
//

import SwiftUI

struct Tab2View: View {
    
    @EnvironmentObject var analytics: Analytics
    
    var body: some View {
        
        GeometryReader { proxy in
            VStack {
                Image(systemName: "2.circle")
                    .frame(width: 40, height: 40)
                    .foregroundStyle(.blue)
                Text("Tab 2")
                    .font(.headline)
                Text("Total clicks: \(analytics.totalClick)")
                    .font(.subheadline)
                    .foregroundStyle(Color.secondary)
            }
            .frame(width: proxy.size.width * 0.98,
                   height: proxy.size.height * 0.98)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(20)
            .position(x: proxy.size.width / 2,
                      y: proxy.size.height / 2)
            .onAppear {
                analytics.send(tag: "Feature_02")
            }
        }
    }
}

#Preview {
    Tab2View()
        .environmentObject(Analytics())
}
