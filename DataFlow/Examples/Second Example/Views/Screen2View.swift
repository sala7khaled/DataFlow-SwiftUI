//
//  Screen1View 2.swift
//  DataFlow
//
//  Created by Salah Khaled on 21/02/2026.
//

import SwiftUI

struct Screen2View: View {
    
    @Environment(\.user) var user
    
    var body: some View {
        
        GeometryReader { proxy in
            VStack {
                Image(systemName: "2.circle")
                    .frame(width: 40, height: 40)
                    .foregroundStyle(.blue)
                Text("Screen 2")
                    .font(.headline)
                Text("Logged user: \(user.username)")
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
                user.log()
            }
        }
    }
}

#Preview {
    Screen2View()
}
