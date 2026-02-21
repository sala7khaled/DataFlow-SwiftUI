//
//  ChildView.swift
//  DataFlow
//
//  Created by Salah Khaled on 21/02/2026.
//

import SwiftUI

struct ChildView: View {
    
    @State private var text: String = ""
    
    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: "stroller.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
                .foregroundStyle(.blue)
            
            Text("Child View")
                .font(.headline)
            
            TextField("Write something...", text: $text)
                .font(.subheadline)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                )
                .publishPreference(text)

        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(20)
    }
}

#Preview {
    ChildView()
}
