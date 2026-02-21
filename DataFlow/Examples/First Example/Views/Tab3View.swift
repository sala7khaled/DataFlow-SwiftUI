//
//  Tab3View.swift
//  DataFlow
//
//  Created by Salah Khaled on 21/02/2026.
//

import SwiftUI

struct Tab3View: View {
    
    @EnvironmentObject var analytics: Analytics
    
    var body: some View {
        
        GeometryReader { proxy in
            VStack {
                Image(systemName: "3.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .foregroundStyle(.red)
                Text("Tab 3")
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
                analytics.send(tag: "Feature_03")
            }
        }
    }
}

#Preview {
    Tab3View()
        .environmentObject(Analytics())
}

